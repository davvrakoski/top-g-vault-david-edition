---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/sbs-noise-textures"
title: "Screaming Brain Studios 700+ Noise Textures (CC0)"
tags: [roblox, community, vfx, free-assets, cc0, noise, beams, trails, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "CC0 1.0"
sources:
  - https://opengameart.org/content/noise-texture-pack
cssclasses: [tg-a40]
---

# Screaming Brain Studios 700+ Noise Textures (CC0)

Noise is the hidden ingredient in most good beams, trails, auras and energy effects: a scrolling noise texture breaks up the "flat strip" look. **Screaming Brain Studios** released a large greyscale noise library on OpenGameArt under **CC0**. The author says credit is never required.

| Resource | What | License | Redistribute? | Link |
|---|---|---|---|---|
| Noise Texture Pack (Screaming Brain Studios) | 768 greyscale PNG noise textures (most seamless) in 18 families, each at 128, 256 and 512 px. Zips: 8.6 MB / 29 MB / 99.2 MB | CC0 | Yes | https://opengameart.org/content/noise-texture-pack |

**Families:** Perlin, Cracked, Gabor, Crater, Grainy, Manifold, Marble, Melt, Milky, Spokes, Streak, Super, Super Perlin, Swirl, Techno, Turbulence, Vein, Voronoi.

Grab the **256 px** zip first. It is plenty for Roblox beams and trails and keeps texture memory low.

## Which family for which Roblox effect

| Effect | Family | Object + settings |
|---|---|---|
| Energy beam / laser core | Streak, Turbulence | `Beam`: `TextureMode = Wrap`, `TextureLength` 3-8, `TextureSpeed` 2-4, `LightEmission = 1`, `FaceCamera = true` |
| Electric / arcane arc | Vein, Cracked | Beam with `Segments` 20-40 and a second Beam scrolling the other way (negative `TextureSpeed`) |
| Sword trail | Streak, Milky | `Trail`: `TextureMode = Stretch`, `Lifetime` 0.15-0.3, `WidthScale` tapering to 0, `LightEmission = 1` |
| Aura / heat shimmer | Perlin, Super Perlin | ParticleEmitter with `LockedToPart = true`, large soft particles, Transparency 0.85 -> 1 |
| Magic circle / portal swirl | Swirl, Spokes | Decal or a ParticleEmitter with one big particle and `RotSpeed` |
| Ground cracks / impact decal | Cracked, Crater, Voronoi | Decal on a thin Part, Tween `Transparency` 0 -> 1 over 2-4 s |
| Water / slime surface | Melt, Marble | Beam or `Texture` with `OffsetStudsU/V` tweened for a slow scroll |

**Tip:** Layer two beams on the same Attachments with different noise families and opposite `TextureSpeed`. The interference reads as "alive" for almost no cost. Recipes: [[Beams, Trails and Attachments - Production Setups]].

Roblox has no shader-based dissolve. Noise here is used as the *visible* texture (colour it with `Color`), not as a mask.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[Beams, Trails and Attachments - Production Setups]] · [[Energy Orb and Projectile VFX]] · [[Beams]] · [[Trails]]

<!-- TDOD_GRAPH_END -->
