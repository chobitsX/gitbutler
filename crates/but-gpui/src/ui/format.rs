//! Text for times, counts, paths and errors, as every surface words them.

use crate::i18n::{Language, language};
use gpui::SharedString;

/// Seconds since the epoch.
pub fn now() -> i64 {
    std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map(|d| d.as_secs() as i64)
        .unwrap_or_default()
}

/// Whether `seconds` (since the epoch) is within two minutes of now: not much later either,
/// as a file a clock that's off dated years ahead.
pub fn just_now(seconds: i64) -> bool {
    (now() - seconds).abs() < 120
}

/// A commit's title as shown, with a stand-in when its message is empty.
pub fn commit_title(title: &str) -> SharedString {
    match title {
        "" => crate::i18n::t("ui-format-no-message").into(),
        title => title.to_owned().into(),
    }
}

/// The kind of quantity being displayed. Grammar lives in Fluent, not in Rust.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Count {
    Branch,
    Commit,
    File,
    Line,
    ConflictedCommit,
    ConflictedFile,
    Fix,
    Release,
    Match,
    Change,
    MoreFile,
    UnpushedCommit,
    UncommittedFile,
    UnmodifiedLine,
    Part,
    Comment,
    Conflict,
    LinkedWorktree,
    Worktree,
    Edit,
    Check,
    ChangedFile,
    PullRequest,
}

impl Count {
    fn message_id(self) -> &'static str {
        match self {
            Self::Branch => "count-branches",
            Self::Commit => "count-commits",
            Self::File => "count-files",
            Self::Line => "count-lines",
            Self::ConflictedCommit => "count-conflicted-commits",
            Self::ConflictedFile => "count-conflicted-files",
            Self::Fix => "count-fixes",
            Self::Release => "count-releases",
            Self::Match => "count-matches",
            Self::Change => "count-changes",
            Self::MoreFile => "count-more-files",
            Self::UnpushedCommit => "count-unpushed-commits",
            Self::UncommittedFile => "count-uncommitted-files",
            Self::UnmodifiedLine => "count-unmodified-lines",
            Self::Part => "count-parts",
            Self::Comment => "count-comments",
            Self::Conflict => "count-conflicts",
            Self::LinkedWorktree => "count-linked-worktrees",
            Self::Worktree => "count-worktrees",
            Self::Edit => "count-edits",
            Self::Check => "count-checks",
            Self::ChangedFile => "count-changed-files",
            Self::PullRequest => "count-pull-requests",
        }
    }
}

/// Localized quantities use Fluent/CLDR plural rules and typed numeric arguments.
pub fn plural(n: usize, kind: Count) -> String {
    count_in(language(), n, kind)
}

fn count_in(language: Language, n: usize, kind: Count) -> String {
    language.format(kind.message_id(), &[("count", n.into())])
}

/// `text` quoted in a menu item, cut to 40 characters.
pub fn quoted(text: &str) -> String {
    match text.chars().count() > 40 {
        true => format!("\"{}…\"", text.chars().take(39).collect::<String>()),
        false => format!("\"{text}\""),
    }
}

/// `path` as shown, with the home folder as `~`, so one cut short keeps more of its end.
pub fn short_path(path: &std::path::Path) -> String {
    let home = std::env::var_os("HOME").map(std::path::PathBuf::from);
    match home.and_then(|home| {
        path.strip_prefix(home)
            .ok()
            .map(|rest| rest.display().to_string())
    }) {
        Some(rest) => format!("~/{rest}"),
        None => path.display().to_string(),
    }
}

/// What to show of an error: Git's own complaints when it ran Git, like "fatal: Could not
/// read from remote repository." and why ssh couldn't get there, said just before it, and
/// what the remote said back, as a server's hook does when it refuses a push, as the rest
/// repeats the command it ran; else its first lines, without the codes libgit2 appends
/// ("; class=Index (10); code=Locked (-14)").
pub fn error_summary(text: &str) -> String {
    let lines: Vec<&str> = (text.lines())
        .map(|line| line.split("; class=").next().unwrap_or(line).trim())
        .collect();
    let git = |line: &str| line.starts_with("fatal:") || line.starts_with("error:");
    let mut said: Vec<&str> = Vec::new();
    let mut keep = |line| {
        // Git's line again with a wrapper's ": …" after it keeps its short form.
        let wraps = |long: &str, short: &str| {
            (long.strip_prefix(short)).is_some_and(|rest| rest.is_empty() || rest.starts_with(':'))
        };
        match (said.iter_mut()).find(|said| wraps(said, line) || wraps(line, said)) {
            Some(said) if line.len() < said.len() => *said = line,
            Some(_) => {}
            None => said.push(line),
        }
    };
    for (ix, &line) in lines.iter().enumerate() {
        let (remote, line) = match line.strip_prefix("remote:") {
            Some(said) => (true, said.trim()),
            None => (false, line),
        };
        if line.is_empty() || !(remote || git(line)) {
            continue;
        }
        let before = ix.checked_sub(1).and_then(|ix| lines.get(ix)).copied();
        if line == "fatal: Could not read from remote repository."
            // Not the label a wrapper puts over Git's output, when ssh said nothing.
            && let Some(cause) =
                before.filter(|before| !before.is_empty() && !git(before) && !before.ends_with(':'))
        {
            keep(cause);
        }
        keep(line);
    }
    match said.is_empty() {
        true => lines.get(..4).unwrap_or(&lines).join("\n"),
        false => said.join("\n"),
    }
}

/// A span of `seconds`: "42s", "3m 5s", "1h 12m".
pub fn duration(seconds: i64) -> String {
    match seconds {
        ..60 => format!("{seconds}s"),
        60..3600 => format!("{}m {}s", seconds / 60, seconds % 60),
        _ => format!("{}h {}m", seconds / 3600, seconds % 3600 / 60),
    }
}

/// A localized age. The quantity is numeric, so Fluent owns grammar and unit wording.
pub fn ago(seconds: i64) -> String {
    let delta = (now() - seconds).max(0);
    let language = language();
    if delta < 60 {
        return language.translate("time-just-now").to_owned();
    }
    language.format(
        "time-ago",
        &[("duration", relative_duration(language, delta).into())],
    )
}

pub fn relative_time(seconds: i64) -> String {
    relative_duration(language(), (now() - seconds).max(0))
}

fn relative_duration(language: Language, delta: i64) -> String {
    let (count, id) = match delta {
        0..60 => return language.translate("time-now").to_owned(),
        60..3600 => (delta / 60, "time-minutes-short"),
        3600..86_400 => (delta / 3600, "time-hours-short"),
        86_400..2_592_000 => (delta / 86_400, "time-days-short"),
        2_592_000..31_536_000 => (delta / 2_592_000, "time-months-short"),
        _ => (delta / 31_536_000, "time-years-short"),
    };
    language.format(id, &[("count", count.into())])
}

/// `seconds` (since the epoch) as the time here, the way but.dev dates a commit:
/// "16/10/2026, 21:04".
pub fn local_time(seconds: i64) -> String {
    local(seconds, crate::i18n::t("date-time-format"))
}

/// `seconds` (since the epoch) in `format`, at the time here then: a summer moment keeps
/// summer time in winter.
fn local(seconds: i64, format: &'static str) -> String {
    use chrono::TimeZone as _;
    match chrono::Local.timestamp_opt(seconds, 0).single() {
        Some(at) => at.format(format).to_string(),
        None => seconds.to_string(),
    }
}

/// The time of day `seconds` (since the epoch) fall on here: "14:15".
pub fn local_clock(seconds: i64) -> String {
    local(seconds, "%H:%M")
}

/// The day `seconds` (since the epoch) fall on here, as a short date: "21 Oct".
pub fn local_date(seconds: i64) -> String {
    local(seconds, crate::i18n::t("date-short-format"))
}

/// The same with its weekday: "Wed, 21 Oct".
pub fn local_weekday(seconds: i64) -> String {
    use chrono::{Datelike as _, TimeZone as _, Weekday};
    let Some(at) = chrono::Local.timestamp_opt(seconds, 0).single() else {
        return seconds.to_string();
    };
    let id = match at.weekday() {
        Weekday::Mon => "weekday-mon",
        Weekday::Tue => "weekday-tue",
        Weekday::Wed => "weekday-wed",
        Weekday::Thu => "weekday-thu",
        Weekday::Fri => "weekday-fri",
        Weekday::Sat => "weekday-sat",
        Weekday::Sun => "weekday-sun",
    };
    crate::i18n::tf(
        "date-weekday-format",
        &[
            ("weekday", crate::i18n::t(id).to_owned().into()),
            ("date", local_date(seconds).into()),
        ],
    )
}

/// The day `seconds` (since the epoch) fell on here, to tell one day's from another's.
pub fn local_day(seconds: i64) -> String {
    local(seconds, "%Y-%m-%d")
}

/// The day `seconds` fell on, as Tauri's history heads a day's operations: Today, Yesterday,
/// or the weekday and date, with the year when it isn't this one.
pub fn day_label(seconds: i64) -> String {
    let today = now();
    match local_day(seconds) {
        day if day == local_day(today) => crate::i18n::t("date-today").into(),
        day if day == local_day(today - 86_400) => crate::i18n::t("date-yesterday").into(),
        _ if local(seconds, "%Y") == local(today, "%Y") => local_weekday(seconds),
        _ => local(seconds, crate::i18n::t("date-full-format")),
    }
}

#[cfg(test)]
mod tests {
    use super::error_summary;

    #[test]
    fn i18n_counts_and_relative_times_follow_the_selected_language() {
        use crate::i18n::Language;
        assert_eq!(
            super::count_in(Language::English, 1, super::Count::Branch),
            "\u{2068}1\u{2069} branch",
            "English retains its existing singular wording"
        );
        assert_eq!(
            super::count_in(Language::English, 2, super::Count::Branch),
            "\u{2068}2\u{2069} branches",
            "English retains its existing plural wording"
        );
        assert_eq!(
            super::count_in(Language::SimplifiedChinese, 2, super::Count::Branch),
            "\u{2068}2\u{2069} 个分支",
            "Chinese uses the translated noun and classifier"
        );
        assert_eq!(
            super::count_in(Language::SimplifiedChinese, 0, super::Count::Line),
            "\u{2068}0\u{2069} 行",
            "zero is kept and lines use their own classifier"
        );
        assert_eq!(
            super::relative_duration(Language::English, 300),
            "\u{2068}5\u{2069}m",
            "English relative-time abbreviations are preserved"
        );
        assert_eq!(
            super::relative_duration(Language::SimplifiedChinese, 300),
            "\u{2068}5\u{2069} 分钟",
            "Chinese relative time does not use an English unit"
        );
    }

    #[test]
    fn a_git_failure_shows_what_git_said_once() {
        let failed = "fetching remote `origin` failed: git command exited with code 128:\n\n\
            ARGS:\n[\"fetch\"]\n\nSTDERR:\nfatal: '/x.git' does not appear to be a git repository\n\
            fatal: Could not read from remote repository.\n: git command exited with code 128:\n\n\
            STDERR:\nfatal: '/x.git' does not appear to be a git repository\n";
        assert_eq!(
            error_summary(failed),
            "fatal: '/x.git' does not appear to be a git repository\n\
             fatal: Could not read from remote repository.",
            "Git's own lines, each once"
        );
        let rejected = "error: remote unpack failed\n ! [remote rejected] a -> b\n\
            error: failed to push some refs to '/u.git': git command exited with code 1:\n\n\
            STDERR:\nerror: remote unpack failed\nerror: failed to push some refs to '/u.git'\n";
        assert_eq!(
            error_summary(rejected),
            "error: remote unpack failed\nerror: failed to push some refs to '/u.git'",
            "a line repeated with the wrapper's words after it, in its short form"
        );
        let declined = "git command exited with non-zero exit code 1:\nSTDERR:\n\
            remote: pushes are frozen for the release        \n\
            ! [remote rejected] a -> b (pre-receive hook declined)\n\
            error: failed to push some refs to '/u.git'\n";
        assert_eq!(
            error_summary(declined),
            "pushes are frozen for the release\nerror: failed to push some refs to '/u.git'",
            "the remote's reason, as its hook gave it"
        );
        let denied = "fetching remote `origin` failed: git command exited with code 128:\n\n\
            STDERR:\ngit@github.com: Permission denied (publickey).\n\
            fatal: Could not read from remote repository.\n\n\
            Please make sure you have the correct access rights\nand the repository exists.\n";
        assert_eq!(
            error_summary(denied),
            "git@github.com: Permission denied (publickey).\n\
             fatal: Could not read from remote repository.",
            "why ssh couldn't get in, which Git gives up after"
        );
        let silent = "git command exited with code 128:\n\nSTDERR:\n\
            fatal: Could not read from remote repository.\n";
        assert_eq!(
            error_summary(silent),
            "fatal: Could not read from remote repository.",
            "not the wrapper's label over Git's output, when ssh said nothing"
        );
        assert_eq!(
            error_summary("the index is locked; class=Index (10); code=Locked (-14)"),
            "the index is locked",
            "without libgit2's codes"
        );
        assert_eq!(
            error_summary("Branch not found\nmore\nand more\nstill\ncut"),
            "Branch not found\nmore\nand more\nstill",
            "any other error by its first lines"
        );
    }
}
