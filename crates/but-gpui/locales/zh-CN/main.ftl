# GitButler native UI. Message IDs are stable; keep arguments and markup names intact.
# Keep GitButler, provider names, paths, code and repository data unchanged.

# app.rs :: check_for_updates
app-check-updates-error = 无法检查更新

# app.rs :: scale_ui
app-interface = 界面缩放 { $percent }%

# app.rs :: can_quit
app-quit = 退出

# app.rs :: install_update
app-restart-gitbutler-error = 无法重启 GitButler

# app.rs :: save_screenshot
app-saved-copied = 已保存并复制 { $item }

# app.rs :: save_screenshot
app-take-screenshot-error = 无法截取屏幕

# app.rs :: ask_to_update_with_conflicts
app-update = 更新

# app.rs :: install_update
app-update-gitbutler-error = 无法更新 GitButler

# app.rs :: ask_to_update_with_conflicts
app-update-leave-conflicts = 更新并保留冲突？

# app.rs :: tile_buttons
app-zoom = 缩放

# app.rs :: tile_buttons
app-zoom-out = 缩小

# Command About
command-about = 关于 GitButler
    .menu = { command-about }

# Command ActualSize
command-actual-size = 实际大小
    .menu = { command-actual-size }

# Command AddEmptyCommitAbove
command-add-empty-commit-above = 在上方添加空提交
    .menu = { command-add-empty-commit-above }

# Command AddEmptyCommitBelow
command-add-empty-commit-below = 在下方添加空提交
    .menu = { command-add-empty-commit-below }

# Command AddProject
command-add-project = 添加项目
    .menu = { command-add-project }

# Command ApplyBranch
command-apply-branch = 应用分支
    .menu = { command-apply-branch }

# Command ArchiveWorktree
command-archive-worktree = 归档工作树
    .menu = { command-archive-worktree }

# Command ArrangeTiles
command-arrange-tiles = 排列面板
    .menu = { command-arrange-tiles }

# Command BuildAndRestart
command-build-restart = 构建并重启
    .menu = { command-build-restart }

# Command BuildAndRestartFromHere
command-build-restart-here = 从此处构建并重启
    .menu = { command-build-restart-here }

# Command ChangeTheme
command-change-theme = 更改主题
    .menu = { command-change-theme }

# Command ChangesBeside
command-changes-beside = 在简报旁显示更改
    .menu = { command-changes-beside }

# Command CheckAll
command-check-all = 选中所有文件
    .menu = { command-check-all }

# Command CheckForUpdates
command-check-updates = 检查更新
    .menu = { command-check-updates }

# Command CherryPick
command-cherry-pick = 拣选
    .menu = { command-cherry-pick }

# Command CloneRepository
command-clone-repository = 克隆仓库
    .menu = { command-clone-repository }

# Command CloseWindow
command-close-window = 关闭窗口
    .menu = { command-close-window }

# Command ConvertToDraft
command-convert-draft = 转为草稿
    .menu = { command-convert-draft }

# Command CopyAbsolutePath
command-copy-absolute-path = 复制绝对路径
    .menu = { command-copy-absolute-path }

# Command CopyBranchName
command-copy-branch-name = 复制分支名称
    .menu = { command-copy-branch-name }

# Command CopyChangeId
command-copy-change-id = 复制更改 ID
    .menu = { command-copy-change-id }

# Command CopyCommitId
command-copy-commit-id = 复制提交 ID
    .menu = { command-copy-commit-id }

# Command CopyErrorMessage
command-copy-error-message = 复制错误信息
    .menu = { command-copy-error-message }

# Command CopyMessage
command-copy-message = 复制信息
    .menu = { command-copy-message }

# Command CopyMore
command-copy-more = 复制更多内容
    .menu = { command-copy-more }

# Command CopyPath
command-copy-path = 复制路径
    .menu = { command-copy-path }

# Command CopyPullRequestLink
command-copy-pull-request-link = 复制拉取请求链接
    .menu = { command-copy-pull-request-link }

# Command CopyRelativePath
command-copy-relative-path = 复制相对路径
    .menu = { command-copy-relative-path }

# Command CopySelection
command-copy-selection = 复制
    .menu = { command-copy-selection }

# Command CopySnapshotId
command-copy-snapshot-id = 复制快照 ID
    .menu = { command-copy-snapshot-id }

# Command CopyTileDiagram
command-copy-tile-diagram = 将面板布局复制为示意图
    .menu = { command-copy-tile-diagram }

# Command CreatePullRequest
command-create-pull-request = 创建拉取请求
    .menu = { command-create-pull-request }

# Command DisableAutoMerge
command-disable-auto-merge = 关闭自动合并
    .menu = { command-disable-auto-merge }

# Command Discard
command-discard = 丢弃
    .menu = { command-discard }

# Command EditDescription
command-edit-description = 编辑分支描述
    .menu = { command-edit-description }

# command_editor.rs :: render_cell
command-editor-add-key = 添加密钥

# command_editor.rs :: render_key
command-editor-also-runs = 同时运行 { $join }

# command_editor.rs :: render_row
command-editor-audited = 已审核 { $title } 项

# command_editor.rs :: render_row
command-editor-audited-2 = 已审核

# command_editor.rs :: render_platforms
command-editor-bind = 在 { $name } 中绑定

# command_editor.rs :: render_row
command-editor-bind-another-place = 在其他位置绑定

# command_editor.rs :: render_key
command-editor-bound-ui-text-input = 在 ui::text_input 中绑定

# command_editor.rs :: render_key
command-editor-change = 更改 { $label }

# command_editor.rs :: render_key
command-editor-change-these-keys = 更改这些快捷键

# command_editor.rs :: open
command-editor-commands = 命令

# command_editor.rs :: render_key_finder
command-editor-find-pressing-key = 按键查找

# command_editor.rs :: new
command-editor-find-title-action-place-or-keys = 按标题、动作、位置或快捷键查找

# command_editor.rs :: label
command-editor-keys = 快捷键

# command_editor.rs :: label
command-editor-menu-bar = 菜单栏

# command_editor/menu_bar.rs :: render
command-editor-menu-bar-add-menu = 添加菜单

# command_editor/menu_bar.rs :: render_source
command-editor-menu-bar-divider = 分隔线

# command_editor/menu_bar.rs :: render_menu
command-editor-menu-bar-drag-commands-here = 将命令拖到此处

# command_editor/menu_bar.rs :: new
command-editor-menu-bar-find-command = 查找命令

# command_editor/menu_bar.rs :: start_renaming
command-editor-menu-bar-menu-name = 菜单名称

# command_editor/menu_bar.rs :: render_item
command-editor-menu-bar-remove = 移除 { $title }

# command_editor/menu_bar.rs :: render_menu_header
command-editor-menu-bar-remove-menu = 移除菜单

# command_editor/menu_bar.rs :: render_item
command-editor-menu-bar-remove-menu-2 = 从菜单中移除

# command_editor/menu_bar.rs :: render_menu_header
command-editor-menu-bar-rename = 重命名 { $name }

# command_editor/menu_bar.rs :: render_menu_header
command-editor-menu-bar-rename-2 = 重命名

# command_editor.rs :: render_row
command-editor-nowhere = 无

# command_editor.rs :: render_key_finder
command-editor-press-key = 请按键…

# command_editor.rs :: recording_cap
command-editor-press-keys = 请按快捷键…

# command_editor.rs :: render_key
command-editor-remove = 移除 { $label }

# command_editor.rs :: render_key
command-editor-remove-these-keys = 移除这些快捷键

# command_editor/rows.rs :: label
command-editor-rows-all = 全部

# command_editor/rows.rs :: label
command-editor-rows-any = 任意

# command_editor/rows.rs :: label
command-editor-rows-audited = 已审核

# command_editor/rows.rs :: label
command-editor-rows-conflicts = 冲突

# command_editor/rows.rs :: label
command-editor-rows-no-keys = 没有快捷键

# command_editor/rows.rs :: label
command-editor-rows-not-audited = 未审核

# command_editor.rs :: render_key
command-editor-shared = 共享

# command_editor.rs :: render_key_finder
command-editor-show-every-key = 显示所有快捷键

# command_editor.rs :: render_toolbar
command-editor-shown-tooltips-right-click-menus = 显示在工具提示和右键菜单中

# command_editor.rs :: render_picker
command-editor-where-should-work = { $title } 应在哪里工作？

# Command EnableAutoMerge
command-enable-auto-merge = 启用自动合并
    .menu = { command-enable-auto-merge }

# Command EqualizeTiles
command-equalize-tiles = 均分面板
    .menu = { command-equalize-tiles }

# Command Fetch
command-fetch = 获取
    .menu = { command-fetch }

# Command FilterFiles
command-filter-files = 筛选文件
    .menu = { command-filter-files }

# Command FindInDiff
command-find-diff = 查找
    .menu = { command-find-diff }

# Command FocusChanges
command-focus-changes = 跳转到文件
    .menu = { command-focus-changes }

# Command FocusDiff
command-focus-diff = 跳转到差异
    .menu = { command-focus-diff }

# Command FocusNavigator
command-focus-navigator = 跳转到导航栏
    .menu = { command-focus-navigator }

# Command FocusNextPane
command-focus-next-pane = 下一个窗格
    .menu = { command-focus-next-pane }

# Command FocusPaneLeft
command-focus-pane-left = 左侧窗格
    .menu = { command-focus-pane-left }

# Command FocusPaneRight
command-focus-pane-right = 右侧窗格
    .menu = { command-focus-pane-right }

# Command FocusPreviousPane
command-focus-previous-pane = 上一个窗格
    .menu = { command-focus-previous-pane }

# Command FocusTerminals
command-focus-terminals = 跳转到终端概览
    .menu = { command-focus-terminals }

# Command FocusTileDown
command-focus-tile-down = 下方面板
    .menu = { command-focus-tile-down }

# Command FocusTileLeft
command-focus-tile-left = 左侧面板
    .menu = { command-focus-tile-left }

# Command FocusTileRight
command-focus-tile-right = 右侧面板
    .menu = { command-focus-tile-right }

# Command FocusTileUp
command-focus-tile-up = 上方面板
    .menu = { command-focus-tile-up }

# Command FoldFile
command-fold-file = 折叠文件
    .menu = { command-fold-file }

# Command GoTo
command-go = 快速跳转
    .menu = { command-go }

# Command GoToTerminal
command-go-terminal = 跳转到终端
    .menu = { command-go-terminal }

# Command MarkReadyForReview
command-mark-ready-review = 可以评审
    .menu = { command-mark-ready-review }

# Command MarkResolved
command-mark-resolved = 标记为已解决
    .menu = { command-mark-resolved }

# Command MergeBranch
command-merge-branch = 合入目标分支
    .menu = { command-merge-branch }

# Command MergePullRequest
command-merge-pull-request = 合并拉取请求
    .menu = { command-merge-pull-request }

# Command MoveToNewBranch
command-move-new-branch = 移到新分支
    .menu = { command-move-new-branch }

# Command MoveSelection
command-move-selection = 移动
    .menu = { command-move-selection }

# Command NameBranch
command-name-branch = 命名分支
    .menu = { command-name-branch }

# Command NewBranch
command-new-branch = 新分支
    .menu = { command-new-branch }

# Command NewBranchBelow
command-new-branch-below = 在下方新建分支
    .menu = { command-new-branch-below }

# Command NewBranchHere
command-new-branch-here = 新建结束于此处的分支
    .menu = { command-new-branch-here }

# Command NewBranchOnTop
command-new-branch-top = 在上方新建分支
    .menu = { command-new-branch-top }

# Command NewTerminal
command-new-terminal = 新建终端
    .menu = { command-new-terminal }

# Command NewTerminalWith
command-new-terminal-with = 使用命令新建终端
    .menu = { command-new-terminal-with }

# Command NewTerminalBelow
command-new-terminal-below = 在下方新建终端
    .menu = { command-new-terminal-below }

# Command NewTerminalWithBelow
command-new-terminal-with-below = 使用命令在下方新建终端
    .menu = { command-new-terminal-with-below }

# Command NewTerminalRight
command-new-terminal-right = 在右侧新建终端
    .menu = { command-new-terminal-right }

# Command NewTerminalWithRight
command-new-terminal-with-right = 使用命令在右侧新建终端
    .menu = { command-new-terminal-with-right }

# Command NewWorktree
command-new-worktree = 新建工作树
    .menu = { command-new-worktree }

# Command NewWorktreeFromBranch
command-new-worktree-branch = 从分支新建工作树
    .menu = { command-new-worktree-branch }

# Command NewWorktreeWithName
command-new-worktree-name = 指定名称新建工作树
    .menu = { command-new-worktree-name }

# Command NextBrief
command-next-brief = 下一份简报
    .menu = { command-next-brief }

# Command NextFile
command-next-file = 下一个文件
    .menu = { command-next-file }

# Command NextHunk
command-next-hunk = 下一个差异块
    .menu = { command-next-hunk }

# Command NextNavigatorTab
command-next-navigator-tab = 下一个导航标签页
    .menu = { command-next-navigator-tab }

# Command NextProjectPage
command-next-project-page = 下一个项目标签页
    .menu = { command-next-project-page }

# Command NextTile
command-next-tile = 下一个面板
    .menu = { command-next-tile }

# Command OpenBriefsSettings
command-open-briefs-settings = 简报设置
    .menu = { command-open-briefs-settings }

# Command OpenCommandEditor
command-open-command-editor = 编辑命令
    .menu = { command-open-command-editor }

# Command OpenDiscord
command-open-discord = GitButler Discord 社区
    .menu = { command-open-discord }

# Command OpenDocs
command-open-docs = GitButler 文档
    .menu = { command-open-docs }

# Command OpenInEditor
command-open-editor = 在编辑器中打开
    .menu = { command-open-editor }

# Command OpenKeyboardShortcuts
command-open-keyboard-shortcuts = 键盘快捷键
    .menu = { command-open-keyboard-shortcuts }

# Command OpenProjectSettings
command-open-project-settings = 项目设置
    .menu = { command-open-project-settings }

# Command OpenPullRequest
command-open-pull-request = 打开拉取请求
    .menu = { command-open-pull-request }

# Command OpenReleaseNotes
command-open-release-notes = 更新内容（更新说明）
    .menu = { command-open-release-notes }

# Command OpenRepository
command-open-repository = 在浏览器中打开仓库
    .menu = { command-open-repository }

# Command OpenSettings
command-open-settings = 设置
    .menu = { command-open-settings }

# Command OpenInTerminal
command-open-terminal = 在终端中打开
    .menu = { command-open-terminal }

# Command OperationsHistory
command-operations-history = 操作历史
    .menu = { command-operations-history }

# Command PreviousBrief
command-previous-brief = 上一份简报
    .menu = { command-previous-brief }

# Command PreviousFile
command-previous-file = 上一个文件
    .menu = { command-previous-file }

# Command PreviousHunk
command-previous-hunk = 上一个差异块
    .menu = { command-previous-hunk }

# Command PreviousNavigatorTab
command-previous-navigator-tab = 上一个导航标签页
    .menu = { command-previous-navigator-tab }

# Command PreviousProjectPage
command-previous-project-page = 上一个项目标签页
    .menu = { command-previous-project-page }

# Command PreviousTab
command-previous-tab = 上一个标签页
    .menu = { command-previous-tab }

# Command PreviousTile
command-previous-tile = 上一个面板
    .menu = { command-previous-tile }

# Command Pull
command-pull = 拉取
    .menu = { command-pull }

# Command PullRemote
command-pull-remote = 从远程拉取
    .menu = { command-pull-remote }

# Command Push
command-push = 推送
    .menu = { command-push }

# Command Quit
command-quit = 退出
    .menu = { command-quit }

# Command RecycleWorktree
command-recycle-worktree = 复用工作树
    .menu = { command-recycle-worktree }

# Command Redo
command-redo = 重做
    .menu = { command-redo }

# Command RenameBranch
command-rename-branch = 重命名分支
    .menu = { command-rename-branch }

# Command RenameTerminal
command-rename-terminal = 重命名终端
    .menu = { command-rename-terminal }

# Command ReportIssue
command-report-issue = 报告问题
    .menu = { command-report-issue }

# Command ResolveConflicts
command-resolve-conflicts = 解决冲突
    .menu = { command-resolve-conflicts }

# Command RestoreOperation
command-restore-operation = 恢复到此操作之前
    .menu = { command-restore-operation }

# Command Reveal
command-reveal =
    { PLATFORM() ->
        [macos] 在访达中显示
       *[other] 在文件管理器中显示
    }
    .menu = { command-reveal }

# Command Reword
command-reword = 修改提交信息
    .menu = { command-reword }

# Command RewrapMessage
command-rewrap-message = 重新换行
    .menu = { command-rewrap-message }

# Command SendNotes
command-send-notes = 发送此简报上的评论
    .menu = { command-send-notes }

# Command ShowActiveProjects
command-show-active-projects = 显示活跃项目
    .menu = { command-show-active-projects }

# Command ShowAllProjects
command-show-all-projects = 显示所有项目
    .menu = { command-show-all-projects }

# Command ShowBranchesWithBriefs
command-show-branches-briefs = 显示有简报的分支
    .menu = { command-show-branches-briefs }

# Command ShowBranchesWithoutCommits
command-show-branches-without-commits = 显示没有独有提交的分支
    .menu = { command-show-branches-without-commits }

# Command ShowBrief
command-show-brief = 显示简报
    .menu = { command-show-brief }

# Command ShowConfigFolder
command-show-config-folder = 显示设置文件夹
    .menu = { command-show-config-folder }

# Command ShowLogsFolder
command-show-logs-folder = 显示日志文件夹
    .menu = { command-show-logs-folder }

# Command ShowOnlyLocalBranches
command-show-only-local-branches = 仅显示本地分支
    .menu = { command-show-only-local-branches }

# Command ShowRemoteBranches
command-show-remote-branches = 显示远程分支
    .menu = { command-show-remote-branches }

# Command SortProjectsByActivity
command-sort-projects-activity = 按最近活动排序项目
    .menu = { command-sort-projects-activity }

# Command SortProjectsByName
command-sort-projects-name = 按名称排序项目
    .menu = { command-sort-projects-name }

# Command SplitBelow
command-split-below = 向下拆分
    .menu = { command-split-below }

# Command SplitIntoNewCommit
command-split-into-new-commit = 拆分到新提交
    .menu = { command-split-into-new-commit }

# Command SplitRight
command-split-right = 向右拆分
    .menu = { command-split-right }

# Command SquashAll
command-squash-all = 压缩合并所有提交
    .menu = { command-squash-all }

# Command SquashIntoSelected
command-squash-into-selected = 将所选提交压缩合并到此提交
    .menu = { command-squash-into-selected }

# Command SquashIntoSelection
command-squash-into-selection = 将未提交的更改压缩合并到此提交
    .menu = { command-squash-into-selection }

# Command SquashPicked
command-squash-picked = 压缩合并所选提交
    .menu = { command-squash-picked }

# Command SquashSelection
command-squash-selection = 压缩合并
    .menu = { command-squash-selection }

# Command StackOn
command-stack = 堆叠到
    .menu = { command-stack }

# Command StartAmend
command-start-amend = 追加到提交
    .menu = { command-start-amend }

# Command StartCommit
command-start-commit = 提交
    .menu = { command-start-commit }

# Command StopWatching
command-stop-watching = 停止关注
    .menu = { command-stop-watching }

# Command SwapTiles
command-swap-tiles = 交换面板
    .menu = { command-swap-tiles }

# Command SwitchTab
command-switch-tab = 切换标签页
    .menu = { command-switch-tab }

# Command TakeRemote
command-take-remote = 替换为远程版本
    .menu = { command-take-remote }

# Command ToggleDetail
command-toggle-detail = 显示/隐藏详情
    .menu = { command-toggle-detail }

# Command ToggleFileTree
command-toggle-file-tree = 以树形或列表显示文件
    .menu = { command-toggle-file-tree }

# Command ToggleFiles
command-toggle-files = 显示/隐藏文件
    .menu = { command-toggle-files }

# Command ToggleNavigator
command-toggle-navigator = 显示/隐藏导航栏
    .menu = { command-toggle-navigator }

# Command ToggleNavigatorPlace
command-toggle-navigator-place = 移动导航栏
    .menu = { command-toggle-navigator-place }

# Command TogglePlainLines
command-toggle-plain-lines = 显示/隐藏差异背景
    .menu = { command-toggle-plain-lines }

# Command ToggleSplit
command-toggle-split = 并排差异
    .menu = { command-toggle-split }

# Command ToggleTerminalOverview
command-toggle-terminal-overview = 显示/隐藏终端概览
    .menu = { command-toggle-terminal-overview }

# Command ToggleWrap
command-toggle-wrap = 长行自动换行
    .menu = { command-toggle-wrap }

# Command UnapplyStack
command-unapply-stack = 取消应用分支栈
    .menu = { command-unapply-stack }

# Command UnarchiveWorktree
command-unarchive-worktree = 取消归档工作树
    .menu = { command-unarchive-worktree }

# Command UncheckAll
command-uncheck-all = 取消选中所有文件
    .menu = { command-uncheck-all }

# Command Uncommit
command-uncommit = 撤销提交
    .menu = { command-uncommit }

# Command UncommitChanges
command-uncommit-changes = 撤销更改的提交
    .menu = { command-uncommit-changes }

# Command Undo
command-undo = 撤销
    .menu = { command-undo }

# Command UnfoldFile
command-unfold-file = 展开文件
    .menu = { command-unfold-file }

# Command Unstack
command-unstack = 取消堆叠
    .menu = { command-unstack }

# Command UpdateFromTarget
command-update-target = 更新工作区和工作树
    .menu = { command-update-target }

# Command UpdateWorkspace
command-update-workspace = 更新工作区
    .menu = { command-update-workspace }

# Command UpdateWorktrees
command-update-worktrees = 更新工作树
    .menu = { command-update-worktrees }

# Command Watch
command-watch = 关注
    .menu = { command-watch }

# Command WriteNote
command-write-note = 为此简报撰写评论
    .menu = { command-write-note }

# Command ZoomIn
command-zoom = 放大
    .menu = { command-zoom }

# Command ZoomOut
command-zoom-out = 缩小
    .menu = { command-zoom-out }

# Command ZoomTile
command-zoom-tile = 放大面板
    .menu = { command-zoom-tile }

# commit_blocked.rs :: offers
commit-blocked-commit = 提交到 { $branch }

# commit_blocked.rs :: offers
commit-blocked-commit-top = 在 { $branch } 上提交

# commit_blocked.rs :: offers
commit-blocked-leave-them-out = 排除它们

# commit_blocked.rs :: hunk_lines
commit-blocked-more = 另外 { $lines } 项

# commit_blocked.rs :: offers
commit-blocked-new-branch-above = 在 { $branch } 上方新建分支

# commit_blocked.rs :: offers
commit-blocked-stack-commit = 堆叠并提交到 { $top }

# commit_blocked.rs :: offers
commit-blocked-stack-commit-new-branch = 堆叠并提交到新分支

# commit_blocked.rs :: render
commit-blocked-t-commit-all = 无法将所有内容提交到 { $target }

# detail/brief/margin.rs :: talk_composer
common-add = 添加

# detail/resolve.rs :: apply_button
common-apply = 应用

# app.rs :: confirm_then
common-cancel = 取消

# edits.rs :: close_terminal
common-close = 关闭

# settings/cli.rs :: agent_setup
common-copy = 复制

# edits.rs :: remove_branch
common-delete = 删除

# ui/conflict.rs :: bar
common-edit = 编辑

# detail/pull_request.rs :: checks_section
common-none = 无

# help.rs :: show_about
common-ok = 确定

# settings/launchers.rs :: launcher_row
common-remove = 移除

# settings/mod.rs :: field_with_save
common-save = 保存

# ui/format.rs :: local_date
date-short-format = %-m月%-d日

# ui/format.rs :: local_time
date-time-format = %Y年%-m月%-d日 %H:%M

# chrono strftime 格式，保留所有日期字段。
date-full-format = %Y年%-m月%-d日
date-today = 今天
date-yesterday = 昨天

# ui/format.rs :: local_weekday
date-weekday-format = { $weekday }，{ $date }

# detail/mod.rs :: welcome
detail-add-repository = 添加仓库…

# detail/blame.rs :: show_last_commit
detail-blame-find-hunk-s-last-commit-error = 找不到差异块的最后一个提交

# detail/blame.rs :: last_commit_item
detail-blame-show-hunk-s-last-commit = 查看差异块的最后一个提交

# detail/blame.rs :: last_commit_item
detail-blame-show-line-s-last-commit = 查看这一行的最后一个提交

# detail/branches.rs :: label
detail-branches-any-time = 不限时间

# detail/branches.rs :: edit_branch_description
detail-branches-branch = 此分支的用途

# detail/branches.rs :: branch_filter_items
detail-branches-brief = 有简报

# detail/branches.rs :: branch_menu_items
detail-branches-delete-branch = 删除分支

# detail/branches.rs :: delete_other_branch
detail-branches-delete-branch-2 = 删除分支 { $name }？

# detail/branches.rs :: delete_other_branch
detail-branches-delete-other-branch-commits-go-too-unless = 除非远程保留了这些提交，否则其提交也会被删除。工作区外的分支无法通过撤销恢复。

# detail/branches.rs :: edit_branch_description
detail-branches-describe = 描述 { $name }

# detail/branches.rs :: edit_branch_description
detail-branches-edit-branch-description-git-keeps-branch-s = Git 会将其保存为分支描述，与 git branch --edit-description 相同。留空可删除，⌘↩ 保存。

# detail/branches.rs :: label
detail-branches-last-30-days = 最近 30 天

# detail/branches.rs :: label
detail-branches-last-7-days = 最近 7 天

# detail/branches.rs :: render_branches_side
detail-branches-list-branches-error = 无法列出分支

# detail/branches/overview.rs :: lane_row
detail-branches-overview-d = { $days } 天

# detail/branches/overview.rs :: lane_row
detail-branches-overview-no-commits-days = { $days } 天没有提交

# detail/branches.rs :: render_branches_side
detail-branches-read-brief = 阅读简报

# detail/branches.rs :: render_branches_side
detail-branches-stack = 包含 { $count } 个分支的分支栈

# detail/branches.rs :: other_branch_parts
detail-branches-stack-2 = 包含 { $count } 个分支的分支栈

# detail/branches.rs :: branch_filter_chips
detail-branches-stop-filtering = 停止按此条件筛选

# detail/branches/sync.rs :: render_branch_comparison
detail-branches-sync-branches = 分支

# detail/branches/sync.rs :: render_branch_comparison
detail-branches-sync-commits-differ-upstream = 与上游不同的提交

# detail/branches/sync.rs :: branch_sync_menu
detail-branches-sync-compare = 与 { $into } 比较

# detail/branches/sync.rs :: choose_branch_upstream
detail-branches-sync-list-remotes-error = 无法列出远程仓库

# detail/branches/sync.rs :: status_mark
detail-branches-sync-no-upstream = 没有上游分支

# detail/branches/sync.rs :: status_mark
detail-branches-sync-synced = 已同步

# detail/branches/sync.rs :: status_mark
detail-branches-sync-unavailable = 不可用

# detail/branches/sync.rs :: status_mark
detail-branches-sync-upstream-missing = 上游分支不存在

# detail/branches.rs :: label
detail-branches-today = 今天

# detail/branches.rs :: apply_branch
detail-branches-wasn-t-applied = 未应用 { $name }

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-answer = 回答

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-answer-web = 在网页中回答

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-back-where-were = 返回之前的位置

# detail/brief/actions.rs :: tell_agent_button
detail-brief-actions-copy-tell = 复制要告诉它的内容

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-go-next-comment = 跳转到下一条评论

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-next-brief = 下一份简报

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-not-sent = { $notes } 条未发送

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-not-sent-2 = { $comments } 条未发送

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-read = 阅读

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-send = 发送

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-send-2 = 发送到 { $state }

# detail/brief/actions.rs :: brief_tab_actions
detail-brief-actions-send-all = 全部发送

# detail/brief/actions.rs :: tell_agent_button
detail-brief-actions-tell = 告诉 { $title }

# detail/brief/actions.rs :: tell_agent_button
detail-brief-actions-types-terminal = 输入到该终端中

# detail/brief/code.rs :: brief_file_row
detail-brief-code-not-branch-now = 目前不在此分支上

# detail/brief/code.rs :: not_shown
detail-brief-code-not-shown = 未显示：{ $join }

# detail/brief/code.rs :: brief_file_row
detail-brief-code-show-changes = 在“更改”中显示 { $path }

# detail/brief.rs :: brief_row
detail-brief-code-under-changed-after-was-written = 此处的代码在描述写成后又发生了更改

# detail/brief/head.rs :: brief_since_row
detail-brief-head-asked = 已请求

# detail/brief/head.rs :: brief_since_row
detail-brief-head-bring-back = 恢复

# detail/brief/head.rs :: brief_head
detail-brief-head-changes-beside = 在旁边显示更改

# detail/brief/head.rs :: brief_unnamed_facts
detail-brief-head-database-change-brief-doesn-t-mention = 简报未提及的数据库更改：

# detail/brief/head.rs :: brief_tests_fact
detail-brief-head-deletes-tests = 删除测试：{ $join }

# detail/brief/head.rs :: brief_failed_checks_fact
detail-brief-head-failed-pr = PR #{ $number } 的 { $names } 检查失败

# detail/brief/head.rs :: brief_since_row
detail-brief-head-keep-comment-asking-back = 保留一条要求恢复此内容的评论

# detail/brief/head.rs :: brief_facts
detail-brief-head-matches-branch-s-latest-commit = 与分支的最新提交一致

# detail/brief/head.rs :: brief_unshown_fact
detail-brief-head-more-changes = 以及“更改”中的其他 { $more } 项

# detail/brief/head.rs :: brief_unnamed_facts
detail-brief-head-not-mentioned-brief = 简报中未提及：

# detail/brief/head.rs :: brief_head
detail-brief-head-open-web = 在网页中打开

# detail/brief/head.rs :: brief_unnamed_facts
detail-brief-head-show-changes = 在“更改”中显示 { $path }

# detail/brief/head.rs :: standing_fact
detail-brief-head-show-commit = 显示提交 { $title }

# detail/brief/head.rs :: brief_turned_off_fact
detail-brief-head-show-line = 显示 { $name } 中的这一行

# detail/brief/head.rs :: brief_since_row
detail-brief-head-show-only-changed = 仅显示更改的内容

# detail/brief/head.rs :: brief_failed_checks_fact
detail-brief-head-show-pull-request-s-checks = 显示拉取请求的检查结果

# detail/brief/head.rs :: brief_versions
detail-brief-head-there-s-no-other-way = 该方向没有其他内容

# detail/brief/head.rs :: brief_turned_off_fact
detail-brief-head-turns-off-test = 关闭了 { $name } 中的一个测试

# detail/brief/head.rs :: brief_turned_off_fact
detail-brief-head-turns-off-test-more = 关闭了 { $name } 中的一个测试，以及其他 { $more } 个测试

# detail/brief/head.rs :: brief_head
detail-brief-head-with = 与 { $agent }

# detail/brief/margin.rs :: talk_composer
detail-brief-margin-add-shortcut = 添加快捷键

# detail/brief/margin.rs :: shortcut_button
detail-brief-margin-adds-right-click-change = 添加此项，右键点击可更改

# detail/brief/margin.rs :: talk_composer
detail-brief-margin-edit-shortcut = 编辑快捷键

# detail/brief/margin.rs :: talk_composer
detail-brief-margin-keep-shortcut = 保存为快捷短语

# detail/brief/margin.rs :: talk_composer
detail-brief-margin-new-shortcut = 新增快捷键

# detail/brief/margin.rs :: shortcut_menu
detail-brief-margin-remove-shortcut = 移除快捷键

# detail/brief/notes.rs :: brief_note
detail-brief-notes-discard = 丢弃

# detail/brief/notes.rs :: brief_end
detail-brief-notes-next = 下一步：{ $title }

# detail/brief/notes.rs :: brief_note
detail-brief-notes-not-sent = 未发送

# detail/brief/notes.rs :: brief_thread
detail-brief-notes-reply = 回复

# detail/brief/notes.rs :: brief_thread
detail-brief-notes-resolved = 已解决

# detail/brief/notes.rs :: write_brief_note
detail-brief-notes-write-comment = 撰写评论…

# detail/brief/notes.rs :: write_brief_note
detail-brief-notes-write-reply = 撰写回复…

# detail/brief.rs :: brief_row
detail-brief-parts = { $count } 个片段

# detail/brief.rs :: brief_row
detail-brief-show-hasn-t-changed = 显示未更改的内容

# detail/brief.rs :: brief_row
detail-brief-unchanged = { $parts } 项未更改

# detail/brief.rs :: brief_row
detail-brief-which-shows-web = { $what }，可在网页中查看

# detail/mod.rs :: welcome
detail-clone-repository = 克隆仓库…

# detail/composer.rs :: render_composer
detail-composer-amend = 追加到提交

# detail/composer.rs :: render_composer
detail-composer-commit = 提交到

# detail/composer.rs :: render_composer
detail-composer-commit-2 = 提交

# detail/composer.rs :: commit_now
detail-composer-committed-but-post-commit-hook-failed = 已提交，但提交后钩子执行失败

# detail/composer.rs :: pick_commit_target
detail-composer-created = 已创建 { $branch }

# detail/composer.rs :: render_target_picker
detail-composer-pick-branch-commit = 选择要提交到的分支

# detail/composer.rs :: render_composer
detail-composer-pick-commit-amend = 选择要追加到的提交

# detail/composer.rs :: render_composer
detail-composer-write-message-ai-guided-s-box = 根据输入框中的内容，使用 AI 撰写信息

# detail/composer.rs :: render_composer
detail-composer-writing-click-keep-s-written-so = 正在撰写…点击可保留已写入的内容

# detail/conversation.rs :: conversation
detail-conversation-activity = 活动

# detail/conversation.rs :: header
detail-conversation-agent = 智能体

# detail/conversation.rs :: opens
detail-conversation-edited = 已编辑

# detail/conversation.rs :: thread
detail-conversation-fold-thread = 折叠 { $path } 上的讨论

# detail/conversation.rs :: opens
detail-conversation-open-github = 在 GitHub 中打开

# detail/conversation.rs :: thread
detail-conversation-open-thread = 打开 { $path } 上的讨论

# detail/diff_view.rs :: render_diff_row
detail-diff-view-commits = { $count } 个提交

# detail/diff_view.rs :: line_menu
detail-diff-view-find = 查找 { $query }

# detail/diff_view.rs :: render_diff
detail-diff-view-load-diff-error = 无法加载差异

# detail/diff_view.rs :: render_diff
detail-diff-view-loading-diff = 正在加载差异…

# detail/diff_view.rs :: render_diff
detail-diff-view-no-files-match = 没有文件匹配“{ $trim }”

# detail/diff_view.rs :: render_diff
detail-diff-view-no-uncommitted-changes = 没有未提交的更改

# detail/diff_view.rs :: load_whole
detail-diff-view-read-file-error = 无法读取文件

# detail/diff_view.rs :: drawing_button
detail-diff-view-show-drawing = 显示绘图

# detail/diff_view.rs :: drawing_button
detail-diff-view-show-text = 显示为文本

# detail/diff_view.rs :: render_diff_row
detail-diff-view-show-whole-file = 显示完整文件

# detail/mod.rs :: welcome
detail-discord = Discord

# detail/mod.rs :: welcome
detail-docs = 文档

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-changed-disk = 磁盘上的内容已更改

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-discard-my-edits = 丢弃我的编辑

# detail/edit_lines.rs :: ask_to_save
detail-edit-lines-don-t-save = 不保存

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-editing = 正在编辑

# detail/edit_lines.rs :: ask_to_save
detail-edit-lines-edits-are-lost-if-don-t = 不保存将丢失你的编辑。

# detail/edit_lines.rs :: end_edit
detail-edit-lines-edits-weren-t-saved-changed-disk = 未保存对 { $shown_path } 的编辑：磁盘上的内容已更改

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-keep-file-was-written = 保留文件原先写入的内容

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-keep-mine = 保留我的版本

# detail/edit_lines.rs :: ask_to_save
detail-edit-lines-save-changes = 保存对 { $name } 的更改？

# detail/edit_lines.rs :: edit_controls
detail-edit-lines-save-over-was-written = 覆盖已写入的内容并保存

# detail/file_list.rs :: change_items
detail-file-list-amend = 追加到提交

# detail/file_list.rs :: render_file_row
detail-file-list-being-edited = 正在编辑

# detail/file_list.rs :: list_header
detail-file-list-close-filter = 关闭筛选

# detail/file_list.rs :: render_message_entry
detail-file-list-commit-message = 提交信息

# detail/file_list.rs :: render_message_entry
detail-file-list-commit-messages = 提交信息

# detail/file_list.rs :: path_items
detail-file-list-copy-absolute-path = 复制绝对路径

# detail/file_list.rs :: path_items
detail-file-list-copy-relative-path = 复制相对路径

# detail/file_list.rs :: edit_items
detail-file-list-edit-file = 编辑文件

# detail/file_list.rs :: files_heading
detail-file-list-files = 文件

# detail/file_list.rs :: find_in_all_files
detail-file-list-find-all-files = 在所有文件中查找“{ $query }”

# detail/file_list.rs :: render_uncommitted_files
detail-file-list-no-uncommitted-changes = 没有未提交的更改

# detail/file_list.rs :: list_header
detail-file-list-of = { $kept } / { $total }

# detail/file_list.rs :: view_items
detail-file-list-open-file = 打开文件…

# detail/file_list.rs :: render_file_row
detail-file-list-opened-edit-nothing-changed-yet = 已打开进行编辑，尚未更改

# detail/file_list.rs :: edit_items
detail-file-list-stop-editing = 结束编辑

# detail/file_list.rs :: list_header
detail-file-list-view-options = 视图选项

# detail/mod.rs :: new
detail-filter-branches = 筛选分支

# detail/mod.rs :: new
detail-filter-commits = 筛选提交

# detail/mod.rs :: new
detail-filter-files = 筛选文件

# detail/mod.rs :: new
detail-filter-operations = 筛选操作

# detail/mod.rs :: new
detail-find = 查找

# detail/graph/mod.rs :: render
detail-graph-back-100 = 恢复到 100%

# detail/graph/mod.rs :: render
detail-graph-follow = 跟随

# detail/graph/mod.rs :: render
detail-graph-follow-workspace = 跟随工作区

# detail/graph/mod.rs :: render
detail-graph-lanes-they-start = 你的泳道及其起点

# detail/graph/mod.rs :: render
detail-graph-no-commits-yet = 尚无提交

# detail/graph/mod.rs :: render
detail-graph-open-new-window = 在新窗口中打开

# detail/graph/page.rs :: graph_menu_items
detail-graph-page-show-navigator = 在导航栏中显示

# detail/graph/page.rs :: graph_menu_items
detail-graph-page-uncommit-commits = 撤销 { $n } 个提交

# detail/graph/mod.rs :: render
detail-graph-read-graph-error = 无法读取提交图

# detail/graph/mod.rs :: render
detail-graph-reading-graph = 正在读取提交图

# detail/graph/mod.rs :: render
detail-graph-target-s-newest-commit = 目标分支的最新提交

# detail/graph/window.rs :: title
detail-graph-window-graph = { $name } – 提交图

# detail/graph/window.rs :: render
detail-graph-window-graph-2 = 提交图

# detail/graph/mod.rs :: render
detail-graph-workspace = 工作区

# detail/graph/mod.rs :: render
detail-graph-zoom = 放大

# detail/graph/mod.rs :: render
detail-graph-zoom-out = 缩小

# detail/history.rs :: label
detail-history-branches = 分支

# detail/history.rs :: label
detail-history-changes-thrown-away = 更改已丢弃

# detail/history.rs :: label
detail-history-commits-amended-squashed-or-moved = 追加、压缩合并或移动的提交数

# detail/history.rs :: label
detail-history-commits-made = 创建的提交数

# detail/history.rs :: render_history_side
detail-history-done-ai-agent = 由 AI 智能体完成：{ $agent }

# detail/history.rs :: render_history_side
detail-history-loading = 正在加载…

# detail/history.rs :: label
detail-history-other = 其他

# detail/history.rs :: load_history
detail-history-read-history-error = 无法读取历史

# detail/history.rs :: restore_operation
detail-history-restore = 恢复

# detail/history.rs :: restore_operation
detail-history-restore-before = 恢复到“{ $title }”之前？

# detail/history.rs :: restore_operation
detail-history-restore-operation-branches-commits-uncommitted-changes = 分支、提交和未提交的更改将恢复原状。可使用 ⌘Z 撤销。

# detail/history.rs :: take_snapshot
detail-history-s-optional = 用途（可选）

# detail/history.rs :: change_line
detail-history-show-commit = 显示此提交

# detail/history.rs :: render_history_side
detail-history-show-older = 显示更早的内容

# detail/history.rs :: label
detail-history-snapshots = 快照

# detail/history.rs :: render_history_side
detail-history-take-snapshot-project-restore-later = 为项目当前状态创建快照，以便稍后恢复

# detail/history.rs :: label
detail-history-undos-restores = 撤销与恢复次数

# detail/history.rs :: label
detail-history-updates-target = 来自目标分支的更新

# detail/machine.rs :: uncommitted_list
detail-machine-nothing-uncommitted = 没有未提交的更改

# detail/machine.rs :: machine_placeholder
detail-machine-open-but-dev = 在 but.dev 中打开

# detail/machine.rs :: mesh_meta
detail-machine-other-machines = 其他机器上有 { $worktrees }，{ $branchs }

# detail/mod.rs :: render
detail-nothing-selected = 未选择内容

# detail/panes.rs :: clear_button
detail-panes-clear = 清除

# detail/panes.rs :: render_uncommitted_side
detail-panes-commit = 提交…

# detail/panes.rs :: editing_actions
detail-panes-commit-files-they-are-place-rebase = 在原位置按文件当前内容提交，并将上方内容变基到它之上

# detail/panes.rs :: commit_meta
detail-panes-conflicted = 存在冲突

# detail/panes.rs :: conflicted_note
detail-panes-conflicted-2 = { $n } 项冲突

# detail/panes.rs :: reference_chip
detail-panes-copy-change-id = 复制更改 ID

# detail/panes.rs :: reference_chip
detail-panes-copy-commit-id = 复制提交 ID

# detail/panes.rs :: render_branch_header
detail-panes-create-pull-request = 创建拉取请求

# detail/panes.rs :: editing_actions
detail-panes-finish = 完成

# detail/panes.rs :: editing_actions
detail-panes-finish-still-conflicted = 仍有 { $files } 存在冲突，确定完成？

# detail/panes.rs :: message_title
detail-panes-hide-full-message = 收起完整信息

# detail/panes.rs :: render_header
detail-panes-inactive-worktrees = 不活跃的工作树

# detail/panes.rs :: people_card
detail-panes-more = 另外 { $rest } 项

# detail/panes.rs :: render_header
detail-panes-network-worktrees = 网络工作树

# detail/panes.rs :: render_stack_header
detail-panes-no-commits = 没有提交

# detail/panes.rs :: remote_meta
detail-panes-only = 仅在 { $remote }

# detail/panes.rs :: remote_meta
detail-panes-only-remote = 仅在远程

# detail/panes.rs :: listed_commit
detail-panes-open-commit = 打开提交

# detail/panes.rs :: render_picks_header
detail-panes-others-between-them-so-each-one = 它们之间还有其他内容，因此各自的更改会依次显示

# detail/panes.rs :: render_branch_header
detail-panes-push-open-pull-request = 推送并创建拉取请求

# detail/panes.rs :: editing_actions
detail-panes-put-commit-back-was = 将提交恢复原状

# detail/panes.rs :: render_uncommitted_side
detail-panes-read-project-error = 无法读取项目

# detail/panes.rs :: reword_editor
detail-panes-save-esc-cancel = ⌘↩ 保存，esc 取消

# detail/panes.rs :: reword_editor
detail-panes-saving = 正在保存…

# detail/panes.rs :: people_card
detail-panes-show-fewer = 收起部分内容

# detail/panes.rs :: message_title
detail-panes-show-full-message = 显示完整信息

# detail/panes.rs :: commit_meta
detail-panes-signed = 已签名

# detail/panes.rs :: commit_meta
detail-panes-signed-not-verified = 由 { $signer } 签名，尚未验证

# detail/panes.rs :: render_stack_header
detail-panes-stack = 包含 { $count } 个分支的分支栈

# detail/panes.rs :: editing_actions
detail-panes-they-go-into-commit-they-are = 它们会以当前状态加入提交，包括任何冲突标记。

# detail/mod.rs :: welcome
detail-pick-folder-git-repository = 选择包含 Git 仓库的文件夹

# detail/pull_request.rs :: auto_merge_switch
detail-pull-request-auto-merge = 自动合并

# detail/pull_request.rs :: reviewers_section
detail-pull-request-awaiting-review = 等待评审

# detail/pull_request.rs :: checks_section
detail-pull-request-checks = 检查

# detail/pull_request.rs :: branches_section
detail-pull-request-copy-branch-name = 复制分支名称

# detail/pull_request.rs :: merge_section
detail-pull-request-merge-now-forge = 立即在托管平台上合并

# detail/pull_request.rs :: description
detail-pull-request-no-description = 没有描述

# detail/pull_request.rs :: freshness
detail-pull-request-old = { $at } 条旧内容

# detail/pull_request.rs :: status_section
detail-pull-request-open = 在 { $forge } 中打开

# detail/pull_request.rs :: check_row
detail-pull-request-open-log = 打开 { $name } 的日志

# detail/pull_request.rs :: freshness
detail-pull-request-out-date = 已过期

# detail/pull_request.rs :: head
detail-pull-request-pull-request = 拉取请求 #{ $number }

# detail/pull_request.rs :: merge_section
detail-pull-request-ready-review = 可以评审

# detail/pull_request.rs :: merge_section
detail-pull-request-take-out-draft-forge = 在托管平台上将其转为可评审状态

# detail/pull_request.rs :: byline
detail-pull-request-updated = 更新于 { $at }

# detail/resolve.rs :: conflict_banner
detail-resolve-left-conflicted = { $files } 项仍有冲突

# detail/resolve.rs :: edit
detail-resolve-lines-keep = 要保留的行

# detail/resolve.rs :: conflict_banner
detail-resolve-older-commit-conflicts-too = 更早的提交也存在冲突

# detail/resolve.rs :: apply_resolutions
detail-resolve-on-to = { $resolved }，继续处理 { $title }

# detail/resolve.rs :: conflict_banner
detail-resolve-ready-apply = { $conflicts } 项可应用

# detail/resolve.rs :: conflict_banner
detail-resolve-resolve = { $conflicts } 项待解决

# detail/resolve.rs :: apply_resolutions
detail-resolve-resolved = 已解决 { $resolved }

# detail/resolve.rs :: apply_resolutions
detail-resolve-resolved-left = 已解决 { $conflicts }，剩余 { $left }

# detail/resolve.rs :: apply_resolutions
detail-resolve-resolved-no-conflicts-left = 已解决，没有剩余冲突

# detail/resolve.rs :: apply_resolutions
detail-resolve-resolved-ready-commit = 已解决 { $resolved }，{ $files } 可以提交

# detail/upstream.rs :: render_project_header
detail-upstream-applied = 已应用 { $applied }

# detail/upstream.rs :: project_tabs
detail-upstream-branches = 分支

# detail/upstream.rs :: project_tabs
detail-upstream-branches-matching-current-filters = 符合当前筛选条件的分支

# detail/upstream/changed_path.rs :: path_history_item
detail-upstream-changed-path-show-file-history = 查看文件历史

# detail/upstream/changed_path.rs :: path_history_item
detail-upstream-changed-path-show-folder-history = 查看文件夹历史

# detail/upstream.rs :: target_chooser
detail-upstream-choose-another = 选择其他选项…

# detail/upstream.rs :: target_chooser
detail-upstream-choose-branch = 选择分支…

# detail/upstream.rs :: pick_target_state
detail-upstream-choose-target-branch = 选择目标分支…

# detail/upstream.rs :: render_upstream_side
detail-upstream-connect = 连接…

# detail/upstream.rs :: render_upstream_side
detail-upstream-connect-see-pull-requests-ci-here = 连接 { $name }，在此查看拉取请求和 CI。

# detail/upstream.rs :: render_project_header
detail-upstream-doesn-t-track = { $name } 未跟踪 { $remote }

# detail/upstream.rs :: render_project_header
detail-upstream-fetching = 正在获取…

# detail/upstream.rs :: render_upstream_side
detail-upstream-gone = { $name } 已不存在

# detail/upstream.rs :: project_tabs
detail-upstream-graph = 提交图

# detail/upstream.rs :: target_commit_items
detail-upstream-hide-commits = 隐藏提交

# detail/upstream.rs :: render_target_message
detail-upstream-hide-message = 收起提交信息

# detail/upstream.rs :: render_upstream_side
detail-upstream-isn-t-remote-yet = { $name } 尚未推送到远程

# detail/upstream.rs :: render_upstream_side
detail-upstream-loading = 正在加载…

# detail/upstream.rs :: render_upstream_side
detail-upstream-no-commits-yet = 尚无提交

# detail/upstream.rs :: render_upstream_side
detail-upstream-no-remote = 没有远程仓库

# detail/upstream.rs :: render_upstream_side
detail-upstream-no-target-branch = 没有目标分支

# detail/upstream.rs :: project_tabs
detail-upstream-operations-history = 操作历史

# detail/upstream.rs :: project_tabs
detail-upstream-overview = 概览

# detail/upstream.rs :: render_upstream_side
detail-upstream-read-checkout-s-history-error = 无法读取检出目录的历史

# detail/upstream.rs :: load_upstream
detail-upstream-read-more-history-error = 无法读取更多历史

# detail/upstream.rs :: render_project_header
detail-upstream-render-project-header-s-pushed-doesn-t = 此处不显示推送到 { $remote } 的内容，也无法推送分支。请使用 `git branch -u { $remote } { $name }` 设置跟踪关系

# detail/upstream.rs :: render_upstream_side
detail-upstream-search-changed-paths = 搜索更改的路径

# detail/upstream.rs :: target_commit_items
detail-upstream-show-commits = 显示提交

# detail/upstream.rs :: render_target_message
detail-upstream-show-message = 展开提交信息

# detail/upstream.rs :: render_upstream_side
detail-upstream-show-older = 显示更早的内容

# detail/upstream.rs :: render_upstream_side
detail-upstream-uncommit-keep-changes = 撤销提交，保留更改

# detail/mod.rs :: welcome
detail-welcome-add-repository-coding-agents = 添加编程智能体使用的仓库。它们产生的更改会实时显示在这里，供你查看、提交和组织为分支栈。

# detail/mod.rs :: welcome
detail-welcome-gitbutler = 欢迎使用 GitButler

# detail/worktree.rs :: now_status
detail-worktree-all-caught-up = 已全部处理

# detail/worktree.rs :: now_commits
detail-worktree-mark-all-read = 全部标记为已读

# detail/worktree.rs :: now_status
detail-worktree-uncommitted = { $count } 项未提交

# detail/worktree.rs :: now_status
detail-worktree-unread = { $unread } 条未读

# edits.rs :: discard_unrecorded
edits-changes-discarded = 更改已丢弃

# edits.rs :: discard
edits-changes-weren-t-discarded = 未能丢弃更改

# edits.rs :: close_terminal
edits-close-terminal = 关闭终端 { $title }？

# edits.rs :: merge_branch
edits-commits-go-straight-onto = { $whose }提交会直接合入 { $target }。{ $left_behind }{ $update }

# edits.rs :: new_branch_at
edits-created = 已创建 { $branch }

# edits.rs :: new_branch_at
edits-created-checked-out = 已创建 { $branch }，并检出到 { $worktree }

# edits.rs :: remove_branch
edits-delete-branch = 删除分支 { $name }？

# edits.rs :: discard_commits
edits-discard = 丢弃

# edits.rs :: discard_commits
edits-discard-commit = 丢弃提交 { $newest }？

# edits.rs :: discard_from_commit
edits-discard-commit-commit-ones-after-lose = 此提交及其后的提交会失去这项更改，且无法撤销。

# edits.rs :: discard_commits
edits-discard-commits = 丢弃 { $n } 个提交？

# edits.rs :: discard_unrecorded
edits-discard-failed = 丢弃失败

# edits.rs :: push_branch
edits-force-push = 强制推送 { $ref_name }？

# edits.rs :: push_branch
edits-force-push-2 = 强制推送

# edits.rs :: merge_branch
edits-merge = 合并

# edits.rs :: merge_branch
edits-merge-branch-commits-go-straight-onto = { $whose }提交会直接合入 { $target } 并推送，跳过评审。推送无法撤销。{ $left_behind }{ $update }

# edits.rs :: merge_branch
edits-merge-into = 将{ $what }合入 { $target }？

# edits.rs :: pull_remote
edits-pull-remote-drops-commits-remote-doesn = 此操作会丢弃远程没有的提交。可使用 ⌘Z 撤销。

# edits.rs :: remove_branch
edits-remove-branch-delete-commits-unapply-then = 要删除 { $name } 及其提交，请先取消应用，再从“分支”页面删除

# edits.rs :: pull_remote
edits-replace = 替换

# edits.rs :: pull_remote
edits-replace-remote-s-version = 将 { $name } 替换为远程版本？

# edits.rs :: close_terminal
edits-shell-stops-whatever-running = 其 Shell 和其中正在运行的程序都会停止。

# edits.rs :: submit_branch_name
edits-submit-branch-name-renamed-remote-keeps-old = 已重命名为 { $to }。远程保留旧名称，再次推送会创建新的远程分支，与旧分支的拉取请求无关联

# edits.rs :: remove_branch
edits-worktree-rests-which-keeps = { $worktree } 工作树基于 { $name }，后者保留了它

# edits.rs :: remove_branch
edits-worktree-s-last-branch-which-keeps = { $name } 是其工作树的最后一个分支，工作树会保留它

# Menu bar heading
menu-edit = 编辑

# Menu bar heading
menu-file = 文件

# Menu bar heading
menu-gitbutler = GitButler

# Menu bar heading
menu-go = 前往

# Menu bar heading
menu-help = 帮助

# Menu bar heading
menu-remote = 远程

# Menu bar heading
menu-repository = 仓库

# keymap/menus.rs :: title
menu-services = 服务

# Menu bar heading
menu-view = 视图

# Menu bar heading
menu-window = 窗口

# navigator/account.rs :: update_button
navigator-account-downloading-100 = 下载中 100%

# navigator/account.rs :: settings_button
navigator-account-settings = 设置

# navigator/account.rs :: settings_menu
navigator-account-sign = 登录…

# navigator/account.rs :: settings_menu
navigator-account-sign-out = 退出 { $who } 的登录

# navigator/account.rs :: update_button
navigator-account-update = 更新到 { $version }

# navigator.rs :: drawer_bar
navigator-add-project = 添加项目

# navigator.rs :: running_mark
navigator-app-re-using-was-built-checkout = 你正在使用的应用由此检出目录构建

# navigator.rs :: branch_row
navigator-branch = 分支 { $name }

# navigator.rs :: filter_field
navigator-clear-filter = 清除筛选

# navigator/drop.rs :: new_branch_zone
navigator-drop-new-independent-branch = 新建独立分支

# navigator.rs :: editing_row
navigator-editing-commit = 正在编辑提交

# navigator.rs :: changes_row
navigator-files = { $count } 个文件

# navigator.rs :: new
navigator-filter-projects = 筛选项目…

# navigator/groups.rs :: group_menu
navigator-groups-add-repository = 添加仓库…

# navigator/groups.rs :: group_row
navigator-groups-changed = 已更改 { $changed }

# navigator/groups.rs :: group_row
navigator-groups-changes = { $name }，{ $total } 个{ $repositories }，其中 { $changed } 个有更改

# navigator/groups.rs :: edit_project_group
navigator-groups-group-name = 分组名称

# navigator/groups.rs :: group_row
navigator-groups-group-options = 分组选项

# navigator/groups.rs :: group_menu
navigator-groups-remove-group = 移除分组

# navigator/groups.rs :: group_menu
navigator-groups-rename-group = 重命名分组…

# navigator/groups.rs :: group_row
navigator-groups-uncommitted-files-or-unpushed-commits = { $changed } 个{ $repositories }有未提交的文件或未推送的提交

# navigator.rs :: inactive_heading
navigator-inactive-worktrees = 不活跃的工作树

# navigator/menu.rs :: delete_worktree
navigator-menu-delete-worktree = 删除工作树 { $name }？

# navigator/menu.rs :: menu_items
navigator-menu-hide-commits = 隐藏提交

# navigator/menu.rs :: menu_items
navigator-menu-mark-all-read = 全部标记为已读

# navigator/menu.rs :: read_marks
navigator-menu-mark-read = 标记为已读

# navigator/menu.rs :: read_marks
navigator-menu-mark-unread = 标记为未读

# navigator/menu.rs :: row_actions
navigator-menu-move-group = 移到分组…

# navigator/menu.rs :: open_file_item
navigator-menu-open-file = 打开文件…

# navigator/menu.rs :: open_repository
navigator-menu-open-repository-error = 无法打开仓库

# navigator/menu.rs :: menu_items
navigator-menu-show-commits = 显示提交

# navigator/menu.rs :: row_menu_items
navigator-menu-show-graph = 在提交图中显示

# navigator/mesh.rs :: mesh_menu
navigator-mesh-apply-here = 应用到此处

# navigator/mesh.rs :: mesh_row
navigator-mesh-branch = 分支 { $name }

# navigator/mesh.rs :: mesh_heading
navigator-mesh-network-worktrees = 网络工作树

# navigator/mesh.rs :: mesh_menu
navigator-mesh-open-but-dev = 在 but.dev 中打开

# navigator/mesh.rs :: mesh_heading
navigator-mesh-unfinished-work-other-machines-mesh = Mesh 中其他机器上尚未完成的工作

# navigator.rs :: row_in_card
navigator-more = 另外 { $hidden } 项

# navigator/moving.rs :: new_commit_row
navigator-moving-new-commit = 新提交

# navigator.rs :: upstream_label
navigator-on = 在 { $remote }

# navigator/order.rs :: view_menu
navigator-order-collapse-all-groups = 折叠所有分组

# navigator/order.rs :: view_menu
navigator-order-expand-all-groups = 展开所有分组

# navigator/order.rs :: view_menu
navigator-order-new-repository-group = 新建仓库分组…

# navigator/order.rs :: view_button
navigator-order-organize-repositories = 整理仓库

# navigator.rs :: render
navigator-projects = 项目

# navigator.rs :: branch_row
navigator-read-brief = 阅读简报

# navigator.rs :: upstream_label
navigator-remote = 在远程

# navigator/rename.rs :: reword
navigator-rename-commit-title = 提交标题

# navigator/rename.rs :: terminal_name_input
navigator-rename-terminal-name = 终端名称

# navigator.rs :: row_in_card
navigator-show-fewer = 收起部分内容

# navigator.rs :: drawer_bar
navigator-sort-show = 排序与显示

# navigator.rs :: stack_row
navigator-stack = 分支栈

# navigator.rs :: stack_row
navigator-stack-2 = 包含 { $count } 个分支的分支栈

# navigator.rs :: project_row
navigator-stop-watching = 停止关注

# navigator/tabs.rs :: terminals_tab
navigator-tabs-terminals = 终端

# navigator/terminals.rs :: menu_items
navigator-terminals-close-terminal = 关闭终端

# navigator/terminals.rs :: render_bar
navigator-terminals-group-terminals = 终端分组

# navigator/terminals.rs :: heading_row
navigator-terminals-needs = 需要你处理

# navigator/terminals.rs :: render_bar
navigator-terminals-new-terminal = 新建终端…

# navigator/terminals.rs :: menu_items
navigator-terminals-rename-terminal = 重命名终端

# navigator/terminals.rs :: menu_items
navigator-terminals-show-navigator = 在导航栏中显示

# navigator/terminals.rs :: menu_items
navigator-terminals-split-below = 向下拆分

# navigator/terminals.rs :: menu_items
navigator-terminals-split-right = 向右拆分

# navigator/terminals.rs :: render_bar
navigator-terminals-terminals = 终端

# navigator.rs :: changes_row
navigator-uncommitted-changes = 未提交的更改

# navigator.rs :: target_update_button
navigator-update = 更新

# navigator.rs :: project_row
navigator-watch-project = 关注此项目

# overlays.rs :: branch_name_input
overlays-branch-name = 分支名称

# overlays.rs :: render_toasts
overlays-copy-error-message = 复制错误信息

# overlays.rs :: run_named
overlays-create-branch = 创建分支

# overlays.rs :: render_toasts
overlays-dismiss = 忽略

# overlays.rs :: render_update_card
overlays-downloads-page = 下载页面

# overlays.rs :: render_update_card
overlays-gitbutler-here = GitButler { $version } 已发布

# overlays.rs :: render_update_card
overlays-hide-4-hours = 隐藏 4 小时

# overlays.rs :: render_update_card
overlays-later = 稍后

# overlays.rs :: listen_for_credential_prompts
overlays-passphrase-or-password = 密钥口令或密码

# overlays.rs :: render_update_card
overlays-release-notes = 更新说明

# overlays.rs :: run_named
overlays-rename-branch = 重命名分支

# overlays.rs :: render_update_card
overlays-update = 更新

# overlays.rs :: listen_for_credential_prompts
overlays-username = 用户名

# palette.rs :: label
palette-blocked = 受阻

# palette.rs :: label
palette-cooking = 忙碌

# palette.rs :: label
palette-done = 完成

# palette.rs :: uncommitted_choice
palette-editing-commit = 正在编辑提交

# palette.rs :: label
palette-failed = 已失败

# palette.rs :: go_to
palette-go-anything-navigator = 跳转到导航栏中的内容

# palette.rs :: go_to
palette-go-anything-navigator-or-file = 跳转到导航栏中的内容或文件

# palette.rs :: label
palette-idle = 空闲

# palette.rs :: terminal_place_choice
palette-main-worktree = 主工作树

# palette.rs :: render_palette
palette-nothing-matches = 没有匹配项

# palette.rs :: remote_choice
palette-on = 在 { $remote }

# palette.rs :: render_palette
palette-reading-files = 正在读取文件…

# palette.rs :: remote_choice
palette-remote = 在远程

# palette.rs :: split_tile
palette-show-below = 显示在下方

# palette.rs :: split_tile
palette-show-right = 显示在右侧

# palette.rs :: render_palette
palette-status = 状态

# palette.rs :: uncommitted_choice
palette-uncommitted-changes = 未提交的更改

# pr.rs :: render
pr-auto-merge = 自动合并

# pr.rs :: new
pr-changes-why = 更改内容及原因

# pr.rs :: set_draft
pr-convert-draft = 转为草稿

# pr.rs :: render
pr-create = ⌘↩ 创建

# pr.rs :: render
pr-create-pull-request = 创建拉取请求

# pr.rs :: render
pr-description = 描述

# pr.rs :: set_auto_merge
pr-disable-auto-merge = 关闭自动合并

# pr.rs :: render
pr-draft = 草稿

# pr.rs :: set_auto_merge
pr-enable-auto-merge = 启用自动合并

# pr.rs :: render
pr-give-title-first = 请先填写标题

# pr.rs :: label
pr-merge-pull-request = 合并拉取请求

# pr.rs :: set_draft
pr-ready-review = 可以评审

# pr.rs :: label
pr-rebase-merge = 变基并合并

# pr.rs :: label
pr-squash-merge = 压缩并合并

# pr.rs :: new
pr-t-open-pull-request = 无法打开拉取请求

# pr.rs :: new
pr-title = 标题

# pr.rs :: render
pr-wait-ai-finish-writing = 请等待 AI 完成撰写

# pr.rs :: render
pr-write-ai = 使用 AI 撰写

# pr.rs :: render
pr-write-title-description-commits = 根据提交撰写标题和描述

# pr.rs :: render
pr-writing = 正在撰写…

# projects.rs :: set_target
projects-change-target-error = 无法更改目标

# projects.rs :: clone_repository
projects-clone-error = 无法克隆 { $name }

# projects.rs :: ask_author_email
projects-email-example-com = your.email@example.com

# projects.rs :: ask_author_name
projects-full-name = 你的姓名

# projects.rs :: pick_target
projects-list-branches-error = 无法列出分支

# projects.rs :: pick_target
projects-no-branches-pick = 没有可选的分支

# projects.rs :: pick_folder
projects-open-folder-picker-error = 无法打开文件夹选择器

# projects.rs :: save_author
projects-save-name-email-error = 无法保存姓名和邮箱

# projects.rs :: open_icon_picker
projects-search-emoji = 搜索表情…

# settings/mod.rs :: appearance_cards
settings-20-lines = 20 行

# settings/mod.rs :: appearance_cards
settings-200-lines = 200 行

# settings/mod.rs :: appearance_cards
settings-50-lines = 50 行

# settings/mod.rs :: look_rows
settings-accent-description = 主要按钮、勾选标记和高亮内容的颜色。自定义颜色会进行调整，以确保文字清晰可读。

# settings/mod.rs :: look_rows
settings-accent-label = 强调色

# settings/mod.rs :: page_cards
settings-accessibility = 辅助功能

# settings/accounts.rs :: integration_cards
settings-accounts-add-account-description = 用于 GitHub、GitHub Enterprise、GitLab、自托管 GitLab 或 Bitbucket 上的拉取请求和 CI。GitButler 的其他客户端也会使用这些账户。

# settings/accounts.rs :: integration_cards
settings-accounts-add-account-description-2 = 添加…

# settings/accounts.rs :: add_token
settings-accounts-add-account-error = 无法添加账户

# settings/accounts.rs :: integration_cards
settings-accounts-add-account-label = 添加账户

# settings/accounts.rs :: gitbutler_row
settings-accounts-ai-use-gitbutler-s-key = AI 可以使用 GitButler 的密钥。

# settings/accounts.rs :: start_adding
settings-accounts-email = 邮箱

# settings/accounts.rs :: integration_cards
settings-accounts-forget = 忘记

# settings/accounts.rs :: title
settings-accounts-new-github-enterprise-token = 新增 GitHub Enterprise 令牌

# settings/accounts.rs :: title
settings-accounts-new-self-hosted-token = 新增自托管 { $name } 令牌

# settings/accounts.rs :: title
settings-accounts-new-token = 新增 { $name } 令牌

# settings/accounts.rs :: log_in_to_gitbutler
settings-accounts-paste-token = 粘贴令牌

# settings/accounts.rs :: log_in_to_gitbutler
settings-accounts-reach-gitbutler-error = 无法连接 GitButler

# settings/accounts.rs :: gitbutler_row
settings-accounts-sign = 登录…

# settings/accounts.rs :: log_in_to_gitbutler
settings-accounts-sign-error = 无法登录

# settings/accounts.rs :: sign_in_to_github
settings-accounts-sign-github-error = 无法登录 GitHub

# settings/accounts.rs :: gitbutler_row
settings-accounts-sign-out = 退出登录

# settings/accounts.rs :: gitbutler_row
settings-accounts-sign-page-opened-then-paste-token = 在已打开的页面中登录，然后粘贴页面显示的令牌。

# settings/accounts.rs :: gitbutler_row
settings-accounts-sign-use-gitbutler-s-ai-key = 登录后可使用 GitButler 的 AI 密钥，无需自备密钥。

# settings/accounts.rs :: integration_cards
settings-accounts-signing-github-description = 在已打开的页面中输入 { $code }，验证码已复制到剪贴板。

# settings/accounts.rs :: integration_cards
settings-accounts-signing-github-description-2 = 复制代码

# settings/accounts.rs :: integration_cards
settings-accounts-signing-github-label = 正在登录 GitHub

# settings/accounts.rs :: sign_in_to_github
settings-accounts-start-signing-error = 无法开始登录

# settings/accounts.rs :: start_adding
settings-accounts-token = 令牌

# settings/ai.rs :: ai_rows
settings-ai-ai-rows-was-set-up-another = { $provider_name } 已在其他 GitButler 客户端中配置，请在那里更改。在此选择服务商可改用此处的配置。

# settings/ai.rs :: ai_rows
settings-ai-ai-rows-writes-commit-messages-pull = 在你要求时，撰写提交信息和拉取请求描述，并提供冲突合并建议。

# settings/ai.rs :: ai_rows
settings-ai-api-key-label = API 密钥

# settings/ai.rs :: ai_rows
settings-ai-endpoint-description = { $provider_name } 的服务地址。

# settings/ai.rs :: ai_rows
settings-ai-endpoint-label = 端点

# settings/mod.rs :: set_up_ai
settings-ai-isn-t-set-up-yet = 尚未配置 AI，此表单中输入的内容将丢失。

# settings/ai.rs :: ai_rows
settings-ai-key-description = 使用 GitButler 的密钥需要先登录；你自己的密钥会保存在钥匙串中。

# settings/ai.rs :: ai_rows
settings-ai-key-description-2 = GitButler 提供

# settings/ai.rs :: ai_rows
settings-ai-key-description-3 = 自己的密钥

# settings/ai.rs :: ai_rows
settings-ai-key-label = 按键

# settings/ai.rs :: ai_rows
settings-ai-key-stored-paste-another-replace = 已保存密钥，粘贴其他密钥可替换。

# settings/ai.rs :: new
settings-ai-model = 模型

# settings/ai.rs :: ai_rows
settings-ai-model-description = 要使用的 { $provider_name } 模型。

# settings/ai.rs :: ai_rows
settings-ai-model-label = 模型

# settings/ai.rs :: ai_rows
settings-ai-needs-key-before-write-anything = { $provider_name } 需要密钥才能撰写内容。

# settings/ai.rs :: new
settings-ai-paste-key = 粘贴密钥

# settings/ai.rs :: ai_rows
settings-ai-paste-key-2 = 粘贴你的 { $provider_name } 密钥。

# settings/ai.rs :: ai_rows
settings-ai-provider-label = 服务商

# settings/ai.rs :: ai_rows
settings-ai-read-ai-settings-error = 无法读取 AI 设置

# settings/ai.rs :: update_ai
settings-ai-save-ai-settings-error = 无法保存 AI 设置

# settings/mod.rs :: title
settings-appearance = 外观

# settings/mod.rs :: appearance_cards
settings-appearance-description = 跟随系统深浅色模式，或始终使用浅色、深色模式。

# settings/mod.rs :: appearance_cards
settings-appearance-label = 外观

# settings/mod.rs :: program_rows
settings-ask-first-time = 首次使用时询问

# settings/mod.rs :: look_rows
settings-balanced = 均衡

# settings/mod.rs :: look_rows
settings-blue = 蓝色

# settings/mod.rs :: briefs_row
settings-briefs-description = 在分支页面的标签页中显示简报。打开的项目每隔几分钟会使用仓库地址、分支名称和提交信息，向 GitButler 服务器查询最新分支的简报。

# settings/mod.rs :: briefs_row
settings-briefs-label = 分支简报

# settings/cli.rs :: cli_row
settings-cli-cli-row-lets-coding-agents-use = 让你和编程智能体可以在终端中使用 GitButler。安装到 /usr/local/bin 时，macOS 可能要求输入密码。

# settings/cli.rs :: cli_row
settings-cli-installed = 已安装到 { $path }。{ $SETUP }

# settings/cli.rs :: install_button
settings-cli-installing = 正在安装…

# settings/cli.rs :: welcome_card
settings-cli-let-agents-use-gitbutler = 让智能体使用 GitButler

# settings/cli.rs :: cli_row
settings-cli-link-app-s-copy = 链接此应用附带的副本

# settings/cli.rs :: welcome_card
settings-cli-set-up-agents = 配置智能体

# settings/cli.rs :: install_button
settings-cli-waiting-administrator-password = 等待管理员密码

# settings/mod.rs :: appearance_cards
settings-code-size-description = 差异中代码的显示大小。

# settings/mod.rs :: appearance_cards
settings-code-size-label = 代码字号

# settings/mod.rs :: new
settings-colour-3b82f6 = 颜色值，例如 #3b82f6

# settings/mod.rs :: new
settings-command = 命令

# settings/mod.rs :: diff_layout_rows
settings-commit-messages-diff-description = 在分支和提交页面的文件上方显示提交信息，替代原来的标题栏；未提交的更改不显示标题栏。

# settings/mod.rs :: diff_layout_rows
settings-commit-messages-diff-label = 在差异中显示提交信息

# settings/mod.rs :: page_cards
settings-commits = 提交

# settings/mod.rs :: look_rows
settings-compact = 紧凑

# settings/mod.rs :: terminal_close_row
settings-confirm-closing-terminals-label = 关闭终端前确认

# settings/mod.rs :: look_rows
settings-corners-description = 按钮、卡片和弹出层的圆角程度。

# settings/mod.rs :: look_rows
settings-corners-label = 圆角

# settings/mod.rs :: look_rows
settings-custom = 自定义

# settings/mod.rs :: terminal_run_row
settings-custom-command = 自定义命令

# settings/mod.rs :: appearance_cards
settings-dark = 深色

# settings/mod.rs :: look_rows
settings-density-description = 按钮及控件的高度，以及标签两侧的留白。

# settings/mod.rs :: look_rows
settings-density-label = 密度

# settings/mod.rs :: title
settings-developer = 开发者

# settings/mod.rs :: appearance_cards
settings-diff = 差异

# settings/mod.rs :: menu_bar_row
settings-draw-menu-bar-description = 在 macOS 中也显示应用内菜单栏，以便测试 Windows 和 Linux 使用的窗口左上角菜单按钮。

# settings/mod.rs :: menu_bar_row
settings-draw-menu-bar-label = 显示应用内菜单栏

# settings/mod.rs :: program_rows
settings-editor-description = “在编辑器中打开”使用的程序，并跳转到当前行。

# settings/mod.rs :: program_rows
settings-editor-label = 编辑器

# settings/mod.rs :: title
settings-experimental = 实验性功能

# settings/mod.rs :: fetch_row
settings-fetch-automatically-description = 为每个展开的项目保持目标分支及各分支远程状态最新。GitButler 的其他客户端共用此设置。

# settings/mod.rs :: fetch_row
settings-fetch-automatically-label = 自动获取

# settings/mod.rs :: appearance_cards
settings-file-list = 文件列表

# settings/mod.rs :: appearance_cards
settings-font-description = 差异中代码使用的字体。

# settings/mod.rs :: appearance_cards
settings-font-description-2 = 此处打开的终端使用的字体。选择 Ghostty 默认时，跟随你的 Ghostty 配置。

# settings/mod.rs :: appearance_cards
settings-font-label = 字体

# settings/mod.rs :: appearance_cards
settings-font-ligatures-description = 如果字体支持连字，在代码中将 !=、== 等字符对显示为一个符号。

# settings/mod.rs :: appearance_cards
settings-font-ligatures-label = 字体连字

# settings/mod.rs :: title
settings-general = 常规

# settings/mod.rs :: look_rows
settings-gray = 灰色

# settings/mod.rs :: look_rows
settings-ground-description = 界面的灰色基调：中性、略冷、偏绿或偏暖。

# settings/mod.rs :: look_rows
settings-ground-label = 底色

# settings/mod.rs :: title
settings-integrations = 集成

# settings/mod.rs :: appearance_cards
settings-interface-size-description = 调整整个界面的大小，类似浏览器缩放。⌘+ 和 ⌘− 逐级调整，⌘0 恢复默认。

# settings/mod.rs :: appearance_cards
settings-interface-size-label = 界面大小

# settings/mod.rs :: title
settings-keyboard = 键盘

# settings/keyboard.rs :: shortcut
settings-keyboard-no-keys = 没有快捷键

# settings/mod.rs :: language_row
settings-language-description = 选择 GitButler 的界面语言，切换后立即生效。

# settings/mod.rs :: language_row
settings-language-label = 语言

# settings/mod.rs :: appearance_cards
settings-large = 大

# settings/launchers.rs :: terminal_launchers_row
settings-launchers-add-command = 添加命令

# settings/launchers.rs :: launcher
settings-launchers-command = 命令

# settings/launchers.rs :: terminal_launchers_row
settings-launchers-new-terminal-command-description = 此处提供的命令，各命令均通过你的 Shell 运行。

# settings/launchers.rs :: terminal_launchers_row
settings-launchers-new-terminal-command-label = 使用命令新建终端

# settings/mod.rs :: appearance_cards
settings-light = 浅色

# settings/mod.rs :: terminal_run_row
settings-login-shell = 登录 Shell

# settings/mod.rs :: page_cards
settings-look = 外观风格

# settings/mod.rs :: appearance_cards
settings-medium = 中

# settings/mod.rs :: merged_worktrees_row
settings-merged-worktrees-description = 更新时发现链接工作树的分支已合并，可以归档工作树或删除其目录，并关闭关联终端。有未提交文件的工作树会保留。

# settings/mod.rs :: merged_worktrees_row
settings-merged-worktrees-label = 已合并的工作树

# settings/mesh.rs :: mesh_row
settings-mesh-approve-machine-page-opened = 请在已打开的页面中批准此机器。

# settings/mesh.rs :: mesh_row
settings-mesh-checking = 正在检查…

# settings/mesh.rs :: mesh_row
settings-mesh-mesh-label = Mesh

# settings/mesh.rs :: mesh_row
settings-mesh-mesh-row-daemon-stops-other-machines = 其后台服务将停止，其他机器不再显示此机器上的工作。仓库内容会保留。

# settings/mesh.rs :: mesh_row
settings-mesh-mesh-row-sign-see-unfinished-work = 登录后，可在各项目旁查看其他机器上未完成的工作，并向它们显示此机器上的工作。

# settings/mesh.rs :: mesh_row
settings-mesh-sign = 登录…

# settings/mesh.rs :: mesh_row
settings-mesh-sign-out = 退出登录

# settings/mesh.rs :: mesh_row
settings-mesh-signed = 已以 { $login } 身份登录机器 { $machine }。{ $reporting }

# settings/mesh.rs :: mesh_row
settings-mesh-signing = 正在登录…

# settings/mesh.rs :: mesh_row
settings-mesh-take-out-mesh = 从 Mesh 中移除 { $machine }？

# settings/mesh.rs :: mesh_row
settings-mesh-waiting-browser = 等待浏览器

# settings/mod.rs :: page_cards
settings-metrics = 统计

# settings/metrics.rs :: metrics_rows
settings-metrics-error-reporting-description = 报告应用崩溃和错误，帮助我们更快发现问题。

# settings/metrics.rs :: metrics_rows
settings-metrics-error-reporting-label = 错误报告

# settings/metrics.rs :: metrics_rows
settings-metrics-usage-metrics-description = 分享使用统计，仅用于改进应用，不包含姓名、路径或你编写的任何内容。

# settings/metrics.rs :: metrics_rows
settings-metrics-usage-metrics-label = 使用统计

# settings/mod.rs :: appearance_cards
settings-navigator = 导航栏

# settings/mod.rs :: navigator_place_row
settings-navigator-position-description = 在顶部以标签页显示各项目，指向项目时显示其内容。

# settings/mod.rs :: navigator_place_row
settings-navigator-position-description-2 = 侧边

# settings/mod.rs :: navigator_place_row
settings-navigator-position-description-3 = 顶部

# settings/mod.rs :: navigator_place_row
settings-navigator-position-label = 导航栏位置

# settings/mod.rs :: terminal_run_row
settings-new-terminals-run-description = 此处打开的终端启动时运行的内容。命令通过你的 Shell 运行，退出时终端也会关闭。

# settings/mod.rs :: terminal_run_row
settings-new-terminals-run-label = 新终端运行

# settings/mod.rs :: start_row
settings-open-app-start-description = 启动 GitButler 时打开此原生应用，对应 settings.json 中的 featureFlags.gpui。使用 --gpui 启动时始终打开此应用。

# settings/mod.rs :: start_row
settings-open-app-start-label = 启动时打开此应用

# settings/mod.rs :: appearance_cards
settings-open-branches-click-description = 点击导航栏中的分支时，也展开它的提交，并折叠上次点击展开的分支。关闭后，点击仅选择分支。

# settings/mod.rs :: appearance_cards
settings-open-branches-click-label = 点击时展开分支

# settings/mod.rs :: look_rows
settings-preset-description = 圆角和密度的组合预设。更改任一选项后成为自定义外观。

# settings/mod.rs :: look_rows
settings-preset-label = 预设

# settings/mod.rs :: title
settings-project = 项目

# settings/project.rs :: project_cards
settings-project-authentication = 身份验证

# settings/project.rs :: project_cards
settings-project-credentials-description = 从目标分支的远程仓库获取，然后向分支推送目标创建一个空分支，并在测试后删除。

# settings/project.rs :: project_cards
settings-project-credentials-description-2 = 需要有远程仓库的目标分支才能测试。

# settings/project.rs :: project_cards
settings-project-credentials-label = 凭据

# settings/project.rs :: project_cards
settings-project-force-pushes-description = 强制推送会先获取远程状态；如果其他人已推送到该分支，则会停止；丢弃仅远程存在的提交前也会询问。因此这里无需单独开启保护。

# settings/project.rs :: project_cards
settings-project-force-pushes-label = 强制推送

# settings/project.rs :: project_cards
settings-project-forge-description = 根据远程主机名识别的拉取请求和 CI 所在平台。

# settings/project.rs :: project_cards
settings-project-forge-description-2 = 远程仓库主机名已确定为 { $name }，此处选择的托管平台不会生效。选择“无”可清除覆盖设置。

# settings/project.rs :: project_cards
settings-project-forge-description-3 = 为无法从主机名识别的平台（例如自托管平台）设置拉取请求和 CI 所在位置。GitHub、GitLab 和 Bitbucket 支持创建拉取请求。

# settings/project.rs :: project_cards
settings-project-forge-label = 托管平台

# settings/mod.rs :: new
settings-project-name = 项目名称

# settings/project.rs :: project_cards
settings-project-name-description = 项目在导航栏中显示的名称。

# settings/project.rs :: project_cards
settings-project-name-label = 名称

# settings/project.rs :: project_cards
settings-project-push-new-branches-description = 分支第一次推送到的远程仓库，例如在目标分支属于原始仓库时推送到你的派生仓库。更新仍从目标分支的远程仓库获取。

# settings/project.rs :: project_cards
settings-project-push-new-branches-label = 新分支推送到

# settings/project.rs :: project_cards
settings-project-read-project-s-settings-error = 无法读取项目设置

# settings/project.rs :: remove_row
settings-project-remove-project-description = 从 GitButler 中移除项目及其操作历史。仓库文件和分支会保留在磁盘上。

# settings/project.rs :: remove_row
settings-project-remove-project-description-2 = 移除…

# settings/project.rs :: remove_row
settings-project-remove-project-label = 移除项目

# settings/project.rs :: remove_project
settings-project-repository-branches-stay-disk-add-again = 仓库及其分支保留在磁盘上，可随时重新添加。

# settings/project.rs :: project_cards
settings-project-run-git-hooks-description = 在主检出目录中运行仓库的 pre-commit、commit-msg、post-commit 和 pre-push 钩子。链接工作树中的提交不运行这些钩子。

# settings/project.rs :: project_cards
settings-project-run-git-hooks-label = 运行 Git 钩子

# settings/project.rs :: project_cards
settings-project-sign-commits-description = 使用 Git 配置中指定的密钥和程序，为 GitButler 创建的提交签名。

# settings/project.rs :: project_cards
settings-project-sign-commits-description-2 = 测试

# settings/project.rs :: project_cards
settings-project-sign-commits-label = 为提交签名

# settings/project.rs :: project_cards
settings-project-signing = 签名

# settings/project.rs :: project_cards
settings-project-signing-works = 签名正常

# settings/project.rs :: project_cards
settings-project-target-branch-description = 接收你的更改、作为拉取请求目标的分支。更改前请先取消应用所有分支。

# settings/project.rs :: project_cards
settings-project-target-branch-description-2 = 接收你的更改、作为拉取请求目标的分支。

# settings/project.rs :: project_cards
settings-project-target-branch-description-3 = 更改…

# settings/project.rs :: project_cards
settings-project-target-branch-label = 目标分支

# settings/project.rs :: project_cards
settings-project-test = 测试

# settings/project.rs :: project_cards
settings-project-testing = 正在测试…

# settings/mod.rs :: look_rows
settings-purple = 紫色

# settings/mod.rs :: look_rows
settings-round = 圆润

# settings/mod.rs :: look_rows
settings-sage = 鼠尾草绿

# settings/mod.rs :: look_rows
settings-sand = 沙色

# settings/mod.rs :: screen_reader_row
settings-screen-reader-support-description = 允许 VoiceOver 等屏幕阅读器读取应用，下次启动时生效。在带有 Touch Bar 的 Mac 上启用后，关闭窗口可能导致应用崩溃。

# settings/mod.rs :: screen_reader_row
settings-screen-reader-support-label = 屏幕阅读器支持

# settings/mod.rs :: new
settings-search-settings = 搜索设置

# settings/mod.rs :: appearance_cards
settings-semantic-context-description = 在每个差异块上显示所属函数或类型的名称；如果其长度较短，则显示完整内容。deltoids 使用 tree-sitter 从代码中读取上下文，支持 Rust、TypeScript、JavaScript、Python、Go 等 20 种语言，暂不支持 Svelte。关闭后跳过上下文读取，加载会稍快。

# settings/mod.rs :: appearance_cards
settings-semantic-context-label = 语义上下文

# settings/mod.rs :: render
settings-settings = 设置

# settings/mod.rs :: look_rows
settings-sharp = 直角

# settings/mod.rs :: appearance_cards
settings-show-all-branch-s-commits-description = 导航栏中展开的分支列出所有提交。关闭后只列出前八个，并显示剩余数量，点击数量可展开。

# settings/mod.rs :: appearance_cards
settings-show-all-branch-s-commits-label = 显示分支的所有提交

# settings/mod.rs :: appearance_cards
settings-show-branches-commits-description = 导航栏中的分支默认展开提交。关闭后，各分支折叠为一行，可用 ↩ 或箭头展开。

# settings/mod.rs :: appearance_cards
settings-show-branches-commits-label = 显示分支提交

# settings/mod.rs :: diff_layout_rows
settings-show-diff-controls-description = 差异上方的工具栏，以及文件标题中的增删行数和按钮。关闭后仍可使用快捷键和菜单操作。

# settings/mod.rs :: diff_layout_rows
settings-show-diff-controls-label = 显示差异控件

# settings/mod.rs :: appearance_cards
settings-show-folders-line-counts-description = 文件树中的文件夹始终显示所含文件的增删行数。关闭后，仅在指针悬停时显示。

# settings/mod.rs :: appearance_cards
settings-show-folders-line-counts-label = 显示文件夹增删行数

# settings/mod.rs :: fps_row
settings-show-fps-description = 在窗口右上角显示最近一秒的帧率。如果近三秒中有一帧明显较慢，会在旁边以琥珀色显示其帧率，并用图表展示每帧耗时。启用时窗口会尽可能持续绘制，因此较慢的视图会降低显示的帧率。

# settings/mod.rs :: fps_row
settings-show-fps-label = 显示帧率

# settings/mod.rs :: diff_layout_rows
settings-show-full-commit-messages-description = 提交页面在标题下方展开完整信息。关闭后只显示标题，点击旁边的按钮可展开其余内容。

# settings/mod.rs :: diff_layout_rows
settings-show-full-commit-messages-label = 显示完整提交信息

# settings/mod.rs :: status_bar_row
settings-show-status-bar-description = 窗口底部的栏，显示正在进行的操作和相关快捷键。

# settings/mod.rs :: status_bar_row
settings-show-status-bar-label = 显示状态栏

# settings/mod.rs :: terminal_overview_row
settings-show-terminal-overview-description = 在导航栏下方显示所有项目打开的终端。

# settings/mod.rs :: terminal_overview_row
settings-show-terminal-overview-label = 显示终端概览

# settings/mod.rs :: appearance_cards
settings-side-side-description = 并排显示更改前后的内容。{ $cx }

# settings/mod.rs :: appearance_cards
settings-side-side-label = 并排显示

# settings/mod.rs :: single_file_row
settings-single-file-diff-description = 差异窗格仅显示文件列表中选中的文件，并在滚动条旁标出更改的行。文件列表仍保留在旁边。

# settings/mod.rs :: single_file_row
settings-single-file-diff-label = 单文件差异

# settings/mod.rs :: look_rows
settings-slate = 岩灰色

# settings/mod.rs :: appearance_cards
settings-small = 小

# settings/mod.rs :: look_rows
settings-soft = 柔和

# settings/mod.rs :: look_rows
settings-spacious = 宽松

# settings/mod.rs :: composer_row
settings-start-commits-nothing-checked-description = 提交面板打开时不选中文件，由你勾选要提交的内容。关闭后默认选中所有文件。

# settings/mod.rs :: composer_row
settings-start-commits-nothing-checked-label = 开始提交时不选中文件

# settings/mod.rs :: appearance_cards
settings-step-through-folders-description = ↑、↓ 或 j、k 也会停在文件树的文件夹上，显示各文件夹中的更改，并可用折叠快捷键展开或收起。关闭后只在文件之间移动。

# settings/mod.rs :: appearance_cards
settings-step-through-folders-label = 逐个经过文件夹

# settings/mod.rs :: appearance_cards
settings-system = 系统

# settings/mod.rs :: look_rows
settings-teal = 青绿色

# settings/mod.rs :: program_rows
settings-terminal = 终端

# settings/mod.rs :: program_rows
settings-terminal-description = “在终端中打开”使用的程序。

# settings/mod.rs :: program_rows
settings-terminal-label = 终端

# settings/mod.rs :: appearance_cards
settings-text-size-description = 此处打开的终端的字号，颜色跟随配色方案。

# settings/mod.rs :: appearance_cards
settings-text-size-label = 字号

# settings/mod.rs :: appearance_cards
settings-theme = { $name }主题 { $label }

# settings/mod.rs :: appearance_cards
settings-theme-description = 选择当前外观模式使用的配色，选中后立即生效。

# settings/mod.rs :: appearance_cards
settings-theme-label = 主题

# settings/mod.rs :: page_cards
settings-tile-dragging = 面板拖动

# settings/mod.rs :: read_failed
settings-try-again = 重试

# settings/mod.rs :: appearance_cards
settings-whole-scopes-up-description = 为完整显示函数或类型，允许在差异块周围补充的未更改行数上限。超过上限时仅保留三行上下文。

# settings/mod.rs :: appearance_cards
settings-whole-scopes-up-label = 完整上下文上限

# settings/mod.rs :: page_cards
settings-worktrees = 工作树

# settings/mod.rs :: appearance_cards
settings-worktrees-go-inactive-after-description = 链接工作树在这么长时间内没有提交或检出操作，且没有未提交内容时，会移到“不活跃的工作树”下。

# settings/mod.rs :: appearance_cards
settings-worktrees-go-inactive-after-label = 工作树不活跃期限

# settings/mod.rs :: appearance_cards
settings-wrap-long-lines-description = 超出窗格宽度的差异行会在下一行继续。{ $cx }

# settings/mod.rs :: appearance_cards
settings-wrap-long-lines-label = 长行自动换行

# state/account.rs :: sign_out
state-account-sign-out-error = 无法退出登录

# state/cli.rs :: install_cli
state-cli-install-cli-error = 无法安装 CLI

# state/load.rs :: add_or_open
state-load-add-project-error = 无法添加项目

# state/load.rs :: offer_init
state-load-initialize-git-error = 无法初始化 Git

# state/load.rs :: load_projects
state-load-list-projects-error = 无法列出项目

# state/load.rs :: remove_project
state-load-remove-project-error = 无法移除项目

# state/mesh.rs :: mesh_apply
state-mesh-bring-here-error = 无法将 { $branch } 带到此处

# state/mesh.rs :: mesh_sign_in
state-mesh-connect-mesh-error = 无法连接你的 Mesh

# state/mesh.rs :: mesh_sign_out
state-mesh-disconnect-mesh-error = 无法断开你的 Mesh 连接

# state/mutation.rs :: amend
state-mutation-amended-but-post-commit-hook-failed = 已追加提交，但提交后钩子执行失败

# state/mutation.rs :: set_worktree_archived
state-mutation-archive-worktree = 归档工作树

# state/mutation.rs :: arriving
state-mutation-commits = { $count } 个提交

# state/mutation.rs :: publish
state-mutation-create-pull-request-error = 无法创建拉取请求

# state/mutation.rs :: apply
state-mutation-failed = { $label }失败

# state/mutation.rs :: fetch
state-mutation-fetch-failed = 获取失败

# state/mutation.rs :: report_left_out
state-mutation-leaving-some-changes-out = { $done }，部分更改未包含

# state/mutation.rs :: unstack
state-mutation-move-branch = 移动分支

# state/mutation.rs :: pull_remote
state-mutation-pulling-leaves-conflicts = 拉取后会留下冲突

# state/mutation.rs :: push
state-mutation-pushed = 已推送 { $all }

# state/mutation.rs :: push
state-mutation-pushed-but-stack-s-pull-requests = 已推送 { $name }{ $pushed }，但未能更新分支栈的拉取请求

# state/mutation.rs :: redo_snapshot
state-mutation-redo-takes-back-newer-changes-too = 重做也会撤回较新的更改

# state/mutation.rs :: set_worktree_archived
state-mutation-unarchive-worktree = 取消归档工作树

# state/mutation.rs :: undo_snapshot
state-mutation-undo-failed = 撤销失败

# state/mutation.rs :: undo_snapshot
state-mutation-undo-may-take-back-was-pushed = 撤销可能撤回已推送的内容

# state/mutation.rs :: undo_snapshot
state-mutation-undo-takes-back-newer-changes-too = 撤销也会撤回较新的更改

# state/mutation.rs :: undo_snapshot
state-mutation-undone = 已撤销：{ $operation }

# state/mutation.rs :: unstack
state-mutation-unstack = 取消堆叠

# state/mutation.rs :: push
state-mutation-wasn-t-pushed = 未推送 { $name }

# state/mod.rs :: load_merged
state-read-merge-s-commits-error = 无法读取合并中的提交

# state/terminals.rs :: open_terminal_then
state-terminals-open-terminal-error = 无法打开终端

# status_bar.rs :: render_status_bar
status-bar-arranging-tiles = 正在排列面板

# status_bar.rs :: render_status_bar
status-bar-commands = 命令

# status_bar.rs :: render_status_bar
status-bar-editing = 正在编辑 { $file }

# status_bar.rs :: render_status_bar
status-bar-press-tile-s-letter = 按面板对应的字母

# status_bar.rs :: render_status_bar
status-bar-s = ⌘S

# status_bar.rs :: render_status_bar
status-bar-selected = 已选择 { $what } 项

# status_bar.rs :: render_status_bar
status-bar-swapping-tiles = 正在交换面板

# status_bar.rs :: render_status_bar
status-bar-z = ⌘Z

# ui/format.rs :: ago
time-ago = { $duration }前


# ui/format.rs :: ago
time-just-now = 刚刚

# ui/format.rs :: relative_duration
time-now = 刚刚

# transfer.rs :: render
transfer-stack = 堆叠到 { $on }

# ui/conflict.rs :: ancestor_toggle
ui-conflict-both-sides-added-these-lines = 两侧均添加了这些行

# ui/conflict.rs :: result
ui-conflict-change = 更改

# ui/conflict.rs :: bar
ui-conflict-conflict = 冲突 { $number } / { $total }

# ui/conflict.rs :: ancestor_toggle
ui-conflict-hide-was-before = 隐藏更改前的内容

# ui/conflict.rs :: editor
ui-conflict-keep = 保留

# ui/conflict.rs :: editor
ui-conflict-leaving-empty-removes-these-lines = 留空会删除这些行。

# ui/conflict.rs :: label
ui-conflict-nothing = { $phrase } 中没有内容

# ui/conflict.rs :: result
ui-conflict-nothing-so-these-lines-go = { $says }：无内容，因此会删除这些行

# ui/conflict.rs :: result
ui-conflict-pick-again = 重新选择

# ui/conflict.rs :: ancestor_toggle
ui-conflict-show-line-before-either-changed = 显示任一方更改前的这一行

# ui/conflict.rs :: ancestor_toggle
ui-conflict-show-lines-before-either-changed-them = 显示任一方更改前的 { $n } 行

# ui/diff.rs :: conflicted_badge
ui-diff-conflicted = 存在冲突

# ui/diff.rs :: hunk_header
ui-diff-not-included = 未包含

# ui/format.rs :: commit_title
ui-format-no-message = 没有提交信息

# ui/markdown.rs :: words
ui-markdown-image = 图像

# ui/markdown.rs :: words
ui-markdown-image-2 = 图像：{ $alt }

# ui/markdown/preview.rs :: render
ui-markdown-preview-image = 图像

# ui/markdown/preview.rs :: render
ui-markdown-preview-next-image = 下一张图像

# ui/markdown/preview.rs :: render
ui-markdown-preview-open-browser = 在浏览器中打开

# ui/markdown/preview.rs :: render
ui-markdown-preview-previous-image = 上一张图像

# ui/person.rs :: byline
ui-person-at = { $by }，时间：{ $time }

# ui/text_input.rs :: title_of
ui-text-input-delete = 删除至{ $words }

# ui/text_input.rs :: words
ui-text-input-down = 下方

# ui/text_input.rs :: words
ui-text-input-end = 末尾

# ui/text_input.rs :: words
ui-text-input-left = 左侧

# ui/text_input.rs :: words
ui-text-input-line-end = 行尾

# ui/text_input.rs :: words
ui-text-input-line-start = 行首

# ui/text_input.rs :: title_of
ui-text-input-move = 移动到

# ui/text_input.rs :: words
ui-text-input-right = 右侧

# ui/text_input.rs :: title_of
ui-text-input-select = 选择至

# ui/text_input.rs :: words
ui-text-input-start = 开头

# ui/text_input.rs :: words
ui-text-input-up = 上方

# ui/text_input.rs :: words
ui-text-input-word-left = 前一个词

# ui/text_input.rs :: words
ui-text-input-word-right = 后一个词

# whats_new.rs :: found
whats-new-needs = 需要 { $version }

# whats_new.rs :: notes
whats-new-not-version-yet = 尚未包含在你的版本中

# whats_new.rs :: notes
whats-new-open-github = 在 GitHub 中打开

# whats_new.rs :: render
whats-new-s-new = 更新内容

# whats_new.rs :: new
whats-new-search-release-notes = 搜索更新说明

# whats_new.rs :: failed
whats-new-try-again = 重试

# whats_new.rs :: found
whats-new-version = 在你的版本中

# whats_new.rs :: release_row
whats-new-yours = 你的版本

## Quantities. Keep count numeric; Fluent selects grammatical variants.

count-branches = { NUMBER($count, useGrouping: 0) } 个分支

count-commits = { NUMBER($count, useGrouping: 0) } 个提交

count-files = { NUMBER($count, useGrouping: 0) } 个文件

count-lines = { NUMBER($count, useGrouping: 0) } 行

count-conflicted-commits = { NUMBER($count, useGrouping: 0) } 个冲突提交

count-conflicted-files = { NUMBER($count, useGrouping: 0) } 个冲突文件

count-fixes = { NUMBER($count, useGrouping: 0) } 项修复

count-releases = { NUMBER($count, useGrouping: 0) } 个版本

count-matches = { NUMBER($count, useGrouping: 0) } 个匹配项

count-changes = { NUMBER($count, useGrouping: 0) } 项更改

count-more-files = { NUMBER($count, useGrouping: 0) } 个其他文件

count-unpushed-commits = { NUMBER($count, useGrouping: 0) } 个未推送的提交

count-uncommitted-files = { NUMBER($count, useGrouping: 0) } 个未提交的文件

count-unmodified-lines = { NUMBER($count, useGrouping: 0) } 行未更改内容

count-parts = { NUMBER($count, useGrouping: 0) } 个片段

count-comments = { NUMBER($count, useGrouping: 0) } 条评论

count-conflicts = { NUMBER($count, useGrouping: 0) } 个冲突

count-linked-worktrees = { NUMBER($count, useGrouping: 0) } 个链接工作树

count-worktrees = { NUMBER($count, useGrouping: 0) } 个工作树

count-edits = { NUMBER($count, useGrouping: 0) } 次编辑

count-checks = { NUMBER($count, useGrouping: 0) } 项检查

count-changed-files = { NUMBER($count, useGrouping: 0) } 个更改的文件

count-pull-requests = { NUMBER($count, useGrouping: 0) } 个拉取请求

releases-category-count = { $category }类更改 { NUMBER($count, useGrouping: 0) } 项

time-minutes-short = { NUMBER($count, useGrouping: 0) } 分钟


time-hours-short = { NUMBER($count, useGrouping: 0) } 小时


time-days-short = { NUMBER($count, useGrouping: 0) } 天


time-months-short = { NUMBER($count, useGrouping: 0) } 个月


time-years-short = { NUMBER($count, useGrouping: 0) } 年


weekday-mon = 周一


weekday-tue = 周二


weekday-wed = 周三


weekday-thu = 周四


weekday-fri = 周五


weekday-sat = 周六


weekday-sun = 周日


welcome-usage-notice = GitButler 会收集使用数据。阅读<privacy>隐私政策</privacy>，了解如何<opt-out>关闭数据收集</opt-out>。


settings-mesh-not-installed = 此机器尚未安装 GitButler Mesh。


## Contextual command phrases. Counts are numeric; names remain literal.

command-uncommit-changes-phrase = 撤销提交{ $changes }

command-add-empty-commit-phrase = 添加空提交

command-copy-name-phrase = 复制名称

command-new-worktree-phrase = 新建工作树

command-edit-description-phrase = 编辑描述

command-restore-operation-phrase = 恢复到此操作之前

command-new-terminal-with-phrase = 使用命令新建终端…

command-archive-phrase = 归档

command-sort-activity-phrase = 最近活动

command-sort-name-phrase = 名称

command-all-projects-phrase = 全部

command-active-projects-phrase = 最近 7 天活跃

command-local-branches-phrase = 本地分支

command-remote-branches-phrase = 远程分支

command-squash-branch-phrase = 压缩分支

command-unapply-branch-phrase = 移出分支

command-uncommit-picked-phrase = 撤销 { $count } 个提交

command-cherry-pick-picked-phrase = 拣选 { $count } 个提交

command-squash-into-picked-phrase = 将 { $count } 个提交压缩到此提交

command-move-new-branch-phrase = 将 { $count } 个提交移到新分支

command-move-picked-phrase = 移动 { $count } 个提交

command-squash-picked-phrase = 压缩 { $count } 个提交

command-open-forge-phrase = 在 { $provider } 上打开

command-squash-into-oldest-phrase = 将 { $count } 个提交压缩到 { $title }

command-merge-stack-phrase = 将堆栈合并到 { $target }

command-merge-branch-phrase = 合并到 { $target }

push-force = 强制推送

command-push-stack-phrase = 推送堆栈

command-force-push-stack-phrase = 强制推送堆栈

command-pull-remote-phrase = 从远程拉取 { $count } 个提交


## Native launchers and push descriptions.

open-in-editor = 在编辑器中打开

open-in-program = 在 { $name } 中打开

open-in-editor-selected = 文件现使用 { $name } 打开，可在设置 → 通用中修改

open-in-editor-error = 无法打开编辑器

open-in-terminal-error = 无法打开终端

terminal-default-title = 终端

push-tooltip = 推送 { $count } 个提交

push-force-tooltip = 强制推送 { $count } 个提交

push-parents-tooltip = 推送 { $count } 个提交及其父分支

push-force-parents-tooltip = 强制推送 { $count } 个提交及其父分支


## Native menu actions outside the command palette.

menu-hide = 隐藏 GitButler

menu-hide-others = 隐藏其他应用

menu-show-all = 显示全部

menu-minimize = 最小化

menu-zoom = 缩放

menu-command-palette = 命令面板…

menu-cut = 剪切

menu-copy = 复制

menu-paste = 粘贴

menu-select-all = 全选


## Repository overview and shared picker labels.

overview-activity = 活动

overview-shipped = 已交付

overview-pull-requests = 拉取请求

overview-commits = 提交

overview-people = 贡献者

overview-time-to-merge = 合并耗时

overview-where-merged = 合并涉及的目录

overview-merged-count-hint = 各目录的合并数量

overview-who-wrote = 这些提交的作者

overview-pull-requests-hint = 在所选时间内合并的拉取请求

overview-commits-hint = 引入的提交，不含合并提交

overview-merge-time-hint = 从拉取请求的首个提交到合并的耗时中位数

overview-no-matches = 没有符合筛选条件的合并

overview-today = 今天

overview-no-remote = 没有可获取的远程仓库

navigator-all-projects = 全部项目

navigator-more-projects = 更多项目

palette-move-hint = 移动

palette-run-hint = 执行

palette-close-hint = 关闭

palette-search-commands = 搜索命令

overview-activity-summary = { $commits }，最近一周 { $week } 个

overview-days-ago = { $count } 天前

overview-last-days = 最近 { $count } 天

overview-nothing-merged = 最近 { $count } 天没有合并

overview-on-target-area = 在 { $target } 上 · { $area }

overview-on-target = 在 { $target } 上

overview-merges-days = 合并 · { $count } 天

overview-merges-picked-days = 合并 · 所选日期

status-fetch = 获取


## Command editor labels.

editor-command-column = 命令

editor-action-column = 操作标识

editor-context-column = 适用范围

editor-keys-column = 快捷键

editor-anywhere = 任意位置

editor-press-key-help = 按下快捷键以查找绑定的操作，点击其他位置可取消。

editor-record-keys-help = 按下要绑定的快捷键，组合键可按两次。点击其他位置可取消。

editor-menu-help = 拖动命令以添加到菜单或调整顺序，修改会自动保存。

editor-keys-help = 点击快捷键进行修改，修改会自动保存。

settings-projects-heading = 项目


## Theme picker. Only schemes matching the active appearance are offered.

theme-current = 当前使用

theme-gitbutler-light = GitButler 默认浅色配色

theme-gitbutler-dark = GitButler 默认深色配色

theme-ghostty-light = 使用 Ghostty 配置中的浅色主题

theme-ghostty-dark = 使用 Ghostty 配置中的深色主题

theme-search-light = 搜索浅色主题

theme-search-dark = 搜索深色主题

theme-use = 使用主题

