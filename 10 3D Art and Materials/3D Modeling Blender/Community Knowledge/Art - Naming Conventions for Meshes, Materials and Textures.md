---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Naming Conventions for Meshes, Materials and Textures"
tags: [roblox, community-knowledge, 3d-art, blender, naming, pipeline]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/modeling/export-requirements
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/projects/assets/manager
  - https://create.roblox.com/docs/art/modeling/specifications
---
# Naming Conventions for Meshes, Materials and Textures

The 3D Importer turns Blender object names into MeshPart names and uses material assignments to decide how a model is split. Textures become separate image assets in the Asset Manager with whatever file name you gave them. After a few hundred assets, "Cube.004" and "Material.012" make a project impossible to search, re-import or hand to another developer. A naming convention costs nothing and makes scripts, Explorer searches and re-imports reliable.

## A simple scheme for Roblox projects

**Pattern:** `Category_Name_Variant_Part`, PascalCase words, underscores between fields, no spaces or dots.

| Thing | Example | Notes |
|---|---|---|
| Blender file | `Prop_Crate.blend` | one asset family per file |
| FBX export | `Prop_Crate_A.fbx` | the variant letter matches the in-game model |
| Mesh object | `Prop_Crate_A`, `Prop_Crate_A_Lid` | becomes the MeshPart name |
| Moving piece | `Veh_Sedan_Wheel_FL` | FL/FR/RL/RR for wheels; L/R for doors |
| Material (Blender) | `MAT_Wood_Painted` | one per MeshPart on Roblox |
| Texture | `T_Crate_A_Color.png` | suffix = SurfaceAppearance slot |
| LOD | `Prop_Crate_A_LOD1` | only if you ship hand-made LODs |

Prefixes that work well: `Prop_`, `Env_` (walls, floors), `Veh_`, `Wpn_` (tools and weapons), `Fol_` (foliage), `Char_`, `FX_` (meshes used by effects).

## Texture suffixes that match SurfaceAppearance

Use the property names so anyone can wire them up without guessing:

- `_Color` to `ColorMap` (alpha used by `AlphaMode`)
- `_Normal` to `NormalMap`
- `_Roughness` to `RoughnessMap`
- `_Metalness` to `MetalnessMap`
- `_Emissive` only if you use an emissive approach (see [[Glowing Surfaces - Neon Material, Emissive Masks and Bloom]])

## In Studio

- Keep the imported names; rename only the root Model if needed, so a re-import still matches parts by name.
- Name scripted parts exactly what code expects (`Handle` for tools, `Hinge` attachments, `Wheel_FL`). Code that uses `FindFirstChild("Wheel_FL")` breaks silently if an artist renames a part.
- Organise the Asset Manager with folders per category, mirroring the prefixes.
- Tag groups of parts with `CollectionService` tags instead of encoding behaviour in names (`Door`, `Breakable`).

## Blender hygiene before export

1. *Outliner*: no `.001` suffixes. They usually mean a duplicate you forgot about.
2. Purge unused data (*File > Clean Up > Purge Unused Data*) so stray materials do not export.
3. Mesh data names can match object names (there are small add-ons and a one-line script to sync them).
4. Material names are unique per look, not per object: `MAT_Metal_Rusty` is reused, not `MAT_Barrel1_Metal`.

## Pitfalls

- Spaces and special characters in texture file names make search and command-line tools annoying.
- Two objects with the same name in one FBX: the importer keeps both, and scripts pick the wrong one.
- Encoding colours in names (`Crate_Red`): when the tint mask changes the colour, the name lies.

## Related
[[3D Modeling Blender - Hub]] - [[FBX Import Settings, Scale and Collision Fidelity]] - [[One Material per MeshPart - Splitting vs Atlasing Multi-Material Models]] - [[Art Content Pipeline]]
