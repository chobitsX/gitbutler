//! The Mesh row on General: whether this machine is in the mesh of the user's machines, and a
//! way in or out. Everything else the mesh does is in `state/mesh.rs`.

use gpui::{AnyElement, ClickEvent, Context, SharedString, prelude::*};

use super::{Row, SettingsView};
use crate::state::MeshState;
use crate::ui::{ButtonStyle, button};

impl SettingsView {
    pub(super) fn mesh_row(&self, cx: &Context<Self>) -> Row {
        let mesh = &self.store.read(cx).mesh;
        let (description, control): (SharedString, Option<AnyElement>) = match &mesh.state {
            MeshState::Unknown => (crate::i18n::t("settings-mesh-checking").into(), None),
            MeshState::Unavailable(why) => (
                match why {
                    crate::state::MeshUnavailable::NotInstalled => {
                        crate::i18n::t("settings-mesh-not-installed").into()
                    }
                    crate::state::MeshUnavailable::Other(why) => why.clone().into(),
                },
                None,
            ),
            MeshState::SignedOut if mesh.signing_in => (
                crate::i18n::t("settings-mesh-approve-machine-page-opened").into(),
                Some(
                    button("mesh-sign-in", crate::i18n::t("settings-mesh-signing"))
                        .small()
                        .disabled_because(Some(crate::i18n::t("settings-mesh-waiting-browser")))
                        .into_any_element(),
                ),
            ),
            MeshState::SignedOut => (
                crate::i18n::t("settings-mesh-mesh-row-sign-see-unfinished-work").into(),
                Some(
                    button("mesh-sign-in", crate::i18n::t("settings-mesh-sign"))
                        .small()
                        .on_click(cx.listener(|this, _: &ClickEvent, _, cx| {
                            this.store.update(cx, |store, cx| store.mesh_sign_in(cx))
                        }))
                        .into_any_element(),
                ),
            ),
            MeshState::Connected(connection) => {
                let reporting = match connection.daemon_running {
                    true => "Projects you watch here show on your other machines.",
                    false => {
                        "Its daemon isn't running, so your other machines don't see this \
                              one's work. Run `but mesh service restart`."
                    }
                };
                let machine = connection.machine.clone();
                (
                    crate::i18n::tf(
                        "settings-mesh-signed",
                        &[
                            ("login", (connection.login.to_string()).into()),
                            ("machine", (connection.machine.to_string()).into()),
                            ("reporting", (reporting.to_string()).into()),
                        ],
                    )
                    .into(),
                    Some(
                        button("mesh-sign-out", crate::i18n::t("settings-mesh-sign-out"))
                            .small()
                            .style(ButtonStyle::Ghost)
                            .on_click(cx.listener(move |this, _: &ClickEvent, window, cx| {
                                let store = this.store.clone();
                                let message = crate::i18n::tf(
                                    "settings-mesh-take-out-mesh",
                                    &[("machine", (machine.to_string()).into())],
                                );
                                this.app.update_later(window, cx, move |app, window, cx| {
                                    app.confirm_then(
                                        None,
                                        message,
                                        crate::i18n::t(
                                            "settings-mesh-mesh-row-daemon-stops-other-machines",
                                        ),
                                        crate::i18n::t("settings-mesh-sign-out"),
                                        window,
                                        cx,
                                        move |_, cx| {
                                            store.update(cx, |store, cx| store.mesh_sign_out(cx))
                                        },
                                    )
                                });
                            }))
                            .into_any_element(),
                    ),
                )
            }
        };
        Row::new(
            crate::i18n::t("settings-mesh-mesh-label"),
            description,
            control.unwrap_or_else(|| gpui::div().into_any_element()),
        )
    }
}
