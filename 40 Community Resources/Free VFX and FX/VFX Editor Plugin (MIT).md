---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/vfx-editor-plugin"
title: "VFX Editor Plugin (MIT)"
tags: [roblox, community, vfx, plugins, open-source, mit, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "MIT"
sources:
  - https://devforum.roblox.com/t/3103467
  - https://github.com/VirtualButFake/vfx-editor
  - https://create.roblox.com/store/asset/18800449515
cssclasses: [tg-a40]
---

# VFX Editor Plugin (MIT)

**Creator:** VirtualButFake · **Announced:** DevForum, 5 Aug 2024 · **License:** MIT (stated in the README / LICENSE.md)

The author pitches it as an all-in-one VFX tool that replaces several single-purpose plugins *and* the default Properties panel for effect objects.

| Resource | What | License | Redistribute? | Link |
|---|---|---|---|---|
| VFX Editor | Studio plugin for ParticleEmitters, Beams, Trails and other effect objects | MIT | Yes | https://github.com/VirtualButFake/vfx-editor |

## Features (from the DevForum post and README)

- **NumberSequence editor** with many easing styles and full Bezier handles. This is the main reason to use it, since Size/Transparency curves are painful in stock Studio.
- **ColorSequence editor.**
- **Texture storage** laid out like a file system, with **flipbook** previews, so you can keep your CC0 texture IDs organised.
- Covers most relevant properties, with **undo/redo** for almost everything.
- Light/dark themes and a **lightweight mode** that looks like the original Properties window.

## Install (three options from the README)

1. **Creator Store** listing (asset 18800449515), which auto-updates. The price shown there was not verifiable from outside Studio.
2. **GitHub release:** download `build.rbxm` from the latest release, drop it into your local Plugins folder (Plugins tab -> *Plugins Folder*), then restart Studio.
3. **Build from source:** Aftman + Lune (`aftman install`, `lune run build`).

## Workflow tips

- Build a **texture library folder** in the plugin from your CC0 sources ([[CC0 VFX Texture Picker by Effect Type]]) and name entries `source_effect_variant`, for example `kenney_spark_04`. Then the license origin stays visible.
- Shape the Size curve as a fast rise with an ease-out tail, and the Transparency curve to hold then fade. Those two curves do most of the work in a hit spark.
- Pair it with the burst-attribute convention (`EmitCount`, `EmitDelay`) from [[ParticleEmitter Bursts, Flipbooks and Budgets]]. VFX Editor edits look; your script handles timing.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[Free Roblox Studio VFX Plugins - License Checked]] · [[Effect Designer Suite Plugin (GPL-3.0)]] · [[Particle emitters]]

<!-- TDOD_GRAPH_END -->
