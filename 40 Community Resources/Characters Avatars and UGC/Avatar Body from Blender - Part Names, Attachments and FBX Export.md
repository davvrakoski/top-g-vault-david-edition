---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/avatar-body-blender-export"
title: "Avatar Body from Blender - Part Names, Attachments and FBX Export"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", blender, avatar-body, fbx, ugc]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/avatar/character-bodies/specifications
  - https://create.roblox.com/docs/avatar/character-bodies/export
  - https://create.roblox.com/docs/avatar/character-bodies/import
  - https://create.roblox.com/docs/avatar/resources
---
# Avatar Body from Blender - Part Names, Attachments and FBX Export

A one-page checklist for building an R15 avatar body in Blender that imports cleanly into Studio and can pass Marketplace validation. Triangle budgets are in [[Roblox Mesh and Avatar Geometry Specs — 2026 Snapshot]].

## Start from the official files

Roblox publishes Blender project files with the R15 rig, the 15 body-part cages and the attachment points. Use them as the base; they are not meant to be imported straight into Studio, they are starting points. Check the license or terms on the download page before redistributing them.

## 15 mesh objects

Head, UpperTorso, LowerTorso, LeftUpperArm, LeftLowerArm, LeftHand, RightUpperArm, RightLowerArm, RightHand, LeftUpperLeg, LeftLowerLeg, LeftFoot, RightUpperLeg, RightLowerLeg, RightFoot.

- Each mesh is watertight (no holes or exposed backfaces). Cages do not need to be watertight.
- Freeze all transforms; pivots at 0, 0, 0.
- Parent all meshes under the armature.

## Outer cages

- One per body part, named `<Part>_OuterCage` (for example `LeftUpperArm_OuterCage`).
- Do not delete vertices or touch UVs. You may parent all cages to one Empty to tidy the outliner.

## 19 attachments (`_Att` suffix)

| Part | Attachments |
| --- | --- |
| Head | FaceCenter_Att, FaceFront_Att, Hat_Att, Hair_Att |
| UpperTorso | LeftCollar_Att, RightCollar_Att, Neck_Att, BodyBack_Att, BodyFront_Att |
| LowerTorso | Root_Att (must be at 0, 0, 0), WaistFront_Att, WaistBack_Att, WaistCenter_Att |
| Arms | LeftShoulder_Att, RightShoulder_Att |
| Hands | LeftGrip_Att, RightGrip_Att (perpendicular to the lower arm bone; for an I-pose, 90, 0, 0) |
| Feet | LeftFoot_Att, RightFoot_Att |

Head attachments must sit on the visible head surface; floating attachments break policy.

## Rig

- Standard R15 bone hierarchy and names; LowerTorso and Root bones at 0, 0, 0.
- Export in I-pose, A-pose or T-pose; upper arm bones may carry rotation.
- Advanced R15 rigs can add optional bones (see [[Skinning Avatar Bodies - Influence Limits and Advanced R15 Bones]]).

## Blender FBX export settings (from the official export guide)

1. File, Export, FBX.
2. Path Mode: **Copy**, and toggle **Embed Textures**.
3. Include: enable **Custom Properties** (dynamic head FACS mapping lives there).
4. Transform: Apply Scalings **FBX Unit Scale**.
5. Armature: **uncheck Add Leaf Bones**.
6. Animation: enabled, but uncheck **NLA Strips**, **All Actions** and **Force Start/End Keyframes**; Simplify **0.0**.
7. Make the timeline Start and End cover every FACS keyframe.

`.gltf` export is also supported.

## Import in Studio

- Importer Rig Type picks the body scale: **Rthro** (Normal), **Rthro Narrow** (Slender), **Default** (Classic).
- Turn off "Upload to Roblox" while iterating to avoid piles of Toolbox copies.
- Quick test: rename the imported model `StarterCharacter`, drop it in StarterPlayer, press Play (see [[StarterCharacter Setup Checklist]]).

## Common mistakes

- Leaf bones left on, which adds extra end bones and breaks the rig hierarchy.
- Unapplied modifiers or scale; the body imports huge or tiny.
- A merged single mesh instead of 15 parts. Either split it yourself or let Avatar Setup partition it.

## Credits

- Roblox Creator Docs: *Character body specifications*, *Export character bodies*, *Import character bodies*, *Avatar resources* (CC BY 4.0). Summarized in our own words.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Character body specifications]] · [[Export character bodies]] · [[Roblox Mesh and Avatar Geometry Specs — 2026 Snapshot]] · [[FBX Import Settings, Scale and Collision Fidelity]] · [[R15 Joint Map for Retargeting]]

<!-- TDOD_GRAPH_END -->
