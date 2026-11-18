<script lang="ts">
	import { UI_STATE } from "$lib/state/uiState.svelte";
	import { inject } from "@gitbutler/core/context";
	import { CardGroup, Select, SelectItem } from "@gitbutler/ui-svelte";
	import { languages, resolveLanguage, t } from "@gitbutler/ui-svelte/utils/i18n";

	const uiState = inject(UI_STATE);
	const language = uiState.global.language;
</script>

<CardGroup.Item alignment="center" standalone>
	{#snippet title()}
		<label for="app-language">{$t("Language")}</label>
	{/snippet}
	{#snippet caption()}
		{$t("Choose the language used in GitButler. Changes apply immediately.")}
	{/snippet}
	{#snippet actions()}
		<Select
			id="app-language"
			value={resolveLanguage(language.current)}
			options={[...languages]}
			onselect={(value) => language.set(resolveLanguage(value))}
		>
			{#snippet itemSnippet({ item, highlighted })}
				<SelectItem selected={item.value === language.current} {highlighted}>
					{item.label}
				</SelectItem>
			{/snippet}
		</Select>
	{/snippet}
</CardGroup.Item>
