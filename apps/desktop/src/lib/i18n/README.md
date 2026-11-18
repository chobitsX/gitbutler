# Desktop languages

The Svelte/Tauri desktop application supports English (`en`, the default) and
Simplified Chinese (`zh-CN`). Select a language in **Global settings → General →
Language**. Changes apply immediately and survive restarts through the existing
Redux Persist `UiState.global.language` preference. No backend settings migration
or duplicate browser-storage entry is needed.

## Messages

The small shared runtime lives in `@gitbutler/ui-svelte/utils/i18n`. The desktop
registers `zh-CN.json` at startup. English source messages double as catalog keys
and fallbacks. Shared Svelte controls and the web app remain English unless their
host explicitly registers a catalog and selects a language.

Use the reactive translator inside Svelte components:

```svelte
<script lang="ts">
	import { t } from "@gitbutler/ui-svelte/utils/i18n";
	let { branchName }: { branchName: string } = $props();
</script>

<button>{$t("Create branch")}</button><p>{$t("Rename {name}", { name: branchName })}</p>
```

Keep translated configuration arrays in `$derived` so an already-open menu or
settings view updates when the language changes. Translate complete messages;
use named interpolation parameters instead of concatenating translated fragments.
Select singular/plural English messages explicitly when necessary, keeping the
full phrase in the catalog. Interpolated values are literal text and are never
looked up as translation keys or inserted as HTML.

Do not translate repository data: project/branch names, file paths, commit
messages, code, hashes, remote URLs, API parameters, and error diagnostics retain
their original values. UI-owned toast titles and guidance are translated at the
presentation layer; raw error diagnostics and classification rules are preserved.
For a dynamically composed notification, use `translate(message, params)` in the
event handler or service, rather than constructing an English string at runtime.

Relative and absolute timestamps receive the selected language explicitly. Dayjs
uses a per-instance locale so changing the desktop language does not change other
clients' formatting globally.

## Native menu and other clients

`nativeMenu.ts` maps stable menu IDs to source messages. The Tauri-only
`set_menu_labels` command updates their titles in place, preserving accelerators
and actions; OS-provided standard menu commands keep their native labels. Updates
are serialized to keep rapid switches in order. This is a desktop shell command,
not an addition to the Git/SDK API.

The public website, CLI/TUI and experimental GPUI client have separate interfaces;
this preference does not change them. Git operations and SDK contracts are
unaffected.

## Adding a language and validation

Add its value and native name to `languages` in the shared runtime, register its
catalog in this directory, and add its date-formatting locale. Missing messages
continue to fall back to English. Keep interpolation names identical to the source.

`i18n.test.ts` checks reactive switching, fallback, interpolation, catalog coverage,
date formatting and native menu labels. `LanguageSettings.svelte.test.ts` exercises
the real selector and Redux persistence across a fresh application state. Run the
desktop tests and Svelte checks after changing the runtime or catalogs.
