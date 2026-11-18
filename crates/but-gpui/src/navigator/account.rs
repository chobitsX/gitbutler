//! The top of the navigator's right end: New version, while the update card is put off, and
//! the menu of Settings and the GitButler account.

use gpui::{AnyElement, App, ClickEvent, Context, div, prelude::*};

use super::Navigator;
use crate::overlays::MenuItem;
use crate::theme::Theme;
use crate::ui::Text;
use crate::ui::person::account_avatar;
use crate::ui::{ButtonStyle, Icon, button, dp, icon_button, picture_button};

impl Navigator {
    /// New version, standing in for the update card while Later puts it off, and how far
    /// installing it has got once it installs; a click brings the card back. Not "Update",
    /// which a project's row says for bringing in its target's new commits.
    pub(super) fn update_button(&self, cx: &mut Context<Self>) -> Option<AnyElement> {
        let store = self.store.read(cx);
        let put_off = store.update_put_off.is_some();
        let version = store.newer_version.clone().filter(|_| put_off)?;
        let progress = store.update_progress();
        let updating = progress.is_some();
        let label = progress.unwrap_or_else(|| "New version".to_owned());
        let update = button("update-app", label)
            .small()
            .style(ButtonStyle::Gray)
            .tooltip(crate::i18n::tf(
                "navigator-account-update",
                &[("version", (version).into())],
            ))
            .on_click(cx.listener(|this, _, _, cx| {
                this.store.update(cx, |store, cx| store.show_update(cx))
            }))
            .into_any_element();
        if !updating {
            return Some(update);
        }
        // The percent changes its width as it counts, which would shift the filter beside it,
        // so while it installs it keeps the room of its widest label, sized as a small button's.
        // Plain text, as a hidden button would still be announced by a screen reader.
        let room = div()
            .invisible()
            .h(dp(20.))
            .px(dp(6.))
            .text_12()
            .semibold()
            .whitespace_nowrap()
            .child(crate::i18n::t("navigator-account-downloading-100"));
        Some(
            div()
                .relative()
                .child(room)
                .child(div().absolute().top_0().right_0().child(update))
                .into_any_element(),
        )
    }

    /// Settings and the GitButler account in one menu, there signed in or out on every
    /// platform, as only macOS has a menu bar. Signed in, it shows who as its picture.
    pub(super) fn settings_button(&self, theme: &Theme, cx: &Context<Self>) -> AnyElement {
        let account = &self.store.read(cx).account;
        let button = match &account.user {
            Some(user) => picture_button(
                "settings-menu",
                account_avatar(user, account.avatar.clone(), 18., theme),
            ),
            None => icon_button("settings-menu", Icon::Settings),
        };
        button
            .small()
            .tooltip(crate::i18n::t("navigator-account-settings"))
            .on_click(cx.listener(|this, event: &ClickEvent, _, cx| {
                this.open_menu(event.position(), |this, cx| this.settings_menu(cx), cx)
            }))
            .into_any_element()
    }

    fn settings_menu(&self, cx: &App) -> Vec<MenuItem> {
        let account = match &self.store.read(cx).account.user {
            Some(user) => {
                let who = user.login.as_ref().unwrap_or(&user.name);
                MenuItem::new(
                    crate::i18n::tf(
                        "navigator-account-sign-out",
                        &[("who", (who.to_string()).into())],
                    ),
                    |app, _, cx| app.store.update(cx, |store, cx| store.sign_out(cx)),
                )
            }
            None => MenuItem::new(
                crate::i18n::t("navigator-account-sign"),
                |app, window, cx| app.sign_in(window, cx),
            ),
        };
        Vec::from([
            MenuItem::action(
                crate::i18n::t("navigator-account-settings"),
                &crate::settings::OpenSettings,
                cx,
            ),
            account.separated(),
        ])
    }
}
