---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/opengameart-cc0-vfx"
title: "OpenGameArt CC0 VFX Sprite Sheets"
tags: [roblox, community, vfx, free-assets, cc0, opengameart, flipbook, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "CC0 1.0 (each item checked)"
sources:
  - https://opengameart.org/node/22567
  - https://opengameart.org/content/ring-explosion
  - https://opengameart.org/content/explosion-7
  - https://opengameart.org/content/animated-fire
  - https://opengameart.org/content/more-explosions
  - https://opengameart.org/content/magic-and-smoke-effect
  - https://opengameart.org/content/smoke-aura
  - https://opengameart.org/content/free-pixel-effects-pack
  - https://opengameart.org/content/lens-flares-and-particles
  - https://devforum.roblox.com/t/finding-particle-emitter-textures/563306
cssclasses: [tg-a40]
---

# OpenGameArt CC0 VFX Sprite Sheets

The vault's OpenGameArt note ([[More Free Sources - OpenGameArt CC0]]) covers **3D models only**. This note adds **2D effect sprite sheets** from OpenGameArt. Each license below was read on the item's own page on 2026-10-25. OpenGameArt pages can be edited, so re-check before shipping.

| Resource | What | License | Redistribute? | Link |
|---|---|---|---|---|
| Animated particle effects #1 (para) | 14 effects (smoke, fire, flame, magic), 1024x1024 sheets of 128 px cells, 64 frames at 30 fps | CC0 | Yes | https://opengameart.org/node/22567 |
| Ring explosion (BenHickling) | Shockwave-style ring blast, 100x100 frames, 56 frames, transparent PNG | CC0 | Yes | https://opengameart.org/content/ring-explosion |
| Explosion 7 (BenHickling) | Fire explosion, 100x100 frames, 50 frames | CC0 | Yes | https://opengameart.org/content/explosion-7 |
| Animated Fire (BenHickling) | 8 fire loops, 64x64 frames, 60 frames | CC0 | Yes | https://opengameart.org/content/animated-fire |
| More Explosions (StumpyStrust) | Several explosion animations (about 100 px frames) | CC0 | Yes | https://opengameart.org/content/more-explosions |
| Magic and Smoke Effect (StumpyStrust) | Program-made magic bursts + smoke in 3 quality levels (invert for steam) | CC0 | Yes | https://opengameart.org/content/magic-and-smoke-effect |
| Smoke aura (Beast) | Looping smoke aura, 256 px frames, 15/30/45-frame sheets | CC0 | Yes | https://opengameart.org/content/smoke-aura |
| Free Pixel Effects Pack (CodeManu) | 20 pixel-art effects, 100x100 frames, made with Pixel FX Designer | CC0 | Yes | https://opengameart.org/content/free-pixel-effects-pack |
| Lens-Flares and Particles (hc / hackcraft.de) | 36 uncoloured greyscale flares, coronas, novas, auras | CC0 **or** CC-BY 3.0 (dual; pick CC0) | Yes (under CC0) | https://opengameart.org/content/lens-flares-and-particles |

The hackcraft pack was recommended in the 2020 DevForum thread "Finding Particle Emitter Textures" (Bytify) for its tint-it-yourself greyscale style.

## Roblox fit notes

- **para's sheets** are already 1024 square 8x8 grids, so they map straight to `FlipbookLayout = Grid8x8`. Most are drawn from a 45-degree camera, so use `Orientation = FacingCameraWorldUp` to stop them rolling.
- **BenHickling / StumpyStrust / CodeManu** sheets are rows of 100 px or 64 px frames with odd counts (50, 56, 60). Re-pack them into a square grid and drop frames to fit 16 or 64 ([[Converting Sprite Sheets into Roblox Flipbooks]]).
- **Ring explosion** works well on a ParticleEmitter with `Orientation = VelocityPerpendicular`, `EmissionDirection = Top` and a tiny `Speed` (about 0.01), so the ring lies flat on the ground without drifting.
- **Smoke aura**: `LockedToPart = true` on a character's HumanoidRootPart, `LightEmission = 0`, recoloured via `Color` (the author suggests black for darkness, green for acid).
- **Lens flares**: `LightEmission = 1`, `LightInfluence = 0`, one particle with `Rate = 0` and `Emit(1)` per flash, or a BillboardGui ImageLabel for a held glow.

Credits (optional for CC0, nice to have): "<pack> by <author> (OpenGameArt), CC0".

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[More Free Sources - OpenGameArt CC0]] · [[Explosion and Fireball Production — Layered, Fast, Readable]] · [[ParticleEmitter Bursts, Flipbooks and Budgets]] · [[Greyscale VFX Textures - Tint in Studio]]

<!-- TDOD_GRAPH_END -->
