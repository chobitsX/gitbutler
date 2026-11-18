# Native UI translations

The GPUI client uses [Fluent](https://projectfluent.org/) through
`fluent-templates`. `en-US/main.ftl` is the English fallback; `zh-CN/main.ftl`
contains Simplified Chinese. These resources are embedded in the native binary.

- Use stable semantic message IDs at call sites. Changing English wording does
  not require renaming an ID. Keep source/context comments useful to translators.
- Translate complete sentences. Use Fluent variables for paths, names and counts;
  pass numeric values as numbers so Fluent can select CLDR plural categories.
- Commands have a `.menu` attribute for native menu wording, separate from their
  palette title. `PLATFORM()` returns `macos`, `windows` or `linux` for platform copy.
- Keep repository data, provider output, user menu overrides and command examples
  literal. Never look up an arbitrary English string as a translation key.
- Preserve variable names and the welcome notice's named `<privacy>` and
  `<opt-out>` overlays. The native renderer owns their destinations; the resource
  can reorder the links within the complete sentence.
- Date patterns use the existing `chrono` strftime syntax. Preserve their date
  fields. Fluent's standard bidirectional isolation remains enabled for arguments.

The adapter only joins Fluent to the existing native preference and redraw path.
It caches argument-free messages for GPUI's render APIs; it does not implement
interpolation, plural rules or locale fallback. The saved `en` / `zh-CN` preference
applies immediately and is restored at startup. Existing installations default to
English. Svelte, web, CLI/TUI and SDK contracts are independent and unchanged.

Run resource, argument, formatting and preference tests with:

```sh
cargo test -p but-gpui --lib i18n --features gpui_platform/runtime_shaders
```

After adding Chinese characters, regenerate the bundled static fallback font
using `crates/but-ui-gpui/assets/fonts/cut-cjk.py` with the upstream
[Noto Sans CJK SC Regular OTF](https://github.com/notofonts/noto-cjk/blob/main/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Regular.otf)
and `zh-CN/main.ftl`. Its SIL OFL license is bundled beside it;
Latin text continues to use Inter. Inspect both languages with the scripted GPUI
runner described in `.agents/skills/gpui-screenshots/SKILL.md`.
