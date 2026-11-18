import LanguageSettings from "$components/settings/LanguageSettings.svelte";
import "$lib/i18n";
import { syncLanguage } from "$lib/i18n/language.svelte";
import { ClientState } from "$lib/state/clientState.svelte";
import { UiState, UI_STATE, uiStateSlice } from "$lib/state/uiState.svelte";
import { reactive } from "@gitbutler/shared/reactiveUtils.svelte";
import { setLanguage } from "@gitbutler/ui-svelte/utils/i18n";
import { render, screen, waitFor, cleanup } from "@testing-library/svelte";
import userEvent from "@testing-library/user-event";
import { tick } from "svelte";
import { afterEach, beforeEach, expect, test, vi } from "vitest";
import type { IBackend } from "$lib/backend";
import type { PostHogWrapper } from "$lib/telemetry/posthog";

const roots: Array<() => void> = [];

vi.mock("@sentry/sveltekit", () => ({ captureException: vi.fn() }));

beforeEach(() => {
	localStorage.clear();
	vi.stubGlobal(
		"ResizeObserver",
		class {
			observe() {}
			unobserve() {}
			disconnect() {}
		},
	);
});

afterEach(() => {
	cleanup();
	roots.splice(0).forEach((dispose) => dispose());
	setLanguage("en");
	vi.unstubAllGlobals();
});

async function startSettings() {
	let clientState!: ClientState;
	let uiState!: UiState;
	const dispose = $effect.root(() => {
		clientState = new ClientState({} as IBackend, {} as PostHogWrapper);
		uiState = new UiState(
			reactive(() => clientState.uiState ?? uiStateSlice.getInitialState()),
			clientState.dispatch,
		);
		syncLanguage(uiState.global.language);
	});
	roots.push(dispose);
	await clientState.initPersist();
	await tick();
	const view = render(LanguageSettings, {
		context: new Map([[UI_STATE._key, uiState]]),
	});
	return { uiState, view, dispose };
}

test("switches immediately, persists the selection, and restores it in a fresh application state", async () => {
	const user = userEvent.setup();
	const first = await startSettings();
	expect(screen.getByText("Language", { exact: true })).toBeVisible();
	await user.click(screen.getByLabelText("Language", { exact: true }));
	await user.click(screen.getByText("简体中文", { exact: true }));
	expect(await screen.findByText("语言", { exact: true })).toBeVisible();
	expect(document.documentElement.lang).toBe("zh-CN");
	expect(first.uiState.global.language.current).toBe("zh-CN");
	await waitFor(() => expect(localStorage.getItem("persist:uiState")).toContain("zh-CN"));
	first.view.unmount();
	first.dispose();
	roots.splice(roots.indexOf(first.dispose), 1);

	const second = await startSettings();
	expect(second.uiState.global.language.current).toBe("zh-CN");
	expect(screen.getByText("语言", { exact: true })).toBeVisible();
	await user.click(screen.getByLabelText("语言", { exact: true }));
	await user.click(screen.getByText("English", { exact: true }));
	expect(await screen.findByText("Language", { exact: true })).toBeVisible();
	expect(document.documentElement.lang).toBe("en");
	expect(second.uiState.global.language.current).toBe("en");
});
