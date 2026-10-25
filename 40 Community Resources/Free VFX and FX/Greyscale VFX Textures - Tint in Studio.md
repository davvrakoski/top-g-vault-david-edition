---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/greyscale-tinting"
title: "Greyscale VFX Textures - Tint in Studio"
tags: [roblox, community, vfx, technique, textures, color, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "n/a - technique note"
sources:
  - https://devforum.roblox.com/t/finding-particle-emitter-textures/563306
  - https://devforum.roblox.com/t/introduction-to-vfx-particles/2068650
  - https://opengameart.org/content/lens-flares-and-particles
  - https://create.roblox.com/docs/effects/particle-emitters
cssclasses: [tg-a40]
---

# Greyscale VFX Textures - Tint in Studio

Pros upload **one white/greyscale texture** and colour it per effect in Studio. Beginners upload a red fire, a blue fire and a green fire. The pro approach saves texture memory, upload time and moderation waits, and keeps a game's palette consistent.

Community support: the 2020 DevForum thread "Finding Particle Emitter Textures" pointed people to **uncoloured greyscale/alpha packs** made for exactly this. VisuallyFX's 2022 "Introduction to VFX: Particles" noted the flip side: recolouring an already-coloured image needs an image editor. Colour baked in is hard to undo.

## How Roblox applies colour

- `ParticleEmitter.Color`, `Beam.Color` and `Trail.Color` are **ColorSequences** that multiply the texture's RGB.
- White (255) shows the sequence colour exactly; grey shows a darker version; black stays black.
- So a white-core / grey-edge texture plus a sequence of *white-yellow -> orange -> dark red* gives a fire with a hot centre, from a single texture.

## Recipes from one white soft-glow texture

| Effect | Color sequence | LightEmission | LightInfluence | Brightness |
|---|---|---|---|---|
| Fire | (255,240,200) -> (255,140,40) -> (120,20,10) | 1 | 0 | 1.5-3 |
| Ice / frost | (230,250,255) -> (120,200,255) | 0.6 | 0 | 1-2 |
| Poison / acid | (220,255,150) -> (60,180,40) | 0.4 | 0.3 | 1 |
| Holy | (255,255,240) -> (255,220,120) | 1 | 0 | 2-4 |
| Dark / void | (120,60,200) -> (20,0,40) | 0 | 1 | 1 |
| Dust / smoke | (200,190,170) -> (120,110,100) | 0 | 1 | 1 |

Values are starting points (not from the docs); tune them against [[VFX Color Language and Readability]] and the elemental palette in [[Elemental Weapon VFX System — Fire, Ice, Arcane, Holy and Dark]].

## Notes

- **Dark effects can't be additive.** With `LightEmission = 1`, black adds nothing and disappears. Use `LightEmission = 0` and a darker texture, or layer a dark normal-blend emitter under a coloured glow.
- `Brightness` only shows when `LightInfluence < 1` (from VisuallyFX's guide).
- Good CC0 greyscale sources: hackcraft Lens-Flares (CC0 option), most of the Kenney Particle Pack, and Screaming Brain noise textures. See [[CC0 VFX Texture Picker by Effect Type]].
- Make your own greyscale textures **white in RGB, shape in alpha** to avoid black fringes ([[Fixing Black Outlines on Particle Textures]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[VFX Color Language and Readability]] · [[Kenney VFX Series - 2D Particle, Smoke, Splat and Mask Packs]] · [[Particle emitters]]

<!-- TDOD_GRAPH_END -->
