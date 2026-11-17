//! Upstream status, explicit branch actions, and the two sides of Compare.

use super::*;
use crate::backend::branches::sync::{
    self as remote, BranchSync, PullStrategy, SyncAction, SyncBranch, SyncOutcome, SyncState,
};
use crate::palette::Choice;
use crate::ui::Text;

pub(super) fn status_mark(status: &BranchSync, solid: bool, theme: &Theme) -> impl IntoElement {
    let upstream = status
        .upstream
        .as_ref()
        .map(|r| r.shorten().to_string())
        .unwrap_or_else(|| "No upstream".into());
    let (label, tip) = match &status.state {
        SyncState::Known { ahead, behind, .. } => (
            None,
            format!(
                "{upstream}\n{ahead} commits only here, {behind} commits only on the upstream\nBased on the last fetch"
            ),
        ),
        SyncState::Untracked => (
            Some("No upstream"),
            "Set a tracking branch or publish this branch".to_owned(),
        ),
        SyncState::Missing => (
            Some("Upstream missing"),
            format!("{upstream} is missing; fetch or publish the branch"),
        ),
        SyncState::Unavailable(reason) => (Some("Unavailable"), format!("{upstream}\n{reason}")),
    };
    let ink = |color| if solid { theme.text_inverted } else { color };
    h_flex()
        .id(gpui::ElementId::Name(
            format!("branch-sync-{upstream}").into(),
        ))
        .flex_none()
        .min_w(dp(64.))
        .justify_end()
        .gap(dp(5.))
        .text_11()
        .when_some(label, |el, label| {
            el.child(div().text_color(ink(theme.text_3)).child(label))
        })
        .when(
            matches!(
                status.state,
                SyncState::Known {
                    ahead: 0,
                    behind: 0,
                    ..
                }
            ),
            |el| {
                el.child(small_icon(Icon::Tick).text_color(ink(theme.text_2)))
                    .child(div().text_color(ink(theme.text_2)).child("Synced"))
            },
        )
        .map(|el| match status.state {
            SyncState::Known { ahead, behind, .. } if ahead + behind > 0 => el
                .child(
                    h_flex()
                        .min_w(dp(24.))
                        .justify_end()
                        .gap(dp(2.))
                        .when(ahead > 0, |el| {
                            el.child(small_icon(Icon::ArrowUp).text_color(ink(theme.blue)))
                                .child(div().text_color(ink(theme.blue)).child(ahead.to_string()))
                        }),
                )
                .child(
                    h_flex()
                        .min_w(dp(24.))
                        .justify_end()
                        .gap(dp(2.))
                        .when(behind > 0, |el| {
                            el.child(small_icon(Icon::ArrowDown).text_color(ink(theme.warn)))
                                .child(div().text_color(ink(theme.warn)).child(behind.to_string()))
                        }),
                ),
            _ => el,
        })
        .tooltip(Tooltip::text(tip))
}

impl Detail {
    pub(super) fn branch_sync_menu(
        &self,
        project: &ProjectId,
        branch: &OtherBranch,
        cx: &Context<Self>,
    ) -> Vec<MenuItem> {
        let Some(sync) = &branch.sync else {
            return Vec::new();
        };
        let (ahead, behind, pull_reason, push_reason) = match &sync.state {
            SyncState::Known { ahead, behind, .. } => (
                *ahead,
                *behind,
                (*behind == 0).then_some("No incoming commits"),
                if *behind > 0 {
                    Some("Pull remote changes first")
                } else if *ahead == 0 {
                    Some("Already up to date")
                } else {
                    None
                },
            ),
            SyncState::Missing => (
                0,
                0,
                Some("Fetch or publish the missing upstream branch"),
                None,
            ),
            SyncState::Untracked => (
                0,
                0,
                Some("Set an upstream branch first"),
                Some("Choose where to publish this branch"),
            ),
            SyncState::Unavailable(_) => (
                0,
                0,
                Some("Upstream history is unavailable"),
                Some("Upstream history is unavailable"),
            ),
        };
        let upstream = sync.upstream.clone();
        let heading = upstream
            .as_ref()
            .map(|r| r.shorten().to_string())
            .unwrap_or_else(|| "Upstream".into());
        let action = |label: String, action: SyncAction| {
            let (project, branch, upstream, detail) = (
                project.clone(),
                branch.clone(),
                upstream.clone(),
                cx.entity().downgrade(),
            );
            MenuItem::new(label, move |_, window, cx| {
                let Some(upstream) = upstream.clone() else {
                    return;
                };
                let request = SyncBranch {
                    branch: branch.ref_name.clone(),
                    local_tip: branch.tip,
                    upstream,
                    remote_tip: None,
                    action,
                    run_hooks: true,
                    publish: branch
                        .sync
                        .as_ref()
                        .is_some_and(|s| matches!(s.state, SyncState::Missing)),
                };
                detail
                    .update(cx, |this, cx| {
                        this.sync_listed_branch(project.clone(), request, window, cx)
                    })
                    .ok();
            })
        };
        let mut items = vec![
            action(
                if ahead > 0 && behind > 0 {
                    format!("Pull {}…", plural(behind, "commit"))
                } else if behind > 0 {
                    format!("Pull {}", plural(behind, "commit"))
                } else {
                    "Pull".into()
                },
                SyncAction::Pull(None),
            )
            .under(heading)
            .disabled_because(pull_reason),
            action(
                if matches!(sync.state, SyncState::Missing) {
                    "Publish branch".into()
                } else if ahead > 0 {
                    format!("Push {}", plural(ahead, "commit"))
                } else {
                    "Push".into()
                },
                SyncAction::Push,
            )
            .disabled_because(push_reason),
        ];
        let (project_copy, reference, detail) = (
            project.clone(),
            branch.ref_name.clone(),
            cx.entity().downgrade(),
        );
        items.push(
            MenuItem::new(
                format!(
                    "Compare with {}",
                    upstream
                        .as_ref()
                        .map(|r| r.shorten().to_string())
                        .unwrap_or_else(|| "upstream".into())
                ),
                move |_, _, cx| {
                    detail
                        .update(cx, |this, cx| {
                            this.compare_listed_branch(&project_copy, &reference, cx)
                        })
                        .ok();
                },
            )
            .separated()
            .disabled_because(
                (!matches!(sync.state, SyncState::Known { .. }))
                    .then_some("An available upstream is required"),
            ),
        );
        if matches!(sync.state, SyncState::Untracked) {
            for (label, publish) in [("Set upstream…", false), ("Publish to remote…", true)] {
                let (project, branch, detail) =
                    (project.clone(), branch.clone(), cx.entity().downgrade());
                items.push(MenuItem::new(label, move |_, window, cx| {
                    detail
                        .update(cx, |this, cx| {
                            this.choose_branch_upstream(&project, &branch, publish, window, cx)
                        })
                        .ok();
                }));
            }
        }
        items
    }

    fn sync_listed_branch(
        &mut self,
        project: ProjectId,
        mut request: SyncBranch,
        window: &mut Window,
        cx: &mut Context<Self>,
    ) {
        request.run_hooks = self.store.read(cx).runs_hooks(&project);
        let (detail, handle, after, retried) = (
            cx.entity().downgrade(),
            window.window_handle(),
            project.clone(),
            request.clone(),
        );
        let pushing = request.action == SyncAction::Push;
        self.store.update(cx, |store, cx| store.apply(&project,
            if pushing { "Push branch" } else { "Pull branch" }, Overlay::default(), request,
            move |store, outcome, cx| {
                store.fetched_now(&after, true);
                if matches!(outcome, SyncOutcome::Done) {
                    if pushing { store.pushed(&after); store.snack("Branch pushed", cx); }
                    else { store.snack_undoable("Branch updated from upstream", cx); }
                }
                // Reading a detail from its store's callback would re-borrow the store.
                cx.defer(move |cx| {
                    handle.update(cx, |_, window, cx| {
                        detail.update(cx, |this, cx| {
                            this.load_branches(&after, true, cx);
                            if let SyncOutcome::Diverged { remote_tip, ahead, behind } = outcome {
                                let app = this.app.clone();
                                let detail = cx.entity().downgrade();
                                app.update_later(window, cx, move |app, window, cx| {
                                    let choices = [("Merge remote changes", PullStrategy::Merge, "Keep local commits and create a merge commit"),
                                        ("Rebase local commits", PullStrategy::Rebase, "Replay local commits on top of the upstream")]
                                        .into_iter().map(|(label, strategy, description)| {
                                            let (detail, project, mut request) = (detail.clone(), after.clone(), retried.clone());
                                            request.action = SyncAction::Pull(Some(strategy));
                                            request.remote_tip = Some(remote_tip);
                                            Choice::new(label, move |_, window, cx| {
                                                detail.update(cx, |this, cx| this.sync_listed_branch(project, request, window, cx)).ok();
                                            }).detail(description)
                                        }).collect();
                                    app.open_picker(Some(format!("{} · {ahead} local, {behind} remote", retried.branch.shorten()).into()), "Choose how to pull", "Pull", choices, window, cx);
                                });
                            }
                        }).ok();
                    }).ok();
                });
            }, cx));
    }

    fn choose_branch_upstream(
        &mut self,
        project: &ProjectId,
        branch: &OtherBranch,
        publish: bool,
        window: &mut Window,
        cx: &mut Context<Self>,
    ) {
        let Some(path) = self.store.read(cx).path(project) else {
            return;
        };
        let existing: Vec<_> = self
            .branches_for(project)
            .into_iter()
            .flat_map(|b| &b.list)
            .filter(|b| !b.local)
            .map(|b| b.ref_name.clone())
            .collect();
        let (project, branch) = (project.clone(), branch.clone());
        self._branch_sync_load = cx.spawn_in(window, async move |this, cx| {
            let reference = branch.ref_name.clone();
            let choices = if publish {
                backend::run(move || remote::publication_targets(&path, &reference)).await
            } else {
                Ok(existing)
            };
            this.update_in(cx, |this, window, cx| {
                let choices = match choices {
                    Ok(choices) => choices,
                    Err(err) => {
                        this.store.update(cx, |store, cx| {
                            store.failed("Couldn't list remotes", &err, cx)
                        });
                        return;
                    }
                };
                if choices.is_empty() {
                    this.store.update(cx, |store, cx| {
                        store.snack("Add a remote and fetch its branches first", cx)
                    });
                    return;
                }
                let detail = cx.entity().downgrade();
                this.app.update_later(window, cx, move |app, window, cx| {
                    let choices = choices
                        .into_iter()
                        .map(|upstream| {
                            let (detail, project, branch) =
                                (detail.clone(), project.clone(), branch.clone());
                            Choice::new(upstream.shorten().to_string(), move |_, window, cx| {
                                detail
                                    .update(cx, |this, cx| {
                                        this.track_branch_upstream(
                                            project, branch, upstream, publish, window, cx,
                                        )
                                    })
                                    .ok();
                            })
                        })
                        .collect();
                    app.open_picker(
                        Some(branch.name.into()),
                        if publish {
                            "Publish branch to"
                        } else {
                            "Track a remote branch"
                        },
                        if publish { "Publish" } else { "Track" },
                        choices,
                        window,
                        cx,
                    );
                });
            })
            .ok();
        });
    }

    fn track_branch_upstream(
        &mut self,
        project: ProjectId,
        branch: OtherBranch,
        upstream: FullName,
        publish: bool,
        window: &mut Window,
        cx: &mut Context<Self>,
    ) {
        let (detail, handle, after) = (
            cx.entity().downgrade(),
            window.window_handle(),
            project.clone(),
        );
        let request = SyncBranch {
            branch: branch.ref_name.clone(),
            local_tip: branch.tip,
            upstream: upstream.clone(),
            remote_tip: None,
            action: SyncAction::Push,
            run_hooks: true,
            publish,
        };
        self.store.update(cx, |store, cx| {
            store.apply(
                &project,
                "Set upstream",
                Overlay::default(),
                remote::TrackUpstream {
                    branch: branch.ref_name,
                    local_tip: branch.tip,
                    upstream,
                },
                move |store, (), cx| {
                    // Tracking configuration is a Git setting, outside history undo.
                    store.keep_last_snapshot(cx);
                    store.snack("Upstream configured", cx);
                    cx.defer(move |cx| {
                        handle
                            .update(cx, |_, window, cx| {
                                detail
                                    .update(cx, |this, cx| {
                                        this.load_branches(&after, true, cx);
                                        if publish {
                                            this.sync_listed_branch(after, request, window, cx);
                                        }
                                    })
                                    .ok();
                            })
                            .ok();
                    });
                },
                cx,
            )
        });
    }

    fn compare_listed_branch(
        &mut self,
        project: &ProjectId,
        reference: &FullName,
        cx: &mut Context<Self>,
    ) {
        self.select_other_branch(Some(reference.clone()), cx);
        if let Some(branches) = self.branches.get_mut(project) {
            branches.comparing = true;
        }
        self.load_branch_comparison(project, cx);
        self.show_picked(cx);
    }

    pub(super) fn load_branch_comparison(&mut self, project: &ProjectId, cx: &mut Context<Self>) {
        if self.on_tab(ProjectTab::Branches).as_ref() != Some(project) {
            return;
        }
        let Some(branches) = self
            .branches_for(project)
            .filter(|b| b.comparing && b.comparison.is_none())
        else {
            return;
        };
        let Some(reference) = branches.selected.clone() else {
            return;
        };
        let Some(path) = self.store.read(cx).path(project) else {
            return;
        };
        let project = project.clone();
        self._branch_compare_load = cx.spawn(async move |this, cx| {
            let asked = reference.clone();
            let result = backend::run(move || remote::compare(&path, &asked)).await;
            this.update(cx, |this, cx| {
                let Some(branches) = this.branches.get_mut(&project).filter(|b| b.comparing && b.selected.as_ref() == Some(&reference)) else { return; };
                match result {
                    Ok(compared) => {
                        let current = branches.branch(&reference).is_some_and(|b| b.tip == compared.local_tip && b.sync.as_ref().is_some_and(|s| matches!(s.state, SyncState::Known { tip, .. } if tip == compared.remote_tip)));
                        if !current { this.load_branches(&project, true, cx); return; }
                        if branches.commit.is_some_and(|id| !compared.local.iter().chain(&compared.remote).any(|c| c.id == id)) { branches.commit = None; }
                        branches.comparison = Some(compared);
                        branches.compare_error = None;
                    }
                    Err(err) => branches.compare_error = Some(format!("{err:#}")),
                }
                this.refresh_diff(false, cx);
                cx.notify();
            }).ok();
        });
    }

    fn comparison_step(&mut self, delta: isize, cx: &mut Context<Self>) -> bool {
        let Some(branches) = self.page_branches_mut() else {
            return false;
        };
        let Some(compared) = &branches.comparison else {
            return false;
        };
        let ids: Vec<_> = compared
            .local
            .iter()
            .chain(&compared.remote)
            .map(|c| c.id)
            .collect();
        let current = branches
            .commit
            .and_then(|id| ids.iter().position(|c| *c == id));
        let next = match current {
            Some(at) => at
                .saturating_add_signed(delta)
                .min(ids.len().saturating_sub(1)),
            None if delta < 0 => ids.len().saturating_sub(1),
            None => 0,
        };
        let next = ids.get(next).copied();
        if branches.commit == next {
            return false;
        }
        branches.commit = next;
        self.show_picked(cx);
        true
    }

    pub(super) fn render_branch_comparison(
        &self,
        project: &ProjectId,
        theme: &Theme,
        cx: &Context<Self>,
    ) -> AnyElement {
        let Some(branches) = self.branches_for(project) else {
            return div().into_any_element();
        };
        let reference = branches.selected.clone();
        let header = v_flex()
            .gap(dp(6.))
            .px(dp(12.))
            .py(dp(10.))
            .child(
                button("back-from-compare", "Branches")
                    .icon(Icon::ChevronLeft)
                    .on_click(cx.listener(move |this, _, _, cx| {
                        this.select_other_branch(reference.clone(), cx)
                    })),
            )
            .child(
                div()
                    .text_12()
                    .text_color(theme.text_2)
                    .child("Commits that differ from upstream"),
            );
        let body = if let Some(error) = &branches.compare_error {
            div()
                .p(dp(16.))
                .child(error_summary(error))
                .into_any_element()
        } else if let Some(compared) = &branches.comparison {
            let (local, remote, shown) =
                (compared.local.len(), compared.remote.len(), project.clone());
            side_list(
                local + remote + 2,
                &self.branches_scroll,
                "branch-compare-scrollbar",
                cx,
                |_, _| None,
                move |this, ix, theme, window, cx| {
                    let branches = this.branches_for(&shown)?;
                    let compared = branches.comparison.as_ref()?;
                    if ix == 0 {
                        return Some(list_heading(
                            format!("Only local · {}", compared.local.len()),
                            theme,
                        ));
                    }
                    if ix == local + 1 {
                        return Some(list_heading(
                            format!(
                                "Only {} · {}",
                                compared.upstream.shorten(),
                                compared.remote.len()
                            ),
                            theme,
                        ));
                    }
                    let commit = if ix <= local {
                        compared.local.get(ix - 1)?
                    } else {
                        compared.remote.get(ix - local - 2)?
                    };
                    let (id, reference) = (commit.id, compared.branch.clone());
                    Some(
                        side_row(
                            ("compare-commit", ix),
                            branches.commit == Some(id),
                            has_keys(&this.side_focus, window, cx),
                            theme,
                        )
                        .child(small_icon(Icon::Commit).text_color(theme.text_2))
                        .child(
                            div()
                                .flex_1()
                                .min_w_0()
                                .truncate()
                                .child(crate::ui::commit_title(&commit.title)),
                        )
                        .child(div().text_11().text_color(theme.text_2).child(id.short()))
                        .on_click(cx.listener(move |this, _, _, cx| {
                            this.select_branch_commit(&reference, id, cx)
                        }))
                        .into_any_element(),
                    )
                },
            )
            .flex_1()
            .min_h(dp(LIST_MIN_HEIGHT))
            .into_any_element()
        } else {
            loading_state("Comparing branches…", theme, cx)
        };
        self.list_column(Self::comparison_step, None, None, None, cx)
            .child(header)
            .child(body)
            .into_any_element()
    }
}
