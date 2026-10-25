---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/mixamo-to-r15-blender-retarget"
title: "Mixamo to R15 - Blender Retarget Workflow"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "workflow note - source clips keep their own license (Mixamo = use-only)"
sources:
  - https://create.roblox.com/docs/avatar/character-bodies/project-files
  - https://create.roblox.com/docs/avatar/emotes/export
  - https://create.roblox.com/docs/avatar/emotes/import
  - https://support.rokoko.com/hc/en-us/articles/4410463481489-Retarget-an-animation-in-Blender
  - https://devforum.roblox.com/t/animation-import-improvements/4775593
  - https://devforum.roblox.com/t/mixamo-plugin-released/2298825
  - https://devforum.roblox.com/t/34729
cssclasses: [tg-a40]
---

# Mixamo to R15 - Blender Retarget Workflow

> **Goal:** a Mixamo (or any Mixamo-skeleton) clip playing on a standard R15 character in Roblox, using only free tools. Same path works for Rokoko free packs and Quaternius UAL (both ship Mixamo-compatible rigs). License reminder: Mixamo clips are **use-only** - see [[Mixamo - License Terms for Roblox Games]].

## Tools (all free)
- **Blender** (any recent LTS).
- **Rokoko Studio Live add-on** for retargeting - [[Rokoko Blender Add-on - Free Retargeting]]. Rokoko's support article says retargeting needs no paid account.
- **An R15 target armature:** Roblox's official reference files (`ClassicMannequin.fbx`, `RthroMannequin.fbx`, `Lola.fbx`) from the *Character body reference files* docs page. These are proper R15 skinned rigs.

## Step by step
1. **Download from Mixamo:** FBX Binary, Without Skin, 30 fps, In Place for locomotion.
2. **Import both into Blender:** the R15 mannequin and the Mixamo FBX (File > Import > FBX; for Mixamo tick *Automatic Bone Orientation* only if bones come in pointing the wrong way).
3. **Match scale and rest pose:** scale the Mixamo armature so its hip height matches the mannequin; apply scale (Ctrl+A). Both rigs should be in a similar T/A-pose at frame 0. A bad rest-pose match is the main cause of the "arms bend inwards" complaint reported in the 2023 DevForum Mixamo plugin thread.
4. **Retarget with Rokoko:** Rokoko tab > Retargeting panel. Source = Mixamo armature, target = R15 armature, click *Build Bone List*, fix the mapping with [[R15 Joint Map for Retargeting]], turn on *Auto Scale* if sizes differ, pick the matching pose under *Use Pose*, then *Retarget Animation*. The add-on bakes a new action on the R15 armature.
5. **Clean up:** delete the Mixamo armature; check the first and last frame match for loops; remove hip drift for in-place clips ([[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]]).
6. **Export FBX** with Roblox's documented Blender settings: Apply Scalings = FBX Unit Scale, **Add Leaf Bones off**, Animation on, NLA Strips / All Actions / Force Start-End off, Simplify 0.
7. **Import in Studio:** Avatar tab > add an R15 character > Clip Editor (Animation Editor) > `...` > Import > From File. Since the August 2026 update the import dialog lets you set **Rig Scale**, **Rest Pose Source**, **Rig Type (R15/Custom)** and which track to load - see [[Clip Editor Import Settings - August 2026 Update]].
8. **Publish** under the account or group that owns the game ([[Animation Permissions and Sharing - 2025 Update]]), set priority and looping, test in a live server.

## Mixamo-specific gotchas
- **Bone prefix:** Mixamo bones are `mixamorig:Hips` etc. Rokoko's auto-mapping usually handles it; if not, strip the prefix with a rename before mapping.
- **Three spine bones vs one UpperTorso:** map `Spine2` (or `Spine1`) to UpperTorso and leave the others unmapped; mapping all three double-bends the back.
- **Shoulder bones:** Mixamo has `LeftShoulder` (clavicle) plus `LeftArm`. R15 has no clavicle; map `LeftArm` to LeftUpperArm and leave the clavicle unmapped, or the arm inherits extra rotation.
- **Fingers:** standard R15 has no finger bones; they are dropped. Advanced R15 rigs (higher-fidelity mannequins) do have them.
- **Name collisions:** keep bone names different from mesh object names in the export or Studio converts that bone into a Motor6D (community tip in the import-improvements thread).

## Alternative without retargeting in Blender
- **Den_S Blender Rig Exporter / Animation Importer** can map other armatures onto its rebuilt Roblox rig by bone name and upload via clipboard - see [[Blender Rig Exporter and R15 IK Rig - Community Tools]].
- **Adaptive Animation** goes the other way (R15 animations on a custom rig) - covered in [[Importing FBX Animations and Retargeting - Kenney Rig Walkthrough]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Importing FBX Animations and Retargeting - Kenney Rig Walkthrough]] · [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]] · [[Export emotes]] · [[Import emotes]] · [[Character body reference files]]

<!-- TDOD_GRAPH_END -->
