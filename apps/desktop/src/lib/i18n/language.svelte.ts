import { resolveLanguage, setLanguage } from "@gitbutler/ui-svelte/utils/i18n";

/** Follow the Redux-backed preference, including its asynchronous rehydration. */
export function syncLanguage(preference: { readonly current: unknown }) {
	$effect(() => {
		const language = resolveLanguage(preference.current);
		setLanguage(language);
		document.documentElement.lang = language;
	});
}
