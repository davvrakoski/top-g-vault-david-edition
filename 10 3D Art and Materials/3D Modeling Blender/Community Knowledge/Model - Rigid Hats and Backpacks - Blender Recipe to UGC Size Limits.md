---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Rigid Hats and Backpacks - Blender Recipe to UGC Size Limits"
tags: [roblox, community-knowledge, 3d-art, blender, accessories, ugc]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/avatar/rigid-accessories/specifications
  - https://create.roblox.com/docs/art/accessories/creating-rigid/modeling-setup
  - https://create.roblox.com/docs/art/accessories/creating-rigid/texturing
  - https://create.roblox.com/docs/avatar/accessory-fitting-tool
---
# Rigid Hats and Backpacks - Blender Recipe to UGC Size Limits

Hats, helmets, backpacks and wings are the most common reward items in Roblox games, and the same mesh can be both an in-game cosmetic and (later) a Marketplace item. If you model it to the Marketplace rules from day one, you never have to rebuild it. The rules are strict: one mesh, at most 4,000 triangles, watertight, and inside a size box that depends on the item type and body scale. This note is the modeling recipe; for which item type to make first and how validation fails, see [[Which Avatar Item to Make First - Classic, Rigid or Layered]] and [[UGC Validation Failures - Triage by Error Type]].

## The numbers to model against (Normal / Rthro body scale)

From the official rigid accessory specifications (studs, centred on the attachment point):

| Item | Width X | Height Y | Depth Z |
|---|---|---|---|
| Hat | 1.87 | 2.5 | 1.87 |
| Face | 1.87 | 1.25 | 1.25 |
| Back | 9.86 | 8.59 | 4.87 (1.623 front, 3.246 behind) |
| Waist | 3.94 | 4.29 (1.842 up, 2.457 down) | 7.57 |

Classic-scale boxes are bigger (Hat 3 x 4 x 3, Back 10 x 7 x 4.5), and Slender boxes are slightly smaller. Build for the scale you will publish at, and import the matching mannequin with the Importer's **Rig Scale** (Rthro = Normal, Rthro Narrow = Slender, Default = Classic).

Other hard rules: **single mesh**, **4k triangle cap**, **watertight with no exposed back faces**, quads preferred, no n-gons of 5+ sides, Marketplace textures at most **2048 x 2048**.

## Blender recipe: a beanie-style hat

1. Import the official mannequin (Avatar Resources page) so you model on the real head, not a guess.
2. Add a UV sphere (16-24 segments), delete the bottom half, and scale it so it wraps the skull with a small gap (about 0.02-0.05 studs) to avoid skin poking through.
3. Select the bottom edge loop, extrude down and outward for the folded brim; add a **Solidify** modifier with a small thickness so the item has real volume (watertight requirement).
4. Add 1-2 supporting loops near the brim edge or a **Bevel** with 2 segments so the silhouette reads soft at a distance.
5. Apply all modifiers, then check: *Select > Select All by Trait > Non Manifold* must select nothing.
6. Triangle check: Viewport Overlays > Statistics. A good hat is often 500-1,500 triangles; 4,000 is the ceiling, not the target.

## Blender recipe: a backpack

1. Block the main body with a cube, bevel the vertical edges (3 segments), and inset/extrude the front pocket.
2. Straps: draw a bezier curve hugging the shoulder, give it a rectangular bevel profile, convert to mesh, then **join everything into one object** (single-mesh rule).
3. Merge overlapping straps into the body only if you can keep it manifold; otherwise keep them as separate closed shells inside one object (each shell must still be closed).
4. Keep the pack inside the Back box: it is not centred, so most depth must sit **behind** the attachment point (3.246 studs behind vs 1.623 in front at Normal scale).

## Texturing quickly

- One material, one UV set. The official rigid tutorial paints directly in Blender; a 512 or 1024 texture is plenty for a hat.
- Bake edge highlights and AO into the colour map if you want a stylised look ([[Baking Normal and AO Maps in Blender for Roblox]]).

## Into Studio

1. Import with the Importer (FBX), check triangle count and scale in the import preview.
2. Open the **Accessory Fitting Tool**, pick the asset type (Hat, Back...), and it adds the correct attachment and shows the size box on a mannequin. Adjust until the mesh fits inside.
3. For an in-game-only cosmetic you can stop here and give it to players by script ([[Accessories by Script - AddAccessory, Attachment Names and Game Gear]]).

## Pitfalls

- Open hat bottoms (a hemisphere without thickness) fail the watertight rule.
- Separate objects for straps and body: the item must be one mesh.
- Modelling at Classic size and publishing as Normal: the item floats or fails the size box.
- Tiny details (zips, stitches) as geometry: paint them; they cost triangles and vanish at game-camera distance.

## Related
[[3D Modeling Blender - Hub]] - [[Which Avatar Item to Make First - Classic, Rigid or Layered]] - [[UGC Validation Failures - Triage by Error Type]] - [[Accessories by Script - AddAccessory, Attachment Names and Game Gear]] - [[Rigid accessory specifications]]
