<script lang="ts">
	import ThemeSelector from "$components/projectSettings/ThemeSelector.svelte";
	import { UI_STATE } from "$lib/state/uiState.svelte";
	import { inject } from "@gitbutler/core/context";
	import {
		CardGroup,
		HunkDiff,
		RadioButton,
		Select,
		SelectItem,
		Textbox,
		Toggle,
	} from "@gitbutler/ui-svelte";
	import { t } from "@gitbutler/ui-svelte/utils/i18n";
	import {
		LIGHT_THEMES,
		DARK_THEMES,
		setSyntaxThemes,
	} from "@gitbutler/ui-svelte/utils/shikiHighlighter";
	import type { ScrollbarVisilitySettings } from "@gitbutler/ui-svelte";

	const uiState = inject(UI_STATE);

	const pathFirst = uiState.global.pathFirst;
	const allInOneDiff = uiState.global.allInOneDiff;
	const highlightDiffs = uiState.global.highlightDiffs;
	const syntaxThemeLight = uiState.global.syntaxThemeLight;
	const syntaxThemeDark = uiState.global.syntaxThemeDark;
	const tabSize = uiState.global.tabSize;
	const diffLigatures = uiState.global.diffLigatures;
	const wrapText = uiState.global.wrapText;
	const diffFont = uiState.global.diffFont;
	const diffFontSize = uiState.global.diffFontSize;
	const strongContrast = uiState.global.strongContrast;
	const colorBlindFriendly = uiState.global.colorBlindFriendly;
	const inlineUnifiedDiffs = uiState.global.inlineUnifiedDiffs;
	const svgAsImage = uiState.global.svgAsImage;
	const scrollbarVisibilityState = uiState.global.scrollbarVisibilityState;
	const defaultFileListMode = uiState.global.defaultFileListMode;
	const MIN_DIFF_FONT_SIZE = 8;
	const MAX_DIFF_FONT_SIZE = 32;

	// Sync persisted syntax theme settings to the shiki highlighter.
	$effect(() => {
		setSyntaxThemes(syntaxThemeLight.current, syntaxThemeDark.current);
	});
	const diff = `@@ -56,10 +56,10 @@
			// Diff example
			projectName={project.title}
			{remoteBranches}
			on:branchSelected={async (e) => {
-				selectedBranch = e.detail;
-				if ($platformName === 'win32') {
+				if ($platformName === 'win64' && $userSettings.enableAdvancedFeatures) {
+					// Enhanced platform detection with feature flags
					setTarget();
				}
			}}`;

	function onScrollbarFormChange(form: HTMLFormElement) {
		const formData = new FormData(form);
		const selectedScrollbarVisibility = formData.get(
			"scrollBarVisibilityType",
		) as ScrollbarVisilitySettings;

		scrollbarVisibilityState.set(selectedScrollbarVisibility);
	}

	function clampDiffFontSize(value: string) {
		if (value.trim() === "") return diffFontSize.current;

		const parsed = Number(value);
		if (!Number.isFinite(parsed)) return diffFontSize.current;

		return Math.round(Math.min(Math.max(parsed, MIN_DIFF_FONT_SIZE), MAX_DIFF_FONT_SIZE));
	}
</script>

<CardGroup.Item standalone>
	{#snippet title()}
		{$t("Theme")}
	{/snippet}
	<ThemeSelector {uiState} />
</CardGroup.Item>

<CardGroup.Item alignment="center" standalone>
	{#snippet title()}
		{$t("Default file list mode")}
	{/snippet}
	{#snippet caption()}
		{$t("Set the default file list view (can be changed per location).")}
	{/snippet}
	{#snippet actions()}
		<Select
			maxWidth={120}
			value={defaultFileListMode.current}
			options={[
				{ label: $t("List view"), value: "list" },
				{ label: $t("Tree view"), value: "tree" },
			]}
			onselect={(value) => {
				defaultFileListMode.set(value as "tree" | "list");
			}}
		>
			{#snippet itemSnippet({ item, highlighted })}
				<SelectItem selected={item.value === defaultFileListMode.current} {highlighted}>
					{item.label}
				</SelectItem>
			{/snippet}
		</Select>
	{/snippet}
</CardGroup.Item>

<CardGroup.Item labelFor="pathFirst" standalone>
	{#snippet title()}
		{$t("File path first")}
	{/snippet}
	{#snippet caption()}
		{$t("Display the full file path before the file name in file lists.")}
	{/snippet}
	{#snippet actions()}
		<Toggle
			id="pathFirst"
			checked={pathFirst.current}
			onclick={() => {
				pathFirst.set(!pathFirst.current);
			}}
		/>
	{/snippet}
</CardGroup.Item>

<CardGroup>
	<CardGroup.Item labelFor="allInOneDiff">
		{#snippet title()}
			{$t("All-in-one diff")}
		{/snippet}
		{#snippet caption()}
			{$t("Show a scrollable list of all file diffs instead of only the selected file's diff.")}
		{/snippet}
		{#snippet actions()}
			<Toggle
				id="allInOneDiff"
				checked={allInOneDiff.current}
				onclick={() => {
					allInOneDiff.set(!allInOneDiff.current);
				}}
			/>
		{/snippet}
	</CardGroup.Item>

	{#if allInOneDiff.current}
		<CardGroup.Item labelFor="highlightDiffs">
			{#snippet title()}
				{$t("Highlight active diff")}
			{/snippet}
			{#snippet caption()}
				{$t("Highlight the currently selected file's diff in the all-in-one diff view.")}
			{/snippet}
			{#snippet actions()}
				<Toggle
					id="highlightDiffs"
					checked={highlightDiffs.current}
					onclick={() => {
						highlightDiffs.set(!highlightDiffs.current);
					}}
				/>
			{/snippet}
		</CardGroup.Item>
	{/if}
</CardGroup>

<CardGroup>
	<CardGroup.Item alignment="center">
		{#snippet title()}
			{$t("Diff preview")}
		{/snippet}

		<HunkDiff
			filePath="test.tsx"
			hunkStr={diff}
			{...uiState.pick(
				"tabSize",
				"wrapText",
				"diffFont",
				"diffFontSize",
				"diffLigatures",
				"strongContrast",
				"colorBlindFriendly",
				"inlineUnifiedDiffs",
			)}
		/>
	</CardGroup.Item>

	<CardGroup.Item alignment="center">
		{#snippet title()}
			{$t("Syntax theme (light)")}
		{/snippet}
		{#snippet caption()}
			{$t("Color scheme used for syntax highlighting when the app is in light mode.")}
		{/snippet}
		{#snippet actions()}
			<Select
				maxWidth={200}
				value={syntaxThemeLight.current}
				options={LIGHT_THEMES}
				onselect={(value) => {
					syntaxThemeLight.set(value);
				}}
			>
				{#snippet itemSnippet({ item, highlighted })}
					<SelectItem selected={item.value === syntaxThemeLight.current} {highlighted}>
						{item.label}
					</SelectItem>
				{/snippet}
			</Select>
		{/snippet}
	</CardGroup.Item>

	<CardGroup.Item alignment="center">
		{#snippet title()}
			{$t("Syntax theme (dark)")}
		{/snippet}
		{#snippet caption()}
			{$t("Color scheme used for syntax highlighting when the app is in dark mode.")}
		{/snippet}
		{#snippet actions()}
			<Select
				maxWidth={200}
				value={syntaxThemeDark.current}
				options={DARK_THEMES}
				onselect={(value) => {
					syntaxThemeDark.set(value);
				}}
			>
				{#snippet itemSnippet({ item, highlighted })}
					<SelectItem selected={item.value === syntaxThemeDark.current} {highlighted}>
						{item.label}
					</SelectItem>
				{/snippet}
			</Select>
		{/snippet}
	</CardGroup.Item>

	<CardGroup.Item>
		{#snippet title()}
			{$t("Font family")}
		{/snippet}
		{#snippet caption()}
			{$t(
				"Sets the font for the diff view. The first font name is the default, others are fallbacks.",
			)}
		{/snippet}

		<Textbox
			wide
			value={diffFont.current}
			required
			onchange={(value: string) => {
				diffFont.set(value);
			}}
		/>
	</CardGroup.Item>

	<CardGroup.Item alignment="center">
		{#snippet title()}
			{$t("Font size")}
		{/snippet}
		{#snippet caption()}
			{$t("Font size of the code in the diff view.")}
		{/snippet}

		{#snippet actions()}
			<Textbox
				type="number"
				width={100}
				textAlign="center"
				value={diffFontSize.current.toString()}
				minVal={MIN_DIFF_FONT_SIZE}
				maxVal={MAX_DIFF_FONT_SIZE}
				showCountActions
				onchange={(value: string) => {
					diffFontSize.set(clampDiffFontSize(value));
				}}
				placeholder={diffFontSize.current.toString()}
			/>
		{/snippet}
	</CardGroup.Item>

	<CardGroup.Item labelFor="allowDiffLigatures">
		{#snippet title()}
			{$t("Allow font ligatures")}
		{/snippet}
		{#snippet actions()}
			<Toggle
				id="allowDiffLigatures"
				checked={diffLigatures.current}
				onclick={() => {
					diffLigatures.set(!diffLigatures.current);
				}}
			/>
		{/snippet}
	</CardGroup.Item>

	<CardGroup.Item alignment="center">
		{#snippet title()}
			{$t("Tab size")}
		{/snippet}
		{#snippet caption()}
			{$t("Number of spaces per tab in the diff view.")}
		{/snippet}

		{#snippet actions()}
			<Textbox
				type="number"
				width={100}
				textAlign="center"
				value={tabSize.current.toString()}
				minVal={1}
				maxVal={8}
				showCountActions
				onchange={(value: string) => {
					tabSize.set(parseInt(value) || tabSize.current);
				}}
				placeholder={tabSize.current.toString()}
			/>
		{/snippet}
	</CardGroup.Item>

	<CardGroup.Item labelFor="wrapText">
		{#snippet title()}
			{$t("Soft wrap")}
		{/snippet}
		{#snippet caption()}
			{$t("Soft wrap long lines in the diff view to fit within the viewport.")}
		{/snippet}

		{#snippet actions()}
			<Toggle
				id="wrapText"
				checked={wrapText.current}
				onclick={() => {
					wrapText.set(!wrapText.current);
				}}
			/>
		{/snippet}
	</CardGroup.Item>

	<CardGroup.Item labelFor="strongContrast">
		{#snippet title()}
			{$t("Strong contrast")}
		{/snippet}
		{#snippet caption()}
			{$t("Use stronger contrast for added, deleted, and context lines in diffs.")}
		{/snippet}
		{#snippet actions()}
			<Toggle
				id="strongContrast"
				checked={strongContrast.current}
				onclick={() => {
					strongContrast.set(!strongContrast.current);
				}}
			/>
		{/snippet}
	</CardGroup.Item>

	<CardGroup.Item labelFor="colorBlindFriendly">
		{#snippet title()}
			{$t("Color blind-friendly colors")}
		{/snippet}
		{#snippet caption()}
			{$t("Use blue and orange colors instead of green and red for better")}
			<br />
			{$t("accessibility with color vision deficiency.")}
		{/snippet}
		{#snippet actions()}
			<Toggle
				id="colorBlindFriendly"
				checked={colorBlindFriendly.current}
				onclick={() => {
					colorBlindFriendly.set(!colorBlindFriendly.current);
				}}
			/>
		{/snippet}
	</CardGroup.Item>

	<CardGroup.Item labelFor="inlineUnifiedDiffs">
		{#snippet title()}
			{$t("Display word diffs inline")}
		{/snippet}
		{#snippet caption()}
			{$t(
				"Instead of separate lines for removals and additions, this feature shows a single line with both added and removed words highlighted.",
			)}
		{/snippet}
		{#snippet actions()}
			<Toggle
				id="inlineUnifiedDiffs"
				checked={inlineUnifiedDiffs.current}
				onclick={() => {
					inlineUnifiedDiffs.set(!inlineUnifiedDiffs.current);
				}}
			/>
		{/snippet}
	</CardGroup.Item>

	<CardGroup.Item labelFor="svgAsImage">
		{#snippet title()}
			{$t("Preview SVG files as images")}
		{/snippet}
		{#snippet caption()}
			{$t("Show SVG file changes as an image diff instead of a code diff.")}
		{/snippet}
		{#snippet actions()}
			<Toggle
				id="svgAsImage"
				checked={svgAsImage.current}
				onclick={() => {
					svgAsImage.set(!svgAsImage.current);
				}}
			/>
		{/snippet}
	</CardGroup.Item>
</CardGroup>

<CardGroup>
	<form class="stack-v" onchange={(e) => onScrollbarFormChange(e.currentTarget)}>
		<CardGroup.Item labelFor="scrollbar-on-scroll">
			{#snippet title()}
				{$t("Scrollbar-On-Scroll")}
			{/snippet}
			{#snippet caption()}
				{$t("Only show the scrollbar when you are scrolling.")}
			{/snippet}
			{#snippet actions()}
				<RadioButton
					name="scrollBarVisibilityType"
					value="scroll"
					id="scrollbar-on-scroll"
					checked={scrollbarVisibilityState.current === "scroll"}
				/>
			{/snippet}
		</CardGroup.Item>

		<CardGroup.Item labelFor="scrollbar-on-hover">
			{#snippet title()}
				{$t("Scrollbar-On-Hover")}
			{/snippet}
			{#snippet caption()}
				{$t("Show the scrollbar only when you hover over the scrollable area.")}
			{/snippet}
			{#snippet actions()}
				<RadioButton
					name="scrollBarVisibilityType"
					value="hover"
					id="scrollbar-on-hover"
					checked={scrollbarVisibilityState.current === "hover"}
				/>
			{/snippet}
		</CardGroup.Item>

		<CardGroup.Item labelFor="scrollbar-always">
			{#snippet title()}
				{$t("Always show scrollbar")}
			{/snippet}
			{#snippet actions()}
				<RadioButton
					name="scrollBarVisibilityType"
					value="always"
					id="scrollbar-always"
					checked={scrollbarVisibilityState.current === "always"}
				/>
			{/snippet}
		</CardGroup.Item>
	</form>
</CardGroup>
