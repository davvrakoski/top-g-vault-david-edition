---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/black-outline-fix"
title: "Fixing Black Outlines on Particle Textures"
tags: [roblox, community, vfx, technique, textures, alpha, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "n/a - technique note"
sources:
  - https://devforum.roblox.com/t/particles-have-black-outlines/2685170
  - https://www.gimp.org/docs/userfaq.html
cssclasses: [tg-a40]
---

# Fixing Black Outlines on Particle Textures

**Symptom:** a free texture looks clean in an image viewer, but in Roblox each particle, decal or beam has a **dark halo or fringe**, which is worst on soft glows and when particles are scaled.

## Why it happens

A Roblox staff member (neutrinostack) explained in a Nov 2023 DevForum thread that this is a limitation of **bilinear filtering**, not a bug. Fully transparent pixels still store a colour, and most editors save them as **black**. When Roblox scales the texture, edge pixels blend with those hidden black pixels. Pre-multiplied alpha would avoid it, but Roblox does not support it.

## Fixes (best first)

| Fix | How | Notes |
|---|---|---|
| **Colour bleeding / dilation** | Fill transparent pixels with the colour of the nearest opaque pixel, and keep alpha unchanged | The staff-recommended approach |
| **GIMP "Value Propagate"** | *Filters -> Distorts -> Value Propagate*, run on a copy with alpha locked, or on the colour layer only | Recommended by the staff member, who said it removed the outlines in testing. GIMP is free (GPL) |
| **Author in white on transparent** | For greyscale/tintable VFX textures, make the RGB channel solid white everywhere and put the shape only in alpha | Simplest fix: no dark colour exists to bleed in |
| **Padding** | Give each flipbook frame a few px of edge colour, not black, around the shape | Helps flipbooks, where per-image tools may fail |

The thread's first poster noted that a popular community drag-and-drop fixer did **not** fix their transparent flipbooks, so check flipbooks frame by frame after any tool.

## Quick check before upload

1. Reveal the hidden colour of transparent pixels: `magick in.png -alpha off check.png` (ImageMagick, free) and open `check.png`.
2. If the area around the shape is **black**, you will get a fringe in Roblox, so bleed or whiten it.
3. If it is the same colour as the effect (or white), you're fine.

## Related settings in Studio

- `LightEmission = 1` (additive) hides fringes on glowy effects because dark pixels add almost nothing. This was also a suggestion in the 2020 "Finding Particle Emitter Textures" thread. It does **not** fix smoke or dust, which use `LightEmission = 0`.
- Reducing particle `Size` reduces the magnification that makes fringes obvious.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[Greyscale VFX Textures - Tint in Studio]] · [[Free Tools for Making Your Own VFX Textures]] · [[Converting Sprite Sheets into Roblox Flipbooks]]

<!-- TDOD_GRAPH_END -->
