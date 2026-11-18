<script lang="ts">
	import { ContextMenuItem, ContextMenuSection, KebabButton, TestId } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";

	type Props = {
		onCherryPick: () => void;
		rightClickTrigger: HTMLElement;
	};

	const { onCherryPick: onclick, rightClickTrigger }: Props = $props();
</script>

<KebabButton showOnHover contextElement={rightClickTrigger} testId={TestId.KebabMenuButton}>
	{#snippet contextMenu({ close })}
		<ContextMenuSection>
			<ContextMenuItem
				label={$t("Cherry-pick commit")}
				icon="cherry-pick"
				onclick={() => {
					close();
					onclick();
				}}
			/>
		</ContextMenuSection>
	{/snippet}
</KebabButton>
