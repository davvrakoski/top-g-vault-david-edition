---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/effect-designer-suite"
title: "Effect Designer Suite Plugin (GPL-3.0)"
tags: [roblox, community, vfx, plugins, open-source, gpl, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "GPL-3.0 (plugin code); preset textures unlicensed"
sources:
  - https://devforum.roblox.com/t/effect-designer-suite-%E2%80%94-vfx-tooling-assets-and-more/4754553
  - https://github.com/MiaGobble/Effect-Design-Suite
  - https://create.roblox.com/store/asset/109890065116916/Effect-Designer-Suite
cssclasses: [tg-a40]
---

# Effect Designer Suite Plugin (GPL-3.0)

**Creator:** iGottic on the DevForum; the GitHub repo is by Mia Gobble (MiaGobble). **Posted:** 24 Jul 2026. Free since an 18 Aug 2026 update. **Code license:** GNU GPL v3 (the repo's LICENSE file, "Copyright (C) 2026 Mia Gobble").

| Resource | What | License | Redistribute? | Link |
|---|---|---|---|---|
| Effect Designer Suite (plugin) | VFX authoring + emit tooling for Studio | GPL-3.0 | Code: yes, under GPL-3.0 terms | https://github.com/MiaGobble/Effect-Design-Suite |
| Its preset texture library (about 5,800 flipbooks/textures after cleanup) | Ready-made VFX textures | **None stated** ("open source" only) | **No**. Do not copy into bundles | via the plugin |

## Features

- **Emit properties** on any emittable object: count, delay, duration, plus repeat emit actions. Good for authoring one-shot bursts without code.
- **Programmer resources** for playing those emits at runtime.
- Copy/paste properties; **scale past Roblox's normal value limits** in one go (resize a whole effect).
- **Oklab colour sequences** (smoother gradients than RGB lerp).
- Curve editor for NumberSequences.
- **Animation indicators** (v1.1.0) for Bezier curves and tweens on attachments and parts.
- A `LockedToPart` acceleration fix option.
- v1.2.0 UI split into four widgets: Core, Editing, Presets, Advanced.

## How to use it safely

- Using the plugin in your workflow is fine; GPL obligations only apply if you redistribute the plugin's code.
- **Treat the preset library as reference.** The thread calls it open-source but names no license or original artists. For anything you will ship or bundle, rebuild the effect with textures from [[CC0 VFX Texture Picker by Effect Type]].
- The emit-attribute workflow pairs well with the BurstPlayer pattern in [[ParticleEmitter Bursts, Flipbooks and Budgets]], but the attribute names may differ, so check both before mixing.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[Free Roblox Studio VFX Plugins - License Checked]] · [[VFX Editor Plugin (MIT)]] · [[Free VFX Licensing Rules for Roblox]]

<!-- TDOD_GRAPH_END -->
