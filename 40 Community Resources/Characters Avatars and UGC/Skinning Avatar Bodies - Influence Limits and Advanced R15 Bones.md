---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/skinning-avatar-bodies"
title: "Skinning Avatar Bodies - Influence Limits and Advanced R15 Bones"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", blender, skinning, rigging]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/avatar/character-bodies/specifications
  - https://create.roblox.com/docs/avatar/automatic-skinning-transfer
  - https://create.roblox.com/docs/art/modeling/skin-a-humanoid-model
  - https://create.roblox.com/docs/marketplace/validation-system
---
# Skinning Avatar Bodies - Influence Limits and Advanced R15 Bones

Skinning decides how the mesh bends with the bones. Roblox's limits are simple; most problems come from Blender defaults.

## Platform rules

- **Max 4 influences per vertex.** No vertex may be weighted to more than 4 bones.
- **No weights on the Root bone.**
- Keep influences **symmetric** where you can.
- Bodies and layered accessories **must** include skinning data; rigid accessories must **not**.
- The skin weight count must match the vertex count (validation checks this).

## Blender habits that keep you inside the rules

- In Weight Paint mode, run **Weights, Limit Total** with a limit of 4, then **Normalize All**, before every export.
- Remove empty vertex groups and any group named after a bone that is not in the R15 hierarchy.
- Check the Root group is empty.
- Paint with X-mirror on for symmetric bodies.
- Bend test: pose elbows, knees, shoulders and hips to extreme angles in Blender before exporting; candy-wrapper twists at the forearm usually mean weights too concentrated on one bone.

## Advanced R15 rigs

Advanced R15 keeps the standard 15-part structure but allows **up to 37 optional extra bones** for articulated hands (fingers), shoulders, spine and feet. Rules:

- Each optional bone must follow the exact naming and hierarchy for its body part.
- Skin each extra bone on the matching mesh object.
- `HumanoidRigDescription` objects are needed to animate individual parts and set per-joint behavior; `DigitsRigDescription` objects (one per hand) enable hand articulation. Both find bones by name, so name correctly before import.
- A validation quality check scores joint count and left/right hand symmetry.

Use the advanced rig when your game shows hands up close (first-person, emotes, sign language). Otherwise the standard rig is lighter.

## Accessories without manual skinning

**Automatic Skinning Transfer** (`WrapLayer.AutoSkin`) builds skinning for layered and face accessories from the body's cage at runtime. `EnabledPreserve` keeps existing weights if present; `EnabledOverride` replaces them. For eyelashes and brows, weight some vertices to special `RBX_Leader` and the rest to `RBX_Follower` joints (placed under Root) so the tips follow the lid instead of the brow.

## Credits

- Roblox Creator Docs: *Character body specifications* (Rigging, Skinning), *Automatic Skinning Transfer*, *Skin a humanoid model*, *UGC validation system* (CC BY 4.0). Blender menu names are Blender's own features. Summarized in our own words.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Skin a humanoid model]] · [[Automatic Skinning Transfer]] · [[Avatar Body from Blender - Part Names, Attachments and FBX Export]] · [[Free Rigging and Animation Helper Plugins]] · [[Blender Rig Exporter and R15 IK Rig - Community Tools]]

<!-- TDOD_GRAPH_END -->
