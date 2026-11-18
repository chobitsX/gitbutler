<script lang="ts">
	import Badge from "$components/Badge.svelte";
	import Tooltip from "$components/Tooltip.svelte";
	import { t } from "$lib/utils/i18n";
</script>

<Tooltip text={$t("Executable")}>
	<Badge kind="soft" style="gray" size="icon">{$t("Ex")}</Badge>
</Tooltip>
