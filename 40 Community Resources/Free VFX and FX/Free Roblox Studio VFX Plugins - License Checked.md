---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/free-vfx-plugins"
title: "Free Roblox Studio VFX Plugins - License Checked"
tags: [roblox, community, vfx, plugins, open-source, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "mixed - see table"
sources:
  - https://devforum.roblox.com/t/3103467
  - https://github.com/VirtualButFake/vfx-editor
  - https://devforum.roblox.com/t/effect-designer-suite-%E2%80%94-vfx-tooling-assets-and-more/4754553
  - https://github.com/MiaGobble/Effect-Design-Suite
  - https://devforum.roblox.com/t/lumina-a-custom-particle-system/2963557
  - https://github.com/Mqxsyy/Lumina
  - https://devforum.roblox.com/t/over-600-free-particle-with-cix-library-a-particle-library-plugin/2864815
  - https://devforum.roblox.com/t/steakparticles-plugin-for-creating-vfx-and-particle-emitters/2908779
  - https://devforum.roblox.com/t/plugin-sine-vfx-a-vfx-plugin-for-roblox-studio/4803771
  - https://zilibobi.itch.io/vfx-forge
cssclasses: [tg-a40]
---

# Free Roblox Studio VFX Plugins - License Checked

Studio's Properties window is clumsy for VFX: NumberSequence and ColorSequence editing is slow, there is no "emit preview", and you cannot batch-edit emitters. These community plugins fix that. A plugin is a **tool**: you use it, you don't ship it, so a GPL license is fine here.

## Free with a clear license

| Plugin | What it adds | License | Redistribute? | Link |
|---|---|---|---|---|
| **VFX Editor** (VirtualButFake, 2024) | All-in-one VFX Properties replacement: Bezier/eased NumberSequence editor, ColorSequence editor, texture library with flipbook support, undo/redo, light/dark + lightweight mode | MIT | Yes (code) | https://github.com/VirtualButFake/vfx-editor |
| **Effect Designer Suite** (iGottic / Mia Gobble, 2026; free since Aug 2026) | Emit attributes (count/delay/duration), repeat emits, Oklab colour sequences, curve editor, property copy/scale, tween/Bezier animation indicators, large preset texture library | GPL-3.0 (plugin code) | Code only under GPL-3.0; preset textures have **no stated license** | https://github.com/MiaGobble/Effect-Design-Suite |
| **Lumina** (Mqxsyy, 2024) | Node-based custom particle system (Spawn / Initialize / Update / Render nodes), exports effects as ModuleScripts | MIT | Yes (code) | https://github.com/Mqxsyy/Lumina |

Detail notes: [[VFX Editor Plugin (MIT)]] · [[Effect Designer Suite Plugin (GPL-3.0)]] · [[Lumina Node-Based Particle Plugin (MIT)]].

## Checked and left out

| Plugin | Why |
|---|---|
| CIX Library ("600+ free particles") | In its DevForum thread the creator admitted taking textures from another pack. Provenance is not clean, so it is not listed |
| SteakParticles | Listed at 200 Robux in its thread (not free), and the texture origin is unstated |
| Sine VFX | Paid (Creator Store, about $5) |
| VFX Forge | Paid (itch.io, about $16.67+) |

## Which one to install

- **Daily VFX work:** VFX Editor. Lightweight, MIT, and it replaces the Properties window for emitters, beams and trails.
- **Effects that fire in timed bursts:** Effect Designer Suite. Its emit attributes match the burst convention in [[ParticleEmitter Bursts, Flipbooks and Budgets]].
- **Experiments only:** Lumina. Its own author marks it unstable and slower than built-in particles (no GPU path).

Plugin safety: install from the GitHub release or the creator's own Creator Store listing linked from the DevForum post, never a re-upload. Check plugin permissions (script injection, HTTP) when Studio asks.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[VFX Framework]] · [[ParticleEmitter Bursts, Flipbooks and Budgets]] · [[Free VFX Licensing Rules for Roblox]]

<!-- TDOD_GRAPH_END -->
