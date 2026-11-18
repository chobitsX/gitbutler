<script lang="ts">
	import { SETTINGS_SERVICE } from "$lib/settings/appSettings";
	import { inject } from "@gitbutler/core/context";
	import { CardGroup, Link, TestId, Toggle } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";

	const settingsService = inject(SETTINGS_SERVICE);
	const appSettings = $derived(settingsService.appSettings);
	const errorReportingEnabled = $derived($appSettings?.telemetry.appErrorReportingEnabled);
	const metricsEnabled = $derived($appSettings?.telemetry.appMetricsEnabled);
</script>

<div class="analytics-settings__content">
	<p class="text-13 text-body analytics-settings__text">
		{$t(
			"GitButler uses telemetry strictly to help us improve the client. We do not collect any personal information, unless explicitly allowed below.",
		)}
		<Link href="https://gitbutler.com/privacy">
			{$t("Privacy policy")}
		</Link>
	</p>
	<p class="text-13 text-body analytics-settings__text">
		{$t(
			"We kindly ask you to consider keeping these settings enabled as it helps us catch issues more quickly. If you choose to disable them, please feel free to share your feedback on our",
		)}
		<Link href="https://discord.gg/MmFkmaJ42D">Discord</Link>.
	</p>
</div>

<CardGroup testId={TestId.OnboardingPageAnalyticsSettings}>
	<CardGroup.Item labelFor="errorReportingToggle">
		{#snippet title()}
			{$t("Error reporting")}
		{/snippet}
		{#snippet caption()}
			{$t("Toggle reporting of application crashes and errors.")}
		{/snippet}
		{#snippet actions()}
			<Toggle
				id="errorReportingToggle"
				testId={TestId.OnboardingPageAnalyticsSettingsErrorReportingToggle}
				checked={errorReportingEnabled}
				onclick={() =>
					settingsService.updateTelemetry({
						appErrorReportingEnabled: !errorReportingEnabled,
					})}
			/>
		{/snippet}
	</CardGroup.Item>

	<CardGroup.Item labelFor="metricsEnabledToggle">
		{#snippet title()}
			{$t("Usage metrics")}
		{/snippet}
		{#snippet caption()}
			{$t("Toggle sharing of usage statistics.")}
		{/snippet}
		{#snippet actions()}
			<Toggle
				id="metricsEnabledToggle"
				testId={TestId.OnboardingPageAnalyticsSettingsTelemetryToggle}
				checked={metricsEnabled}
				onclick={() =>
					settingsService.updateTelemetry({
						appMetricsEnabled: !metricsEnabled,
					})}
			/>
		{/snippet}
	</CardGroup.Item>
</CardGroup>

<style lang="postcss">
	.analytics-settings__content {
		display: flex;
		flex-direction: column;
		gap: 16px;
	}

	.analytics-settings__text {
		margin-bottom: 10px;
		color: var(--text-2);
	}
</style>
