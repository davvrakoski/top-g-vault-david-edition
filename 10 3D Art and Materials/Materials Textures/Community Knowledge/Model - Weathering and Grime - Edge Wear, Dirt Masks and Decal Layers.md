---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Weathering and Grime - Edge Wear, Dirt Masks and Decal Layers"
tags: [roblox, community-knowledge, materials, textures, weathering, decals]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/parts/textures-decals
  - https://create.roblox.com/docs/reference/engine/classes/Decal
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://docs.blender.org/manual/en/latest/render/cycles/baking.html
---
# Weathering and Grime - Edge Wear, Dirt Masks and Decal Layers

Clean assets look like toys; weathered assets look like they belong to a place and a story. Weathering is also how you make 20 copies of the same crate stop looking identical. On Roblox there are two layers to work with: **wear baked into the asset's textures** (edge wear, dirt in crevices, rust streaks) and **decals placed in the level** (stains, cracks, leaks, posters) that vary each copy for almost no cost. This note shows both and when to use which.

## Where wear really happens (paint the logic, not noise)

| Effect | Where it goes | Why |
|---|---|---|
| Edge wear / chipped paint | Convex edges and corners | Hands, boots and bumps hit edges |
| Dirt and grime | Crevices, bottoms, inner corners | Dirt collects where it is not cleaned |
| Dust | Upward-facing surfaces | Gravity |
| Rust / water streaks | Below bolts, seams, and edges, running down | Water carries rust downward |
| Sun fade | Top and sun-facing sides | UV light |
| Grease and scuffs | Handles, buttons, floors near doors | Touch and traffic |

Random noise everywhere reads as dirty texture, not as weathering.

## Baked wear in Blender (no paid tools)

1. Bake an **AO** map and a **convexity/edge** mask (Cycles Pointiness baked through Emit works) for the mesh ([[Baking Normal and AO Maps in Blender for Roblox]]).
2. In the shader, mix the base colour toward a dirt colour using the AO mask (crevices) and toward a bare-material colour using the edge mask (chips). Break both masks with a noise texture so edges are not uniformly worn.
3. Add a top-down dust mask with the Geometry normal's Z component.
4. Bake the result to a single colour map; also adjust roughness (dirt rougher, polished wear on handles smoother).

In Substance-style painters the same logic comes from smart masks and generators ([[Model - Choosing a Texture Painter - Substance Painter, ArmorPaint or Blender]]).

## Decal layers in the level

`Decal` projects an image onto one face of a part; it is the cheapest way to add unique wear per copy.

- Make a small **decal sheet** of grime: leak streaks, cracks, footprint dirt, scorch marks, moss patches, graffiti-free stains. Transparent PNGs, 256-512 px.
- Place decals on simple invisible parts placed just in front of the surface, or on the face of the asset itself (decals work on MeshParts on the chosen `Face`, but projection follows the part's bounding box, so check stretching on curved meshes).
- Decals can now carry normal, roughness and metalness maps, so a wet stain can be glossy and a crack can have depth ([[Model - PBR Decals and Textures - Normal, Roughness, Metalness and Emissive Maps on Decal]]).
- Use `Decal.Color3` to tint one greyscale grime image for many uses (brown mud, green moss, black soot), and `Transparency` to fade it.
- Offset helper parts by about 0.01-0.05 studs from the wall to avoid z-fighting.
- For repeatable patterns on large surfaces use `Texture` (tiling) instead of `Decal` ([[Texture vs Decal vs SurfaceAppearance - Which Surface Tool to Use]]).

Bullet holes and scorch marks spawned at runtime are a different system with pooling; see [[Impact Decals - Bullet Holes, Scorch Marks and Pooling]].

## Variation without unique textures

- **Tint masks:** with `SurfaceAppearance.AlphaMode = TintMask`, the same weathered crate can be red, green or blue by part `Color` while wear stays ([[SurfaceAppearance AlphaMode and TintMask - Recolorable Assets]]).
- **SurfaceAppearance `Color`:** the property tints the colour map; a slight darker tint on some copies suggests older, dirtier items.
- Rotate copies 90/180 degrees so the wear pattern is not repeated in the same direction.

## How much is enough

- Stylised games: light edge highlights and a little crevice darkening. Heavy grime clashes with bright palettes.
- Realistic, horror or post-apocalyptic: heavier, but keep **value contrast** readable; gameplay objects must still stand out ([[Art - Colour Palettes for a Consistent Look - Value, Saturation and Accent Rules]]).
- Keep pickups and interactive objects cleaner than the background so they pop.

## Pitfalls

- Uniform edge wear on every edge: looks procedural. Break it up and favour exposed edges.
- Dirt that ignores gravity (streaks running sideways).
- Dozens of overlapping transparent decals in one spot: overdraw cost and sorting flicker.
- Grime baked so dark that the asset reads as a hole at night.

## Related
[[Materials Textures - Hub]] - [[Texture vs Decal vs SurfaceAppearance - Which Surface Tool to Use]] - [[Impact Decals - Bullet Holes, Scorch Marks and Pooling]] - [[Baking Normal and AO Maps in Blender for Roblox]]
