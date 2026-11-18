import dayjs from "dayjs";
import type { Language } from "@gitbutler/ui-svelte/utils/i18n";

export function toHumanReadableTime(d: Date, language: Language = "en") {
	return d.toLocaleTimeString(language, {
		hour: "numeric",
		minute: "numeric",
	});
}

export function msSinceDaysAgo(days: number) {
	return Math.abs(dayjs().subtract(days, "day").endOf("day").diff(dayjs(), "millisecond"));
}
