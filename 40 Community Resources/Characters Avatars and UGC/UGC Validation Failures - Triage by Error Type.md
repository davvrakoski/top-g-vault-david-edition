---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/ugc-validation-triage"
title: "UGC Validation Failures - Triage by Error Type"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", ugc, validation, debugging]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/marketplace/validation-system
  - https://create.roblox.com/docs/art/characters/blender-validation-tool
  - https://create.roblox.com/docs/avatar/layered-accessories/caging-best-practices
  - https://create.roblox.com/docs/avatar/dynamic-heads/caging-best-practices
---
# UGC Validation Failures - Triage by Error Type

The official [[UGC validation system]] page lists every error. This note groups them by **where you fix them**, so you know whether to open Blender or stay in Studio. Validation runs on Studio upload and on in-game creation through AvatarCreationService. In-game-only assets do not need to pass, but the checks are still a good debug tool.

## Fix in Blender (geometry, UVs, cages, rig)

| Error family | Typical cause | Fix |
| --- | --- | --- |
| Triangle budget, bounding box too small or too large | Wrong scale on export, too dense a mesh | Apply scale, use the official mannequin for size, decimate |
| Not watertight, N-gons, zero-area or degenerate triangles | Modeling leftovers | Merge by distance, triangulate check, fill holes |
| Non-manifold or self-intersecting faces (quality score) | Internal faces, T-junctions | Delete internal faces, fix overlaps |
| Cage UV mismatch (over 100 bad UVs on accessories, over 7 per body part) | Cage re-UVed, vertices deleted, wrong template | Re-start from the official cage template |
| Outer cage too far from mesh (over about 0.60) | Cage pushed out too much | Pull cage back to just outside the surface |
| Mesh outside outer cage (over about 65% of vertices) | Cage not moved over the garment | Push cage out over the garment |
| Cage relevancy (under 40% of edits cover the item) | Edited cage areas the garment does not touch | Reset untouched areas to template |
| Skinning missing, or present on a rigid item | Wrong export, armature modifier left on a hat | Bodies and layered: skin; rigid: no skin |
| Dynamic head: cannot detect blink, mouth open, happy or sad | FACS poses missing or cage landmarks not aligned with eyes and mouth | Add the 17 required poses; fix landmark area of the head cage |
| UVs outside 0 to 1, similar vertices (warnings only) | Unpacked UVs, duplicates | Pack UVs, merge by distance |

## Fix in Studio (hierarchy, properties, attachments)

| Error | Fix |
| --- | --- |
| `AvatarPartScaleType` values differ or are invalid | All MeshParts the same, one of `Classic`, `ProportionsSlender`, `ProportionsNormal` |
| Part has non-zero transparency | Set every MeshPart `Transparency` to 0 |
| Failed to load mesh, mesh has zero size | Re-import; check MeshId |
| Instance contains Attributes | Remove all custom attributes before upload |
| Rig attachments rotated | Set rig attachment orientation to 0, 0, 0 |
| Accessory attachment outside valid region | Move it onto the mesh surface where the item sits |
| Rig attachment too far from the joint boundary | Move it to the edge where the parts connect |
| Animation Weight not greater than 0 | Set the `Weight` NumberValue to a positive number (usually 1) |
| Banned scripts or class names | Remove scripts and non-allowed instances |

## Order of operations

1. Run Roblox's **Blender validation tool** before export when you can.
2. Import, then check the Output for importer warnings first; many validation failures start as importer warnings.
3. Use the validation **visualization checks** in Studio; they highlight the exact cage or mesh area.
4. Fix geometry issues in Blender in one pass; fix property issues in Studio last.
5. Only then pay the upload fee. The 80 Robux is not refunded on rejection.

## Credits

- Roblox Creator Docs: *UGC validation system*, *Blender validation tool*, caging best-practices pages (CC BY 4.0). Grouping and wording are our own.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[UGC validation system]] · [[Blender validation tool]] · [[Layered Clothing in Blender - Cage Editing Rules]] · [[Avatar Body from Blender - Part Names, Attachments and FBX Export]] · [[Dynamic head caging best practices]]

<!-- TDOD_GRAPH_END -->
