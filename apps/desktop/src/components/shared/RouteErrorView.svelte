<script lang="ts">
	import IllustrationSplitLayout from "$components/shared/IllustrationSplitLayout.svelte";
	import ProjectSwitcher from "$components/shared/ProjectSwitcher.svelte";
	import loadErrorSvg from "$lib/assets/illustrations/load-error.svg?raw";
	import { InfoMessage } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";

	interface Props {
		projectId?: string;
		error?: any;
	}

	const { projectId, error = undefined }: Props = $props();
</script>

<IllustrationSplitLayout img={loadErrorSvg}>
	<div class="problem__container">
		<h2 class="problem__title text-18 text-body text-bold">
			{$t("There was a problem loading the app")}
		</h2>

		<InfoMessage filled outlined={false} style="danger" icon="info">
			{#snippet content()}
				{error ? error : $t("An unknown error occurred")}
			{/snippet}
		</InfoMessage>

		<ProjectSwitcher {projectId} />
	</div>
</IllustrationSplitLayout>

<style lang="postcss">
	.problem__container {
		display: flex;
		flex-direction: column;
		gap: 20px;
	}

	.problem__title {
		color: var(--text-1);
	}
</style>
