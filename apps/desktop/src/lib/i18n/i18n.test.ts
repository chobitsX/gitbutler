import { nativeMenuMessages, localizeNativeMenu } from "$lib/i18n/nativeMenu";
import zhCN from "$lib/i18n/zh-CN.json";
import { generalSettingsPages } from "$lib/settings/generalSettingsPages";
import { projectSettingsPages } from "$lib/settings/projectSettingsPages";
import { createI18n, resolveLanguage } from "@gitbutler/ui-svelte/utils/i18n";
import { getTimeAgo } from "@gitbutler/ui-svelte/utils/timeAgo";
import { parse } from "svelte/compiler";
import { get } from "svelte/store";
import { describe, expect, test, vi } from "vitest";
import { readFileSync, readdirSync } from "node:fs";
import path from "node:path";
import type { IBackend } from "$lib/backend";

describe("internationalization", () => {
	test("switches existing subscribers both ways and falls back to the English source", () => {
		const i18n = createI18n();
		i18n.registerMessages("zh-CN", zhCN);
		const values: string[] = [];
		const unsubscribe = i18n.t.subscribe((t) => values.push(t("Global settings")));

		i18n.setLanguage("zh-CN");
		expect(i18n.translate("Global settings")).toBe("全局设置");
		expect(i18n.translate("A future message")).toBe("A future message");
		i18n.setLanguage("en");
		expect(values).toEqual(["Global settings", "全局设置", "Global settings"]);
		unsubscribe();
	});

	test("interpolates values literally and does not reinterpret user content as a message", () => {
		const i18n = createI18n();
		i18n.registerMessages("zh-CN", {
			"Delete {name}, {count}": "删除 {name}，{count}",
			Main: "主分支",
		});
		i18n.setLanguage("zh-CN");
		expect(i18n.translate("Delete {name}, {count}", { name: "Main", count: 0 })).toBe(
			"删除 Main，0",
		);
		expect(i18n.translate("Delete {name}, {count}", { name: "$&<b>{count}</b>" })).toBe(
			"删除 $&<b>{count}</b>，{count}",
		);
		expect(i18n.translate("{value}", { value: undefined })).toBe("");
		expect(i18n.translate("toString")).toBe("toString");
	});

	test("uses English for old, missing, or unsupported language preferences", () => {
		for (const value of [undefined, null, "", "fr", {}, "zh"]) {
			expect(resolveLanguage(value)).toBe("en");
		}
		expect(resolveLanguage("zh-CN")).toBe("zh-CN");
	});

	test("preserves browser-local date formatting for hosts that do not opt into languages", () => {
		const i18n = createI18n();
		expect(get(i18n.formatLocale)).toBeUndefined();
		expect(get(i18n.language)).toBe("en");
		i18n.setLanguage("en");
		expect(get(i18n.formatLocale)).toBe("en");
		i18n.setLanguage("zh-CN");
		expect(get(i18n.formatLocale)).toBe("zh-CN");
	});

	test("formats relative times in the selected language without changing dayjs globally", () => {
		vi.useFakeTimers();
		try {
			vi.setSystemTime(new Date("2026-11-17T08:00:00Z"));
			const earlier = new Date("2026-11-17T07:55:00Z");
			expect(getTimeAgo(earlier, true, "zh-CN")).toBe("5 分钟前");
			expect(getTimeAgo(earlier, true, "en")).toBe("5 min ago");
			expect(getTimeAgo(new Date(), true, "zh-CN")).toBe("刚刚");
		} finally {
			vi.useRealTimers();
		}
	});

	test("has matching interpolation parameters in every Chinese message", () => {
		function placeholders(message: string) {
			return [...message.matchAll(/\{(\w+)\}/g)].map((m) => m[1]).sort();
		}
		for (const [source, translated] of Object.entries(zhCN)) {
			expect(translated.trim(), source).not.toBe("");
			expect(placeholders(translated), source).toEqual(placeholders(source));
		}
	});

	test("covers all static messages used by desktop and shared components", () => {
		const root = path.resolve(import.meta.dirname, "../../../../..");
		const roots = [
			path.join(root, "apps/desktop/src"),
			path.join(root, "packages/ui-svelte/src/lib/components"),
			path.join(root, "packages/ui-svelte/src/lib/richText"),
			path.join(root, "packages/shared/src/lib/organizations"),
			path.join(root, "packages/shared/src/lib/interest"),
		];
		const missing = new Set<string>();
		function messageKeys(node: any) {
			if (node?.type === "Literal" && node.value && !Object.hasOwn(zhCN, node.value)) {
				missing.add(node.value);
			} else if (node?.type === "ConditionalExpression") {
				messageKeys(node.consequent);
				messageKeys(node.alternate);
			}
		}
		function walk(node: any) {
			if (!node || typeof node !== "object") return;
			if (node.type === "CallExpression" && node.callee?.name === "$t") {
				messageKeys(node.arguments[0]);
			}
			for (const [key, value] of Object.entries(node)) {
				if (["metadata", "loc"].includes(key)) continue;
				if (Array.isArray(value)) value.forEach(walk);
				else if (typeof value === "object") walk(value);
			}
		}
		function inspect(directory: string) {
			for (const entry of readdirSync(directory, { withFileTypes: true })) {
				const file = path.join(directory, entry.name);
				if (entry.isDirectory()) inspect(file);
				else if (file.endsWith(".svelte"))
					walk(parse(readFileSync(file, "utf8"), { modern: true }));
			}
		}
		roots.forEach(inspect);
		for (const source of Object.values(nativeMenuMessages)) {
			if (!Object.hasOwn(zhCN, source)) missing.add(source);
		}
		for (const page of [...generalSettingsPages, ...projectSettingsPages]) {
			if (!Object.hasOwn(zhCN, page.label)) missing.add(page.label);
		}
		const menuSource = readFileSync(path.join(root, "crates/gitbutler-tauri/src/menu.rs"), "utf8");
		for (const id of Object.keys(nativeMenuMessages)) {
			expect(menuSource, id).toContain(`"${id}"`);
		}
		expect([...missing]).toEqual([]);
	});

	test("updates native menu labels by stable ID in both languages", async () => {
		const i18n = createI18n();
		i18n.registerMessages("zh-CN", zhCN);
		const invoke = vi.fn().mockResolvedValue(undefined);
		const backend = {
			platformName: "macos",
			currentVersion: async () => "1.0.0",
			invoke,
		} as unknown as IBackend;
		i18n.setLanguage("zh-CN");
		await localizeNativeMenu(backend, get(i18n.t));
		expect(invoke).toHaveBeenLastCalledWith("set_menu_labels", {
			labels: expect.objectContaining({
				"menu/file": "文件",
				"global/settings": "设置",
				"project/show-in-finder": "在访达中显示",
				"help/version": "版本 1.0.0",
			}),
		});
		i18n.setLanguage("en");
		await localizeNativeMenu(backend, get(i18n.t));
		expect(invoke).toHaveBeenLastCalledWith("set_menu_labels", {
			labels: expect.objectContaining({ "menu/file": "File", "global/settings": "Settings" }),
		});
	});
});
