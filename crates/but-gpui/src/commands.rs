//! What the app can do, as ⌘K and the right-click menus offer it: each command's one title,
//! whether it throws work away, how a menu words it for the selection, and when it's offered.

use gpui::{Action, App, Window};

use crate::app::{
    ActualSize, AddProject, AppView, ChangeTheme, CheckForUpdates, CopySelection, Fetch,
    FocusChanges, FocusDiff, FocusNavigator, FocusTerminals, NewBranch, NewBranchOnTop,
    OpenPullRequest, Pull, Push, Quit, Redo, StartAmend, StartCommit, ToggleDetail, ToggleFileTree,
    ToggleNavigator, ToggleNavigatorPlace, ToggleTerminalOverview, Undo, UpdateFromTarget,
    UpdateWorkspace, UpdateWorktrees, ZoomIn, ZoomOut,
};
use crate::backend::{FullName, Workspace};
use crate::detail::{FoldFile, NextFile, NextHunk, PreviousFile, PreviousHunk, UnfoldFile};
use crate::edits::{
    AddEmptyCommitAbove, AddEmptyCommitBelow, BranchEdits, CherryPick, CopyChangeId, CopyMessage,
    Discard, NameBranch, NewBranchBelow, NewBranchHere, RenameBranch, RenameTerminal, Reword,
    RewrapMessage, SquashAll, StackOn, UnapplyStack, Uncommit, Unstack,
};
use crate::palette::{CopyMore, GoTo, GoToTerminal};
use crate::state::Selection;
use crate::ui::{commit_title, quoted};

/// What the palette calls the action named `name`, or its name in words: `navigator::SelectNext`
/// is "Select next".
pub(crate) fn title_of(name: &str) -> String {
    if let Some(command) = COMMANDS.iter().find(|c| c.name() == name) {
        return command.title().to_owned();
    }
    let last = name.rsplit("::").next().unwrap_or(name);
    let mut words = String::new();
    for (ix, c) in last.char_indices() {
        if c.is_uppercase() && ix > 0 {
            words.push(' ');
            words.extend(c.to_lowercase());
        } else {
            words.push(c);
        }
    }
    words
}

/// An action the palette and the menus offer, by the one title they all call it.
pub(crate) trait Command: Action {
    fn message_id(&self) -> &'static str;

    fn source_title(&self) -> &'static str {
        crate::i18n::english(self.message_id())
    }

    fn title(&self) -> &'static str {
        crate::i18n::t(self.message_id())
    }

    fn menu_title(&self) -> &'static str {
        crate::i18n::language().attribute(self.message_id(), "menu")
    }

    fn source_menu_title(&self) -> &'static str {
        crate::i18n::Language::English.attribute(self.message_id(), "menu")
    }

    /// It throws work away, so ⌘K then Enter never repeats it, and letters scattered through
    /// its title don't find it.
    fn risky(&self) -> bool {
        false
    }

    /// How a right-click menu says it for the selection, with what it acts on in the sentence:
    /// "Pull 3 commits from the remote" for Pull from the remote. It keeps the title's verb, so
    /// what a menu says is what ⌘K finds. The title when `None`.
    fn phrase(&self, _app: &AppView, _window: &Window, _cx: &App) -> Option<String> {
        None
    }

    /// Whether ⌘K and the menus offer it where its handler is registered: not where it could
    /// only say why it can't run, as Push with nothing to push, whose key still says so.
    fn listed(&self, _app: &AppView, _cx: &App) -> bool {
        true
    }

    /// Other names typing finds it by in ⌘K and Settings › Keyboard, as other commands word the
    /// same kind of thing: Remove branch for Delete branch. Never shown.
    fn aliases(&self) -> &'static [&'static str] {
        &[]
    }
}

/// Gives each action its title, `risky` after the ones that throw work away, and between braces
/// the functions of the app that word it for a menu (`phrase`, or `phrase_at` where that
/// depends on what has the keys) and say whether it's offered
/// (`listed`), and the other names it's found by (`aliases`), and lists them as [`COMMANDS`], in
/// that order.
macro_rules! commands {
    ($(
        $action:path => $message_id:literal $($risky:ident)? $({ $($option:ident: $method:expr),* $(,)? })?
    ),* $(,)?) => {
        $(impl Command for $action {
            fn message_id(&self) -> &'static str {
                $message_id
            }
            $(fn $risky(&self) -> bool {
                true
            })?
            $($(commands!(@option $option $method);)*)?
        })*

        /// Every command, in the order they're listed before anything is typed.
        pub(crate) const COMMANDS: &[&dyn Command] = &[$(&$action),*];
    };
    (@option phrase $method:expr) => {
        fn phrase(&self, app: &AppView, _window: &Window, cx: &App) -> Option<String> {
            let phrase: fn(&AppView, &App) -> Option<String> = $method;
            phrase(app, cx)
        }
    };
    // A phrase that depends on where the keys are.
    (@option phrase_at $method:expr) => {
        fn phrase(&self, app: &AppView, window: &Window, cx: &App) -> Option<String> {
            let phrase: fn(&AppView, &Window, &App) -> Option<String> = $method;
            phrase(app, window, cx)
        }
    };
    (@option listed $method:expr) => {
        fn listed(&self, app: &AppView, cx: &App) -> bool {
            let listed: fn(&AppView, &App) -> bool = $method;
            listed(app, cx)
        }
    };
    (@option aliases $aliases:expr) => {
        fn aliases(&self) -> &'static [&'static str] {
            $aliases
        }
    };
}

commands! {
    NextHunk => "command-next-hunk",
    PreviousHunk => "command-previous-hunk",
    NextFile => "command-next-file",
    PreviousFile => "command-previous-file",
    FoldFile => "command-fold-file",
    UnfoldFile => "command-unfold-file",
    ToggleFileTree => "command-toggle-file-tree",
    Discard => "command-discard" risky {
        aliases: &[
            "Discard commit",
            "Remove commit",
            "Delete commit",
            "Discard changes",
            "Discard hunk",
            "Discard lines",
            "Discard file",
            "Delete branch",
            "Remove branch",
            "Discard branch",
            "Close terminal",
            "Remove terminal",
            "Delete terminal",
            "Discard terminal",
            "Delete worktree",
            "Remove worktree",
            "Discard worktree",
        ],
        listed: deletable,
    },
    crate::detail::CheckAll => "command-check-all",
    crate::detail::UncheckAll => "command-uncheck-all",
    crate::detail::MarkResolved => "command-mark-resolved",
    crate::detail::UncommitChanges => "command-uncommit-changes" risky {
        phrase: |app, cx| Some(crate::i18n::tf("command-uncommit-changes-phrase", &[("changes", app.detail.read(cx).changes_kind(cx)?.into())])),
    },
    crate::detail::SplitIntoNewCommit => "command-split-into-new-commit",
    StartCommit => "command-start-commit",
    StartAmend => "command-start-amend",
    Undo => "command-undo",
    Redo => "command-redo",
    Push => "command-push" risky { phrase: push_phrase, listed: pushable },
    OpenPullRequest => "command-open-pull-request" { listed: has_pull_request },
    Fetch => "command-fetch",
    Pull => "command-pull",
    UpdateFromTarget => "command-update-target" { listed: target_moved },
    UpdateWorkspace => "command-update-workspace" { listed: has_target },
    UpdateWorktrees => "command-update-worktrees" { listed: has_target },
    NewBranch => "command-new-branch",
    NewBranchOnTop => "command-new-branch-top",
    crate::app::NewWorktree => "command-new-worktree" { listed: has_target },
    crate::app::NewWorktreeWithName => "command-new-worktree-name" { listed: has_target },
    crate::app::RecycleWorktree => "command-recycle-worktree" {
        listed: has_target,
        aliases: &["Reuse worktree"],
    },
    Reword => "command-reword" {
        aliases: &["Reword commit", "Rename commit", "Edit commit message"],
    },
    RenameBranch => "command-rename-branch" {
        aliases: &["Reword branch", "Edit branch name"],
    },
    NameBranch => "command-name-branch",
    // What a terminal's menu called Reword before it had a command of its own.
    RenameTerminal => "command-rename-terminal" { aliases: &["Reword terminal"] },
    Uncommit => "command-uncommit" risky {
        phrase: |app, cx| picks(app, cx).map(|n| crate::i18n::tf("command-uncommit-picked-phrase", &[("count", n.into())])),
    },
    CherryPick => "command-cherry-pick" {
        // The workspace's commits picked, or the Branches page's.
        phrase: |app, cx| {
            let n = picks(app, cx).or_else(|| app.detail.read(cx).branch_cherry_picks())?;
            (n > 1).then(|| crate::i18n::tf("command-cherry-pick-picked-phrase", &[("count", n.into())]))
        },
    },
    AddEmptyCommitAbove => "command-add-empty-commit-above" {
        // On a branch, above is on top: it's the only place there.
        phrase: |app, cx| on_branch(app, cx).then(|| crate::i18n::t("command-add-empty-commit-phrase").to_owned()),
    },
    AddEmptyCommitBelow => "command-add-empty-commit-below",
    SquashAll => "command-squash-all" risky,
    crate::edits::SquashPicked => "command-squash-picked" risky { phrase: squash_picked_phrase },
    crate::edits::SquashIntoSelected => "command-squash-into-selected" risky {
        phrase: |app, cx| picks(app, cx).map(|n| crate::i18n::tf("command-squash-into-picked-phrase", &[("count", n.into())])),
    },
    crate::edits::MoveToNewBranch => "command-move-new-branch" {
        phrase: |app, cx| picks(app, cx).map(|n| crate::i18n::tf("command-move-new-branch-phrase", &[("count", n.into())])),
    },
    crate::edits::PullRemote => "command-pull-remote" { phrase: pull_phrase },
    crate::edits::TakeRemote => "command-take-remote" risky,
    NewBranchBelow => "command-new-branch-below",
    NewBranchHere => "command-new-branch-here",
    StackOn => "command-stack",
    Unstack => "command-unstack",
    UnapplyStack => "command-unapply-stack" risky { phrase: unapply_phrase },
    crate::edits::MergeBranch => "command-merge-branch" risky { phrase: merge_phrase },
    RewrapMessage => "command-rewrap-message",
    CopyChangeId => "command-copy-change-id",
    CopyMessage => "command-copy-message",
    CopySelection => "command-copy-selection",
    crate::app::CopyCommitId => "command-copy-commit-id",
    crate::app::CopyBranchName => "command-copy-branch-name" {
        phrase: |_, _| Some(crate::i18n::t("command-copy-name-phrase").to_owned()),
    },
    crate::app::CopyPullRequestLink => "command-copy-pull-request-link",
    crate::app::CopySnapshotId => "command-copy-snapshot-id",
    crate::app::CopyPath => "command-copy-path",
    crate::app::CopyRelativePath => "command-copy-relative-path",
    crate::app::CopyAbsolutePath => "command-copy-absolute-path",
    crate::app::CopyErrorMessage => "command-copy-error-message",
    CopyMore => "command-copy-more",
    crate::app::MoveSelection => "command-move-selection" {
        phrase: |app, cx| picks(app, cx).map(|n| crate::i18n::tf("command-move-picked-phrase", &[("count", n.into())])),
    },
    crate::app::SquashSelection => "command-squash-selection" {
        phrase_at: squash_phrase,
        // What's uncommitted is amended instead.
        listed: |app, cx| !matches!(app.store.read(cx).selection, Some(Selection::Uncommitted(..))),
    },
    crate::app::SquashIntoSelection => "command-squash-into-selection",
    ToggleNavigator => "command-toggle-navigator",
    ToggleNavigatorPlace => "command-toggle-navigator-place",
    ToggleDetail => "command-toggle-detail",
    ToggleTerminalOverview => "command-toggle-terminal-overview",
    ZoomIn => "command-zoom",
    ZoomOut => "command-zoom-out",
    ActualSize => "command-actual-size",
    FocusNavigator => "command-focus-navigator",
    FocusChanges => "command-focus-changes",
    FocusDiff => "command-focus-diff",
    FocusTerminals => "command-focus-terminals",
    AddProject => "command-add-project",
    crate::projects::CloneRepository => "command-clone-repository",
    crate::settings::OpenSettings => "command-open-settings",
    ChangeTheme => "command-change-theme" { aliases: &["Colour scheme", "Color scheme"] },
    crate::settings::OpenBriefsSettings => "command-open-briefs-settings" { listed: briefs_off },
    crate::settings::OpenKeyboardShortcuts => "command-open-keyboard-shortcuts",
    crate::app::OperationsHistory => "command-operations-history",
    crate::app::NextProjectPage => "command-next-project-page" { aliases: &["Next project page"] },
    crate::app::PreviousProjectPage => "command-previous-project-page" {
        aliases: &["Previous project page"]
    },
    crate::app::NextNavigatorTab => "command-next-navigator-tab" {
        aliases: &["Next worktree"],
        listed: navigator_on_top
    },
    crate::app::PreviousNavigatorTab => "command-previous-navigator-tab" {
        aliases: &["Previous worktree"],
        listed: navigator_on_top
    },
    crate::app::FocusNextPane => "command-focus-next-pane",
    crate::app::FocusPreviousPane => "command-focus-previous-pane",
    crate::app::FocusPaneRight => "command-focus-pane-right",
    crate::app::FocusPaneLeft => "command-focus-pane-left",
    crate::app::FocusTileLeft => "command-focus-tile-left" { aliases: &["Left split"] },
    crate::app::FocusTileRight => "command-focus-tile-right" { aliases: &["Right split"] },
    crate::app::FocusTileUp => "command-focus-tile-up" { aliases: &["Upper split"] },
    crate::app::FocusTileDown => "command-focus-tile-down" { aliases: &["Lower split"] },
    crate::detail::SwitchTab => "command-switch-tab" {
        aliases: &["Switch between Changes and Pull request"]
    },
    crate::detail::PreviousTab => "command-previous-tab",
    crate::detail::ShowBrief => "command-show-brief" { listed: brief_here },
    crate::detail::ShowBranchesWithBriefs => "command-show-branches-briefs" {
        aliases: &["Find a brief"],
        listed: briefs_on,
    },
    crate::detail::ChangesBeside => "command-changes-beside" { listed: changes_can_go_beside },
    crate::detail::WriteNote => "command-write-note" { listed: brief_shown },
    crate::detail::SendNotes => "command-send-notes" { listed: brief_shown },
    crate::detail::NextBrief => "command-next-brief" { listed: brief_shown },
    crate::detail::PreviousBrief => "command-previous-brief" { listed: brief_shown },
    crate::app::CloseWindow => "command-close-window",
    GoTo => "command-go",
    GoToTerminal => "command-go-terminal",
    crate::detail::FindInDiff => "command-find-diff" { aliases: &["Find in diff", "Find in the brief"] },
    crate::detail::FilterFiles => "command-filter-files",
    crate::detail::ToggleWrap => "command-toggle-wrap",
    crate::detail::TogglePlainLines => "command-toggle-plain-lines",
    crate::detail::ToggleSplit => "command-toggle-split",
    crate::detail::ToggleFiles => "command-toggle-files" {
        // In the single file diff the files stay beside the diff, and nothing hides them.
        listed: |app, cx| !app.detail.read(cx).single_file_diff(cx),
    },
    crate::pr::CreatePullRequest => "command-create-pull-request" { listed: pull_request_creatable },
    crate::pr::MergePullRequest => "command-merge-pull-request" risky {
        // As the forge's button says it, for how the project merges.
        phrase: |app, cx| {
            let store = app.store.read(cx);
            let method = crate::pr::merge_method(store, store.selection.as_ref()?.project());
            Some(crate::pr::Offer::Merge.label(method).to_owned())
        },
    },
    crate::pr::EnableAutoMerge => "command-enable-auto-merge",
    crate::pr::DisableAutoMerge => "command-disable-auto-merge",
    crate::pr::ConvertToDraft => "command-convert-draft",
    crate::pr::MarkReadyForReview => "command-mark-ready-review",
    crate::detail::ResolveConflicts => "command-resolve-conflicts" {
        // A linked worktree's conflicts are resolved there.
        listed: |app, cx| {
            let store = app.store.read(cx);
            (store.selection.as_ref()).is_none_or(|s| !store.in_linked(s))
        },
    },
    crate::detail::ApplyBranch => "command-apply-branch",
    crate::detail::NewWorktreeFromBranch => "command-new-worktree-branch" {
        // Of the branch the menu's on.
        phrase: |_, _| Some(crate::i18n::t("command-new-worktree-phrase").to_owned()),
    },
    crate::detail::EditDescription => "command-edit-description" {
        phrase: |_, _| Some(crate::i18n::t("command-edit-description-phrase").to_owned()),
    },
    crate::detail::RestoreOperation => "command-restore-operation" risky {
        phrase: |_, _| Some(crate::i18n::t("command-restore-operation-phrase").to_owned()),
    },
    crate::open_in::OpenInEditor => "command-open-editor" {
        // The one chosen.
        phrase: |app, cx| Some(crate::open_in::editor_label(app.store.read(cx))),
    },
    crate::open_in::OpenInTerminal => "command-open-terminal",
    crate::terminal::NewTerminal => "command-new-terminal",
    crate::terminal::NewTerminalWith => "command-new-terminal-with" {
        aliases: &["Open terminal with", "Run in new terminal", "New agent terminal"],
        // Short in a menu, beside "Open a file…".
        phrase: |_, _| Some(crate::i18n::t("command-new-terminal-with-phrase").to_owned()),
    },
    crate::app::SplitRight => "command-split-right" { aliases: &["Split vertically", "Pin to the right"] },
    crate::app::SplitBelow => "command-split-below" {
        aliases: &["Split down", "Split horizontally", "Pin below"],
    },
    crate::app::NewTerminalRight => "command-new-terminal-right" {
        aliases: &["Split terminal right", "Terminal to the right"],
    },
    crate::app::NewTerminalBelow => "command-new-terminal-below" {
        aliases: &["Split terminal below", "Split terminal down", "Terminal below"],
    },
    crate::app::NewTerminalWithRight => "command-new-terminal-with-right" {
        aliases: &["Run in new terminal to the right", "New agent terminal to the right"],
    },
    crate::app::NewTerminalWithBelow => "command-new-terminal-with-below" {
        aliases: &["Run in new terminal below", "New agent terminal below"],
    },
    crate::app::EqualizeTiles => "command-equalize-tiles" {
        aliases: &["Equalize splits", "Even out tiles", "Balance tiles", "Balance splits"],
    },
    crate::app::ZoomTile => "command-zoom-tile" {
        aliases: &["Zoom split", "Maximize tile", "Maximize split"],
    },
    crate::app::ArrangeTiles => "command-arrange-tiles" {
        aliases: &["Move tile", "Move split", "Rearrange tiles", "Rearrange splits"],
    },
    crate::app::SwapTiles => "command-swap-tiles" {
        aliases: &["Swap splits", "Exchange tiles", "Exchange splits"],
    },
    crate::app::NextTile => "command-next-tile" { aliases: &["Next split"] },
    crate::app::PreviousTile => "command-previous-tile" { aliases: &["Previous split"] },
    crate::app::CopyTileDiagram => "command-copy-tile-diagram" {
        aliases: &["Copy splits as ASCII", "Copy tiling diagram"],
    },
    crate::navigator::Watch => "command-watch",
    crate::navigator::StopWatching => "command-stop-watching" { aliases: &["Unwatch"] },
    crate::navigator::UnarchiveWorktree => "command-unarchive-worktree",
    crate::navigator::Reveal => "command-reveal",
    crate::navigator::OpenProjectSettings => "command-open-project-settings",
    crate::navigator::OpenRepository => "command-open-repository" {
        aliases: &[
            "Open on GitHub",
            "Open on GitLab",
            "Open on Bitbucket",
            "Open on Azure",
            "Open remote",
            "View repository",
        ],
        // The forge it's on.
        phrase: |app, cx| Some(crate::i18n::tf("command-open-forge-phrase", &[("provider", selected_workspace(app, cx)?.forge?.name().into())])),
    },
    crate::navigator::ArchiveWorktree => "command-archive-worktree" {
        phrase: |_, _| Some(crate::i18n::t("command-archive-phrase").to_owned()),
    },
    // Under their headings in the view menus, they're the choices.
    crate::navigator::SortProjectsByActivity => "command-sort-projects-activity" {
        phrase: |_, _| Some(crate::i18n::t("command-sort-activity-phrase").to_owned()),
    },
    crate::navigator::SortProjectsByName => "command-sort-projects-name" {
        phrase: |_, _| Some(crate::i18n::t("command-sort-name-phrase").to_owned()),
    },
    crate::navigator::ShowAllProjects => "command-show-all-projects" {
        phrase: |_, _| Some(crate::i18n::t("command-all-projects-phrase").to_owned()),
    },
    crate::navigator::ShowActiveProjects => "command-show-active-projects" {
        phrase: |_, _| Some(crate::i18n::t("command-active-projects-phrase").to_owned()),
    },
    crate::detail::ShowOnlyLocalBranches => "command-show-only-local-branches" {
        phrase: |_, _| Some(crate::i18n::t("command-local-branches-phrase").to_owned()),
    },
    crate::detail::ShowRemoteBranches => "command-show-remote-branches" {
        phrase: |_, _| Some(crate::i18n::t("command-remote-branches-phrase").to_owned()),
        aliases: &["Show all remote branches"],
    },
    crate::detail::ShowBranchesWithoutCommits => "command-show-branches-without-commits" {
        aliases: &["Include empty branches"],
    },
    // The menu bar's, for Windows, which has none.
    CheckForUpdates => "command-check-updates",
    crate::app::BuildAndRestart => "command-build-restart",
    crate::app::BuildAndRestartFromHere => "command-build-restart-here",
    crate::command_editor::OpenCommandEditor => "command-open-command-editor" {
        aliases: &["Keybindings", "Keymap editor", "Edit keys", "Edit shortcuts"],
    },
    crate::help::OpenDocs => "command-open-docs",
    crate::help::OpenReleaseNotes => "command-open-release-notes",
    crate::help::ReportIssue => "command-report-issue",
    crate::help::OpenDiscord => "command-open-discord",
    crate::help::ShowConfigFolder => "command-show-config-folder",
    crate::help::ShowLogsFolder => "command-show-logs-folder",
    crate::help::About => "command-about",
    Quit => "command-quit",
}

/// How many commits the selected commit acts on with those picked with it, when that's more
/// than one.
fn picks(app: &AppView, cx: &App) -> Option<usize> {
    let store = app.store.read(cx);
    let Some(Selection::Commit(project, id)) = &store.selection else {
        return None;
    };
    let n = store.with_picks(project, *id).len();
    (n > 1).then_some(n)
}

/// Whether the navigator's tabs are across the top, the only place its tabs are.
fn navigator_on_top(app: &AppView, cx: &App) -> bool {
    app.store.read(cx).prefs.navigator_place == crate::state::NavigatorPlace::Top
}

fn on_branch(app: &AppView, cx: &App) -> bool {
    matches!(app.store.read(cx).selection, Some(Selection::Branch(..)))
}

/// The branch the selection pushes, merges or unapplies, as Push takes it: a branch, a commit's
/// branch or a stack's top, and the workspace it's in.
fn selected_branch<'a>(app: &AppView, cx: &'a App) -> Option<(&'a Workspace, FullName)> {
    let (project, ref_name) = app.branch_of_selection(cx)?;
    Some((app.store.read(cx).workspace(&project)?, ref_name?))
}

fn selected_workspace<'a>(app: &AppView, cx: &'a App) -> Option<&'a Workspace> {
    let store = app.store.read(cx);
    store.workspace(store.selection.as_ref()?.project())
}

fn push_phrase(app: &AppView, cx: &App) -> Option<String> {
    let (workspace, ref_name) = selected_branch(app, cx)?;
    let stack = matches!(app.store.read(cx).selection, Some(Selection::Stack(..)));
    let id = match (workspace.needs_force(&ref_name), stack) {
        (false, false) => "command-push",
        (true, false) => "push-force",
        (false, true) => "command-push-stack-phrase",
        (true, true) => "command-force-push-stack-phrase",
    };
    Some(crate::i18n::t(id).to_owned())
}

/// Not with nothing to push, or what stops it; from uncommitted changes, it pushes the branch
/// they commit to, which its key says when it can't.
fn pushable(app: &AppView, cx: &App) -> bool {
    let Some((project, ref_name)) = app.branch_of_selection(cx) else {
        return true;
    };
    (app.store.read(cx).workspace(&project))
        .is_none_or(|ws| ws.push_blocked(ref_name.as_ref()).is_none())
}

/// Everywhere while they're on, not only where the page has one: on a page without one, what
/// it says is where they are, which nothing else tells a newcomer.
fn briefs_on(app: &AppView, cx: &App) -> bool {
    app.store.read(cx).briefs
}

fn brief_here(app: &AppView, cx: &App) -> bool {
    app.detail.read(cx).has_brief()
}

fn brief_shown(app: &AppView, cx: &App) -> bool {
    app.detail.read(cx).showing_brief()
}

fn changes_can_go_beside(app: &AppView, cx: &App) -> bool {
    let detail = app.detail.read(cx);
    detail.showing_brief() && detail.can_show_changes_beside(cx)
}

fn briefs_off(app: &AppView, cx: &App) -> bool {
    !briefs_on(app, cx)
}

fn has_pull_request(app: &AppView, cx: &App) -> bool {
    app.pull_request_url(cx).is_some()
}

/// Not where it would only say why not, as with nothing committed yet.
fn pull_request_creatable(app: &AppView, cx: &App) -> bool {
    let store = app.store.read(cx);
    (store.selection.as_ref())
        .is_none_or(|s| !matches!(crate::pr::create_offer(store, s), Some(Err(_))))
}

/// Only when the target has moved on since the workspace last took it in.
fn target_moved(app: &AppView, cx: &App) -> bool {
    (selected_workspace(app, cx).and_then(|ws| ws.target.as_ref()))
        .is_some_and(|t| t.needs_update())
}

/// A worktree's branch starts from the target, so not before there is one.
fn has_target(app: &AppView, cx: &App) -> bool {
    selected_workspace(app, cx).is_some_and(|ws| ws.target.is_some())
}

fn pull_phrase(app: &AppView, cx: &App) -> Option<String> {
    let store = app.store.read(cx);
    let branch = store.branch_for(store.selection.as_ref()?)?;
    Some(crate::i18n::tf(
        "command-pull-remote-phrase",
        &[("count", branch.incoming.len().into())],
    ))
}

/// What the navigator squashes, the row selected. With the keys in a diff it's the changes
/// they're on there, whatever the row, which the title alone says.
fn squash_phrase(app: &AppView, window: &Window, cx: &App) -> Option<String> {
    if app.detail_with_keys(window, cx).is_some() {
        return None;
    }
    if let Some(n) = picks(app, cx) {
        return Some(crate::i18n::tf(
            "command-squash-picked-phrase",
            &[("count", n.into())],
        ));
    }
    match &app.store.read(cx).selection {
        Some(Selection::Branch(..)) => {
            Some(crate::i18n::t("command-squash-branch-phrase").to_owned())
        }
        _ => None,
    }
}

/// Into the oldest picked, whose message the squash keeps: the commits list newest first.
fn squash_picked_phrase(app: &AppView, cx: &App) -> Option<String> {
    let n = picks(app, cx)?;
    let store = app.store.read(cx);
    let Some(Selection::Commit(project, id)) = &store.selection else {
        return None;
    };
    let (_, oldest) = (store.with_picks(project, *id).iter())
        .rev()
        .find_map(|id| store.find_commit(project, *id))?;
    let title = quoted(&commit_title(&oldest.title));
    Some(crate::i18n::tf(
        "command-squash-into-oldest-phrase",
        &[("count", n.into()), ("title", title.into())],
    ))
}

/// A branch alone in its stack is unapplied by itself.
fn unapply_phrase(app: &AppView, cx: &App) -> Option<String> {
    if !on_branch(app, cx) {
        return None;
    }
    let (workspace, ref_name) = selected_branch(app, cx)?;
    (!BranchEdits::of(workspace, &ref_name).stacked)
        .then(|| crate::i18n::t("command-unapply-branch-phrase").to_owned())
}

/// Merging a branch with others below it takes the whole stack.
fn merge_phrase(app: &AppView, cx: &App) -> Option<String> {
    let (workspace, ref_name) = selected_branch(app, cx)?;
    let target = &workspace.target.as_ref()?.name;
    Some(match BranchEdits::of(workspace, &ref_name).merge? {
        true => crate::i18n::tf(
            "command-merge-stack-phrase",
            &[("target", target.to_string().into())],
        ),
        false => crate::i18n::tf(
            "command-merge-branch-phrase",
            &[("target", target.to_string().into())],
        ),
    })
}

/// Not a linked worktree's last branch, which the worktree keeps.
fn deletable(app: &AppView, cx: &App) -> bool {
    let store = app.store.read(cx);
    let Some(selection @ Selection::Branch(_, Some(ref_name))) = &store.selection else {
        return true;
    };
    let Some((workspace, _)) = selected_branch(app, cx) else {
        return true;
    };
    let last = (workspace.lane_of(Some(ref_name))).is_some_and(|(lane, _)| {
        (lane.branches.iter())
            .filter(|b| b.ref_name.is_some())
            .count()
            < 2
    });
    !(last && store.in_linked(selection))
}

#[cfg(test)]
mod tests {
    use super::{COMMANDS, title_of};

    #[test]
    fn every_command_has_a_title_of_its_own() {
        let mut seen = std::collections::HashSet::new();
        for command in COMMANDS {
            assert!(
                seen.insert(command.title()),
                "{:?} names two commands, so searching for it can't tell which is meant, and \
                 running one puts both first",
                command.title()
            );
        }
    }

    #[test]
    fn no_alias_is_a_commands_title() {
        let titles: std::collections::HashSet<&str> = COMMANDS.iter().map(|c| c.title()).collect();
        for command in COMMANDS {
            for alias in command.aliases() {
                assert!(
                    !titles.contains(alias),
                    "{alias:?}, an alias of {:?}, is a command's title, so typing it finds both",
                    command.title()
                );
            }
        }
    }

    #[test]
    fn commands_without_a_palette_title_are_named_from_their_action() {
        assert_eq!(
            title_of("navigator::SelectNext"),
            "Select next",
            "words from the name"
        );
        assert_eq!(
            title_of("remote::UpdateFromTarget"),
            "Update workspace and worktrees",
            "the palette's own title first"
        );
    }

    #[test]
    fn no_title_ends_in_an_ellipsis() {
        for command in COMMANDS {
            let title = command.title();
            assert!(
                !title.ends_with('…') && !title.ends_with("..."),
                "{title:?}: a command is named for what it does, not for whether it asks first"
            );
        }
    }
}
