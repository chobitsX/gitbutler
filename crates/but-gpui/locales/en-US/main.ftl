# GitButler native UI. Message IDs are stable; keep arguments and markup names intact.
# Keep GitButler, provider names, paths, code and repository data unchanged.

# app.rs :: check_for_updates
app-check-updates-error = Couldn't check for updates

# app.rs :: scale_ui
app-interface = Interface at { $percent }%

# app.rs :: can_quit
app-quit = Quit

# app.rs :: install_update
app-restart-gitbutler-error = Couldn't restart GitButler

# app.rs :: save_screenshot
app-saved-copied = Saved and copied { $item }

# app.rs :: save_screenshot
app-take-screenshot-error = Couldn't take a screenshot

# app.rs :: ask_to_update_with_conflicts
app-update = Update

# app.rs :: install_update
app-update-gitbutler-error = Couldn't update GitButler

# app.rs :: ask_to_update_with_conflicts
app-update-leave-conflicts = Update and leave conflicts?

# app.rs :: tile_buttons
app-zoom = Zoom

# app.rs :: tile_buttons
app-zoom-out = Zoom out

# Command About
command-about = About GitButler
    .menu = About GitButler

# Command ActualSize
command-actual-size = Actual size
    .menu = Actual Size

# Command AddEmptyCommitAbove
command-add-empty-commit-above = Add empty commit above
    .menu = Add Empty Commit Above

# Command AddEmptyCommitBelow
command-add-empty-commit-below = Add empty commit below
    .menu = Add Empty Commit Below

# Command AddProject
command-add-project = Add project
    .menu = Add Project…

# Command ApplyBranch
command-apply-branch = Apply branch
    .menu = Apply Branch

# Command ArchiveWorktree
command-archive-worktree = Archive worktree
    .menu = Archive Worktree

# Command ArrangeTiles
command-arrange-tiles = Arrange tiles
    .menu = Arrange Tiles

# Command BuildAndRestart
command-build-restart = Build and restart
    .menu = Build and Restart

# Command BuildAndRestartFromHere
command-build-restart-here = Build and restart from here
    .menu = Build and Restart from Here

# Command ChangeTheme
command-change-theme = Change theme
    .menu = Change Theme…

# Command ChangesBeside
command-changes-beside = Show changes beside the brief
    .menu = Show Changes Beside the Brief

# Command CheckAll
command-check-all = Check all files
    .menu = Check All Files

# Command CheckForUpdates
command-check-updates = Check for updates
    .menu = Check for Updates

# Command CherryPick
command-cherry-pick = Cherry-pick
    .menu = Cherry-pick

# Command CloneRepository
command-clone-repository = Clone a repository
    .menu = Clone Repository…

# Command CloseWindow
command-close-window = Close window
    .menu = Close Window

# Command ConvertToDraft
command-convert-draft = Convert to draft
    .menu = Convert to Draft

# Command CopyAbsolutePath
command-copy-absolute-path = Copy absolute path
    .menu = Copy Absolute Path

# Command CopyBranchName
command-copy-branch-name = Copy branch name
    .menu = Copy Branch Name

# Command CopyChangeId
command-copy-change-id = Copy change ID
    .menu = Copy Change ID

# Command CopyCommitId
command-copy-commit-id = Copy commit ID
    .menu = Copy Commit ID

# Command CopyErrorMessage
command-copy-error-message = Copy error message
    .menu = Copy Error Message

# Command CopyMessage
command-copy-message = Copy message
    .menu = Copy Message

# Command CopyMore
command-copy-more = Copy more
    .menu = Copy More…

# Command CopyPath
command-copy-path = Copy path
    .menu = Copy Path

# Command CopyPullRequestLink
command-copy-pull-request-link = Copy pull request link
    .menu = Copy Pull Request Link

# Command CopyRelativePath
command-copy-relative-path = Copy relative path
    .menu = Copy Relative Path

# Command CopySelection
command-copy-selection = Copy
    .menu = Copy Selection

# Command CopySnapshotId
command-copy-snapshot-id = Copy snapshot ID
    .menu = Copy Snapshot ID

# Command CopyTileDiagram
command-copy-tile-diagram = Copy tile layout as a diagram
    .menu = Copy Tile Layout as a Diagram

# Command CreatePullRequest
command-create-pull-request = Create pull request
    .menu = Create Pull Request…

# Command DisableAutoMerge
command-disable-auto-merge = Disable auto-merge
    .menu = Disable Auto-merge

# Command Discard
command-discard = Discard
    .menu = Discard

# Command EditDescription
command-edit-description = Edit branch description
    .menu = Edit Branch Description

# command_editor.rs :: render_cell
command-editor-add-key = Add a key

# command_editor.rs :: render_key
command-editor-also-runs = Also runs { $join }

# command_editor.rs :: render_row
command-editor-audited = { $title } audited

# command_editor.rs :: render_row
command-editor-audited-2 = Audited

# command_editor.rs :: render_platforms
command-editor-bind = Bind on { $name }

# command_editor.rs :: render_row
command-editor-bind-another-place = Bind it in another place

# command_editor.rs :: render_key
command-editor-bound-ui-text-input = Bound in ui::text_input

# command_editor.rs :: render_key
command-editor-change = Change { $label }

# command_editor.rs :: render_key
command-editor-change-these-keys = Change these keys

# command_editor.rs :: open
command-editor-commands = Commands

# command_editor.rs :: render_key_finder
command-editor-find-pressing-key = Find by pressing a key

# command_editor.rs :: new
command-editor-find-title-action-place-or-keys = Find by title, action, place or keys

# command_editor.rs :: label
command-editor-keys = Keys

# command_editor.rs :: label
command-editor-menu-bar = Menu bar

# command_editor/menu_bar.rs :: render
command-editor-menu-bar-add-menu = Add menu

# command_editor/menu_bar.rs :: render_source
command-editor-menu-bar-divider = Divider

# command_editor/menu_bar.rs :: render_menu
command-editor-menu-bar-drag-commands-here = Drag commands here

# command_editor/menu_bar.rs :: new
command-editor-menu-bar-find-command = Find a command

# command_editor/menu_bar.rs :: start_renaming
command-editor-menu-bar-menu-name = Menu name

# command_editor/menu_bar.rs :: render_item
command-editor-menu-bar-remove = Remove { $title }

# command_editor/menu_bar.rs :: render_menu_header
command-editor-menu-bar-remove-menu = Remove menu

# command_editor/menu_bar.rs :: render_item
command-editor-menu-bar-remove-menu-2 = Remove from the menu

# command_editor/menu_bar.rs :: render_menu_header
command-editor-menu-bar-rename = Rename { $name }

# command_editor/menu_bar.rs :: render_menu_header
command-editor-menu-bar-rename-2 = Rename

# command_editor.rs :: render_row
command-editor-nowhere = Nowhere

# command_editor.rs :: render_key_finder
command-editor-press-key = Press a key…

# command_editor.rs :: recording_cap
command-editor-press-keys = Press keys…

# command_editor.rs :: render_key
command-editor-remove = Remove { $label }

# command_editor.rs :: render_key
command-editor-remove-these-keys = Remove these keys

# command_editor/rows.rs :: label
command-editor-rows-all = All

# command_editor/rows.rs :: label
command-editor-rows-any = Any

# command_editor/rows.rs :: label
command-editor-rows-audited = Audited

# command_editor/rows.rs :: label
command-editor-rows-conflicts = Conflicts

# command_editor/rows.rs :: label
command-editor-rows-no-keys = No keys

# command_editor/rows.rs :: label
command-editor-rows-not-audited = Not audited

# command_editor.rs :: render_key
command-editor-shared = shared

# command_editor.rs :: render_key_finder
command-editor-show-every-key = Show every key

# command_editor.rs :: render_toolbar
command-editor-shown-tooltips-right-click-menus = Shown in tooltips and right-click menus

# command_editor.rs :: render_picker
command-editor-where-should-work = Where should { $title } work?

# Command EnableAutoMerge
command-enable-auto-merge = Enable auto-merge
    .menu = Enable Auto-merge

# Command EqualizeTiles
command-equalize-tiles = Equalize tiles
    .menu = Equalize Tiles

# Command Fetch
command-fetch = Fetch
    .menu = Fetch

# Command FilterFiles
command-filter-files = Filter files
    .menu = Filter Files

# Command FindInDiff
command-find-diff = Find
    .menu = Find

# Command FocusChanges
command-focus-changes = Go to files
    .menu = Go to Files

# Command FocusDiff
command-focus-diff = Go to diff
    .menu = Go to Diff

# Command FocusNavigator
command-focus-navigator = Go to navigator
    .menu = Go to Navigator

# Command FocusNextPane
command-focus-next-pane = Next pane
    .menu = Next Pane

# Command FocusPaneLeft
command-focus-pane-left = Pane to the left
    .menu = Pane to the Left

# Command FocusPaneRight
command-focus-pane-right = Pane to the right
    .menu = Pane to the Right

# Command FocusPreviousPane
command-focus-previous-pane = Previous pane
    .menu = Previous Pane

# Command FocusTerminals
command-focus-terminals = Go to terminal overview
    .menu = Go to Terminal Overview

# Command FocusTileDown
command-focus-tile-down = Tile below
    .menu = Tile Below

# Command FocusTileLeft
command-focus-tile-left = Tile to the left
    .menu = Tile to the Left

# Command FocusTileRight
command-focus-tile-right = Tile to the right
    .menu = Tile to the Right

# Command FocusTileUp
command-focus-tile-up = Tile above
    .menu = Tile Above

# Command FoldFile
command-fold-file = Fold file
    .menu = Fold File

# Command GoTo
command-go = Go to anything
    .menu = Go to Anything…

# Command GoToTerminal
command-go-terminal = Go to a terminal
    .menu = Go to a Terminal

# Command MarkReadyForReview
command-mark-ready-review = Ready for review
    .menu = Ready for Review

# Command MarkResolved
command-mark-resolved = Mark resolved
    .menu = Mark Resolved

# Command MergeBranch
command-merge-branch = Merge into target
    .menu = Merge into Target

# Command MergePullRequest
command-merge-pull-request = Merge pull request
    .menu = Merge Pull Request

# Command MoveToNewBranch
command-move-new-branch = Move to a new branch
    .menu = Move to a New Branch

# Command MoveSelection
command-move-selection = Move
    .menu = Move…

# Command NameBranch
command-name-branch = Name branch
    .menu = Name Branch

# Command NewBranch
command-new-branch = New branch
    .menu = New Branch

# Command NewBranchBelow
command-new-branch-below = New branch below
    .menu = New Branch Below

# Command NewBranchHere
command-new-branch-here = New branch ending here
    .menu = New Branch Ending Here

# Command NewBranchOnTop
command-new-branch-top = New branch above
    .menu = New Branch Above

# Command NewTerminal
command-new-terminal = New terminal
    .menu = New Terminal

# Command NewTerminalWith
command-new-terminal-with = New terminal with command
    .menu = New Terminal With Command

# Command NewTerminalBelow
command-new-terminal-below = New terminal below
    .menu = New Terminal Below

# Command NewTerminalWithBelow
command-new-terminal-with-below = New terminal with command below
    .menu = New Terminal With Command Below

# Command NewTerminalRight
command-new-terminal-right = New terminal to the right
    .menu = New Terminal to the Right

# Command NewTerminalWithRight
command-new-terminal-with-right = New terminal with command to the right
    .menu = New Terminal With Command to the Right

# Command NewWorktree
command-new-worktree = New worktree
    .menu = New Worktree

# Command NewWorktreeFromBranch
command-new-worktree-branch = New worktree from branch
    .menu = New Worktree from Branch

# Command NewWorktreeWithName
command-new-worktree-name = New worktree with name
    .menu = New Worktree With Name…

# Command NextBrief
command-next-brief = Next brief
    .menu = Next Brief

# Command NextFile
command-next-file = Next file
    .menu = Next File

# Command NextHunk
command-next-hunk = Next hunk
    .menu = Next Hunk

# Command NextNavigatorTab
command-next-navigator-tab = Next navigator tab
    .menu = Next Navigator Tab

# Command NextProjectPage
command-next-project-page = Next project tab
    .menu = Next Project Tab

# Command NextTile
command-next-tile = Next tile
    .menu = Next Tile

# Command OpenBriefsSettings
command-open-briefs-settings = Briefs settings
    .menu = Briefs Settings

# Command OpenCommandEditor
command-open-command-editor = Edit commands
    .menu = Edit Commands

# Command OpenDiscord
command-open-discord = GitButler Discord
    .menu = GitButler Discord

# Command OpenDocs
command-open-docs = GitButler docs
    .menu = GitButler Docs

# Command OpenInEditor
command-open-editor = Open in editor
    .menu = Open in Editor

# Command OpenKeyboardShortcuts
command-open-keyboard-shortcuts = Keyboard shortcuts
    .menu = Keyboard Shortcuts

# Command OpenProjectSettings
command-open-project-settings = Project settings
    .menu = Project Settings

# Command OpenPullRequest
command-open-pull-request = Open pull request
    .menu = Open Pull Request

# Command OpenReleaseNotes
command-open-release-notes = What's new (release notes)
    .menu = What's New

# Command OpenRepository
command-open-repository = Open repository in browser
    .menu = Open Repository in Browser

# Command OpenSettings
command-open-settings = Settings
    .menu = Settings…

# Command OpenInTerminal
command-open-terminal = Open in terminal
    .menu = Open in Terminal

# Command OperationsHistory
command-operations-history = Operations history
    .menu = Operations History

# Command PreviousBrief
command-previous-brief = Previous brief
    .menu = Previous Brief

# Command PreviousFile
command-previous-file = Previous file
    .menu = Previous File

# Command PreviousHunk
command-previous-hunk = Previous hunk
    .menu = Previous Hunk

# Command PreviousNavigatorTab
command-previous-navigator-tab = Previous navigator tab
    .menu = Previous Navigator Tab

# Command PreviousProjectPage
command-previous-project-page = Previous project tab
    .menu = Previous Project Tab

# Command PreviousTab
command-previous-tab = Previous tab
    .menu = Previous Tab

# Command PreviousTile
command-previous-tile = Previous tile
    .menu = Previous Tile

# Command Pull
command-pull = Pull
    .menu = Pull

# Command PullRemote
command-pull-remote = Pull from the remote
    .menu = Pull from the Remote

# Command Push
command-push = Push
    .menu = Push

# Command Quit
command-quit = Quit
    .menu = Quit GitButler

# Command RecycleWorktree
command-recycle-worktree = Recycle worktree
    .menu = Recycle Worktree

# Command Redo
command-redo = Redo
    .menu = Redo Operation

# Command RenameBranch
command-rename-branch = Rename branch
    .menu = Rename Branch

# Command RenameTerminal
command-rename-terminal = Rename terminal
    .menu = Rename Terminal

# Command ReportIssue
command-report-issue = Report an issue
    .menu = Report an Issue

# Command ResolveConflicts
command-resolve-conflicts = Resolve conflicts
    .menu = Resolve Conflicts

# Command RestoreOperation
command-restore-operation = Restore to before this operation
    .menu = Restore to Before This Operation

# Command Reveal
command-reveal =
    { PLATFORM() ->
        [macos] Reveal in Finder
       *[other] Reveal in File Manager
    }
    .menu = { command-reveal }

# Command Reword
command-reword = Reword
    .menu = Reword

# Command RewrapMessage
command-rewrap-message = Rewrap message
    .menu = Rewrap Message

# Command SendNotes
command-send-notes = Send comments on this brief
    .menu = Send Comments on This Brief

# Command ShowActiveProjects
command-show-active-projects = Show active projects
    .menu = Show Active Projects

# Command ShowAllProjects
command-show-all-projects = Show all projects
    .menu = Show All Projects

# Command ShowBranchesWithBriefs
command-show-branches-briefs = Show branches with a brief
    .menu = Show Branches with a Brief

# Command ShowBranchesWithoutCommits
command-show-branches-without-commits = Show branches without unique commits
    .menu = Show Branches Without Unique Commits

# Command ShowBrief
command-show-brief = Show brief
    .menu = Show Brief

# Command ShowConfigFolder
command-show-config-folder = Show settings folder
    .menu = Show Settings Folder

# Command ShowLogsFolder
command-show-logs-folder = Show logs folder
    .menu = Show Logs Folder

# Command ShowOnlyLocalBranches
command-show-only-local-branches = Show only local branches
    .menu = Show Only Local Branches

# Command ShowRemoteBranches
command-show-remote-branches = Show remote branches
    .menu = Show Remote Branches

# Command SortProjectsByActivity
command-sort-projects-activity = Sort projects by last activity
    .menu = Sort Projects by Last Activity

# Command SortProjectsByName
command-sort-projects-name = Sort projects by name
    .menu = Sort Projects by Name

# Command SplitBelow
command-split-below = Split below
    .menu = Split Below

# Command SplitIntoNewCommit
command-split-into-new-commit = Split into a new commit
    .menu = Split into a New Commit

# Command SplitRight
command-split-right = Split right
    .menu = Split Right

# Command SquashAll
command-squash-all = Squash all commits
    .menu = Squash All Commits

# Command SquashIntoSelected
command-squash-into-selected = Squash picked commits into this one
    .menu = Squash Picked Commits into This One

# Command SquashIntoSelection
command-squash-into-selection = Squash uncommitted changes into this
    .menu = Squash Uncommitted Changes into This

# Command SquashPicked
command-squash-picked = Squash picked commits
    .menu = Squash Picked Commits

# Command SquashSelection
command-squash-selection = Squash
    .menu = Squash…

# Command StackOn
command-stack = Stack on
    .menu = Stack on

# Command StartAmend
command-start-amend = Amend
    .menu = Amend…

# Command StartCommit
command-start-commit = Commit
    .menu = Commit…

# Command StopWatching
command-stop-watching = Stop watching
    .menu = Stop Watching

# Command SwapTiles
command-swap-tiles = Swap tiles
    .menu = Swap Tiles

# Command SwitchTab
command-switch-tab = Switch tab
    .menu = Switch Tab

# Command TakeRemote
command-take-remote = Replace with the remote's version
    .menu = Replace with the Remote's Version

# Command ToggleDetail
command-toggle-detail = Toggle details
    .menu = Toggle Details

# Command ToggleFileTree
command-toggle-file-tree = Show files as a tree or a list
    .menu = Show Files as a Tree or a List

# Command ToggleFiles
command-toggle-files = Toggle files
    .menu = Toggle Files

# Command ToggleNavigator
command-toggle-navigator = Toggle navigator
    .menu = Toggle Navigator

# Command ToggleNavigatorPlace
command-toggle-navigator-place = Move navigator
    .menu = Move Navigator

# Command TogglePlainLines
command-toggle-plain-lines = Toggle diff backgrounds
    .menu = Toggle Diff Backgrounds

# Command ToggleSplit
command-toggle-split = Side-by-side diff
    .menu = Side-by-side Diff

# Command ToggleTerminalOverview
command-toggle-terminal-overview = Toggle terminal overview
    .menu = Toggle Terminal Overview

# Command ToggleWrap
command-toggle-wrap = Wrap long lines
    .menu = Wrap Long Lines

# Command UnapplyStack
command-unapply-stack = Unapply stack
    .menu = Unapply Stack

# Command UnarchiveWorktree
command-unarchive-worktree = Unarchive worktree
    .menu = Unarchive Worktree…

# Command UncheckAll
command-uncheck-all = Uncheck all files
    .menu = Uncheck All Files

# Command Uncommit
command-uncommit = Uncommit
    .menu = Uncommit

# Command UncommitChanges
command-uncommit-changes = Uncommit changes
    .menu = Uncommit Changes

# Command Undo
command-undo = Undo
    .menu = Undo Operation

# Command UnfoldFile
command-unfold-file = Unfold file
    .menu = Unfold File

# Command Unstack
command-unstack = Unstack
    .menu = Unstack

# Command UpdateFromTarget
command-update-target = Update workspace and worktrees
    .menu = Update Workspace and Worktrees

# Command UpdateWorkspace
command-update-workspace = Update workspace
    .menu = Update Workspace

# Command UpdateWorktrees
command-update-worktrees = Update worktrees
    .menu = Update Worktrees

# Command Watch
command-watch = Watch
    .menu = Watch

# Command WriteNote
command-write-note = Write a comment on this brief
    .menu = Write a Comment on This Brief

# Command ZoomIn
command-zoom = Zoom in
    .menu = Zoom in

# Command ZoomOut
command-zoom-out = Zoom out
    .menu = Zoom Out

# Command ZoomTile
command-zoom-tile = Zoom tile
    .menu = Zoom Tile

# commit_blocked.rs :: offers
commit-blocked-commit = Commit to { $branch }

# commit_blocked.rs :: offers
commit-blocked-commit-top = Commit on top of { $branch }

# commit_blocked.rs :: offers
commit-blocked-leave-them-out = Leave them out

# commit_blocked.rs :: hunk_lines
commit-blocked-more = { $lines } more

# commit_blocked.rs :: offers
commit-blocked-new-branch-above = New branch above { $branch }

# commit_blocked.rs :: offers
commit-blocked-stack-commit = Stack and commit to { $top }

# commit_blocked.rs :: offers
commit-blocked-stack-commit-new-branch = Stack and commit to a new branch

# commit_blocked.rs :: render
commit-blocked-t-commit-all = Can't commit all of this to { $target }

# detail/brief/margin.rs :: talk_composer
common-add = Add

# detail/resolve.rs :: apply_button
common-apply = Apply

# app.rs :: confirm_then
common-cancel = Cancel

# edits.rs :: close_terminal
common-close = Close

# settings/cli.rs :: agent_setup
common-copy = Copy

# edits.rs :: remove_branch
common-delete = Delete

# ui/conflict.rs :: bar
common-edit = Edit

# detail/pull_request.rs :: checks_section
common-none = None

# help.rs :: show_about
common-ok = OK

# settings/launchers.rs :: launcher_row
common-remove = Remove

# settings/mod.rs :: field_with_save
common-save = Save

# ui/format.rs :: local_date
date-short-format = %-d %b

# ui/format.rs :: local_time
date-time-format = %d/%m/%Y, %H:%M

# chrono strftime syntax; retain all date fields.
date-full-format = %a, %-d %b %Y
date-today = Today
date-yesterday = Yesterday

# ui/format.rs :: local_weekday
date-weekday-format = { $weekday }, { $date }

# detail/mod.rs :: welcome
detail-add-repository = Add a repository…

# detail/blame.rs :: show_last_commit
detail-blame-find-hunk-s-last-commit-error = Couldn't find the hunk's last commit

# detail/blame.rs :: last_commit_item
detail-blame-show-hunk-s-last-commit = Show hunk's last commit

# detail/blame.rs :: last_commit_item
detail-blame-show-line-s-last-commit = Show line's last commit

# detail/branches.rs :: label
detail-branches-any-time = Any time

# detail/branches.rs :: edit_branch_description
detail-branches-branch = What this branch is for

# detail/branches.rs :: branch_filter_items
detail-branches-brief = With a brief

# detail/branches.rs :: branch_menu_items
detail-branches-delete-branch = Delete branch

# detail/branches.rs :: delete_other_branch
detail-branches-delete-branch-2 = Delete branch { $name }?

# detail/branches.rs :: delete_other_branch
detail-branches-delete-other-branch-commits-go-too-unless = Its commits go too, unless a remote has them. Undo can't bring back a branch outside the workspace.

# detail/branches.rs :: edit_branch_description
detail-branches-describe = Describe { $name }

# detail/branches.rs :: edit_branch_description
detail-branches-edit-branch-description-git-keeps-branch-s = Git keeps it as the branch's description, where git branch --edit-description does. Leave it empty to remove it. ⌘↩ saves it.

# detail/branches.rs :: label
detail-branches-last-30-days = Last 30 days

# detail/branches.rs :: label
detail-branches-last-7-days = Last 7 days

# detail/branches.rs :: render_branches_side
detail-branches-list-branches-error = Couldn't list the branches

# detail/branches/overview.rs :: lane_row
detail-branches-overview-d = { $days }d

# detail/branches/overview.rs :: lane_row
detail-branches-overview-no-commits-days = No commits for { $days } days

# detail/branches.rs :: render_branches_side
detail-branches-read-brief = Read the brief

# detail/branches.rs :: render_branches_side
detail-branches-stack = Stack of { $count }

# detail/branches.rs :: other_branch_parts
detail-branches-stack-2 = Stack of { $count }

# detail/branches.rs :: branch_filter_chips
detail-branches-stop-filtering = Stop filtering by this

# detail/branches/sync.rs :: render_branch_comparison
detail-branches-sync-branches = Branches

# detail/branches/sync.rs :: render_branch_comparison
detail-branches-sync-commits-differ-upstream = Commits that differ from upstream

# detail/branches/sync.rs :: branch_sync_menu
detail-branches-sync-compare = Compare with { $into }

# detail/branches/sync.rs :: choose_branch_upstream
detail-branches-sync-list-remotes-error = Couldn't list remotes

# detail/branches/sync.rs :: status_mark
detail-branches-sync-no-upstream = No upstream

# detail/branches/sync.rs :: status_mark
detail-branches-sync-synced = Synced

# detail/branches/sync.rs :: status_mark
detail-branches-sync-unavailable = Unavailable

# detail/branches/sync.rs :: status_mark
detail-branches-sync-upstream-missing = Upstream missing

# detail/branches.rs :: label
detail-branches-today = Today

# detail/branches.rs :: apply_branch
detail-branches-wasn-t-applied = { $name } wasn't applied

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-answer = Answer

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-answer-web = Answer on the web

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-back-where-were = Back to where you were

# detail/brief/actions.rs :: tell_agent_button
detail-brief-actions-copy-tell = Copy what to tell it

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-go-next-comment = Go to the next comment

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-next-brief = Next brief

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-not-sent = { $notes } not sent

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-not-sent-2 = { $comments } not sent

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-read = Read it

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-send = Send

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-send-2 = Send to { $state }

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-send-all = Send all

# detail/brief/actions.rs :: tell_agent_button
detail-brief-actions-tell = Tell { $title }

# detail/brief/actions.rs :: tell_agent_button
detail-brief-actions-types-terminal = Types it in that terminal

# detail/brief/code.rs :: brief_file_row
detail-brief-code-not-branch-now = not on the branch now

# detail/brief/code.rs :: not_shown
detail-brief-code-not-shown = Not shown: { $join }

# detail/brief/code.rs :: brief_file_row
detail-brief-code-show-changes = Show { $path } in Changes

# detail/brief.rs :: brief_row
detail-brief-code-under-changed-after-was-written = The code under this changed after it was written

# detail/brief/head.rs :: brief_since_row
detail-brief-head-asked = Asked for it

# detail/brief/head.rs :: brief_since_row
detail-brief-head-bring-back = Bring it back

# detail/brief/head.rs :: brief_head
detail-brief-head-changes-beside = Changes beside

# detail/brief/head.rs :: brief_unnamed_facts
detail-brief-head-database-change-brief-doesn-t-mention = Database change the brief doesn't mention:

# detail/brief/head.rs :: brief_tests_fact
detail-brief-head-deletes-tests = Deletes tests: { $join }

# detail/brief/head.rs :: brief_failed_checks_fact
detail-brief-head-failed-pr = { $names } failed on PR #{ $number }

# detail/brief/head.rs :: brief_since_row
detail-brief-head-keep-comment-asking-back = Keep a comment asking for this back

# detail/brief/head.rs :: brief_facts
detail-brief-head-matches-branch-s-latest-commit = Matches the branch's latest commit

# detail/brief/head.rs :: brief_unshown_fact
detail-brief-head-more-changes = and { $more } more in Changes

# detail/brief/head.rs :: brief_unnamed_facts
detail-brief-head-not-mentioned-brief = Not mentioned in the brief:

# detail/brief/head.rs :: brief_head
detail-brief-head-open-web = Open on the web

# detail/brief/head.rs :: brief_unnamed_facts
detail-brief-head-show-changes = Show { $path } in Changes

# detail/brief/head.rs :: standing_fact
detail-brief-head-show-commit = Show commit { $title }

# detail/brief/head.rs :: brief_turned_off_fact
detail-brief-head-show-line = Show the line in { $name }

# detail/brief/head.rs :: brief_since_row
detail-brief-head-show-only-changed = Show only what changed

# detail/brief/head.rs :: brief_failed_checks_fact
detail-brief-head-show-pull-request-s-checks = Show the pull request's checks

# detail/brief/head.rs :: brief_versions
detail-brief-head-there-s-no-other-way = There's no other that way

# detail/brief/head.rs :: brief_turned_off_fact
detail-brief-head-turns-off-test = Turns off a test in { $name }

# detail/brief/head.rs :: brief_turned_off_fact
detail-brief-head-turns-off-test-more = Turns off a test in { $name }, and { $more } more

# detail/brief/head.rs :: brief_head
detail-brief-head-with = with { $agent }

# detail/brief/margin.rs :: talk_composer
detail-brief-margin-add-shortcut = Add a shortcut

# detail/brief/margin.rs :: shortcut_button
detail-brief-margin-adds-right-click-change = Adds it. Right-click to change

# detail/brief/margin.rs :: talk_composer
detail-brief-margin-edit-shortcut = Edit shortcut

# detail/brief/margin.rs :: talk_composer
detail-brief-margin-keep-shortcut = Keep as a shortcut

# detail/brief/margin.rs :: talk_composer
detail-brief-margin-new-shortcut = New shortcut

# detail/brief/margin.rs :: shortcut_menu
detail-brief-margin-remove-shortcut = Remove shortcut

# detail/brief/notes.rs :: brief_note
detail-brief-notes-discard = Discard

# detail/brief/notes.rs :: brief_end
detail-brief-notes-next = Next: { $title }

# detail/brief/notes.rs :: brief_note
detail-brief-notes-not-sent = Not sent

# detail/brief/notes.rs :: brief_thread
detail-brief-notes-reply = Reply

# detail/brief/notes.rs :: brief_thread
detail-brief-notes-resolved = Resolved

# detail/brief/notes.rs :: write_brief_note
detail-brief-notes-write-comment = Write a comment…

# detail/brief/notes.rs :: write_brief_note
detail-brief-notes-write-reply = Write a reply…

# detail/brief.rs :: brief_row
detail-brief-parts = { $count } parts

# detail/brief.rs :: brief_row
detail-brief-show-hasn-t-changed = Show what hasn't changed

# detail/brief.rs :: brief_row
detail-brief-unchanged = { $parts } unchanged

# detail/brief.rs :: brief_row
detail-brief-which-shows-web = { $what }, which shows on the web

# detail/mod.rs :: welcome
detail-clone-repository = Clone a repository…

# detail/composer.rs :: render_composer
detail-composer-amend = Amend

# detail/composer.rs :: render_composer
detail-composer-commit = Commit to

# detail/composer.rs :: render_composer
detail-composer-commit-2 = Commit

# detail/composer.rs :: commit_now
detail-composer-committed-but-post-commit-hook-failed = Committed, but the post-commit hook failed

# detail/composer.rs :: pick_commit_target
detail-composer-created = Created { $branch }

# detail/composer.rs :: render_target_picker
detail-composer-pick-branch-commit = Pick the branch to commit to

# detail/composer.rs :: render_composer
detail-composer-pick-commit-amend = Pick a commit to amend

# detail/composer.rs :: render_composer
detail-composer-write-message-ai-guided-s-box = Write the message with AI, guided by what's in the box

# detail/composer.rs :: render_composer
detail-composer-writing-click-keep-s-written-so = Writing… Click to keep what's written so far

# detail/conversation.rs :: conversation
detail-conversation-activity = Activity

# detail/conversation.rs :: header
detail-conversation-agent = Agent

# detail/conversation.rs :: opens
detail-conversation-edited = edited

# detail/conversation.rs :: thread
detail-conversation-fold-thread = Fold the thread on { $path }

# detail/conversation.rs :: opens
detail-conversation-open-github = Open on GitHub

# detail/conversation.rs :: thread
detail-conversation-open-thread = Open the thread on { $path }

# detail/diff_view.rs :: render_diff_row
detail-diff-view-commits = { $count } commits

# detail/diff_view.rs :: line_menu
detail-diff-view-find = Find { $query }

# detail/diff_view.rs :: render_diff
detail-diff-view-load-diff-error = Couldn't load the diff

# detail/diff_view.rs :: render_diff
detail-diff-view-loading-diff = Loading diff…

# detail/diff_view.rs :: render_diff
detail-diff-view-no-files-match = No files match "{ $trim }"

# detail/diff_view.rs :: render_diff
detail-diff-view-no-uncommitted-changes = No uncommitted changes

# detail/diff_view.rs :: load_whole
detail-diff-view-read-file-error = Couldn't read the file

# detail/diff_view.rs :: drawing_button
detail-diff-view-show-drawing = Show the drawing

# detail/diff_view.rs :: drawing_button
detail-diff-view-show-text = Show as text

# detail/diff_view.rs :: render_diff_row
detail-diff-view-show-whole-file = Show the whole file

# detail/mod.rs :: welcome
detail-discord = Discord

# detail/mod.rs :: welcome
detail-docs = Docs

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-changed-disk = Changed on disk

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-discard-my-edits = Discard my edits

# detail/edit_lines.rs :: ask_to_save
detail-edit-lines-don-t-save = Don't save

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-editing = Editing

# detail/edit_lines.rs :: ask_to_save
detail-edit-lines-edits-are-lost-if-don-t = Your edits are lost if you don't save them.

# detail/edit_lines.rs :: end_edit
detail-edit-lines-edits-weren-t-saved-changed-disk = Your edits to { $shown_path } weren't saved: it changed on disk

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-keep-file-was-written = Keep the file as it was written

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-keep-mine = Keep mine

# detail/edit_lines.rs :: ask_to_save
detail-edit-lines-save-changes = Save changes to { $name }?

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-save-over-was-written = Save over what was written

# detail/file_list.rs :: change_items
detail-file-list-amend = Amend

# detail/file_list.rs :: render_file_row
detail-file-list-being-edited = Being edited

# detail/file_list.rs :: list_header
detail-file-list-close-filter = Close the filter

# detail/file_list.rs :: render_message_entry
detail-file-list-commit-message = Commit message

# detail/file_list.rs :: render_message_entry
detail-file-list-commit-messages = Commit messages

# detail/file_list.rs :: path_items
detail-file-list-copy-absolute-path = Copy absolute path

# detail/file_list.rs :: path_items
detail-file-list-copy-relative-path = Copy relative path

# detail/file_list.rs :: edit_items
detail-file-list-edit-file = Edit file

# detail/file_list.rs :: files_heading
detail-file-list-files = Files

# detail/file_list.rs :: find_in_all_files
detail-file-list-find-all-files = Find "{ $query }" in all files

# detail/file_list.rs :: render_uncommitted_files
detail-file-list-no-uncommitted-changes = No uncommitted changes

# detail/file_list.rs :: list_header
detail-file-list-of = { $kept } of { $total }

# detail/file_list.rs :: view_items
detail-file-list-open-file = Open a file…

# detail/file_list.rs :: render_file_row
detail-file-list-opened-edit-nothing-changed-yet = Opened to edit, nothing changed yet

# detail/file_list.rs :: edit_items
detail-file-list-stop-editing = Stop editing

# detail/file_list.rs :: list_header
detail-file-list-view-options = View options

# detail/mod.rs :: new
detail-filter-branches = Filter branches

# detail/mod.rs :: new
detail-filter-commits = Filter commits

# detail/mod.rs :: new
detail-filter-files = Filter files

# detail/mod.rs :: new
detail-filter-operations = Filter operations

# detail/mod.rs :: new
detail-find = Find

# detail/graph/mod.rs :: render
detail-graph-back-100 = Back to 100%

# detail/graph/mod.rs :: render
detail-graph-follow = Follow

# detail/graph/mod.rs :: render
detail-graph-follow-workspace = Follow workspace

# detail/graph/mod.rs :: render
detail-graph-lanes-they-start = Your lanes and what they start from

# detail/graph/mod.rs :: render
detail-graph-no-commits-yet = No commits yet

# detail/graph/mod.rs :: render
detail-graph-open-new-window = Open in new window

# detail/graph/page.rs :: graph_menu_items
detail-graph-page-show-navigator = Show in navigator

# detail/graph/page.rs :: graph_menu_items
detail-graph-page-uncommit-commits = Uncommit { $n } commits

# detail/graph/mod.rs :: render
detail-graph-read-graph-error = Couldn't read the graph

# detail/graph/mod.rs :: render
detail-graph-reading-graph = Reading the graph

# detail/graph/mod.rs :: render
detail-graph-target-s-newest-commit = The target's newest commit

# detail/graph/window.rs :: title
detail-graph-window-graph = { $name } – Graph

# detail/graph/window.rs :: render
detail-graph-window-graph-2 = Graph

# detail/graph/mod.rs :: render
detail-graph-workspace = Workspace

# detail/graph/mod.rs :: render
detail-graph-zoom = Zoom in

# detail/graph/mod.rs :: render
detail-graph-zoom-out = Zoom out

# detail/history.rs :: label
detail-history-branches = Branches

# detail/history.rs :: label
detail-history-changes-thrown-away = Changes thrown away

# detail/history.rs :: label
detail-history-commits-amended-squashed-or-moved = Commits amended, squashed or moved

# detail/history.rs :: label
detail-history-commits-made = Commits made

# detail/history.rs :: render_history_side
detail-history-done-ai-agent = Done by an AI agent: { $agent }

# detail/history.rs :: render_history_side
detail-history-loading = Loading…

# detail/history.rs :: label
detail-history-other = Other

# detail/history.rs :: load_history
detail-history-read-history-error = Couldn't read the history

# detail/history.rs :: restore_operation
detail-history-restore = Restore

# detail/history.rs :: restore_operation
detail-history-restore-before = Restore to before "{ $title }"?

# detail/history.rs :: restore_operation
detail-history-restore-operation-branches-commits-uncommitted-changes = Branches, commits and uncommitted changes go back to how they were. You can undo this with ⌘Z.

# detail/history.rs :: take_snapshot
detail-history-s-optional = What it's for (optional)

# detail/history.rs :: change_line
detail-history-show-commit = Show this commit

# detail/history.rs :: render_history_side
detail-history-show-older = Show older

# detail/history.rs :: label
detail-history-snapshots = Snapshots

# detail/history.rs :: render_history_side
detail-history-take-snapshot-project-restore-later = Take a snapshot of the project as it is, to restore later

# detail/history.rs :: label
detail-history-undos-restores = Undos and restores

# detail/history.rs :: label
detail-history-updates-target = Updates from the target

# detail/machine.rs :: uncommitted_list
detail-machine-nothing-uncommitted = Nothing uncommitted

# detail/machine.rs :: machine_placeholder
detail-machine-open-but-dev = Open on but.dev

# detail/machine.rs :: mesh_meta
detail-machine-other-machines = { $worktrees } on other machines, { $branchs }

# detail/mod.rs :: render
detail-nothing-selected = Nothing selected

# detail/panes.rs :: clear_button
detail-panes-clear = Clear

# detail/panes.rs :: render_uncommitted_side
detail-panes-commit = Commit…

# detail/panes.rs :: editing_actions
detail-panes-commit-files-they-are-place-rebase = Commit the files as they are in its place, and rebase what's above it

# detail/panes.rs :: commit_meta
detail-panes-conflicted = conflicted

# detail/panes.rs :: conflicted_note
detail-panes-conflicted-2 = { $n } conflicted

# detail/panes.rs :: reference_chip
detail-panes-copy-change-id = Copy change ID

# detail/panes.rs :: reference_chip
detail-panes-copy-commit-id = Copy commit ID

# detail/panes.rs :: render_branch_header
detail-panes-create-pull-request = Create pull request

# detail/panes.rs :: editing_actions
detail-panes-finish = Finish

# detail/panes.rs :: editing_actions
detail-panes-finish-still-conflicted = Finish with { $files } still conflicted?

# detail/panes.rs :: message_title
detail-panes-hide-full-message = Hide full message

# detail/panes.rs :: render_header
detail-panes-inactive-worktrees = Inactive worktrees

# detail/panes.rs :: people_card
detail-panes-more = { $rest } more

# detail/panes.rs :: render_header
detail-panes-network-worktrees = Network worktrees

# detail/panes.rs :: render_stack_header
detail-panes-no-commits = No commits

# detail/panes.rs :: remote_meta
detail-panes-only = only on { $remote }

# detail/panes.rs :: remote_meta
detail-panes-only-remote = only on the remote

# detail/panes.rs :: listed_commit
detail-panes-open-commit = Open commit

# detail/panes.rs :: render_picks_header
detail-panes-others-between-them-so-each-one = With others between them, so each one's changes show in turn

# detail/panes.rs :: render_branch_header
detail-panes-push-open-pull-request = Push and open a pull request

# detail/panes.rs :: editing_actions
detail-panes-put-commit-back-was = Put the commit back as it was

# detail/panes.rs :: render_uncommitted_side
detail-panes-read-project-error = Couldn't read the project

# detail/panes.rs :: reword_editor
detail-panes-save-esc-cancel = ⌘↩ to save, esc to cancel

# detail/panes.rs :: reword_editor
detail-panes-saving = Saving…

# detail/panes.rs :: people_card
detail-panes-show-fewer = Show fewer

# detail/panes.rs :: message_title
detail-panes-show-full-message = Show full message

# detail/panes.rs :: commit_meta
detail-panes-signed = Signed

# detail/panes.rs :: commit_meta
detail-panes-signed-not-verified = Signed with { $signer }, not verified

# detail/panes.rs :: render_stack_header
detail-panes-stack = Stack of { $count }

# detail/panes.rs :: editing_actions
detail-panes-they-go-into-commit-they-are = They go into the commit as they are now, with any conflict markers.

# detail/mod.rs :: welcome
detail-pick-folder-git-repository = Pick a folder with a Git repository

# detail/pull_request.rs :: auto_merge_switch
detail-pull-request-auto-merge = Auto-merge

# detail/pull_request.rs :: reviewers_section
detail-pull-request-awaiting-review = Awaiting review

# detail/pull_request.rs :: checks_section
detail-pull-request-checks = Checks

# detail/pull_request.rs :: branches_section
detail-pull-request-copy-branch-name = Copy branch name

# detail/pull_request.rs :: merge_section
detail-pull-request-merge-now-forge = Merge it now on the forge

# detail/pull_request.rs :: description
detail-pull-request-no-description = No description

# detail/pull_request.rs :: freshness
detail-pull-request-old = { $at } old

# detail/pull_request.rs :: status_section
detail-pull-request-open = Open on { $forge }

# detail/pull_request.rs :: check_row
detail-pull-request-open-log = Open the log of { $name }

# detail/pull_request.rs :: freshness
detail-pull-request-out-date = Out of date

# detail/pull_request.rs :: head
detail-pull-request-pull-request = Pull request #{ $number }

# detail/pull_request.rs :: merge_section
detail-pull-request-ready-review = Ready for review

# detail/pull_request.rs :: merge_section
detail-pull-request-take-out-draft-forge = Take it out of draft on the forge

# detail/pull_request.rs :: byline
detail-pull-request-updated = updated { $at }

# detail/resolve.rs :: conflict_banner
detail-resolve-left-conflicted = { $files } left conflicted

# detail/resolve.rs :: edit
detail-resolve-lines-keep = The lines to keep

# detail/resolve.rs :: conflict_banner
detail-resolve-older-commit-conflicts-too = An older commit conflicts too

# detail/resolve.rs :: apply_resolutions
detail-resolve-on-to = { $resolved }, on to { $title }

# detail/resolve.rs :: conflict_banner
detail-resolve-ready-apply = { $conflicts } ready to apply

# detail/resolve.rs :: conflict_banner
detail-resolve-resolve = { $conflicts } to resolve

# detail/resolve.rs :: apply_resolutions
detail-resolve-resolved = Resolved { $resolved }

# detail/resolve.rs :: apply_resolutions
detail-resolve-resolved-left = Resolved { $conflicts }, { $left } left

# detail/resolve.rs :: apply_resolutions
detail-resolve-resolved-no-conflicts-left = Resolved, no conflicts left

# detail/resolve.rs :: apply_resolutions
detail-resolve-resolved-ready-commit = Resolved { $resolved }, { $files } ready to commit

# detail/upstream.rs :: render_project_header
detail-upstream-applied = { $applied } applied

# detail/upstream.rs :: project_tabs
detail-upstream-branches = Branches

# detail/upstream.rs :: project_tabs
detail-upstream-branches-matching-current-filters = Branches matching the current filters

# detail/upstream/changed_path.rs :: path_history_item
detail-upstream-changed-path-show-file-history = Show file history

# detail/upstream/changed_path.rs :: path_history_item
detail-upstream-changed-path-show-folder-history = Show folder history

# detail/upstream.rs :: target_chooser
detail-upstream-choose-another = Choose another…

# detail/upstream.rs :: target_chooser
detail-upstream-choose-branch = Choose a branch…

# detail/upstream.rs :: pick_target_state
detail-upstream-choose-target-branch = Choose a target branch…

# detail/upstream.rs :: render_upstream_side
detail-upstream-connect = Connect…

# detail/upstream.rs :: render_upstream_side
detail-upstream-connect-see-pull-requests-ci-here = Connect { $name } to see pull requests and CI here.

# detail/upstream.rs :: render_project_header
detail-upstream-doesn-t-track = { $name } doesn't track { $remote }

# detail/upstream.rs :: render_project_header
detail-upstream-fetching = Fetching…

# detail/upstream.rs :: render_upstream_side
detail-upstream-gone = { $name } is gone

# detail/upstream.rs :: project_tabs
detail-upstream-graph = Graph

# detail/upstream.rs :: target_commit_items
detail-upstream-hide-commits = Hide commits

# detail/upstream.rs :: render_target_message
detail-upstream-hide-message = Hide message

# detail/upstream.rs :: render_upstream_side
detail-upstream-isn-t-remote-yet = { $name } isn't on the remote yet

# detail/upstream.rs :: render_upstream_side
detail-upstream-loading = Loading…

# detail/upstream.rs :: render_upstream_side
detail-upstream-no-commits-yet = No commits yet

# detail/upstream.rs :: render_upstream_side
detail-upstream-no-remote = No remote

# detail/upstream.rs :: render_upstream_side
detail-upstream-no-target-branch = No target branch

# detail/upstream.rs :: project_tabs
detail-upstream-operations-history = Operations history

# detail/upstream.rs :: project_tabs
detail-upstream-overview = Overview

# detail/upstream.rs :: render_upstream_side
detail-upstream-read-checkout-s-history-error = Couldn't read the checkout's history

# detail/upstream.rs :: load_upstream
detail-upstream-read-more-history-error = Couldn't read more of the history

# detail/upstream.rs :: render_project_header
detail-upstream-render-project-header-s-pushed-doesn-t = What's pushed to { $remote } doesn't show here, nor can branches be pushed. Track it with `git branch -u { $remote } { $name }`

# detail/upstream.rs :: render_upstream_side
detail-upstream-search-changed-paths = Search changed paths

# detail/upstream.rs :: target_commit_items
detail-upstream-show-commits = Show commits

# detail/upstream.rs :: render_target_message
detail-upstream-show-message = Show message

# detail/upstream.rs :: render_upstream_side
detail-upstream-show-older = Show older

# detail/upstream.rs :: render_upstream_side
detail-upstream-uncommit-keep-changes = Uncommit, keep the changes

# detail/mod.rs :: welcome
detail-welcome-add-repository-coding-agents = Add a repository your coding agents work in. What they change shows up here as it happens, to review, commit and stack into branches.

# detail/mod.rs :: welcome
detail-welcome-gitbutler = Welcome to GitButler

# detail/worktree.rs :: now_status
detail-worktree-all-caught-up = All caught up

# detail/worktree.rs :: now_commits
detail-worktree-mark-all-read = Mark all as read

# detail/worktree.rs :: now_status
detail-worktree-uncommitted = { $count } uncommitted

# detail/worktree.rs :: now_status
detail-worktree-unread = { $unread } unread

# edits.rs :: discard_unrecorded
edits-changes-discarded = Changes discarded

# edits.rs :: discard
edits-changes-weren-t-discarded = Changes weren't discarded

# edits.rs :: close_terminal
edits-close-terminal = Close terminal { $title }?

# edits.rs :: merge_branch
edits-commits-go-straight-onto = { $whose } commits go straight onto { $target }.{ $left_behind }{ $update }

# edits.rs :: new_branch_at
edits-created = Created { $branch }

# edits.rs :: new_branch_at
edits-created-checked-out = Created { $branch }, checked out in { $worktree }

# edits.rs :: remove_branch
edits-delete-branch = Delete branch { $name }?

# edits.rs :: discard_commits
edits-discard = Discard

# edits.rs :: discard_commits
edits-discard-commit = Discard commit { $newest }?

# edits.rs :: discard_from_commit
edits-discard-commit-commit-ones-after-lose = The commit, and the ones after it, lose the change. This can't be undone.

# edits.rs :: discard_commits
edits-discard-commits = Discard { $n } commits?

# edits.rs :: discard_unrecorded
edits-discard-failed = Discard failed

# edits.rs :: push_branch
edits-force-push = Force push { $ref_name }?

# edits.rs :: push_branch
edits-force-push-2 = Force push

# edits.rs :: merge_branch
edits-merge = Merge

# edits.rs :: merge_branch
edits-merge-branch-commits-go-straight-onto = { $whose } commits go straight onto { $target } and get pushed, skipping review. A push can't be undone.{ $left_behind }{ $update }

# edits.rs :: merge_branch
edits-merge-into = Merge { $what } into { $target }?

# edits.rs :: pull_remote
edits-pull-remote-drops-commits-remote-doesn = This drops its commits the remote doesn't have. You can undo this with ⌘Z.

# edits.rs :: remove_branch
edits-remove-branch-delete-commits-unapply-then = To delete { $name } and its commits, unapply it, then delete it from Branches

# edits.rs :: pull_remote
edits-replace = Replace

# edits.rs :: pull_remote
edits-replace-remote-s-version = Replace { $name } with the remote's version?

# edits.rs :: close_terminal
edits-shell-stops-whatever-running = Its shell stops, and whatever is running in it.

# edits.rs :: submit_branch_name
edits-submit-branch-name-renamed-remote-keeps-old = Renamed to { $to }. The remote keeps the old name, and pushing again makes a new remote branch, apart from any pull request of the old one

# edits.rs :: remove_branch
edits-worktree-rests-which-keeps = The { $worktree } worktree rests on { $name }, which keeps it

# edits.rs :: remove_branch
edits-worktree-s-last-branch-which-keeps = { $name } is its worktree's last branch, which keeps it

# Menu bar heading
menu-edit = Edit

# Menu bar heading
menu-file = File

# Menu bar heading
menu-gitbutler = GitButler

# Menu bar heading
menu-go = Go

# Menu bar heading
menu-help = Help

# Menu bar heading
menu-remote = Remote

# Menu bar heading
menu-repository = Repository

# keymap/menus.rs :: title
menu-services = Services

# Menu bar heading
menu-view = View

# Menu bar heading
menu-window = Window

# navigator/account.rs :: update_button
navigator-account-downloading-100 = Downloading 100%

# navigator/account.rs :: settings_button
navigator-account-settings = Settings

# navigator/account.rs :: settings_menu
navigator-account-sign = Sign in…

# navigator/account.rs :: settings_menu
navigator-account-sign-out = Sign out { $who }

# navigator/account.rs :: update_button
navigator-account-update = Update to { $version }

# navigator.rs :: drawer_bar
navigator-add-project = Add project

# navigator.rs :: running_mark
navigator-app-re-using-was-built-checkout = The app you're using was built from this checkout

# navigator.rs :: branch_row
navigator-branch = Branch { $name }

# navigator.rs :: filter_field
navigator-clear-filter = Clear the filter

# navigator/drop.rs :: new_branch_zone
navigator-drop-new-independent-branch = New independent branch

# navigator.rs :: editing_row
navigator-editing-commit = Editing a commit

# navigator.rs :: changes_row
navigator-files = { $count } files

# navigator.rs :: new
navigator-filter-projects = Filter projects…

# navigator/groups.rs :: group_menu
navigator-groups-add-repository = Add repository…

# navigator/groups.rs :: group_row
navigator-groups-changed = { $changed } changed

# navigator/groups.rs :: group_row
navigator-groups-changes = { $name }, { $total } { $repositories }, { $changed } with changes

# navigator/groups.rs :: edit_project_group
navigator-groups-group-name = Group name

# navigator/groups.rs :: group_row
navigator-groups-group-options = Group options

# navigator/groups.rs :: group_menu
navigator-groups-remove-group = Remove group

# navigator/groups.rs :: group_menu
navigator-groups-rename-group = Rename group…

# navigator/groups.rs :: group_row
navigator-groups-uncommitted-files-or-unpushed-commits = { $changed } { $repositories } with uncommitted files or unpushed commits

# navigator.rs :: inactive_heading
navigator-inactive-worktrees = Inactive worktrees

# navigator/menu.rs :: delete_worktree
navigator-menu-delete-worktree = Delete worktree { $name }?

# navigator/menu.rs :: menu_items
navigator-menu-hide-commits = Hide commits

# navigator/menu.rs :: menu_items
navigator-menu-mark-all-read = Mark all as read

# navigator/menu.rs :: read_marks
navigator-menu-mark-read = Mark as read

# navigator/menu.rs :: read_marks
navigator-menu-mark-unread = Mark as unread

# navigator/menu.rs :: row_actions
navigator-menu-move-group = Move to group…

# navigator/menu.rs :: open_file_item
navigator-menu-open-file = Open a file…

# navigator/menu.rs :: open_repository
navigator-menu-open-repository-error = Couldn't open the repository

# navigator/menu.rs :: menu_items
navigator-menu-show-commits = Show commits

# navigator/menu.rs :: row_menu_items
navigator-menu-show-graph = Show in graph

# navigator/mesh.rs :: mesh_menu
navigator-mesh-apply-here = Apply here

# navigator/mesh.rs :: mesh_row
navigator-mesh-branch = Branch { $name }

# navigator/mesh.rs :: mesh_heading
navigator-mesh-network-worktrees = Network worktrees

# navigator/mesh.rs :: mesh_menu
navigator-mesh-open-but-dev = Open on but.dev

# navigator/mesh.rs :: mesh_heading
navigator-mesh-unfinished-work-other-machines-mesh = Unfinished work on your other machines, from your mesh

# navigator.rs :: row_in_card
navigator-more = { $hidden } more

# navigator/moving.rs :: new_commit_row
navigator-moving-new-commit = New commit

# navigator.rs :: upstream_label
navigator-on = On { $remote }

# navigator/order.rs :: view_menu
navigator-order-collapse-all-groups = Collapse all groups

# navigator/order.rs :: view_menu
navigator-order-expand-all-groups = Expand all groups

# navigator/order.rs :: view_menu
navigator-order-new-repository-group = New repository group…

# navigator/order.rs :: view_button
navigator-order-organize-repositories = Organize repositories

# navigator.rs :: render
navigator-projects = Projects

# navigator.rs :: branch_row
navigator-read-brief = Read the brief

# navigator.rs :: upstream_label
navigator-remote = On the remote

# navigator/rename.rs :: reword
navigator-rename-commit-title = Commit title

# navigator/rename.rs :: terminal_name_input
navigator-rename-terminal-name = Terminal name

# navigator.rs :: row_in_card
navigator-show-fewer = Show fewer

# navigator.rs :: drawer_bar
navigator-sort-show = Sort and show

# navigator.rs :: stack_row
navigator-stack = Stack

# navigator.rs :: stack_row
navigator-stack-2 = Stack of { $count }

# navigator.rs :: project_row
navigator-stop-watching = Stop watching

# navigator/tabs.rs :: terminals_tab
navigator-tabs-terminals = Terminals

# navigator/terminals.rs :: menu_items
navigator-terminals-close-terminal = Close terminal

# navigator/terminals.rs :: render_bar
navigator-terminals-group-terminals = Group terminals

# navigator/terminals.rs :: heading_row
navigator-terminals-needs = Needs you

# navigator/terminals.rs :: render_bar
navigator-terminals-new-terminal = New terminal…

# navigator/terminals.rs :: menu_items
navigator-terminals-rename-terminal = Rename terminal

# navigator/terminals.rs :: menu_items
navigator-terminals-show-navigator = Show in navigator

# navigator/terminals.rs :: menu_items
navigator-terminals-split-below = Split below

# navigator/terminals.rs :: menu_items
navigator-terminals-split-right = Split right

# navigator/terminals.rs :: render_bar
navigator-terminals-terminals = Terminals

# navigator.rs :: changes_row
navigator-uncommitted-changes = Uncommitted changes

# navigator.rs :: target_update_button
navigator-update = Update

# navigator.rs :: project_row
navigator-watch-project = Watch this project

# overlays.rs :: branch_name_input
overlays-branch-name = Branch name

# overlays.rs :: render_toasts
overlays-copy-error-message = Copy error message

# overlays.rs :: run_named
overlays-create-branch = Create branch

# overlays.rs :: render_toasts
overlays-dismiss = Dismiss

# overlays.rs :: render_update_card
overlays-downloads-page = Downloads page

# overlays.rs :: render_update_card
overlays-gitbutler-here = GitButler { $version } is here

# overlays.rs :: render_update_card
overlays-hide-4-hours = Hide for 4 hours

# overlays.rs :: render_update_card
overlays-later = Later

# overlays.rs :: listen_for_credential_prompts
overlays-passphrase-or-password = Passphrase or password

# overlays.rs :: render_update_card
overlays-release-notes = Release notes

# overlays.rs :: run_named
overlays-rename-branch = Rename branch

# overlays.rs :: render_update_card
overlays-update = Update

# overlays.rs :: listen_for_credential_prompts
overlays-username = Username

# palette.rs :: label
palette-blocked = Blocked

# palette.rs :: label
palette-cooking = Cooking

# palette.rs :: label
palette-done = Done

# palette.rs :: uncommitted_choice
palette-editing-commit = Editing a commit

# palette.rs :: label
palette-failed = Failed

# palette.rs :: go_to
palette-go-anything-navigator = Go to anything in the navigator

# palette.rs :: go_to
palette-go-anything-navigator-or-file = Go to anything in the navigator, or a file

# palette.rs :: label
palette-idle = Idle

# palette.rs :: terminal_place_choice
palette-main-worktree = Main worktree

# palette.rs :: render_palette
palette-nothing-matches = Nothing matches

# palette.rs :: remote_choice
palette-on = On { $remote }

# palette.rs :: render_palette
palette-reading-files = Reading files…

# palette.rs :: remote_choice
palette-remote = On the remote

# palette.rs :: split_tile
palette-show-below = Show below

# palette.rs :: split_tile
palette-show-right = Show to the right

# palette.rs :: render_palette
palette-status = Status

# palette.rs :: uncommitted_choice
palette-uncommitted-changes = Uncommitted changes

# pr.rs :: render
pr-auto-merge = Auto-merge

# pr.rs :: new
pr-changes-why = What it changes, and why

# pr.rs :: set_draft
pr-convert-draft = Convert to draft

# pr.rs :: render
pr-create = ⌘↩ to create

# pr.rs :: render
pr-create-pull-request = Create a pull request

# pr.rs :: render
pr-description = Description

# pr.rs :: set_auto_merge
pr-disable-auto-merge = Disable auto-merge

# pr.rs :: render
pr-draft = Draft

# pr.rs :: set_auto_merge
pr-enable-auto-merge = Enable auto-merge

# pr.rs :: render
pr-give-title-first = Give it a title first

# pr.rs :: label
pr-merge-pull-request = Merge pull request

# pr.rs :: set_draft
pr-ready-review = Ready for review

# pr.rs :: label
pr-rebase-merge = Rebase and merge

# pr.rs :: label
pr-squash-merge = Squash and merge

# pr.rs :: new
pr-t-open-pull-request = Can't open a pull request

# pr.rs :: new
pr-title = Title

# pr.rs :: render
pr-wait-ai-finish-writing = Wait for the AI to finish writing

# pr.rs :: render
pr-write-ai = Write with AI

# pr.rs :: render
pr-write-title-description-commits = Write the title and description from the commits

# pr.rs :: render
pr-writing = Writing…

# projects.rs :: set_target
projects-change-target-error = Couldn't change the target

# projects.rs :: clone_repository
projects-clone-error = Couldn't clone { $name }

# projects.rs :: ask_author_email
projects-email-example-com = your.email@example.com

# projects.rs :: ask_author_name
projects-full-name = Your full name

# projects.rs :: pick_target
projects-list-branches-error = Couldn't list the branches

# projects.rs :: pick_target
projects-no-branches-pick = No branches to pick from

# projects.rs :: pick_folder
projects-open-folder-picker-error = Couldn't open the folder picker

# projects.rs :: save_author
projects-save-name-email-error = Couldn't save your name and email

# projects.rs :: open_icon_picker
projects-search-emoji = Search emoji…

# settings/mod.rs :: appearance_cards
settings-20-lines = 20 lines

# settings/mod.rs :: appearance_cards
settings-200-lines = 200 lines

# settings/mod.rs :: appearance_cards
settings-50-lines = 50 lines

# settings/mod.rs :: look_rows
settings-accent-description = The colour of primary buttons, ticks and what's picked out. Custom takes any colour, set so text on it still reads.

# settings/mod.rs :: look_rows
settings-accent-label = Accent

# settings/mod.rs :: page_cards
settings-accessibility = Accessibility

# settings/accounts.rs :: integration_cards
settings-accounts-add-account-description = For pull requests and CI on GitHub, GitHub Enterprise, GitLab, self-hosted GitLab or Bitbucket. GitButler's other apps share them.

# settings/accounts.rs :: integration_cards
settings-accounts-add-account-description-2 = Add…

# settings/accounts.rs :: add_token
settings-accounts-add-account-error = Couldn't add the account

# settings/accounts.rs :: integration_cards
settings-accounts-add-account-label = Add an account

# settings/accounts.rs :: gitbutler_row
settings-accounts-ai-use-gitbutler-s-key = AI can use GitButler's key.

# settings/accounts.rs :: start_adding
settings-accounts-email = Email

# settings/accounts.rs :: integration_cards
settings-accounts-forget = Forget

# settings/accounts.rs :: title
settings-accounts-new-github-enterprise-token = New GitHub Enterprise token

# settings/accounts.rs :: title
settings-accounts-new-self-hosted-token = New self-hosted { $name } token

# settings/accounts.rs :: title
settings-accounts-new-token = New { $name } token

# settings/accounts.rs :: log_in_to_gitbutler
settings-accounts-paste-token = Paste the token

# settings/accounts.rs :: log_in_to_gitbutler
settings-accounts-reach-gitbutler-error = Couldn't reach GitButler

# settings/accounts.rs :: gitbutler_row
settings-accounts-sign = Sign in…

# settings/accounts.rs :: log_in_to_gitbutler
settings-accounts-sign-error = Couldn't sign in

# settings/accounts.rs :: sign_in_to_github
settings-accounts-sign-github-error = Couldn't sign in to GitHub

# settings/accounts.rs :: gitbutler_row
settings-accounts-sign-out = Sign out

# settings/accounts.rs :: gitbutler_row
settings-accounts-sign-page-opened-then-paste-token = Sign in on the page that opened, then paste the token it shows.

# settings/accounts.rs :: gitbutler_row
settings-accounts-sign-use-gitbutler-s-ai-key = Sign in to use GitButler's AI key, with no key of your own.

# settings/accounts.rs :: integration_cards
settings-accounts-signing-github-description = Enter { $code } on the page that opened. It's on your clipboard.

# settings/accounts.rs :: integration_cards
settings-accounts-signing-github-description-2 = Copy code

# settings/accounts.rs :: integration_cards
settings-accounts-signing-github-label = Signing in to GitHub

# settings/accounts.rs :: sign_in_to_github
settings-accounts-start-signing-error = Couldn't start signing in

# settings/accounts.rs :: start_adding
settings-accounts-token = Token

# settings/ai.rs :: ai_rows
settings-ai-ai-rows-was-set-up-another = { $provider_name } was set up in another GitButler app, which is where it changes. Pick a provider here to use that instead.

# settings/ai.rs :: ai_rows
settings-ai-ai-rows-writes-commit-messages-pull = Writes commit messages and pull request descriptions, and suggests conflict merges, when you ask.

# settings/ai.rs :: ai_rows
settings-ai-api-key-label = API key

# settings/ai.rs :: ai_rows
settings-ai-endpoint-description = Where { $provider_name } listens.

# settings/ai.rs :: ai_rows
settings-ai-endpoint-label = Endpoint

# settings/mod.rs :: set_up_ai
settings-ai-isn-t-set-up-yet = AI isn't set up yet. What's typed in this form is lost.

# settings/ai.rs :: ai_rows
settings-ai-key-description = GitButler's needs you signed in to GitButler; your own stays in the keychain.

# settings/ai.rs :: ai_rows
settings-ai-key-description-2 = GitButler's

# settings/ai.rs :: ai_rows
settings-ai-key-description-3 = Your own

# settings/ai.rs :: ai_rows
settings-ai-key-label = Key

# settings/ai.rs :: ai_rows
settings-ai-key-stored-paste-another-replace = A key is stored. Paste another to replace it.

# settings/ai.rs :: new
settings-ai-model = Model

# settings/ai.rs :: ai_rows
settings-ai-model-description = The { $provider_name } model to ask.

# settings/ai.rs :: ai_rows
settings-ai-model-label = Model

# settings/ai.rs :: ai_rows
settings-ai-needs-key-before-write-anything = { $provider_name } needs a key before it can write anything.

# settings/ai.rs :: new
settings-ai-paste-key = Paste a key

# settings/ai.rs :: ai_rows
settings-ai-paste-key-2 = Paste your { $provider_name } key.

# settings/ai.rs :: ai_rows
settings-ai-provider-label = Provider

# settings/ai.rs :: ai_rows
settings-ai-read-ai-settings-error = Couldn't read the AI settings

# settings/ai.rs :: update_ai
settings-ai-save-ai-settings-error = Couldn't save the AI settings

# settings/mod.rs :: title
settings-appearance = Appearance

# settings/mod.rs :: appearance_cards
settings-appearance-description = Follow the system appearance, or always use light or dark mode.

# settings/mod.rs :: appearance_cards
settings-appearance-label = Appearance

# settings/mod.rs :: program_rows
settings-ask-first-time = Ask the first time

# settings/mod.rs :: look_rows
settings-balanced = Balanced

# settings/mod.rs :: look_rows
settings-blue = Blue

# settings/mod.rs :: briefs_row
settings-briefs-description = Show the brief about a branch on a tab of its page. Every few minutes, open projects ask GitButler's server about their newest branches, by the repository's address and the branches' names and commits.

# settings/mod.rs :: briefs_row
settings-briefs-label = Briefs

# settings/cli.rs :: cli_row
settings-cli-cli-row-lets-coding-agents-use = Lets you and your coding agents use GitButler from a terminal. macOS may ask for your password to put it in /usr/local/bin.

# settings/cli.rs :: cli_row
settings-cli-installed = Installed at { $path }. { $SETUP }

# settings/cli.rs :: install_button
settings-cli-installing = Installing…

# settings/cli.rs :: welcome_card
settings-cli-let-agents-use-gitbutler = Let your agents use GitButler

# settings/cli.rs :: cli_row
settings-cli-link-app-s-copy = Link this app's copy

# settings/cli.rs :: welcome_card
settings-cli-set-up-agents = Set up your agents

# settings/cli.rs :: install_button
settings-cli-waiting-administrator-password = Waiting for the administrator password

# settings/mod.rs :: appearance_cards
settings-code-size-description = How large code shows in diffs.

# settings/mod.rs :: appearance_cards
settings-code-size-label = Code size

# settings/mod.rs :: new
settings-colour-3b82f6 = A colour, as #3b82f6

# settings/mod.rs :: new
settings-command = Command

# settings/mod.rs :: diff_layout_rows
settings-commit-messages-diff-description = Commit and branch pages list their messages above the files in place of their headers, and uncommitted changes go without theirs.

# settings/mod.rs :: diff_layout_rows
settings-commit-messages-diff-label = Commit messages in the diff

# settings/mod.rs :: page_cards
settings-commits = Commits

# settings/mod.rs :: look_rows
settings-compact = Compact

# settings/mod.rs :: terminal_close_row
settings-confirm-closing-terminals-label = Confirm closing terminals

# settings/mod.rs :: look_rows
settings-corners-description = How round buttons, cards and popovers are.

# settings/mod.rs :: look_rows
settings-corners-label = Corners

# settings/mod.rs :: look_rows
settings-custom = Custom

# settings/mod.rs :: terminal_run_row
settings-custom-command = Custom command

# settings/mod.rs :: appearance_cards
settings-dark = Dark

# settings/mod.rs :: look_rows
settings-density-description = How tall buttons and controls are, and the room beside their labels.

# settings/mod.rs :: look_rows
settings-density-label = Density

# settings/mod.rs :: title
settings-developer = Developer

# settings/mod.rs :: appearance_cards
settings-diff = Diff

# settings/mod.rs :: menu_bar_row
settings-draw-menu-bar-description = The menu bar the app draws on Windows and Linux, a button in the window's top left corner that opens the menus, drawn here too, to try it.

# settings/mod.rs :: menu_bar_row
settings-draw-menu-bar-label = Draw the menu bar

# settings/mod.rs :: program_rows
settings-editor-description = Where "Open in editor" opens files, at the line you're on.

# settings/mod.rs :: program_rows
settings-editor-label = Editor

# settings/mod.rs :: title
settings-experimental = Experimental

# settings/mod.rs :: fetch_row
settings-fetch-automatically-description = Keeps the target and each branch's remote current, for every expanded project. GitButler's other apps share this.

# settings/mod.rs :: fetch_row
settings-fetch-automatically-label = Fetch automatically

# settings/mod.rs :: appearance_cards
settings-file-list = File list

# settings/mod.rs :: appearance_cards
settings-font-description = The font of code in diffs.

# settings/mod.rs :: appearance_cards
settings-font-description-2 = The font of terminals opened here. As Ghostty's follows your Ghostty config.

# settings/mod.rs :: appearance_cards
settings-font-label = Font

# settings/mod.rs :: appearance_cards
settings-font-ligatures-description = Code joins pairs of characters like != and == into one symbol, if the font has them.

# settings/mod.rs :: appearance_cards
settings-font-ligatures-label = Font ligatures

# settings/mod.rs :: title
settings-general = General

# settings/mod.rs :: look_rows
settings-gray = Gray

# settings/mod.rs :: look_rows
settings-ground-description = The gray everything sits on: neutral, or a touch cool, green or warm.

# settings/mod.rs :: look_rows
settings-ground-label = Ground

# settings/mod.rs :: title
settings-integrations = Integrations

# settings/mod.rs :: appearance_cards
settings-interface-size-description = How large everything draws, as a browser zooms. ⌘+ and ⌘− step it, ⌘0 puts it back.

# settings/mod.rs :: appearance_cards
settings-interface-size-label = Interface size

# settings/mod.rs :: title
settings-keyboard = Keyboard

# settings/keyboard.rs :: shortcut
settings-keyboard-no-keys = No keys

# settings/mod.rs :: language_row
settings-language-description = Choose the language used in GitButler. Changes apply immediately.

# settings/mod.rs :: language_row
settings-language-label = Language

# settings/mod.rs :: appearance_cards
settings-large = Large

# settings/launchers.rs :: terminal_launchers_row
settings-launchers-add-command = Add command

# settings/launchers.rs :: launcher
settings-launchers-command = Command

# settings/launchers.rs :: terminal_launchers_row
settings-launchers-new-terminal-command-description = The commands it offers. Each runs through your shell.

# settings/launchers.rs :: terminal_launchers_row
settings-launchers-new-terminal-command-label = New terminal with command

# settings/mod.rs :: appearance_cards
settings-light = Light

# settings/mod.rs :: terminal_run_row
settings-login-shell = Login shell

# settings/mod.rs :: page_cards
settings-look = Look

# settings/mod.rs :: appearance_cards
settings-medium = Medium

# settings/mod.rs :: merged_worktrees_row
settings-merged-worktrees-description = When an update finds a linked worktree's branch merged, archive the worktree or delete its folder, closing its terminals. One with uncommitted files is left alone.

# settings/mod.rs :: merged_worktrees_row
settings-merged-worktrees-label = Merged worktrees

# settings/mesh.rs :: mesh_row
settings-mesh-approve-machine-page-opened = Approve this machine on the page that opened.

# settings/mesh.rs :: mesh_row
settings-mesh-checking = Checking…

# settings/mesh.rs :: mesh_row
settings-mesh-mesh-label = Mesh

# settings/mesh.rs :: mesh_row
settings-mesh-mesh-row-daemon-stops-other-machines = Its daemon stops, and your other machines no longer see its work. Its repositories stay as they are.

# settings/mesh.rs :: mesh_row
settings-mesh-mesh-row-sign-see-unfinished-work = Sign in to see unfinished work on your other machines beside each project, and show them this one's.

# settings/mesh.rs :: mesh_row
settings-mesh-sign = Sign in…

# settings/mesh.rs :: mesh_row
settings-mesh-sign-out = Sign out

# settings/mesh.rs :: mesh_row
settings-mesh-signed = Signed in as { $login } on { $machine }. { $reporting }

# settings/mesh.rs :: mesh_row
settings-mesh-signing = Signing in…

# settings/mesh.rs :: mesh_row
settings-mesh-take-out-mesh = Take { $machine } out of your mesh?

# settings/mesh.rs :: mesh_row
settings-mesh-waiting-browser = Waiting for the browser

# settings/mod.rs :: page_cards
settings-metrics = Metrics

# settings/metrics.rs :: metrics_rows
settings-metrics-error-reporting-description = Reports the app's crashes and errors, which helps us catch issues more quickly.

# settings/metrics.rs :: metrics_rows
settings-metrics-error-reporting-label = Error reporting

# settings/metrics.rs :: metrics_rows
settings-metrics-usage-metrics-description = Shares usage statistics, strictly to help us improve the app, with no personal information: no names, paths or anything you wrote.

# settings/metrics.rs :: metrics_rows
settings-metrics-usage-metrics-label = Usage metrics

# settings/mod.rs :: appearance_cards
settings-navigator = Navigator

# settings/mod.rs :: navigator_place_row
settings-navigator-position-description = Across the top, each project is a tab, and pointing at one shows what's in it.

# settings/mod.rs :: navigator_place_row
settings-navigator-position-description-2 = Side

# settings/mod.rs :: navigator_place_row
settings-navigator-position-description-3 = Top

# settings/mod.rs :: navigator_place_row
settings-navigator-position-label = Navigator position

# settings/mod.rs :: terminal_run_row
settings-new-terminals-run-description = What terminals opened here start. A command runs through your shell, and its terminal closes when it exits.

# settings/mod.rs :: terminal_run_row
settings-new-terminals-run-label = New terminals run

# settings/mod.rs :: start_row
settings-open-app-start-description = GitButler opens this app rather than its web app when it starts, as featureFlags.gpui in its settings.json says. Starting it with --gpui opens this app either way.

# settings/mod.rs :: start_row
settings-open-app-start-label = Open this app at start

# settings/mod.rs :: appearance_cards
settings-open-branches-click-description = Clicking a branch in the navigator lists its commits too, and folds the ones the last click listed. Off, a click only selects it.

# settings/mod.rs :: appearance_cards
settings-open-branches-click-label = Open branches on click

# settings/mod.rs :: look_rows
settings-preset-description = Corners and density together. Changing either makes the look your own.

# settings/mod.rs :: look_rows
settings-preset-label = Preset

# settings/mod.rs :: title
settings-project = Project

# settings/project.rs :: project_cards
settings-project-authentication = Authentication

# settings/project.rs :: project_cards
settings-project-credentials-description = Fetches from the target branch's remote, then pushes an empty branch to the one branches are pushed to and deletes it.

# settings/project.rs :: project_cards
settings-project-credentials-description-2 = Needs a target branch with a remote to test against.

# settings/project.rs :: project_cards
settings-project-credentials-label = Credentials

# settings/project.rs :: project_cards
settings-project-force-pushes-description = A force push fetches first, stops if someone else pushed to the branch since, and asks before dropping commits only the remote has, so there's no protection to turn on here.

# settings/project.rs :: project_cards
settings-project-force-pushes-label = Force pushes

# settings/project.rs :: project_cards
settings-project-forge-description = Where pull requests and CI are, as the remote's host names it.

# settings/project.rs :: project_cards
settings-project-forge-description-2 = The remote's host names { $name }, so the forge picked here doesn't count. None clears it.

# settings/project.rs :: project_cards
settings-project-forge-description-3 = Where pull requests and CI are, for a remote whose host doesn't say, as a self-hosted forge's. GitHub, GitLab and Bitbucket can open pull requests.

# settings/project.rs :: project_cards
settings-project-forge-label = Forge

# settings/mod.rs :: new
settings-project-name = Project name

# settings/project.rs :: project_cards
settings-project-name-description = What the project is called in the navigator.

# settings/project.rs :: project_cards
settings-project-name-label = Name

# settings/project.rs :: project_cards
settings-project-push-new-branches-description = The remote a branch goes to on its first push, as your fork when the target is the original repository's. Updates come from the target branch's remote.

# settings/project.rs :: project_cards
settings-project-push-new-branches-label = Push new branches to

# settings/project.rs :: project_cards
settings-project-read-project-s-settings-error = Couldn't read the project's settings

# settings/project.rs :: remove_row
settings-project-remove-project-description = Takes it out of GitButler, and its operations history with it. The repository's files and branches stay on disk.

# settings/project.rs :: remove_row
settings-project-remove-project-description-2 = Remove…

# settings/project.rs :: remove_row
settings-project-remove-project-label = Remove project

# settings/project.rs :: remove_project
settings-project-repository-branches-stay-disk-add-again = The repository and its branches stay on disk; add it again any time.

# settings/project.rs :: project_cards
settings-project-run-git-hooks-description = Runs the repository's pre-commit, commit-msg, post-commit and pre-push hooks in the main checkout. A linked worktree's commits don't run them.

# settings/project.rs :: project_cards
settings-project-run-git-hooks-label = Run Git hooks

# settings/project.rs :: project_cards
settings-project-sign-commits-description = Sign the commits GitButler makes, with the key and program your Git config names.

# settings/project.rs :: project_cards
settings-project-sign-commits-description-2 = Test

# settings/project.rs :: project_cards
settings-project-sign-commits-label = Sign commits

# settings/project.rs :: project_cards
settings-project-signing = Signing

# settings/project.rs :: project_cards
settings-project-signing-works = Signing works

# settings/project.rs :: project_cards
settings-project-target-branch-description = The branch your work goes into, and pull requests aim at. To change it, unapply every branch first.

# settings/project.rs :: project_cards
settings-project-target-branch-description-2 = The branch your work goes into, and pull requests aim at.

# settings/project.rs :: project_cards
settings-project-target-branch-description-3 = Change…

# settings/project.rs :: project_cards
settings-project-target-branch-label = Target branch

# settings/project.rs :: project_cards
settings-project-test = Test

# settings/project.rs :: project_cards
settings-project-testing = Testing…

# settings/mod.rs :: look_rows
settings-purple = Purple

# settings/mod.rs :: look_rows
settings-round = Round

# settings/mod.rs :: look_rows
settings-sage = Sage

# settings/mod.rs :: look_rows
settings-sand = Sand

# settings/mod.rs :: screen_reader_row
settings-screen-reader-support-description = Lets VoiceOver and other screen readers read the app. Takes effect when the app next starts. On a Mac with a Touch Bar, closing a window with this on can crash the app.

# settings/mod.rs :: screen_reader_row
settings-screen-reader-support-label = Screen reader support

# settings/mod.rs :: new
settings-search-settings = Search settings

# settings/mod.rs :: appearance_cards
settings-semantic-context-description = Each hunk's box names the function or type it changes, and a short one shows whole around it. deltoids reads it from the code with tree-sitter, for Rust, TypeScript, JavaScript, Python, Go and 15 other languages, though not Svelte. Off, diffs skip reading it, and load a little faster.

# settings/mod.rs :: appearance_cards
settings-semantic-context-label = Semantic context

# settings/mod.rs :: render
settings-settings = Settings

# settings/mod.rs :: look_rows
settings-sharp = Sharp

# settings/mod.rs :: appearance_cards
settings-show-all-branch-s-commits-description = An open branch in the navigator lists every commit it has. Off, it lists the first eight, then how many more, which a click lists too.

# settings/mod.rs :: appearance_cards
settings-show-all-branch-s-commits-label = Show all of a branch's commits

# settings/mod.rs :: appearance_cards
settings-show-branches-commits-description = Branches in the navigator start with their commits listed. Off, each starts folded to one row, which ↩ or its chevron opens.

# settings/mod.rs :: appearance_cards
settings-show-branches-commits-label = Show branches' commits

# settings/mod.rs :: diff_layout_rows
settings-show-diff-controls-description = The bar over the diff, and the line counts and buttons in file headers. Off, keys and menus still have them.

# settings/mod.rs :: diff_layout_rows
settings-show-diff-controls-label = Show diff controls

# settings/mod.rs :: appearance_cards
settings-show-folders-line-counts-description = Folders in a file tree always show the lines their files add and remove. Off, they show them only under the pointer.

# settings/mod.rs :: appearance_cards
settings-show-folders-line-counts-label = Show folders' line counts

# settings/mod.rs :: fps_row
settings-show-fps-description = The frames drawn in the last second, in the window's top right corner. When a frame of the last three seconds was much slower, its pace shows beside them in amber, and a graph before them shows how long each frame of those seconds took. While it shows, the window draws every frame it can, so a slow view brings them down.

# settings/mod.rs :: fps_row
settings-show-fps-label = Show FPS

# settings/mod.rs :: diff_layout_rows
settings-show-full-commit-messages-description = Commit pages start with the whole message open under its title. Off, they show the title, and the button beside it opens the rest.

# settings/mod.rs :: diff_layout_rows
settings-show-full-commit-messages-label = Show full commit messages

# settings/mod.rs :: status_bar_row
settings-show-status-bar-description = The bar along the window's bottom, with what's under way and the keys for it.

# settings/mod.rs :: status_bar_row
settings-show-status-bar-label = Show status bar

# settings/mod.rs :: terminal_overview_row
settings-show-terminal-overview-description = Every terminal open, on every project, under the navigator.

# settings/mod.rs :: terminal_overview_row
settings-show-terminal-overview-label = Show terminal overview

# settings/mod.rs :: appearance_cards
settings-side-side-description = Diffs show the old lines beside the new ones.{ $cx }

# settings/mod.rs :: appearance_cards
settings-side-side-label = Side by side

# settings/mod.rs :: single_file_row
settings-single-file-diff-description = The diff shows only the file selected in the file list, filling the pane, with its changed lines marked beside the scrollbar. The file list stays beside it.

# settings/mod.rs :: single_file_row
settings-single-file-diff-label = Single file diff

# settings/mod.rs :: look_rows
settings-slate = Slate

# settings/mod.rs :: appearance_cards
settings-small = Small

# settings/mod.rs :: look_rows
settings-soft = Soft

# settings/mod.rs :: look_rows
settings-spacious = Spacious

# settings/mod.rs :: composer_row
settings-start-commits-nothing-checked-description = The commit box opens with every file unchecked, and you check the ones that go in. Off, they all start checked.

# settings/mod.rs :: composer_row
settings-start-commits-nothing-checked-label = Start commits with nothing checked

# settings/mod.rs :: appearance_cards
settings-step-through-folders-description = ↑ and ↓, or j and k, stop on a file tree's folders too, showing what changed in each, and the fold keys fold and unfold them. Off, they go from file to file.

# settings/mod.rs :: appearance_cards
settings-step-through-folders-label = Step through folders

# settings/mod.rs :: appearance_cards
settings-system = System

# settings/mod.rs :: look_rows
settings-teal = Teal

# settings/mod.rs :: program_rows
settings-terminal = Terminal

# settings/mod.rs :: program_rows
settings-terminal-description = Where "Open in terminal" opens the project.

# settings/mod.rs :: program_rows
settings-terminal-label = Terminal

# settings/mod.rs :: appearance_cards
settings-text-size-description = How large text shows in terminals opened here. Their colours follow the colour scheme.

# settings/mod.rs :: appearance_cards
settings-text-size-label = Text size

# settings/mod.rs :: appearance_cards
settings-theme = { $name } theme { $label }

# settings/mod.rs :: appearance_cards
settings-theme-description = The colours for the current appearance. Changes apply immediately.

# settings/mod.rs :: appearance_cards
settings-theme-label = Theme

# settings/mod.rs :: page_cards
settings-tile-dragging = Tile dragging

# settings/mod.rs :: read_failed
settings-try-again = Try again

# settings/mod.rs :: appearance_cards
settings-whole-scopes-up-description = The most unchanged lines a function or type may add around its hunks to show whole. A longer one keeps three lines of context.

# settings/mod.rs :: appearance_cards
settings-whole-scopes-up-label = Whole scopes up to

# settings/mod.rs :: page_cards
settings-worktrees = Worktrees

# settings/mod.rs :: appearance_cards
settings-worktrees-go-inactive-after-description = A linked worktree with nothing uncommitted moves under Inactive worktrees once it's gone this long without a commit or checkout.

# settings/mod.rs :: appearance_cards
settings-worktrees-go-inactive-after-label = Worktrees go inactive after

# settings/mod.rs :: appearance_cards
settings-wrap-long-lines-description = Diff lines wider than the pane continue on the next row.{ $cx }

# settings/mod.rs :: appearance_cards
settings-wrap-long-lines-label = Wrap long lines

# state/account.rs :: sign_out
state-account-sign-out-error = Couldn't sign out

# state/cli.rs :: install_cli
state-cli-install-cli-error = Couldn't install the CLI

# state/load.rs :: add_or_open
state-load-add-project-error = Couldn't add the project

# state/load.rs :: offer_init
state-load-initialize-git-error = Couldn't initialize Git

# state/load.rs :: load_projects
state-load-list-projects-error = Couldn't list projects

# state/load.rs :: remove_project
state-load-remove-project-error = Couldn't remove the project

# state/mesh.rs :: mesh_apply
state-mesh-bring-here-error = Couldn't bring { $branch } here

# state/mesh.rs :: mesh_sign_in
state-mesh-connect-mesh-error = Couldn't connect to your mesh

# state/mesh.rs :: mesh_sign_out
state-mesh-disconnect-mesh-error = Couldn't disconnect from your mesh

# state/mutation.rs :: amend
state-mutation-amended-but-post-commit-hook-failed = Amended, but the post-commit hook failed

# state/mutation.rs :: set_worktree_archived
state-mutation-archive-worktree = Archive worktree

# state/mutation.rs :: arriving
state-mutation-commits = { $count } commits

# state/mutation.rs :: publish
state-mutation-create-pull-request-error = Couldn't create the pull request

# state/mutation.rs :: apply
state-mutation-failed = { $label } failed

# state/mutation.rs :: fetch
state-mutation-fetch-failed = Fetch failed

# state/mutation.rs :: report_left_out
state-mutation-leaving-some-changes-out = { $done }, leaving some changes out

# state/mutation.rs :: unstack
state-mutation-move-branch = Move branch

# state/mutation.rs :: pull_remote
state-mutation-pulling-leaves-conflicts = Pulling leaves conflicts

# state/mutation.rs :: push
state-mutation-pushed = Pushed { $all }

# state/mutation.rs :: push
state-mutation-pushed-but-stack-s-pull-requests = Pushed { $name }{ $pushed }, but the stack's pull requests weren't updated

# state/mutation.rs :: redo_snapshot
state-mutation-redo-takes-back-newer-changes-too = Redo takes back newer changes too

# state/mutation.rs :: set_worktree_archived
state-mutation-unarchive-worktree = Unarchive worktree

# state/mutation.rs :: undo_snapshot
state-mutation-undo-failed = Undo failed

# state/mutation.rs :: undo_snapshot
state-mutation-undo-may-take-back-was-pushed = Undo may take back what was pushed

# state/mutation.rs :: undo_snapshot
state-mutation-undo-takes-back-newer-changes-too = Undo takes back newer changes too

# state/mutation.rs :: undo_snapshot
state-mutation-undone = Undone: { $operation }

# state/mutation.rs :: unstack
state-mutation-unstack = Unstack

# state/mutation.rs :: push
state-mutation-wasn-t-pushed = { $name } wasn't pushed

# state/mod.rs :: load_merged
state-read-merge-s-commits-error = Couldn't read the merge's commits

# state/terminals.rs :: open_terminal_then
state-terminals-open-terminal-error = Couldn't open a terminal

# status_bar.rs :: render_status_bar
status-bar-arranging-tiles = Arranging tiles

# status_bar.rs :: render_status_bar
status-bar-commands = Commands

# status_bar.rs :: render_status_bar
status-bar-editing = Editing { $file }

# status_bar.rs :: render_status_bar
status-bar-press-tile-s-letter = press a tile's letter

# status_bar.rs :: render_status_bar
status-bar-s = ⌘S

# status_bar.rs :: render_status_bar
status-bar-selected = { $what } selected

# status_bar.rs :: render_status_bar
status-bar-swapping-tiles = Swapping tiles

# status_bar.rs :: render_status_bar
status-bar-z = ⌘Z

# ui/format.rs :: ago
time-ago = { $duration } ago


# ui/format.rs :: ago
time-just-now = just now

# ui/format.rs :: relative_duration
time-now = now

# transfer.rs :: render
transfer-stack = Stack on { $on }

# ui/conflict.rs :: ancestor_toggle
ui-conflict-both-sides-added-these-lines = Both sides added these lines

# ui/conflict.rs :: result
ui-conflict-change = Change

# ui/conflict.rs :: bar
ui-conflict-conflict = Conflict { $number } of { $total }

# ui/conflict.rs :: ancestor_toggle
ui-conflict-hide-was-before = Hide how it was before

# ui/conflict.rs :: editor
ui-conflict-keep = Keep

# ui/conflict.rs :: editor
ui-conflict-leaving-empty-removes-these-lines = Leaving it empty removes these lines.

# ui/conflict.rs :: label
ui-conflict-nothing = Nothing from { $phrase }

# ui/conflict.rs :: result
ui-conflict-nothing-so-these-lines-go = { $says }: nothing, so these lines go

# ui/conflict.rs :: result
ui-conflict-pick-again = Pick again

# ui/conflict.rs :: ancestor_toggle
ui-conflict-show-line-before-either-changed = Show the line before either changed it

# ui/conflict.rs :: ancestor_toggle
ui-conflict-show-lines-before-either-changed-them = Show the { $n } lines before either changed them

# ui/diff.rs :: conflicted_badge
ui-diff-conflicted = Conflicted

# ui/diff.rs :: hunk_header
ui-diff-not-included = not included

# ui/format.rs :: commit_title
ui-format-no-message = No message

# ui/markdown.rs :: words
ui-markdown-image = Image

# ui/markdown.rs :: words
ui-markdown-image-2 = Image: { $alt }

# ui/markdown/preview.rs :: render
ui-markdown-preview-image = Image

# ui/markdown/preview.rs :: render
ui-markdown-preview-next-image = Next image

# ui/markdown/preview.rs :: render
ui-markdown-preview-open-browser = Open in browser

# ui/markdown/preview.rs :: render
ui-markdown-preview-previous-image = Previous image

# ui/person.rs :: byline
ui-person-at = { $by } at { $time }

# ui/text_input.rs :: title_of
ui-text-input-delete = Delete to { $words }

# ui/text_input.rs :: words
ui-text-input-down = down

# ui/text_input.rs :: words
ui-text-input-end = end

# ui/text_input.rs :: words
ui-text-input-left = left

# ui/text_input.rs :: words
ui-text-input-line-end = line end

# ui/text_input.rs :: words
ui-text-input-line-start = line start

# ui/text_input.rs :: title_of
ui-text-input-move = Move to

# ui/text_input.rs :: words
ui-text-input-right = right

# ui/text_input.rs :: title_of
ui-text-input-select = Select to

# ui/text_input.rs :: words
ui-text-input-start = start

# ui/text_input.rs :: words
ui-text-input-up = up

# ui/text_input.rs :: words
ui-text-input-word-left = word left

# ui/text_input.rs :: words
ui-text-input-word-right = word right

# whats_new.rs :: found
whats-new-needs = Needs { $version }

# whats_new.rs :: notes
whats-new-not-version-yet = Not in your version yet

# whats_new.rs :: notes
whats-new-open-github = Open on GitHub

# whats_new.rs :: render
whats-new-s-new = What's new

# whats_new.rs :: new
whats-new-search-release-notes = Search release notes

# whats_new.rs :: failed
whats-new-try-again = Try again

# whats_new.rs :: found
whats-new-version = In your version

# whats_new.rs :: release_row
whats-new-yours = Yours

## Quantities. Keep count numeric; Fluent selects grammatical variants.

count-branches =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } branch
       *[other] { NUMBER($count, useGrouping: 0) } branches
    }

count-commits =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } commit
       *[other] { NUMBER($count, useGrouping: 0) } commits
    }

count-files =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } file
       *[other] { NUMBER($count, useGrouping: 0) } files
    }

count-lines =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } line
       *[other] { NUMBER($count, useGrouping: 0) } lines
    }

count-conflicted-commits =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } conflicted commit
       *[other] { NUMBER($count, useGrouping: 0) } conflicted commits
    }

count-conflicted-files =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } conflicted file
       *[other] { NUMBER($count, useGrouping: 0) } conflicted files
    }

count-fixes =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } fix
       *[other] { NUMBER($count, useGrouping: 0) } fixes
    }

count-releases =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } release
       *[other] { NUMBER($count, useGrouping: 0) } releases
    }

count-matches =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } match
       *[other] { NUMBER($count, useGrouping: 0) } matches
    }

count-changes =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } change
       *[other] { NUMBER($count, useGrouping: 0) } changes
    }

count-more-files =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } more file
       *[other] { NUMBER($count, useGrouping: 0) } more files
    }

count-unpushed-commits =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } unpushed commit
       *[other] { NUMBER($count, useGrouping: 0) } unpushed commits
    }

count-uncommitted-files =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } uncommitted file
       *[other] { NUMBER($count, useGrouping: 0) } uncommitted files
    }

count-unmodified-lines =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } unmodified line
       *[other] { NUMBER($count, useGrouping: 0) } unmodified lines
    }

count-parts =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } part
       *[other] { NUMBER($count, useGrouping: 0) } parts
    }

count-comments =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } comment
       *[other] { NUMBER($count, useGrouping: 0) } comments
    }

count-conflicts =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } conflict
       *[other] { NUMBER($count, useGrouping: 0) } conflicts
    }

count-linked-worktrees =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } linked worktree
       *[other] { NUMBER($count, useGrouping: 0) } linked worktrees
    }

count-worktrees =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } worktree
       *[other] { NUMBER($count, useGrouping: 0) } worktrees
    }

count-edits =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } edit
       *[other] { NUMBER($count, useGrouping: 0) } edits
    }

count-checks =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } check
       *[other] { NUMBER($count, useGrouping: 0) } checks
    }

count-changed-files =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } changed file
       *[other] { NUMBER($count, useGrouping: 0) } changed files
    }

count-pull-requests =
    { $count ->
        [one] { NUMBER($count, useGrouping: 0) } pull request
       *[other] { NUMBER($count, useGrouping: 0) } pull requests
    }

releases-category-count =
    { $count ->
        [one] { $category } change
       *[other] { NUMBER($count, useGrouping: 0) } { $category } changes
    }

time-minutes-short = { NUMBER($count, useGrouping: 0) }m


time-hours-short = { NUMBER($count, useGrouping: 0) }h


time-days-short = { NUMBER($count, useGrouping: 0) }d


time-months-short = { NUMBER($count, useGrouping: 0) }mo


time-years-short = { NUMBER($count, useGrouping: 0) }y


weekday-mon = Mon


weekday-tue = Tue


weekday-wed = Wed


weekday-thu = Thu


weekday-fri = Fri


weekday-sat = Sat


weekday-sun = Sun


welcome-usage-notice = GitButler collects usage data. Read our <privacy>privacy policy</privacy> and learn how to <opt-out>opt out</opt-out>.


settings-mesh-not-installed = GitButler's mesh isn't installed on this machine.


## Contextual command phrases. Counts are numeric; names remain literal.

command-uncommit-changes-phrase = Uncommit { $changes }

command-add-empty-commit-phrase = Add empty commit

command-copy-name-phrase = Copy name

command-new-worktree-phrase = New worktree

command-edit-description-phrase = Edit description

command-restore-operation-phrase = Restore to before this

command-new-terminal-with-phrase = New terminal with…

command-archive-phrase = Archive

command-sort-activity-phrase = Last activity

command-sort-name-phrase = Name

command-all-projects-phrase = All

command-active-projects-phrase = Active in the last 7 days

command-local-branches-phrase = Local branches

command-remote-branches-phrase = Remote branches

command-squash-branch-phrase = Squash branch

command-unapply-branch-phrase = Unapply branch

command-uncommit-picked-phrase = Uncommit { $count } commits

command-cherry-pick-picked-phrase = Cherry-pick { $count } commits

command-squash-into-picked-phrase = Squash { $count } commits into this one

command-move-new-branch-phrase = Move { $count } commits to a new branch

command-move-picked-phrase = Move { $count } commits

command-squash-picked-phrase = Squash { $count } commits

command-open-forge-phrase = Open on { $provider }

command-squash-into-oldest-phrase = Squash { $count } commits into { $title }

command-merge-stack-phrase = Merge the stack into { $target }

command-merge-branch-phrase = Merge into { $target }

push-force = Force push

command-push-stack-phrase = Push stack

command-force-push-stack-phrase = Force push stack

command-pull-remote-phrase = 
    { $count ->
        [one] Pull { $count } commit from the remote
       *[other] Pull { $count } commits from the remote
    }


## Native launchers and push descriptions.

open-in-editor = Open in editor

open-in-program = Open in { $name }

open-in-editor-selected = Files now open in { $name }, set in Settings → General

open-in-editor-error = Couldn't open the editor

open-in-terminal-error = Couldn't open the terminal

terminal-default-title = Terminal

push-tooltip = 
    { $count ->
        [one] Push { $count } commit
       *[other] Push { $count } commits
    }

push-force-tooltip = 
    { $count ->
        [one] Force push { $count } commit
       *[other] Force push { $count } commits
    }

push-parents-tooltip = 
    { $count ->
        [one] Push { $count } commit with parents
       *[other] Push { $count } commits with parents
    }

push-force-parents-tooltip = 
    { $count ->
        [one] Force push { $count } commit with parents
       *[other] Force push { $count } commits with parents
    }


## Native menu actions outside the command palette.

menu-hide = Hide GitButler

menu-hide-others = Hide Others

menu-show-all = Show All

menu-minimize = Minimize

menu-zoom = Zoom

menu-command-palette = Command Palette…

menu-cut = Cut

menu-copy = Copy

menu-paste = Paste

menu-select-all = Select All


## Repository overview and shared picker labels.

overview-activity = Activity

overview-shipped = Shipped

overview-pull-requests = Pull requests

overview-commits = Commits

overview-people = People

overview-time-to-merge = Time to merge

overview-where-merged = Where it merged

overview-merged-count-hint = how many merged there

overview-who-wrote = Who wrote them

overview-pull-requests-hint = Pull requests that merged then

overview-commits-hint = The commits they brought in, merges left out

overview-merge-time-hint = The middle time from a pull request's first commit being written to it merging

overview-no-matches = Nothing merged that the filters keep

overview-today = Today

overview-no-remote = No remote to fetch from

navigator-all-projects = All projects

navigator-more-projects = More projects

palette-move-hint = Move

palette-run-hint = Run

palette-close-hint = Close

palette-search-commands = Search commands

overview-activity-summary = { $commits }, { $week } in the last week

overview-days-ago = { $count } days ago

overview-last-days = Last { $count } days

overview-nothing-merged = Nothing merged in the last { $count } days

overview-on-target-area = On { $target } · { $area }

overview-on-target = On { $target }

overview-merges-days = merges · { $count } days

overview-merges-picked-days = merges · days picked

status-fetch = fetch


## Command editor labels.

editor-command-column = Command

editor-action-column = Action

editor-context-column = Where

editor-keys-column = Keys

editor-anywhere = Anywhere

editor-press-key-help = Press a key to find what's bound to it. Click elsewhere to cancel.

editor-record-keys-help = Press the keys, two for a chord. Click elsewhere to cancel.

editor-menu-help = Drag commands into menus and around them. Changes are saved as you make them.

editor-keys-help = Click keys to change them. Changes are saved as you make them.

settings-projects-heading = Projects


## Theme picker. Only schemes matching the active appearance are offered.

theme-current = Current

theme-gitbutler-light = GitButler's light colours

theme-gitbutler-dark = GitButler's dark colours

theme-ghostty-light = The light theme in your Ghostty configuration

theme-ghostty-dark = The dark theme in your Ghostty configuration

theme-search-light = Search light themes

theme-search-dark = Search dark themes

theme-use = Use theme

