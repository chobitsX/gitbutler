<script lang="ts">
	import { InfoMessage } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";

	// Number of events received.
	let count = $state(0);

	/**
	 * Listens for custom events sent by vite, defined in `vite.config.ts`.
	 * See: https://vite.dev/guide/api-plugin.html#typescript-for-custom-events
	 */
	import.meta.hot?.on("gb:reload", () => {
		count++;
	});
</script>

{#if count > 0}
	<div class="reload-warning">
		<InfoMessage style="warning">
			{#snippet title()}
				{$t("Full reload pending")}
			{/snippet}
			{#snippet content()}
				{$t("Detected {count} events that require reloading this page.", { count: count })}
			{/snippet}
		</InfoMessage>
	</div>
{/if}

<style lang="postcss">
	.reload-warning {
		z-index: var(--z-lifted);
		position: absolute;
		bottom: 24px;
		left: 50%;
		transform: translateX(-50%);
	}
</style>
