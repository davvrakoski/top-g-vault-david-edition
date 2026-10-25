---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Metal and Plastic Looks with Built-in Materials - Presets, Reflectance and When to Upgrade"
tags: [roblox, community-knowledge, materials, metal, plastic, built-in-materials]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/parts/materials
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/classes/MaterialService
  - https://create.roblox.com/docs/art/modeling/material-reference
---
# Metal and Plastic Looks with Built-in Materials - Presets, Reflectance and When to Upgrade

Metal and plastic are the two looks most Roblox props need, and both can be done with **no custom textures at all** using built-in materials, part `Color` and `Reflectance`. That keeps memory tiny and works on Parts, Unions and MeshParts alike. Knowing what each preset actually contains (which ones have metalness maps, which have no textures) tells you when the built-in look is enough and when to move to a `SurfaceAppearance` or a `MaterialVariant`. Value ranges for custom PBR are in [[PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges]].

## What the presets contain (from the Materials reference)

- **No texture maps (engine-bundled):** `Plastic`, `SmoothPlastic`, `Neon`, `ForceField`. Plastic adds a subtle surface pattern; SmoothPlastic is perfectly clean.
- **Built-in metalness maps:** `Metal`, `Foil`, `DiamondPlate`, `CorrodedMetal`, plus `CeramicTiles` and `Rubber` in the current set. These respond as metal where their metalness map says so.
- **Newer additions** in the current base set include `Cardboard`, `Carpet`, `CeramicTiles`, `ClayRoofTiles`, `Leather`, `Plaster`, `Rubber` and `RoofShingles`.
- `MaterialService.Use2022Materials` switches between the current pack and the pre-2022 pack; keep one choice for the whole game.

## Metal recipes

| Look | Material | Color | Reflectance | Notes |
|---|---|---|---|---|
| Brushed steel / tools | Metal | Mid grey (about 150-170 RGB) | 0-0.1 | The Metal pattern supplies the brushing |
| Painted metal (lockers, cars) | SmoothPlastic or Plastic | Paint colour | 0.05-0.2 | Paint is not metal; do not use Metal under paint |
| Chrome / mirror trim | SmoothPlastic or Foil | Light grey | 0.4-0.8 | Reflectance reflects the sky; looks best outdoors |
| Gold / brass | Metal or Foil | Saturated yellow-orange | 0-0.2 | Metals take their tint from Color |
| Rusty / industrial | CorrodedMetal | Brown-grey | 0 | Pair with clean Metal for contrast |
| Floor plates, truck beds | DiamondPlate | Grey | 0 | Check tile scale on large parts |

`Reflectance` (0-1) controls how much a part reflects the sky. The API notes it may be ignored depending on material, and it does not render on fully transparent parts. Very high Reflectance indoors looks wrong because it reflects the outdoor sky, not the room.

## Plastic recipes

| Look | Material | Tips |
|---|---|---|
| Toy / stylised plastic | SmoothPlastic | Clean, saturated colours; the classic Roblox look |
| Matte moulded plastic (crates, casings) | Plastic | Slight surface texture hides flat lighting |
| Glossy plastic (buttons, helmets) | SmoothPlastic + Reflectance 0.05-0.15 | A little reflectance reads as gloss |
| Rubber (tyres, grips) | Rubber | Dark grey, never pure black |

## When to upgrade

Move to a **SurfaceAppearance** on a MeshPart when you need: wear only on edges, mixed metal and paint on one mesh, logos, panel lines, or a roughness that varies across the surface ([[Model - Weathering and Grime - Edge Wear, Dirt Masks and Decal Layers]]).

Move to a **MaterialVariant** when you want the same metal or plastic everywhere but with your own texture (for example a stylised hand-painted metal that replaces `Metal` game-wide through MaterialService overrides) ([[MaterialVariant and MaterialService - Custom Materials for Parts and Terrain]]).

Stay with built-ins for: stylised and low-poly games, large building blocks, prototypes, and anything that must look identical on every device.

## Checks

- Look at metals under your real sky and at night: metal looks dark without something to reflect. Bright skies and `EnvironmentSpecularScale` (Lighting) affect this; test before judging.
- Keep metal colours in a realistic brightness range; very dark Color on Metal reads as black plastic.
- Do not mix SmoothPlastic toy props with realistic SurfaceAppearance props in the same view ([[Stylized vs Realistic Art Direction on Roblox]]).

## Pitfalls

- Using `Metal` for painted surfaces: the paint looks like tinted steel.
- Reflectance on everything: scenes look wet and noisy.
- Changing `Use2022Materials` late in production: every built-in surface changes at once.

## Related
[[Materials Textures - Hub]] - [[PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges]] - [[MaterialVariant and MaterialService - Custom Materials for Parts and Terrain]] - [[Model - Glass, Ice and Liquid Props - Glass Material, Transparency and Refraction Limits]]
