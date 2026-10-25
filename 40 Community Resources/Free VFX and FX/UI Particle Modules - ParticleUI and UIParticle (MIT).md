---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/ui-particle-modules"
title: "UI Particle Modules - ParticleUI and UIParticle (MIT)"
tags: [roblox, community, vfx, ui, open-source, mit, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/themwsama/Particle-UI-Module
  - https://github.com/Novaly-Studios/UIParticle
cssclasses: [tg-a40]
---

# UI Particle Modules - ParticleUI and UIParticle (MIT)

ParticleEmitters only render in 3D. For **2D UI juice** (sparkles on a reward popup, coins flying to a counter, a level-up burst), you need a script that animates ImageLabels. Two small MIT modules do this.

| Resource | What | License | Redistribute? | Link |
|---|---|---|---|---|
| ParticleUI (themwsama, 2025) | ParticleEmitter-like API for ImageLabels: textures, flipbooks, colour/size/transparency sequences, speed/angle/acceleration, spin, bursts or loops, auto-cleanup | MIT | Yes | https://github.com/themwsama/Particle-UI-Module |
| UIParticle / "UIParty" (Novaly Studios, 2024) | Code-defined emitter: a `ParticleDefinition` function returns per-particle Lifetime, Texture (with SpriteSheet), and Sequence / Physics paths | MIT | Yes | https://github.com/Novaly-Studios/UIParticle |

## ParticleUI quick use (README)

- Put `ParticleUIMod` in ReplicatedStorage, then `require` it from a LocalScript.
- `ParticleUI.new(player, { Texture = ..., LifeTime = 0.6, Rate = 15, Parent = gui })`
- `:Emit(20)` for a burst (default 5), `:Enabled(true/false)` for a loop, `:Destroy()`.
- Flipbook keys: `YesFlipbook`, `FlipbookLayout`, `FlipbookFramerate`, `FlipbookMode` ("OneShot"/"Loop"), `FlipbookStartRandom`.
- Gotcha: `Texture` must name a UI object (or an entry under `ReplicatedStorage.UI`), and the README does not explain that folder well.

## UIParticle quick use (README)

- `UIParty.CreateParticleEmitter({ EmitFrom = frame, Rate = 30, TimeScale = 1, ParticleDefinition = function() ... end })`
- Helpers: `Paths.Sequence({{Time=0,Value=...},{Time=1,Value=...}})`, `Paths.Physics(pos, vel, accel)`, `Paths.Value(v)`.
- `Emitter.Destroy()` to clean up. Docs are incomplete, and emission shapes / framerate scaling were still on the to-do list.

## Both are young

Few stars and no releases. Read the code before adopting, cap particle counts (each particle is a GUI object), and destroy emitters when a screen closes. Kenney `star_*` / `magic_*` sprites ([[Kenney VFX Series - 2D Particle, Smoke, Splat and Mask Packs]]) make good CC0 UI sparkles.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[Camera, Feel and Game Juice]] · [[CC0 VFX Texture Picker by Effect Type]]

<!-- TDOD_GRAPH_END -->
