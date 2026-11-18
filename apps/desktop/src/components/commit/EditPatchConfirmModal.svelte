<script lang="ts">
	import { Modal, Button } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";

	type Props = {
		fileName: string;
		onConfirm: () => void;
		onCancel: () => void;
	};

	const { fileName, onConfirm, onCancel }: Props = $props();

	let modal: Modal | undefined = $state();

	export function show() {
		modal?.show();
	}

	export function hide() {
		modal?.close();
	}
</script>

<Modal bind:this={modal} width="small" type="warning" title={$t("Resolve conflicts to preview")}>
	<p class="text-base-body-13 text-light">
		{$t("The file")} <span class="text-bold">{fileName}</span>
		{$t("has unresolved merge conflicts that need to be addressed before it can be previewed.")}
	</p>

	{#snippet controls()}
		<Button kind="outline" onclick={onCancel}>{$t("Cancel")}</Button>
		<Button style="pop" onclick={onConfirm}>{$t("Resolve Conflicts")}</Button>
	{/snippet}
</Modal>
