---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/clip-editor-import-settings-2026"
title: "Clip Editor Import Settings - August 2026 Update"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "n/a - summary of a Roblox announcement"
sources:
  - https://devforum.roblox.com/t/animation-import-improvements/4775593
  - https://create.roblox.com/docs/avatar/emotes/import
  - https://create.roblox.com/docs/avatar/emotes/export
cssclasses: [tg-a40]
---

# Clip Editor Import Settings - August 2026 Update

> **Source:** DevForum announcement "Animation Import Improvements", 4 Aug 2026, posted by **bballerblox** (Roblox). Changes how FBX/glTF animations come into the Animation Editor (now labelled **Clip Editor** in the Avatar tab). Matters for every free-mocap workflow in this cluster.

## New import dialog (Clip Editor > `...` > Import > From File)

Setting | What it does | When to touch it
---|---|---
**Rig Scale** | Scales the imported motion to Studio units (the post reminds: 1 stud = 0.28 m) | Mixamo/BVH files in cm or m that come in huge/tiny or with floating hips
**Rest Pose Source** | Choose which track gives the rest pose instead of always "first frame of first track"; options include *Imported Rig* and *Imported Rig (Zeroed Rotations)* | Twisted limbs after import; try the zeroed option when source bones have non-zero rest rotations
**Rig Type** | R15 or Custom | R15 for humanoids (emotes, Humanoid features); Custom for creatures, props, non-humanoids
**Animation Track Selection** | Pick which take/track in the file to load | Multi-take FBX files (e.g. several clips in one export)

Other changes:
- Animations that come in with models through the **3D Importer** are auto-saved under **AnimSaves** (in ServerStorage) when the Clip Editor is open.
- Staff reply: the 3D Importer's *Animation General* section has **"Default with rotations"** to preserve original global rotations.
- Dialog now scales with the editor window.

## Known issues from the replies
- Some users hit a "64 errors" message when publishing; one fixed it by restarting Studio.
- Option naming was called confusing; staff said the interoperability team is still working on it.

## Fits with the official export settings
Export from Blender with Roblox's documented settings (FBX Unit Scale, Add Leaf Bones off, Simplify 0, no NLA/All Actions). Then use Rig Scale only if the result is still off - do not double-scale.

## Why it matters for free mocap
Most "my Mixamo/CMU clip imports broken" problems were rest-pose or scale problems. With Rest Pose Source + Rig Scale, many clips that used to need a Blender round-trip just for fixing scale now import directly onto an R15 rig. Retargeting (different bone names) still needs Blender: [[Mixamo to R15 - Blender Retarget Workflow]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Import emotes]] · [[Export emotes]] · [[Animation Editor]] · [[FBX Import Settings, Scale and Collision Fidelity]] · [[Importing FBX Animations and Retargeting - Kenney Rig Walkthrough]]

<!-- TDOD_GRAPH_END -->
