import type { IBackend } from "$lib/backend";
import type { Translate } from "@gitbutler/ui-svelte/utils/i18n";

/** IDs are shared with crates/gitbutler-tauri/src/menu.rs. */
export const nativeMenuMessages = {
	"menu/file": "File",
	"menu/edit": "Edit",
	"menu/view": "View",
	"menu/project": "Project",
	"menu/window": "Window",
	"menu/help": "Help",
	"global/settings": "Settings",
	"global/update": "Check for updates…",
	"file/add-local-repo": "Add Local Repository…",
	"file/clone-repo": "Clone Repository…",
	"file/create-branch": "Create Branch…",
	"file/create-dependent-branch": "Create Dependent Branch…",
	"view/switch-theme": "Switch Theme",
	"view/toggle-sidebar": "Toggle Unassigned",
	"view/zoom-in": "Zoom In",
	"view/zoom-out": "Zoom Out",
	"view/zoom-reset": "Reset Zoom",
	"view/devtools": "Developer Tools",
	"view/reload": "Reload View",
	"project/history": "Operations History",
	"project/open-in-vscode": "Open in Editor",
	"project/open-in-terminal": "Open in Terminal",
	"project/settings": "Project Settings",
	"help/documentation": "Documentation",
	"help/debugging-guide": "Debugging Guide",
	"help/github": "Source Code",
	"help/release-notes": "Release Notes",
	"help/share-debug-info": "Share Debug Info…",
	"help/report-issue": "Create an Issue",
	"help/open-logs-folder": "Open Logs Folder",
	"help/open-config-folder": "Open Config Folder",
	"help/open-cache-folder": "Open Cache Folder",
} as const;

export async function localizeNativeMenu(backend: IBackend, t: Translate) {
	const labels: Record<string, string> = Object.fromEntries(
		Object.entries(nativeMenuMessages).map(([id, message]) => [id, t(message)]),
	);
	const showIn =
		backend.platformName === "macos"
			? "Show in Finder"
			: backend.platformName === "windows"
				? "Show in Explorer"
				: "Show in File Manager";
	labels["project/show-in-finder"] = t(showIn);
	labels["help/version"] = t("Version {version}", { version: await backend.currentVersion() });
	await backend.invoke("set_menu_labels", { labels });
}
