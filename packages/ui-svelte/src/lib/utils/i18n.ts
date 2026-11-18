import { derived, get, readonly, writable } from "svelte/store";

export const languages = [
	{ value: "en", label: "English" },
	{ value: "zh-CN", label: "简体中文" },
] as const;

export type Language = (typeof languages)[number]["value"];
export type Messages = Readonly<Record<string, string>>;
export type MessageParams = Readonly<Record<string, string | number | null | undefined>>;
export type Translate = (message: string, params?: MessageParams) => string;

export function resolveLanguage(value: unknown): Language {
	return languages.find((language) => language.value === value)?.value ?? "en";
}

/**
 * English source messages are also the fallback keys. Applications register their
 * catalogs; shared controls stay in English until an application selects a language.
 * Interpolation is plain text, so translated messages never inject HTML.
 */
export function createI18n() {
	// An unconfigured host keeps its existing browser-local date formatting.
	const preference = writable<Language | undefined>(undefined);
	const language = derived(preference, resolveLanguage);
	const catalogs = writable<Partial<Record<Language, Messages>>>({});
	const t = derived([language, catalogs], ([$language, $catalogs]): Translate => {
		return (message, params = {}) => {
			const catalog = $catalogs[$language];
			const translated =
				$language !== "en" && catalog && Object.hasOwn(catalog, message)
					? catalog[message]
					: message;
			return translated.replace(/\{(\w+)\}/g, (placeholder, name: string) =>
				Object.hasOwn(params, name) ? String(params[name] ?? "") : placeholder,
			);
		};
	});

	return {
		language,
		formatLocale: readonly(preference),
		t,
		setLanguage: (value: unknown) => preference.set(resolveLanguage(value)),
		registerMessages: (value: Language, messages: Messages) => {
			catalogs.update((current) => ({ ...current, [value]: messages }));
		},
		/** For event handlers and services; components use $t for live updates. */
		translate: ((message, params) => get(t)(message, params)) as Translate,
	};
}

export const { language, formatLocale, t, setLanguage, registerMessages, translate } = createI18n();
