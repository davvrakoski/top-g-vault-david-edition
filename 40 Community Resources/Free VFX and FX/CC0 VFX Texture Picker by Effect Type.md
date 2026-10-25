---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/texture-picker"
title: "CC0 VFX Texture Picker by Effect Type"
tags: [roblox, community, vfx, free-assets, cc0, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "mixed - see table (all CC0)"
sources:
  - https://kenney.nl/assets/tag:vfx
  - https://unity.com/blog/engine-platform/free-vfx-image-sequences-flipbooks
  - https://opengameart.org/content/noise-texture-pack
  - https://opengameart.org/node/22567
  - https://docs.ambientcg.com/license/
  - https://brackeysgames.itch.io/brackeys-vfx-bundle
cssclasses: [tg-a40]
---

# CC0 VFX Texture Picker by Effect Type

A quick "I need X, where do I get it" table. Every source here is **CC0**, so you can ship it in a game *and* put it in a shared or sold bundle. Licenses were checked 2026-10-25 on each source page.

| Effect you need | First pick | Backup | Roblox object |
|---|---|---|---|
| Sparks / streaks | Kenney Particle Pack `spark_*`, `trace_*` | CodeManu pixel effects | ParticleEmitter, `VelocityParallel` |
| Fire loop | OpenGameArt Animated Fire (BenHickling) | Unity Labs Flame02/03 flipbooks | ParticleEmitter flipbook, `Loop` |
| Realistic explosion | Unity Labs Explosion01/02 | OpenGameArt Explosion 7 / More Explosions | ParticleEmitter flipbook, `OneShot` |
| Ground shockwave ring | OpenGameArt Ring explosion | Kenney `circle_*` scaled up fast | ParticleEmitter, `VelocityPerpendicular` |
| Soft smoke puffs | Kenney Smoke Particles | Unity Labs WispySmoke | ParticleEmitter, `LightEmission 0` |
| Character aura | OpenGameArt Smoke aura (Beast) | para Animated particle effects #1 | ParticleEmitter, `LockedToPart` |
| Magic burst / runes | Kenney `magic_*`, `symbol_*`, `twirl_*` | StumpyStrust Magic and Smoke | ParticleEmitter or Decal |
| Lens flare / glow | hackcraft Lens-Flares (CC0 option) | Kenney `flare_*`, `light_*` | ParticleEmitter, `LightEmission 1` |
| Muzzle flash | Kenney `muzzle_*` | bigdamnhero6 Free 2D VFX Pack | ParticleEmitter `Emit(1)`, Lifetime 0.05 |
| Beam / trail scroll texture | Screaming Brain noise (Streak, Turbulence) | Kenney Pattern Pack Lines | Beam / Trail, `TextureMode Wrap` |
| Slash arc | Kenney `slash_*` | Hand-made, see [[DevForum Slash VFX Breakdowns]] | Mesh + Texture, or Beam |
| Scorch / impact mark | Kenney `scorch_*`, Splat Pack | ambientCG decals (CC0) | Decal on thin Part |
| Grime / leaks / cracks on walls | ambientCG Decal assets (Leaking, Scratches, Asphalt Damage) | Screaming Brain Cracked | Decal / SurfaceAppearance |
| Blood splatter | bigdamnhero6 blood splatter | Kenney Splat Pack (tinted) | Decal / ParticleEmitter, gated by [[Blood - Damage VFX - Gore Policy]] |
| Clouds / fog cards | Unity Labs Cloud01-04 | Screaming Brain Milky/Perlin | Large ParticleEmitter particles, low Rate |

Already in the vault and CC0, useful for VFX too: ambientCG and Poly Haven (texture/HDRI libraries, see [[SurfaceAppearance PBR from Poly Haven Textures]]). ambientCG's license page says copying, modifying and distributing is allowed, commercial use included, with no credit needed.

## Detail notes

[[Kenney VFX Series - 2D Particle, Smoke, Splat and Mask Packs]] · [[Unity Labs CC0 Flipbooks - Smoke, Fire and Explosions]] · [[OpenGameArt CC0 VFX Sprite Sheets]] · [[Screaming Brain Studios 700+ Noise Textures (CC0)]] · [[Brackeys VFX Bundle (CC0)]] · [[itch.io Free VFX Packs - License Checked]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[VFX Color Language and Readability]] · [[Elemental Weapon VFX System — Fire, Ice, Arcane, Holy and Dark]] · [[Particle emitters]]

<!-- TDOD_GRAPH_END -->
