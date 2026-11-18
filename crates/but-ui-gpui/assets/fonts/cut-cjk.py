#!/usr/bin/env python3
"""Cut the bundled static Chinese fallback from Noto Sans CJK SC Regular (SIL OFL)."""

import argparse
from pathlib import Path

from fontTools import subset
from fontTools.ttLib import TTFont


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("catalog", type=Path)
    args = parser.parse_args()
    characters = set("简体中文" + args.catalog.read_text())
    font = TTFont(args.source)
    options = subset.Options()
    options.name_IDs = ["*"]
    options.name_legacy = True
    options.name_languages = ["*"]
    cutter = subset.Subsetter(options=options)
    cutter.populate(unicodes={ord(c) for c in characters})
    cutter.subset(font)
    # A modified OFL font gets a distinct family, avoiding installed-font name collisions.
    names = font["name"]
    for record in list(names.names):
        if record.nameID in (1, 4, 6, 16, 17):
            names.names.remove(record)
    for name_id, value in {
        1: "GitButler CJK",
        4: "GitButler CJK Regular",
        6: "GitButlerCJK-Regular",
        16: "GitButler CJK",
        17: "Regular",
    }.items():
        names.setName(value, name_id, 3, 1, 0x409)
    cff = font["CFF "].cff
    cff.fontNames = ["GitButlerCJK-Regular"]
    top = cff.topDictIndex[0]
    top.FullName = "GitButler CJK Regular"
    top.FamilyName = "GitButler CJK"
    output = Path(__file__).with_name("GitButlerCJK-Regular.otf")
    font.save(output)
    cmap = font.getBestCmap()
    missing = sorted(c for c in characters if ord(c) >= 0x3000 and ord(c) not in cmap)
    # Emoji use their system colour font; CJK text must be in the bundled face.
    missing = [c for c in missing if 0x3000 <= ord(c) <= 0x9FFF]
    if missing:
        raise SystemExit("Missing Chinese glyphs: " + "".join(missing))
    print(f"{output.name}: {output.stat().st_size} bytes, {len(cmap)} glyph mappings")


if __name__ == "__main__":
    main()
