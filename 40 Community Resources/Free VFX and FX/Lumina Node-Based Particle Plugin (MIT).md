---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/lumina-plugin"
title: "Lumina Node-Based Particle Plugin (MIT)"
tags: [roblox, community, vfx, plugins, open-source, mit, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "MIT"
sources:
  - https://devforum.roblox.com/t/lumina-a-custom-particle-system/2963557
  - https://github.com/Mqxsyy/Lumina
cssclasses: [tg-a40]
---

# Lumina Node-Based Particle Plugin (MIT)

**Creator:** Mqxsyy (Mqx) · **First posted:** DevForum, 9 May 2024 (thread at update 0.2.0) · **License:** MIT (repo LICENSE) · **Price:** free on the Creator Store

| Resource | What | License | Redistribute? | Link |
|---|---|---|---|---|
| Lumina | Custom, script-driven particle system with a node-graph editor (similar in idea to Unity VFX Graph / Niagara) | MIT | Yes | https://github.com/Mqxsyy/Lumina |

## What it does

- Graph groups: **Spawn -> Initialize -> Update -> Render**, plus Logic nodes (e.g. Random Number).
- Presets: Basic, Burst, Flame.
- Saves graphs to a StringValue in ServerStorage and **exports an effect as a ModuleScript** you control with `.Start()` / `.Stop()`.
- Planned (not shipped when checked): 3D particles, physics, variables.

## Big caveats (from the author)

- Work in progress. The author advises against production use and recommends saving often (it can crash).
- **Slower than built-in ParticleEmitters**: no GPU access or parallel threads, and it ignores the player's graphics quality setting.
- Needed Studio's UIListLayout Flex beta when posted.
- Last code push July 2024; the author said development might pause.

## When it's worth it

Use it to **learn node-based VFX thinking** or to prototype behaviour that ParticleEmitters cannot do, for example particles that read game state each frame. For shipped effects, rebuild with ParticleEmitters/Beams so Roblox's GPU path and quality scaling apply ([[VFX looks good but kills FPS]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[Free Roblox Studio VFX Plugins - License Checked]] · [[VFX Budget and Readability]] · [[VFX Framework]]

<!-- TDOD_GRAPH_END -->
