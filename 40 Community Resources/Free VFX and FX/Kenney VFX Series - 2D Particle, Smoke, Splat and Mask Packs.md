---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/kenney-vfx-series"
title: "Kenney VFX Series - 2D Particle, Smoke, Splat and Mask Packs"
tags: [roblox, community, vfx, free-assets, cc0, kenney, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "CC0 1.0"
sources:
  - https://kenney.nl/assets/tag:vfx
  - https://kenney.nl/assets/particle-pack
  - https://kenney.nl/assets/smoke-particles
  - https://kenney.nl/assets/splat-pack
  - https://kenney.nl/assets/light-masks
  - https://kenney.nl/assets/pattern-pack
  - https://opengameart.org/content/particle-pack-80-sprites
  - https://devforum.roblox.com/t/finding-particle-emitter-textures/563306
cssclasses: [tg-a40]
---

# Kenney VFX Series - 2D Particle, Smoke, Splat and Mask Packs

The vault already covers Kenney's **3D kits** ([[Modular Kits from the Kenney FBX Library]]). This note covers only Kenney's **2D VFX series**, which the 3D library does not include. The Particle Pack is also the texture source most often pointed to in DevForum "where do I get particle textures" threads (Bytify, 2020).

## Packs (all checked on kenney.nl, 2026-10-25)

| Resource | What | License | Redistribute? | Link |
|---|---|---|---|---|
| Particle Pack (v1.0, 2018) | 80 sprites at 512 px: circle, dirt, fire, flame, flare, light, magic, muzzle, scorch, scratch, slash, smoke, spark, star, symbol, trace, twirl, window. PNGs + tilesheet + vectors | CC0 | Yes | https://kenney.nl/assets/particle-pack |
| Smoke Particles (v1.0, 2014) | 70 files of smoke and explosion puffs | CC0 | Yes | https://kenney.nl/assets/smoke-particles |
| Splat Pack (v1.0, 2022) | 30 splat textures (paint, liquid, impact splats) | CC0 | Yes | https://kenney.nl/assets/splat-pack |
| Light Masks (v1.0, 2026) | Around 150 light-cookie / mask textures | CC0 | Yes | https://kenney.nl/assets/light-masks |
| Pattern Pack (v1.1) | 80 seamless 256 px patterns (good for beam/trail scroll textures) | CC0 | Yes | https://kenney.nl/assets/pattern-pack |
| Pattern Pack Lines / Pixel / Extra | More seamless pattern sets | CC0 | Yes | https://kenney.nl/assets/tag:vfx |

Credit is optional; Kenney asks for "Kenney.nl" if you choose to credit.

## Using them in Roblox

| Kenney texture | Roblox object | Starting settings |
|---|---|---|
| `spark_*`, `trace_*` | ParticleEmitter | `Orientation = VelocityParallel`, `LightEmission = 1`, `Squash` 0.5-1.5 for streaks, Lifetime 0.15-0.4 |
| `fire_*`, `flame_*` | ParticleEmitter | `LightEmission = 1`, `LightInfluence = 0`, `Orientation = FacingCameraWorldUp`, Size grows then shrinks |
| `smoke_*`, Smoke Particles | ParticleEmitter | `LightEmission = 0`, `LightInfluence = 1`, random `Rotation` + slow `RotSpeed`, Transparency 0.4 -> 1 |
| `magic_*`, `twirl_*`, `star_*` | ParticleEmitter or a flat Part with a Decal | Spin with `RotSpeed`, tint with the `Color` sequence |
| `slash_*` | Beam between two Attachments, or a mesh with a Texture | `LightEmission = 1`, `FaceCamera = true` for beams; see [[DevForum Slash VFX Breakdowns]] |
| `scorch_*`, Splat Pack | Decal on a thin invisible Part, or a ParticleEmitter with `Orientation = VelocityPerpendicular` | Fade the decal's `Transparency` out with a Tween |
| Pattern Pack | Beam / Trail texture | `TextureMode = Wrap`, `TextureLength` 2-6, `TextureSpeed` 1-3 |
| Light Masks | SurfaceGui/Decal glow cards | Use as soft glow cards, not as real light cookies (Roblox lights have no cookie slot) |

Most Kenney particle sprites are **white or greyscale**, so tint them in Studio instead of recolouring files; see [[Greyscale VFX Textures - Tint in Studio]].

**Tilesheets are not flipbooks.** Kenney's tilesheet packs many different sprites at different sizes. Upload the single PNGs, or rebuild a square grid first ([[Converting Sprite Sheets into Roblox Flipbooks]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[ParticleEmitter Bursts, Flipbooks and Budgets]] · [[Modular Kits from the Kenney FBX Library]] · [[CC0 VFX Texture Picker by Effect Type]] · [[Particle emitters]]

<!-- TDOD_GRAPH_END -->
