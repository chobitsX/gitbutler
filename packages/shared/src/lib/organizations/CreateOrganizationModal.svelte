<script lang="ts">
	import { ORGANIZATION_SERVICE } from "$lib/organizations/organizationService";
	import { inject } from "@gitbutler/core/context";

	import { Button, Modal, Textarea, Textbox } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";
	import { slugify } from "@gitbutler/ui-svelte/utils/string";

	const organizationService = inject(ORGANIZATION_SERVICE);

	let name = $state<string>("");
	let slug = $state<string>("");
	const sluggifiedSlug = $derived(slugify(slug || name || "").toLocaleLowerCase());
	let description = $state<string>("");

	const requiredFieldsFilled = $derived(!!(name && sluggifiedSlug));
	let modalCreationState: "inert" | "loading" | "complete" = $state("inert");
	let submitAttempted = $state(false);

	function onModalClose() {
		name = "";
		slug = "";
		description = "";
		modalCreationState = "inert";
		submitAttempted = false;
	}

	async function create(close: () => void) {
		submitAttempted = true;

		if (!requiredFieldsFilled) return;

		modalCreationState = "loading";
		await organizationService.createOrganization(sluggifiedSlug, name, description);
		modalCreationState = "complete";
		close();
	}

	let modal = $state<Modal>();

	export function show() {
		modal?.show();
	}
</script>

<Modal bind:this={modal} onClose={onModalClose}>
	<div class="form-container">
		<h2>{$t("Create a new Organization")}</h2>
		<p>
			{$t(
				"Organizations are a way to group projects and collaborate with your team. You can create as many organizations as you want.",
			)}
		</p>
		<Textbox bind:value={name} label={$t("Name")} required={submitAttempted}></Textbox>
		<Textbox bind:value={slug} label={$t("Slug")} required={submitAttempted}></Textbox>
		{#if slug !== sluggifiedSlug}
			<p>{$t("Slug will be save as: {sluggifiedSlug}", { sluggifiedSlug: sluggifiedSlug })}</p>
		{/if}

		<Textarea bind:value={description} label={$t("Description")}></Textarea>
	</div>

	{#snippet controls(close)}
		<Button
			disabled={!requiredFieldsFilled}
			loading={modalCreationState === "loading"}
			onclick={() => create(close)}>{$t("Create")}</Button
		>
	{/snippet}
</Modal>

<style>
	h2 {
		margin-bottom: 10px;
		font-weight: 600;
		font-size: 20px;
	}

	.form-container {
		display: flex;
		flex-direction: column;
		gap: 10px;
	}
</style>
