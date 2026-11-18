<script lang="ts">
	import { ORGANIZATION_SERVICE } from "$lib/organizations/organizationService";
	import { inject } from "@gitbutler/core/context";
	import { Button, Modal, Textbox } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";

	const organizationService = inject(ORGANIZATION_SERVICE);

	let modal = $state<Modal>();

	let organizationSlug = $state("");
	let joinCode = $state("");
	let joiningState = $state<"intert" | "loading" | "completed">("intert");
	const buttonEnabled = $derived(!!(joinCode && organizationSlug));

	async function join(close: () => void) {
		joiningState = "loading";

		await organizationService.joinOrganization(organizationSlug, joinCode);

		joiningState = "completed";
		close();
	}

	export function show() {
		modal?.show();
	}
</script>

<Modal bind:this={modal} title={$t("Join an organization")} width="small">
	<p>{$t("To join an organization, you need to have a join code and an organization slug.")}</p>
	<br />
	<Textbox bind:value={organizationSlug} label={$t("Organization slug")} />
	<br />
	<Textbox bind:value={joinCode} label={$t("Join code")} />

	{#snippet controls(close)}
		<Button
			disabled={!buttonEnabled}
			loading={joiningState === "loading"}
			onclick={() => join(close)}>{$t("Join")}</Button
		>
	{/snippet}
</Modal>
