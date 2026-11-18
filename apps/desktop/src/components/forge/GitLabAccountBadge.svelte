<script lang="ts">
	import { Badge } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";
	import type { GitlabAccountIdentifier } from "@gitbutler/but-sdk";

	type Props = {
		account: GitlabAccountIdentifier;
		class?: string;
	};

	const { account, class: className }: Props = $props();

	export function badgeText(account: GitlabAccountIdentifier): string | null {
		switch (account.type) {
			case "patUsername":
				return "PAT";
			case "selfHosted":
				return account.info.host;
		}
	}

	export function tooltipText(account: GitlabAccountIdentifier): string {
		switch (account.type) {
			case "patUsername":
				return $t("Personal Access Token");
			case "selfHosted":
				return $t("Self-Hosted GitLab");
		}
	}
</script>

<Badge class={className} tooltip={tooltipText(account)}>
	{badgeText(account)}
</Badge>
