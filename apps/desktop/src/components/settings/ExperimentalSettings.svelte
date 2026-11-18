<script lang="ts">
	import { BACKEND } from "$lib/backend";
	import { fModeEnabled } from "$lib/config/uiFeatureFlags";
	import { SETTINGS_SERVICE } from "$lib/settings/appSettings";
	import { hasNativeApp } from "$lib/settings/nativeApp";
	import { inject } from "@gitbutler/core/context";
	import { CardGroup, Toggle } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";

	const settingsService = inject(SETTINGS_SERVICE);
	const settingsStore = settingsService.appSettings;
	const backend = inject(BACKEND);

	let nativeApp = $state(false);
	hasNativeApp(backend).then((has) => (nativeApp = has));
</script>

<p class="text-12 text-body experimental-settings__text">
	{$t("Flags for features in development or beta. Features may not work fully.")}
	<br />
	{$t("Use at your own risk.")}
</p>

<CardGroup>
	<CardGroup.Item labelFor="f-mode">
		{#snippet title()}
			{$t("F Mode Navigation")}
		{/snippet}
		{#snippet caption()}
			{$t("Enable F mode for quick keyboard navigation to buttons using two-letter shortcuts.")}
		{/snippet}
		{#snippet actions()}
			<Toggle
				id="f-mode"
				checked={$fModeEnabled}
				onclick={() => fModeEnabled.set(!$fModeEnabled)}
			/>
		{/snippet}
	</CardGroup.Item>

	{#if nativeApp}
		<CardGroup.Item labelFor="native-app">
			{#snippet title()}
				{$t("Native app")}
			{/snippet}
			{#snippet caption()}
				{$t(
					"Open GitButler's experimental native app instead of this one. Takes effect after you restart GitButler. To come back, turn off \"Open this app at start\" in the native app's settings.",
				)}
			{/snippet}
			{#snippet actions()}
				<Toggle
					id="native-app"
					checked={$settingsStore?.featureFlags.gpui}
					onclick={() =>
						settingsService.updateFeatureFlags({
							gpui: !$settingsStore?.featureFlags.gpui,
						})}
				/>
			{/snippet}
		</CardGroup.Item>
	{/if}
</CardGroup>

<style>
	.experimental-settings__text {
		margin-bottom: 10px;
		color: var(--text-2);
	}
</style>
