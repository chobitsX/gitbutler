<script lang="ts">
	import { Badge } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";
	import type { BitbucketAccountIdentifier } from "@gitbutler/but-sdk";

	type Props = {
		account: BitbucketAccountIdentifier;
		class?: string;
	};

	const { account, class: className }: Props = $props();

	export function badgeText(account: BitbucketAccountIdentifier): string | null {
		switch (account.type) {
			case "apiToken":
				return "API token";
		}
	}

	export function tooltipText(account: BitbucketAccountIdentifier): string {
		switch (account.type) {
			case "apiToken":
				return $t("Atlassian API token");
		}
	}
</script>

<Badge class={className} tooltip={tooltipText(account)}>
	{badgeText(account)}
</Badge>
