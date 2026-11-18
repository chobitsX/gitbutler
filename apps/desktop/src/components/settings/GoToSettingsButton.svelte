<script lang="ts">
	import { useSettingsModal } from "$lib/settings/settingsModal.svelte";
	import { Button } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";

	const { openGeneralSettings } = useSettingsModal();
</script>

<Button
	style="pop"
	icon="login"
	onclick={async () => {
		openGeneralSettings("general");
	}}
>
	{$t("Go to Settings")}
</Button>
