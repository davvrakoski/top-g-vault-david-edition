---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/layered-clothing-blender-cages"
title: "Layered Clothing in Blender - Cage Editing Rules"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", layered-clothing, blender, cages, ugc]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/art/modeling/cage-meshes/create-cages
  - https://create.roblox.com/docs/avatar/layered-accessories/caging-best-practices
  - https://create.roblox.com/docs/avatar/layered-accessories/specifications
  - https://create.roblox.com/docs/marketplace/validation-system
  - https://devforum.roblox.com/t/trouble-with-layered-clothing/3222059
  - https://devforum.roblox.com/t/layered-clothing-not-deleting-hidden-faces/3349681
---
# Layered Clothing in Blender - Cage Editing Rules

The fastest way to fail layered-clothing validation is to treat cages like normal meshes. These rules come from the Creator Hub caging docs and the UGC validation thresholds.

## Golden rules

1. **Start from Roblox's template cages.** The docs say not to build your own cages for avatar items. Append the inner and outer cage from the official clothing project file.
2. **Only move vertices.** Never delete, add, merge or re-UV cage vertices. Matching relies on cage UVs.
3. **Leave the inner cage alone for most clothing.** The template inner cage matches the body; the outer cage starts identical and is the one you push out over your garment.
4. **Keep the outer cage tight.** It should sit just outside the garment everywhere.
5. **Name them right**: `MyJacket_InnerCage`, `MyJacket_OuterCage`, and the render mesh `MyJacket`.
6. **Export render mesh plus both cages together** in one `.fbx` or `.gltf`.

## Validation thresholds to aim for

The UGC validation system scores cages. Default thresholds in the docs:

| Check | Fails when |
| --- | --- |
| Outer cage to mesh distance | Any cage vertex is farther than about 0.60 units from the mesh |
| Mesh outside outer cage | More than about 65% of mesh vertices sit outside the outer cage |
| Cage relevancy | Fewer than 40% of your outer cage edits actually cover the accessory (you moved cage areas the garment does not touch) |
| Cage UV | More than 100 cage UVs do not match the template |

So: move only the cage area over the garment, push it just past the surface, and keep everything else at the template position.

## Blender workflow

1. Model the garment on the Roblox mannequin from the official project file (correct scale).
2. Append the template cages; hide the inner cage.
3. In Edit Mode on the outer cage, use proportional editing or a Shrinkwrap modifier with an offset to bring cage vertices just outside the garment, then **apply** the modifier.
4. Check: no cage vertex inside the garment, no huge bulges away from it.
5. Skin the garment to the R15 armature (or plan to use Automatic Skinning Transfer).
6. Export with the same FBX settings as bodies (see [[Avatar Body from Blender - Part Names, Attachments and FBX Export]]).
7. Import in Studio, then test on several bodies with Avatar Setup's Check Body tools and the Accessory Fitting Tool.

## Community symptoms

- A DevForum thread (topic 3222059) hit non-manifold and overlapping-vertex import errors when using a cage from a third-party Blender add-on, while the official template imported cleanly. Use the official cage.
- Hidden faces still visible in play mode even though Studio hid them (topic 3349681): test in a real playtest, not only the edit viewport.

## Credits

- Roblox Creator Docs: *Create cages in Blender*, *Layered accessory caging best practices*, *Layered accessory specifications*, *UGC validation system* (CC BY 4.0).
- DevForum topics 3222059 and 3349681 (their posters). Summaries in our own words.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Layered Clothing Explained - Cages, WrapLayer and WrapTarget]] · [[Create cages in Blender]] · [[Layered accessory caging best practices]] · [[UGC Validation Failures - Triage by Error Type]] · [[Free Blender Add-ons for Roblox Work]]

<!-- TDOD_GRAPH_END -->
