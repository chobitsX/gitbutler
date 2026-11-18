<script lang="ts">
	import { AsyncButton, Button, Modal } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";

	interface Props {
		onSubmit: () => void;
	}

	const { onSubmit }: Props = $props();

	let modalEl = $state<ReturnType<typeof Modal>>();

	export function show() {
		modalEl?.show();
	}
	export function close() {
		modalEl?.close();
	}
</script>

<Modal bind:this={modalEl} width="small">
	<div>
		<p>{$t("It's generally better to start resolving conflicts from the bottom up.")}</p>
		<br />
		<p>{$t("Are you sure you want to resolve conflicts for this commit?")}</p>
	</div>
	{#snippet controls(close)}
		<Button kind="outline" type="reset" onclick={close}>{$t("Cancel")}</Button>
		<AsyncButton
			style="pop"
			action={async () => {
				await onSubmit();
				close();
			}}>{$t("Yes")}</AsyncButton
		>
	{/snippet}
</Modal>
