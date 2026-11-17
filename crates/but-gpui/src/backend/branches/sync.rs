//! A local ref compared with its configured upstream, including refs outside the workspace.

use std::collections::HashMap;
use std::path::Path;

use anyhow::{Context as _, Result};
use bstr::ByteSlice as _;

use crate::backend::intent::Run;
use crate::backend::upstream::{TargetCommit, target_commit};
use crate::backend::{CommitId, FullName, open};
use crate::backend::{Intent, OpKind};

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PullStrategy {
    Merge,
    Rebase,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum SyncAction {
    Push,
    Pull(Option<PullStrategy>),
}

#[derive(Clone)]
pub struct SyncBranch {
    pub branch: FullName,
    pub local_tip: CommitId,
    pub upstream: FullName,
    /// Set after choosing how to reconcile diverged history.
    pub remote_tip: Option<CommitId>,
    pub action: SyncAction,
    pub run_hooks: bool,
    /// First publication or an explicit request to recreate a missing upstream.
    pub publish: bool,
}

#[derive(Debug)]
pub enum SyncOutcome {
    Done,
    Diverged {
        remote_tip: CommitId,
        ahead: usize,
        behind: usize,
    },
}

impl Intent for SyncBranch {
    type Done = SyncOutcome;
    fn kind(&self) -> OpKind {
        match self.action {
            SyncAction::Push => OpKind::Push(self.branch.clone()),
            SyncAction::Pull(_) => OpKind::Other,
        }
    }
    fn apply(self, run: &mut Run) -> Result<SyncOutcome> {
        let mut fetching = open(run.path())?;
        let remote_name = {
            let repo = fetching.repo.get()?;
            let configured = repo
                .branch_remote_tracking_ref_name(
                    self.branch.as_ref(),
                    gix::remote::Direction::Fetch,
                )
                .transpose()?;
            anyhow::ensure!(
                configured.as_ref() == Some(&self.upstream),
                "The upstream changed; review it before retrying"
            );
            let (_, remote) = repo
                .upstream_branch_and_remote_for_tracking_branch(self.upstream.as_ref())?
                .context("The upstream is not a configured remote branch")?;
            remote
                .name()
                .context("The remote has no name")?
                .as_bstr()
                .to_str()?
                .to_owned()
        };
        but_api::workspace::workspace_fetch_remote(
            &mut fetching,
            &remote_name,
            Some("fetch".into()),
        )?;
        if self.action == SyncAction::Push {
            let ctx = open(run.path())?;
            let sync = self.checked(&*ctx.repo.get()?)?;
            match sync.state {
                SyncState::Known { behind, .. } => {
                    anyhow::ensure!(behind == 0, "Pull the remote changes before pushing")
                }
                SyncState::Missing => {
                    anyhow::ensure!(
                        self.publish,
                        "The upstream was deleted. Review the branch and choose Publish to recreate it"
                    );
                }
                _ => anyhow::bail!("The upstream state is unavailable"),
            }
            but_api::legacy::workspace::branch_push_upstream(
                &ctx,
                self.branch.as_ref(),
                self.local_tip.0,
                self.upstream.as_ref(),
                self.run_hooks,
            )?;
            return Ok(SyncOutcome::Done);
        }
        run.locked(|ctx, perm| {
            ctx.reload_repo_and_invalidate_workspace(perm)?;
            let sync = self.checked(&*ctx.repo.get()?)?;
            let SyncState::Known { tip, ahead, behind } = sync.state else {
                anyhow::bail!("The upstream history is unavailable");
            };
            if behind == 0 {
                return Ok(SyncOutcome::Done);
            }
            // Moving an unchecked ref forward must not rebase branches resting on its old
            // commit. The existing target fast-forward helper also accepts an exact local ref.
            let fast_forward = ahead == 0 && {
                let repo = ctx.repo.get()?;
                but_workspace::local_tracking_branch_to_fast_forward(
                    &repo,
                    self.branch.as_ref(),
                    tip.0,
                )?
                .is_some()
            };
            if fast_forward {
                let snapshot =
                    but_oplog::UnmaterializedOplogSnapshot::from_details_with_refs_and_perm(
                        ctx,
                        but_oplog::legacy::SnapshotDetails::new(
                            but_oplog::legacy::OperationKind::GenericBranchUpdate,
                        ),
                        &[self.branch.as_ref()],
                        perm.read_permission(),
                        but_core::DryRun::No,
                    );
                but_workspace::fast_forward_local_tracking_branch(
                    &*ctx.repo.get()?,
                    self.branch.as_ref(),
                    tip.0,
                )?;
                ctx.invalidate_workspace_cache()?;
                if let Some(snapshot) = snapshot {
                    snapshot.commit(ctx, perm).ok();
                }
                return Ok(SyncOutcome::Done);
            }
            let SyncAction::Pull(strategy) = self.action else {
                anyhow::bail!("Expected a pull operation");
            };
            if ahead > 0 && strategy.is_none() {
                return Ok(SyncOutcome::Diverged {
                    remote_tip: tip,
                    ahead,
                    behind,
                });
            }
            let strategy = match strategy.unwrap_or(PullStrategy::Rebase) {
                PullStrategy::Merge => but_workspace::branch::BranchIntegrationStrategy::Merge,
                PullStrategy::Rebase => {
                    but_workspace::branch::BranchIntegrationStrategy::PullRebase
                }
            };
            let plan = but_api::branch::get_initial_branch_integration_with_perm(
                ctx,
                self.branch.as_ref(),
                strategy,
                perm.read_permission(),
            )?;
            let preview = but_api::branch::apply_branch_integration_with_perm(
                ctx,
                self.branch.as_ref(),
                plan.integration,
                but_core::DryRun::Yes,
                perm,
            )?;
            anyhow::ensure!(
                preview.workspace.conflicted_commits.is_empty()
                    && preview.workspace.conflicted_checkouts.is_empty(),
                "Pull would introduce conflicts. Resolve the branch in its worktree before retrying"
            );
            let plan = but_api::branch::get_initial_branch_integration_with_perm(
                ctx,
                self.branch.as_ref(),
                strategy,
                perm.read_permission(),
            )?;
            but_api::branch::apply_branch_integration_with_perm(
                ctx,
                self.branch.as_ref(),
                plan.integration,
                but_core::DryRun::No,
                perm,
            )?;
            Ok(SyncOutcome::Done)
        })
    }
}

impl SyncBranch {
    fn checked(&self, repo: &gix::Repository) -> Result<BranchSync> {
        let tip = CommitId(
            repo.find_reference(self.branch.as_ref())?
                .peel_to_commit()?
                .id,
        );
        anyhow::ensure!(
            tip == self.local_tip,
            "The branch changed; review it before retrying"
        );
        let sync = read(repo, &self.branch, tip, &mut HashMap::new());
        anyhow::ensure!(
            sync.upstream.as_ref() == Some(&self.upstream),
            "The upstream changed; review it before retrying"
        );
        if let Some(expected) = self.remote_tip {
            anyhow::ensure!(
                matches!(sync.state, SyncState::Known { tip, .. } if tip == expected),
                "The remote changed; compare it again before pulling"
            );
        }
        Ok(sync)
    }
}

/// Available configured remotes for first publication; no network call while a menu renders.
pub fn publication_targets(path: &Path, branch: &FullName) -> Result<Vec<FullName>> {
    let ctx = open(path)?;
    let repo = ctx.repo.get()?;
    repo.remote_names()
        .iter()
        .map(|remote| Ok(format!("refs/remotes/{remote}/{}", branch.shorten()).try_into()?))
        .collect()
}

pub struct TrackUpstream {
    pub branch: FullName,
    pub local_tip: CommitId,
    pub upstream: FullName,
}

impl Intent for TrackUpstream {
    type Done = ();
    fn apply(self, run: &mut Run) -> Result<()> {
        run.locked(|ctx, _| {
            let repo = ctx.repo.get()?;
            let tip = CommitId(
                repo.find_reference(self.branch.as_ref())?
                    .peel_to_commit()?
                    .id,
            );
            anyhow::ensure!(
                tip == self.local_tip,
                "The branch changed; choose its upstream again"
            );
            let current = repo
                .branch_remote_tracking_ref_name(
                    self.branch.as_ref(),
                    gix::remote::Direction::Fetch,
                )
                .transpose()?;
            anyhow::ensure!(
                current.is_none(),
                "This branch now has an upstream; refresh before changing it"
            );
            let (destination, remote) = repo
                .upstream_branch_and_remote_for_tracking_branch(self.upstream.as_ref())?
                .context("Choose a branch on a configured remote")?;
            let name = remote.name().context("The remote has no name")?.as_bstr();
            but_core::git_config::edit_repo_config(&repo, gix::config::Source::Local, |config| {
                let mut section =
                    config.section_mut_or_create_new("branch", Some(self.branch.shorten()))?;
                section.set("remote", name)?;
                section.set("merge", destination.as_bstr())?;
                Ok(())
            })?;
            Ok(())
        })
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct BranchSync {
    pub upstream: Option<FullName>,
    pub state: SyncState,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum SyncState {
    Untracked,
    Missing,
    Known {
        tip: CommitId,
        ahead: usize,
        behind: usize,
    },
    Unavailable(String),
}

type Counts = HashMap<(CommitId, CommitId), Result<(usize, usize), String>>;

pub(super) fn read(
    repo: &gix::Repository,
    branch: &FullName,
    local: CommitId,
    cache: &mut Counts,
) -> BranchSync {
    let upstream = match repo
        .branch_remote_tracking_ref_name(branch.as_ref(), gix::remote::Direction::Fetch)
        .transpose()
    {
        Ok(Some(name)) => name,
        Ok(None) => {
            return BranchSync {
                upstream: None,
                state: SyncState::Untracked,
            };
        }
        Err(err) => {
            return BranchSync {
                upstream: None,
                state: SyncState::Unavailable(err.to_string()),
            };
        }
    };
    let state = (|| -> Result<SyncState> {
        let Some(mut reference) = repo.try_find_reference(upstream.as_ref())? else {
            return Ok(SyncState::Missing);
        };
        let remote = CommitId(reference.peel_to_commit()?.id);
        let counts = cache
            .entry((local, remote))
            .or_insert_with(|| counts(repo, local, remote).map_err(|err| format!("{err:#}")));
        Ok(match counts {
            Ok((ahead, behind)) => SyncState::Known {
                tip: remote,
                ahead: *ahead,
                behind: *behind,
            },
            Err(reason) => SyncState::Unavailable(reason.clone()),
        })
    })()
    .unwrap_or_else(|err| SyncState::Unavailable(format!("{err:#}")));
    BranchSync {
        upstream: Some(upstream),
        state,
    }
}

fn counts(repo: &gix::Repository, local: CommitId, remote: CommitId) -> Result<(usize, usize)> {
    if local == remote {
        return Ok((0, 0));
    }
    complete_history(repo)?;
    let count = |tip: CommitId, hidden: CommitId| -> Result<usize> {
        repo.rev_walk([tip.0])
            .with_hidden([hidden.0])
            .all()?
            .try_fold(0, |count, commit| {
                commit.map(|_| count + 1).map_err(Into::into)
            })
    };
    Ok((count(local, remote)?, count(remote, local)?))
}

fn complete_history(repo: &gix::Repository) -> Result<()> {
    anyhow::ensure!(
        !repo.is_shallow()?,
        "Fetch the complete history to compare these branches"
    );
    Ok(())
}

#[derive(Debug, Clone)]
pub struct Comparison {
    pub branch: FullName,
    pub upstream: FullName,
    pub local_tip: CommitId,
    pub remote_tip: CommitId,
    pub local: Vec<TargetCommit>,
    pub remote: Vec<TargetCommit>,
}

/// Exact two-ref reachability, without the workspace projection's target cutoff or first-parent
/// limits. The inventory includes refs outside that projection. The same walk supplies Compare.
pub fn compare(path: &Path, branch: &FullName) -> Result<Comparison> {
    let ctx = open(path)?;
    let repo = ctx.repo.get()?;
    let local_tip = CommitId(repo.find_reference(branch.as_ref())?.peel_to_commit()?.id);
    let sync = read(&repo, branch, local_tip, &mut HashMap::new());
    let upstream = sync
        .upstream
        .context("Set an upstream branch before comparing")?;
    let SyncState::Known {
        tip: remote_tip, ..
    } = sync.state
    else {
        anyhow::bail!("The upstream or its complete history is unavailable");
    };
    let mailmap = repo.open_mailmap();
    let commits = |tip: CommitId, hidden: CommitId| -> Result<Vec<TargetCommit>> {
        use gix::revision::walk::Sorting;
        use gix::traverse::commit::simple::CommitTimeOrder;
        repo.rev_walk([tip.0])
            .with_hidden([hidden.0])
            .sorting(Sorting::ByCommitTime(CommitTimeOrder::NewestFirst))
            .all()?
            .map(|commit| target_commit(&mailmap, &commit?.object()?))
            .collect()
    };
    Ok(Comparison {
        branch: branch.clone(),
        upstream,
        local_tip,
        remote_tip,
        local: commits(local_tip, remote_tip)?,
        remote: commits(remote_tip, local_tip)?,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::backend::ops::tests::{git, repo_with, target_origin_main};

    fn remote_repo() -> (tempfile::TempDir, tempfile::TempDir) {
        crate::backend::upstream::tests::without_askpass();
        let local = repo_with("base\n");
        target_origin_main(local.path());
        let remote = tempfile::tempdir().expect("remote directory");
        git(remote.path(), &["init", "--bare", "-q"]);
        git(
            local.path(),
            &[
                "remote",
                "set-url",
                "origin",
                remote.path().to_str().expect("temporary path"),
            ],
        );
        git(local.path(), &["push", "-q", "origin", "main"]);
        (local, remote)
    }

    fn request(path: &Path, branch: &str, action: SyncAction) -> SyncBranch {
        let repo = gix::open(path).expect("repository");
        let branch: FullName = format!("refs/heads/{branch}").try_into().expect("ref");
        let local_tip = CommitId(
            repo.find_reference(branch.as_ref())
                .expect("local ref")
                .peel_to_commit()
                .expect("commit")
                .id,
        );
        let upstream = repo
            .branch_remote_tracking_ref_name(branch.as_ref(), gix::remote::Direction::Fetch)
            .expect("upstream configured")
            .expect("upstream ref");
        let publish = repo
            .try_find_reference(upstream.as_ref())
            .expect("tracking ref")
            .is_none();
        SyncBranch {
            branch,
            local_tip,
            upstream,
            remote_tip: None,
            action,
            run_hooks: false,
            publish,
        }
    }

    #[test]
    fn pushing_an_unchecked_branch_uses_its_own_upstream_only() {
        but_testsupport::isolated_app_data_dir(|| {
            let (local, remote) = remote_repo();
            let path = local.path();
            let main = git(path, &["rev-parse", "main"]);
            git(path, &["checkout", "-qb", "feature"]);
            git(path, &["commit", "-q", "--allow-empty", "-m", "local work"]);
            git(path, &["config", "branch.feature.remote", "origin"]);
            git(
                path,
                &["config", "branch.feature.merge", "refs/heads/review"],
            );
            let feature = git(path, &["rev-parse", "HEAD"]);
            git(path, &["checkout", "-q", "main"]);
            crate::backend::intent::apply(path, request(path, "feature", SyncAction::Push))
                .expect("publish selected branch");
            assert_eq!(
                git(remote.path(), &["rev-parse", "refs/heads/review"]),
                feature,
                "the differently named upstream is published"
            );
            assert_eq!(
                git(remote.path(), &["rev-parse", "refs/heads/main"]),
                main,
                "no ancestor branch is pushed"
            );
            assert_eq!(
                git(path, &["symbolic-ref", "HEAD"]).trim(),
                "refs/heads/main",
                "pushing another branch keeps the checkout"
            );
        });
    }

    #[test]
    fn pull_fast_forwards_the_target_and_an_unchecked_branch() {
        but_testsupport::isolated_app_data_dir(|| {
            for branch in ["main", "other"] {
                let (local, _remote) = remote_repo();
                let path = local.path();
                if branch == "other" {
                    git(path, &["branch", "other"]);
                    git(path, &["config", "branch.other.remote", "origin"]);
                    git(path, &["config", "branch.other.merge", "refs/heads/main"]);
                }
                let before = git(path, &["rev-parse", "main"]);
                let incoming = git(
                    path,
                    &[
                        "commit-tree",
                        "HEAD^{tree}",
                        "-p",
                        "HEAD",
                        "-m",
                        "remote work",
                    ],
                );
                git(
                    path,
                    &[
                        "push",
                        "-q",
                        "origin",
                        &format!("{}:refs/heads/main", incoming.trim()),
                    ],
                );
                let (_, ran) = crate::backend::intent::apply(
                    path,
                    request(path, branch, SyncAction::Pull(None)),
                )
                .expect("pull selected branch");
                assert_eq!(
                    git(path, &["rev-parse", branch]),
                    incoming,
                    "a branch only behind fast-forwards to the exact upstream tip"
                );
                if branch == "other" {
                    assert_eq!(
                        git(path, &["rev-parse", "main"]),
                        before,
                        "other local refs remain unchanged"
                    );
                    crate::backend::intent::apply(
                        path,
                        crate::backend::history::Undo {
                            snapshot: ran.recorded.expect("pull records an undo snapshot"),
                            newer_than: None,
                        },
                    )
                    .expect("undo operation")
                    .0
                    .expect("undo succeeds");
                    assert_eq!(
                        git(path, &["rev-parse", "other"]),
                        before,
                        "undo restores an unchecked branch too"
                    );
                }
                assert_eq!(
                    git(path, &["symbolic-ref", "HEAD"]).trim(),
                    "refs/heads/main",
                    "pull keeps the current branch selected"
                );
            }
        });
    }

    #[test]
    fn divergence_requires_a_choice_and_both_strategies_keep_remote_work() {
        but_testsupport::isolated_app_data_dir(|| {
            for strategy in [PullStrategy::Merge, PullStrategy::Rebase] {
                let (local, _remote) = remote_repo();
                let path = local.path();
                git(path, &["checkout", "-qb", "feature"]);
                git(path, &["commit", "-q", "--allow-empty", "-m", "local work"]);
                git(path, &["config", "branch.feature.remote", "origin"]);
                git(
                    path,
                    &["config", "branch.feature.merge", "refs/heads/review"],
                );
                let incoming = git(
                    path,
                    &[
                        "commit-tree",
                        "main^{tree}",
                        "-p",
                        "main",
                        "-m",
                        "remote work",
                    ],
                );
                git(
                    path,
                    &[
                        "push",
                        "-q",
                        "origin",
                        &format!("{}:refs/heads/review", incoming.trim()),
                    ],
                );
                git(path, &["checkout", "-q", "main"]);
                let before = git(path, &["rev-parse", "feature"]);
                let (outcome, _) = crate::backend::intent::apply(
                    path,
                    request(path, "feature", SyncAction::Pull(None)),
                )
                .expect("prepare pull");
                assert!(
                    matches!(
                        outcome,
                        SyncOutcome::Diverged {
                            ahead: 1,
                            behind: 1,
                            ..
                        }
                    ),
                    "both exclusive sides are presented before rewriting history"
                );
                assert_eq!(
                    git(path, &["rev-parse", "feature"]),
                    before,
                    "choosing a strategy has not changed the branch"
                );
                crate::backend::intent::apply(
                    path,
                    request(path, "feature", SyncAction::Pull(Some(strategy))),
                )
                .expect("integrate chosen strategy");
                let comparison = compare(path, &"refs/heads/feature".try_into().expect("ref"))
                    .expect("compare after pull");
                assert!(
                    comparison.remote.is_empty(),
                    "all upstream work is retained"
                );
                assert_eq!(
                    git(path, &["symbolic-ref", "HEAD"]).trim(),
                    "refs/heads/main",
                    "updating an unchecked branch never checks it out"
                );
                assert!(
                    !super::super::all_branches(path)
                        .expect("inventory")
                        .iter()
                        .find(|b| b.local && b.name == "feature")
                        .expect("feature")
                        .applied,
                    "pulling an un-applied branch does not apply it"
                );
            }
        });
    }

    #[test]
    fn a_remote_advance_or_changed_tracking_ref_cannot_be_overwritten() {
        but_testsupport::isolated_app_data_dir(|| {
            let (local, remote) = remote_repo();
            let path = local.path();
            let mut push = request(path, "main", SyncAction::Push);
            let incoming = git(
                path,
                &[
                    "commit-tree",
                    "main^{tree}",
                    "-p",
                    "main",
                    "-m",
                    "someone else",
                ],
            );
            git(
                path,
                &[
                    "push",
                    "-q",
                    "origin",
                    &format!("{}:refs/heads/main", incoming.trim()),
                ],
            );
            let result = crate::backend::intent::apply(path, push.clone());
            assert!(
                result.is_err(),
                "fetch detects incoming work and refuses ordinary push"
            );
            assert_eq!(
                git(remote.path(), &["rev-parse", "main"]),
                incoming,
                "the remote's new commit is preserved"
            );
            git(path, &["config", "branch.main.merge", "refs/heads/review"]);
            push.action = SyncAction::Pull(None);
            assert!(
                crate::backend::intent::apply(path, push).is_err(),
                "a menu cannot operate on a newly configured upstream"
            );
        });
    }

    #[test]
    fn compare_diff_uses_remote_tip_instead_of_the_project_target() {
        but_testsupport::isolated_app_data_dir(|| {
            let dir = repo_with("base\n");
            let path = dir.path();
            let base = git(path, &["rev-parse", "HEAD"]);
            std::fs::write(path.join("remote-only"), "remote\n").expect("remote file");
            git(path, &["add", "."]);
            git(path, &["commit", "-qm", "remote change"]);
            let remote = crate::backend::ops::tests::head(path);
            git(path, &["checkout", "-qb", "local", base.trim()]);
            std::fs::write(path.join("local-only"), "local\n").expect("local file");
            git(path, &["add", "."]);
            git(path, &["commit", "-qm", "local change"]);
            let local = crate::backend::ops::tests::head(path);
            let diffs = crate::backend::diff::load_diff(
                path,
                crate::backend::DiffSource::Between {
                    base: remote,
                    tip: local,
                },
                None,
                None,
                None,
                None,
            )
            .expect("two-ref diff");
            assert_eq!(
                diffs.len(),
                2,
                "the direct comparison includes the local addition and remote-only removal"
            );
        });
    }

    #[test]
    fn pulling_a_linked_worktree_updates_its_files_and_preserves_the_main_checkout() {
        but_testsupport::isolated_app_data_dir(|| {
            let (local, _remote) = remote_repo();
            let path = local.path();
            let ctx = open(path).expect("context");
            but_api::legacy::workspace::head_info(&ctx).expect("adopt before adding a worktree");
            drop(ctx);
            let linked_dir = tempfile::tempdir().expect("linked parent");
            let linked = linked_dir.path().join("linked");
            git(
                path,
                &[
                    "worktree",
                    "add",
                    "-q",
                    "-b",
                    "linked",
                    linked.to_str().expect("path"),
                    "main",
                ],
            );
            git(path, &["branch", "--set-upstream-to=origin/main", "linked"]);
            git(path, &["checkout", "-qb", "remote-update"]);
            std::fs::write(path.join("file"), "remote\n").expect("incoming file");
            git(path, &["commit", "-qam", "remote file update"]);
            git(path, &["push", "-q", "origin", "HEAD:refs/heads/main"]);
            git(path, &["checkout", "-q", "main"]);
            let (_, ran) = crate::backend::intent::apply(
                path,
                request(path, "linked", SyncAction::Pull(None)),
            )
            .expect("pull linked branch");
            assert_eq!(
                std::fs::read_to_string(linked.join("file")).expect("linked file"),
                "remote\n",
                "the linked checkout follows its moved branch"
            );
            assert_eq!(
                std::fs::read_to_string(path.join("file")).expect("main file"),
                "base\n",
                "the main checkout is not switched or rewritten"
            );
            assert!(
                ran.moved_worktree,
                "the UI knows snapshot-only undo cannot restore this linked checkout"
            );
        });
    }

    #[test]
    fn a_failed_upstream_fetch_never_uses_its_cached_tip_to_pull() {
        but_testsupport::isolated_app_data_dir(|| {
            let (local, _remote) = remote_repo();
            let path = local.path();
            git(path, &["branch", "feature"]);
            git(
                path,
                &["remote", "add", "offline", "/missing/gitbutler-sync-remote"],
            );
            let incoming = git(
                path,
                &[
                    "commit-tree",
                    "main^{tree}",
                    "-p",
                    "main",
                    "-m",
                    "cached upstream",
                ],
            );
            git(
                path,
                &["update-ref", "refs/remotes/offline/review", incoming.trim()],
            );
            git(
                path,
                &["branch", "--set-upstream-to=offline/review", "feature"],
            );
            let before = git(path, &["rev-parse", "feature"]);
            assert!(
                crate::backend::intent::apply(
                    path,
                    request(path, "feature", SyncAction::Pull(None))
                )
                .is_err(),
                "the branch's own remote must fetch successfully even when origin is healthy"
            );
            assert_eq!(
                git(path, &["rev-parse", "feature"]),
                before,
                "cached incoming work cannot be treated as a successful fresh pull"
            );
        });
    }

    #[test]
    fn conflicts_do_not_change_the_branch_or_the_current_worktree() {
        but_testsupport::isolated_app_data_dir(|| {
            let (local, _remote) = remote_repo();
            let path = local.path();
            git(path, &["checkout", "-qb", "feature"]);
            std::fs::write(path.join("file"), "local\n").expect("local file");
            git(path, &["commit", "-qam", "local edit"]);
            git(path, &["config", "branch.feature.remote", "origin"]);
            git(
                path,
                &["config", "branch.feature.merge", "refs/heads/review"],
            );
            git(path, &["checkout", "-qb", "remote-edit", "main"]);
            std::fs::write(path.join("file"), "remote\n").expect("remote file");
            git(path, &["commit", "-qam", "remote edit"]);
            git(path, &["push", "-q", "origin", "HEAD:refs/heads/review"]);
            git(path, &["checkout", "-q", "main"]);
            let before = git(path, &["rev-parse", "feature"]);
            assert!(
                crate::backend::intent::apply(
                    path,
                    request(path, "feature", SyncAction::Pull(Some(PullStrategy::Merge)))
                )
                .is_err(),
                "conflicting integration stops at its preview"
            );
            assert_eq!(
                git(path, &["rev-parse", "feature"]),
                before,
                "the original branch remains intact"
            );
            assert_eq!(
                std::fs::read_to_string(path.join("file")).expect("main file"),
                "base\n",
                "the current checkout remains intact"
            );
        });
    }

    #[test]
    fn shallow_history_is_unavailable_instead_of_a_partial_count() {
        but_testsupport::isolated_app_data_dir(|| {
            let dir = repo_with("base\n");
            let path = dir.path();
            target_origin_main(path);
            let base = git(path, &["rev-parse", "HEAD"]);
            git(path, &["commit", "-q", "--allow-empty", "-m", "local"]);
            std::fs::write(path.join(".git/shallow"), base).expect("shallow boundary");
            let repo = gix::open(path).expect("repo");
            let branch = "refs/heads/main".try_into().expect("ref");
            let tip = crate::backend::ops::tests::head(path);
            assert!(
                matches!(
                    read(&repo, &branch, tip, &mut HashMap::new()).state,
                    SyncState::Unavailable(_)
                ),
                "a truncated graph must never claim an exact count"
            );
        });
    }

    #[test]
    #[cfg(unix)]
    fn push_respects_a_rejecting_hook() {
        use std::os::unix::fs::PermissionsExt as _;
        but_testsupport::isolated_app_data_dir(|| {
            let (local, remote) = remote_repo();
            let path = local.path();
            let before = git(remote.path(), &["rev-parse", "main"]);
            git(path, &["commit", "-q", "--allow-empty", "-m", "local work"]);
            let hook = path.join(".git/hooks/pre-push");
            std::fs::write(
                &hook,
                "#!/bin/sh\necho 'Blocked by test hook' >&2\nexit 1\n",
            )
            .expect("hook");
            std::fs::set_permissions(&hook, std::fs::Permissions::from_mode(0o755))
                .expect("executable hook");
            let mut push = request(path, "main", SyncAction::Push);
            push.run_hooks = true;
            assert!(
                crate::backend::intent::apply(path, push).is_err(),
                "hook refusal is honored"
            );
            assert_eq!(
                git(remote.path(), &["rev-parse", "main"]),
                before,
                "nothing is published after hook rejection"
            );
        });
    }

    #[test]
    fn external_tracking_changes_invalidate_the_branch_list() {
        but_testsupport::isolated_app_data_dir(|| {
            let dir = repo_with("base\n");
            let path = dir.path();
            target_origin_main(path);
            git(path, &["branch", "feature"]);
            let before = crate::backend::refs_fingerprint(&gix::open(path).expect("repo"))
                .expect("fingerprint");
            git(
                path,
                &["branch", "--set-upstream-to=origin/main", "feature"],
            );
            let after = crate::backend::refs_fingerprint(&gix::open(path).expect("repo"))
                .expect("fingerprint");
            assert_ne!(
                before, after,
                "an upstream configuration change invalidates cached status even when every ref tip stays put"
            );
        });
    }

    #[test]
    fn pulling_the_target_keeps_the_checked_out_feature_branch_intact() {
        but_testsupport::isolated_app_data_dir(|| {
            let (local, _remote) = remote_repo();
            let path = local.path();
            git(path, &["checkout", "-qb", "feature"]);
            std::fs::write(path.join("feature"), "local work\n").expect("feature file");
            git(path, &["add", "feature"]);
            git(path, &["commit", "-qm", "feature work"]);
            let before = git(path, &["rev-parse", "feature"]);
            let incoming = git(
                path,
                &[
                    "commit-tree",
                    "main^{tree}",
                    "-p",
                    "main",
                    "-m",
                    "upstream target",
                ],
            );
            git(
                path,
                &[
                    "push",
                    "-q",
                    "origin",
                    &format!("{}:refs/heads/main", incoming.trim()),
                ],
            );
            crate::backend::intent::apply(path, request(path, "main", SyncAction::Pull(None)))
                .expect("pull target");
            assert_eq!(
                git(path, &["rev-parse", "main"]),
                incoming,
                "the selected target advances to its own upstream"
            );
            assert_eq!(
                git(path, &["rev-parse", "feature"]),
                before,
                "pulling the target does not rebase the checked-out feature branch"
            );
            assert_eq!(
                git(path, &["symbolic-ref", "HEAD"]).trim(),
                "refs/heads/feature",
                "the current branch remains checked out"
            );
        });
    }

    #[test]
    fn a_deleted_upstream_requires_explicit_republication() {
        but_testsupport::isolated_app_data_dir(|| {
            let (local, remote) = remote_repo();
            let path = local.path();
            git(path, &["commit", "-q", "--allow-empty", "-m", "local work"]);
            let push = request(path, "main", SyncAction::Push);
            git(remote.path(), &["update-ref", "-d", "refs/heads/main"]);
            assert!(
                crate::backend::intent::apply(path, push).is_err(),
                "ordinary Push must not recreate an upstream deleted since the menu opened"
            );
            let repo = gix::open(remote.path()).expect("remote");
            assert!(
                repo.try_find_reference("refs/heads/main")
                    .expect("lookup")
                    .is_none(),
                "the deleted remote branch remains absent"
            );
            let local_repo = gix::open(path).expect("local repo");
            assert!(
                local_repo
                    .try_find_reference("refs/remotes/origin/main")
                    .expect("lookup")
                    .is_none(),
                "the refreshed UI can show the upstream as missing"
            );
        });
    }

    #[test]
    fn configured_upstream_counts_both_sides_and_merge_parents() {
        but_testsupport::isolated_app_data_dir(|| {
            let dir = repo_with("base\n");
            let path = dir.path();
            target_origin_main(path);
            git(
                path,
                &["remote", "add", "backup", "https://example.com/backup.git"],
            );
            git(path, &["checkout", "-qb", "feature"]);
            git(path, &["commit", "-q", "--allow-empty", "-m", "local"]);
            let side = git(
                path,
                &["commit-tree", "main^{tree}", "-p", "main", "-m", "side"],
            );
            let merge = git(
                path,
                &[
                    "commit-tree",
                    "HEAD^{tree}",
                    "-p",
                    "HEAD",
                    "-p",
                    side.trim(),
                    "-m",
                    "merge",
                ],
            );
            git(path, &["update-ref", "refs/heads/feature", merge.trim()]);
            let remote = git(
                path,
                &["commit-tree", "main^{tree}", "-p", "main", "-m", "remote"],
            );
            git(
                path,
                &["update-ref", "refs/remotes/backup/review", remote.trim()],
            );
            git(path, &["config", "branch.feature.remote", "backup"]);
            git(
                path,
                &["config", "branch.feature.merge", "refs/heads/review"],
            );
            // A same-named remote deliberately points elsewhere: only the configured upstream counts.
            git(path, &["update-ref", "refs/remotes/origin/feature", "HEAD"]);
            let compared = compare(path, &"refs/heads/feature".try_into().expect("valid ref"))
                .expect("comparison");
            assert_eq!(
                (compared.local.len(), compared.remote.len()),
                (3, 1),
                "merge side commits count, and the upstream may have another name"
            );
            assert_eq!(
                compared.upstream.shorten(),
                "backup/review",
                "the configured upstream wins over a namesake"
            );
            let branches = super::super::all_branches(path).expect("inventory");
            let branch = branches
                .iter()
                .find(|b| b.local && b.name == "feature")
                .expect("local branch");
            assert!(
                matches!(
                    branch.sync.as_ref().map(|s| &s.state),
                    Some(SyncState::Known {
                        ahead: 3,
                        behind: 1,
                        ..
                    })
                ),
                "row counts agree with Compare"
            );
        });
    }

    #[test]
    fn unconfigured_missing_and_synced_are_distinct() {
        but_testsupport::isolated_app_data_dir(|| {
            let dir = repo_with("base\n");
            let path = dir.path();
            target_origin_main(path);
            git(path, &["branch", "new"]);
            git(path, &["update-ref", "refs/remotes/origin/new", "HEAD"]);
            git(path, &["branch", "missing"]);
            git(path, &["config", "branch.missing.remote", "origin"]);
            git(
                path,
                &["config", "branch.missing.merge", "refs/heads/deleted"],
            );
            let branches = super::super::all_branches(path).expect("inventory");
            let state = |name| {
                &branches
                    .iter()
                    .find(|b| b.local && b.name == name)
                    .expect("branch")
                    .sync
                    .as_ref()
                    .expect("local status")
                    .state
            };
            assert_eq!(
                state("new"),
                &SyncState::Untracked,
                "a namesake doesn't configure tracking"
            );
            assert_eq!(
                state("missing"),
                &SyncState::Missing,
                "a deleted upstream is not synced"
            );
            assert!(
                matches!(
                    state("main"),
                    SyncState::Known {
                        ahead: 0,
                        behind: 0,
                        ..
                    }
                ),
                "the target has its own sync status too"
            );
            assert!(
                branches
                    .iter()
                    .filter(|b| !b.local)
                    .all(|b| b.sync.is_none()),
                "remote inventory rows don't inherit local sync status"
            );
        });
    }
}
