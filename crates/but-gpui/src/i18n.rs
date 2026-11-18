//! The native UI's Fluent adapter. Fluent owns parsing, argument formatting, plural rules,
//! locale negotiation and English fallback. This module only connects the saved preference
//! and caches argument-free messages, keeping GPUI's render path allocation-free.

use std::borrow::Cow;
use std::collections::HashMap;
use std::sync::LazyLock;
use std::sync::atomic::{AtomicU8, Ordering};

use fluent_syntax::ast;
use fluent_templates::{Loader, static_loader};
use serde::{Deserialize, Serialize};
use unic_langid::{LanguageIdentifier, langid};

pub use fluent_templates::fluent_bundle::FluentValue as Value;
pub type Argument<'a> = (&'static str, Value<'a>);

static_loader! {
    static LOCALES = {
        locales: "./locales",
        fallback_language: "en-US",
        customise: |bundle| {
            if let Err(error) = bundle.add_builtins() {
                tracing::error!(%error, "couldn't register Fluent builtins");
            }
            // Platform names in native menus are a presentation detail, not a translation rule.
            if let Err(error) = bundle.add_function("PLATFORM", |_, _| std::env::consts::OS.into()) {
                tracing::error!(%error, "couldn't register the Fluent platform function");
            }
        }
    };
}

const ENGLISH: &str = include_str!("../locales/en-US/main.ftl");
static EN: LanguageIdentifier = langid!("en-US");
static ZH: LanguageIdentifier = langid!("zh-CN");

#[derive(Debug, Clone, Copy, Default, PartialEq, Eq, Serialize, Deserialize)]
pub enum Language {
    #[default]
    #[serde(rename = "en")]
    English,
    #[serde(rename = "zh-CN")]
    SimplifiedChinese,
}

impl Language {
    pub const ALL: [Self; 2] = [Self::English, Self::SimplifiedChinese];

    /// Autonyms stay readable whichever language is currently selected.
    pub fn label(self) -> &'static str {
        match self {
            Self::English => "English",
            Self::SimplifiedChinese => "简体中文",
        }
    }

    fn locale(self) -> &'static LanguageIdentifier {
        match self {
            Self::English => &EN,
            Self::SimplifiedChinese => &ZH,
        }
    }

    fn messages(self) -> &'static StaticMessages {
        match self {
            Self::English => &MESSAGES.english,
            Self::SimplifiedChinese => &MESSAGES.chinese,
        }
    }

    pub fn translate(self, id: &'static str) -> &'static str {
        self.messages()
            .values
            .get(id)
            .map(String::as_str)
            .unwrap_or(id)
    }

    pub fn attribute(self, id: &'static str, attribute: &'static str) -> &'static str {
        self.messages()
            .attributes
            .get(id)
            .and_then(|attributes| attributes.get(attribute))
            .map(String::as_str)
            .unwrap_or_else(|| self.translate(id))
    }

    pub fn format(self, id: &'static str, params: &[Argument<'_>]) -> String {
        let args: HashMap<_, _> = params
            .iter()
            .map(|(name, value)| (Cow::Borrowed(*name), value.clone()))
            .collect();
        LOCALES
            .try_lookup_with_args(self.locale(), id, &args)
            .unwrap_or_else(|| {
                // Diagnostics never include argument values, which may hold repository data.
                tracing::warn!(message_id = id, "couldn't format a native UI message");
                english(id).to_owned()
            })
    }
}

static LANGUAGE: AtomicU8 = AtomicU8::new(0);

pub fn language() -> Language {
    match LANGUAGE.load(Ordering::Relaxed) {
        1 => Language::SimplifiedChinese,
        _ => Language::English,
    }
}

pub fn set_language(language: Language) {
    LANGUAGE.store(
        match language {
            Language::English => 0,
            Language::SimplifiedChinese => 1,
        },
        Ordering::Relaxed,
    );
}

pub fn t(id: &'static str) -> &'static str {
    language().translate(id)
}

pub fn english(id: &'static str) -> &'static str {
    Language::English.translate(id)
}

pub fn tf(id: &'static str, params: &[Argument<'_>]) -> String {
    language().format(id, params)
}

#[derive(Default)]
struct StaticMessages {
    values: HashMap<String, String>,
    attributes: HashMap<String, HashMap<String, String>>,
}

struct Messages {
    english: StaticMessages,
    chinese: StaticMessages,
}

static MESSAGES: LazyLock<Messages> = LazyLock::new(|| Messages {
    english: static_messages(Language::English),
    chinese: static_messages(Language::SimplifiedChinese),
});

/// Enumerate IDs with Fluent's AST, then let the standard loader resolve them. Messages
/// requiring arguments are not cached here; `format` passes typed values to Fluent instead.
fn static_messages(language: Language) -> StaticMessages {
    let mut result = StaticMessages::default();
    let Ok(resource) = fluent_syntax::parser::parse(ENGLISH) else {
        tracing::error!("the embedded English Fluent resource is invalid");
        return result;
    };
    for entry in resource.body {
        let ast::Entry::Message(message) = entry else {
            continue;
        };
        let id = message.id.name;
        if let Some(value) = LOCALES.try_lookup(language.locale(), id) {
            result.values.insert(id.to_owned(), value);
        }
        for attribute in message.attributes {
            let name = attribute.id.name;
            if let Some(value) = LOCALES.try_lookup(language.locale(), &format!("{id}.{name}")) {
                result
                    .attributes
                    .entry(id.to_owned())
                    .or_default()
                    .insert(name.to_owned(), value);
            }
        }
    }
    result
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::{BTreeMap, BTreeSet};

    fn variables(pattern: &ast::Pattern<&str>, names: &mut BTreeSet<String>) {
        for element in &pattern.elements {
            if let ast::PatternElement::Placeable { expression: value } = element {
                expression(value, names);
            }
        }
    }

    fn expression(value: &ast::Expression<&str>, names: &mut BTreeSet<String>) {
        match value {
            ast::Expression::Inline(value) => inline(value, names),
            ast::Expression::Select { selector, variants } => {
                inline(selector, names);
                for variant in variants {
                    variables(&variant.value, names);
                }
            }
        }
    }

    fn inline(value: &ast::InlineExpression<&str>, names: &mut BTreeSet<String>) {
        match value {
            ast::InlineExpression::VariableReference { id } => {
                names.insert(id.name.to_owned());
            }
            ast::InlineExpression::FunctionReference { arguments, .. } => {
                arguments_in(arguments, names)
            }
            ast::InlineExpression::TermReference {
                arguments: Some(arguments),
                ..
            } => arguments_in(arguments, names),
            ast::InlineExpression::Placeable { expression: value } => expression(value, names),
            _ => {}
        }
    }

    fn arguments_in(arguments: &ast::CallArguments<&str>, names: &mut BTreeSet<String>) {
        for value in &arguments.positional {
            inline(value, names);
        }
        for argument in &arguments.named {
            inline(&argument.value, names);
        }
    }

    fn schemas(source: &str) -> BTreeMap<String, BTreeSet<String>> {
        let resource = fluent_syntax::parser::parse(source).expect("valid Fluent syntax");
        let mut schemas = BTreeMap::new();
        for entry in resource.body {
            let ast::Entry::Message(message) = entry else {
                continue;
            };
            let mut names = BTreeSet::new();
            if let Some(value) = message.value {
                variables(&value, &mut names);
            }
            assert!(
                schemas.insert(message.id.name.to_owned(), names).is_none(),
                "unique message IDs"
            );
            for attribute in message.attributes {
                let mut names = BTreeSet::new();
                variables(&attribute.value, &mut names);
                schemas.insert(format!("{}.{}", message.id.name, attribute.id.name), names);
            }
        }
        schemas
    }

    #[test]
    fn resource_arguments_match_and_every_pattern_formats_without_fallback() {
        let en = schemas(ENGLISH);
        let zh = schemas(include_str!("../locales/zh-CN/main.ftl"));
        assert_eq!(
            en, zh,
            "translations retain argument names, including nested selectors"
        );
        for (id, names) in &en {
            let args: HashMap<_, _> = names
                .iter()
                .map(|name| {
                    let value = if name == "count" {
                        Value::from(2)
                    } else {
                        Value::from("General {literal}")
                    };
                    (name.as_str(), value)
                })
                .collect();
            for language in Language::ALL {
                let rendered = LOCALES.lookup_single_language(language.locale(), id, Some(&args));
                assert!(
                    rendered.is_ok(),
                    "{language:?} {id} must format directly: {rendered:?}"
                );
            }
        }
    }

    #[test]
    fn fallback_is_english_and_arguments_are_literal_user_data() {
        assert_eq!(
            LOCALES.try_lookup(&langid!("fr-FR"), "settings-language-label"),
            Some("Language".into()),
            "the standard loader falls back to English for an unavailable locale"
        );
        let title = "General {$count} Settings";
        for language in Language::ALL {
            let rendered = language.format("detail-branches-describe", &[("name", title.into())]);
            assert!(
                rendered.contains(title),
                "repository data is literal, never another lookup or pattern"
            );
        }
    }

    #[test]
    fn language_preference_keeps_its_existing_serialized_values() {
        assert_eq!(
            Language::default(),
            Language::English,
            "old native preferences keep English"
        );
        for (language, json) in [
            (Language::English, "\"en\""),
            (Language::SimplifiedChinese, "\"zh-CN\""),
        ] {
            assert_eq!(
                serde_json::to_string(&language).expect("a unit enum serializes"),
                json,
                "the Fluent migration does not change saved language codes"
            );
            assert_eq!(
                serde_json::from_str::<Language>(json).expect("a known language"),
                language,
                "the language survives a restart"
            );
        }
    }

    #[test]
    fn resources_are_valid_fluent_with_the_same_message_ids() {
        fn keys(source: &str) -> std::collections::BTreeSet<String> {
            let resource = fluent_syntax::parser::parse(source).expect("valid Fluent syntax");
            let mut keys = std::collections::BTreeSet::new();
            for entry in resource.body {
                let ast::Entry::Message(message) = entry else {
                    continue;
                };
                assert!(
                    keys.insert(message.id.name.to_owned()),
                    "message IDs are unique"
                );
                for attribute in message.attributes {
                    keys.insert(format!("{}.{}", message.id.name, attribute.id.name));
                }
            }
            keys
        }
        assert_eq!(
            keys(ENGLISH),
            keys(include_str!("../locales/zh-CN/main.ftl")),
            "translators provide the same messages and contextual attributes"
        );
    }

    #[test]
    fn language_switch_uses_standard_fluent_messages() {
        assert_eq!(
            Language::English.translate("settings-language-label"),
            "Language",
            "English is rendered from the fallback resource"
        );
        assert_eq!(
            Language::SimplifiedChinese.translate("settings-language-label"),
            "语言",
            "Chinese is rendered from its Fluent resource"
        );
    }

    #[test]
    fn commands_have_message_and_menu_contexts_in_both_languages() {
        for language in Language::ALL {
            let mut seen = BTreeSet::new();
            for command in crate::commands::COMMANDS {
                assert!(
                    seen.insert(language.translate(command.message_id())),
                    "{language:?} command titles must distinguish every action: {}",
                    command.message_id()
                );
            }
        }
        for command in crate::commands::COMMANDS {
            for language in Language::ALL {
                let id = command.message_id();
                assert!(
                    language.messages().values.contains_key(id),
                    "{id} has a command title"
                );
                assert!(
                    language
                        .messages()
                        .attributes
                        .get(id)
                        .is_some_and(|a| a.contains_key("menu")),
                    "{id} has a separate native-menu context"
                );
            }
        }
    }
}
