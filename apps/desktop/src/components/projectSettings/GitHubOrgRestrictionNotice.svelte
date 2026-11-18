<script lang="ts">
	import { InfoMessage, Link } from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";

	import type { Code } from "@gitbutler/but-sdk";

	const { errorCode }: { errorCode: Code | undefined } = $props();
</script>

{#if errorCode === "GitHubOrgOAuthRestricted"}
	<InfoMessage style="warning" filled outlined={false}>
		{#snippet title()}
			{$t("Restricted by a GitHub organization")}
		{/snippet}
		{#snippet content()}
			{$t(
				"An organization that owns this repository has blocked the GitButler OAuth app, so pull requests can't be listed or created right now. Ask an organization owner to approve the app, or connect an account that uses a personal access token — see the",
			)}
			<Link
				href="https://docs.gitbutler.com/features/forge-integration/github-integration?utm_source=gitbutler-app&utm_medium=settings-banner&utm_campaign=org-oauth-restriction#connect-a-github-account"
				>{$t("docs")}</Link
			>.
		{/snippet}
	</InfoMessage>
{:else if errorCode === "GitHubOrgSamlRestricted"}
	<InfoMessage style="warning" filled outlined={false}>
		{#snippet title()}
			{$t("GitHub organization requires SAML SSO")}
		{/snippet}
		{#snippet content()}
			{$t(
				"This repository's organization requires SAML SSO, but the selected GitHub credential isn't authorized for it. In GitHub, authorize the GitButler OAuth app or your personal access token for the organization, then try again.",
			)}
		{/snippet}
	</InfoMessage>
{:else if errorCode === "GitHubTokenLifetimeRestricted"}
	<InfoMessage style="warning" filled outlined={false}>
		{#snippet title()}
			{$t("GitHub organization limits token lifetime")}
		{/snippet}
		{#snippet content()}
			{$t(
				"This repository's organization refuses personal access tokens that stay valid longer than its policy allows. Create a token with a shorter expiration, then connect GitHub with it here.",
			)}
		{/snippet}
	</InfoMessage>
{/if}
