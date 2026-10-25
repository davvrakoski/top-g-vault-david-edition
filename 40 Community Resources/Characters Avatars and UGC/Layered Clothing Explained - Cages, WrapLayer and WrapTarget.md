---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/layered-clothing-explained"
title: "Layered Clothing Explained - Cages, WrapLayer and WrapTarget"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", layered-clothing, cages]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/avatar/layered-accessories
  - https://create.roblox.com/docs/avatar/layered-accessories/specifications
  - https://create.roblox.com/docs/reference/engine/classes/WrapLayer
  - https://create.roblox.com/docs/reference/engine/classes/WrapTarget
  - https://create.roblox.com/docs/reference/engine/classes/BaseWrap
  - https://create.roblox.com/docs/avatar/automatic-skinning-transfer
---
# Layered Clothing Explained - Cages, WrapLayer and WrapTarget

Layered clothing is 3D clothing that stretches to fit any body and stacks with other clothing. It works by matching invisible **cage** meshes, not by skinning to a specific body.

## The parts

| Piece | Lives on | Job |
| --- | --- | --- |
| **Outer cage** of the body | `WrapTarget` on each body MeshPart | The surface clothing wraps onto. Each body part has a `_OuterCage` mesh. |
| **Inner cage** of the clothing | `WrapLayer` (its reference mesh) | Describes how the garment sits on whatever is under it. |
| **Outer cage** of the clothing | `WrapLayer` (its cage mesh) | Becomes the new surface for the next layer on top. |
| **Order** | `WrapLayer.Order` (default 1) | Higher draws on top. Equal values give an ambiguous result. |
| **HSR data** | read-only on the wrap | Precomputed hidden-surface removal so covered triangles underneath are not drawn. |

Matching works by **cage UVs**: vertices with the same UV on the body cage and the clothing cages are treated as the same point. That is why you must never delete cage vertices or edit cage UVs.

## Properties worth knowing in 2026

- `Order`: the only one you will set in scripts often.
- `AutoSkin` (`Disabled`, `EnabledOverride`, `EnabledPreserve`): Automatic Skinning Transfer computes skinning for the clothing from the body, so you do not have to skin the garment yourself. Requires layered clothing loading to be on.
- `BindOffset`: fine-tune position, plugin-write only.
- `Puffiness`, `ShrinkFactor` and `WrapTarget.Stiffness`: marked **deprecated** in the API reference. Ignore old tutorials that tune them.

## Engine switches

- `StarterPlayer.LoadCharacterLayeredClothing` controls whether spawning characters wear layered clothing.
- `Workspace.MeshPartHeadsAndAccessories` must also be enabled.

## Marketplace numbers (from the specs)

- Max **4,000 triangles** per layered accessory.
- Textures up to **2048 x 2048** for Marketplace assets.
- Must include both an inner cage (`ItemName_InnerCage`) and an outer cage (`ItemName_OuterCage`).

## Mental model for debugging

- Clothing pokes through the body: the clothing's inner cage is too far out, or the render mesh sits outside its outer cage.
- Next layer clips through this one: this item's outer cage does not enclose its own render mesh.
- Clothing stretches oddly on one body: that body's outer cage is non-standard (custom bodies with edited cage UVs).
- Two jackets fight: they share the same `Order`.

## Credits

- Roblox Creator Docs: *Layered accessories*, *Layered accessory specifications*, *Automatic Skinning Transfer*, WrapLayer, WrapTarget and BaseWrap references (CC BY 4.0). Summarized in our own words.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Layered accessories]] · [[Layered Clothing in Blender - Cage Editing Rules]] · [[Layered Clothing on Custom and Non-R15 Rigs]] · [[Character Materials, Rigging and Layering]] · [[Cage meshes]]

<!-- TDOD_GRAPH_END -->
