---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/blender-rig-exporter-r15-ik-rig"
title: "Blender Rig Exporter and R15 IK Rig - Community Tools"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "no license stated on either source page - free tools to use, do not redistribute"
sources:
  - https://devforum.roblox.com/t/34729
  - https://github.com/TK-DZ/Roblox-IK-R15
cssclasses: [tg-a40]
---

# Blender Rig Exporter and R15 IK Rig - Community Tools

> Two long-running free community tools for animating **Motor6D (part-based) R15/R6 rigs in Blender** instead of the Studio editor. Neither page states a license, so: use them, credit them, don't re-host them.

## 1. Blender Rig Exporter / Animation Importer (Den_S)
- **Creator:** Den_S (@DennisRBLX), DevForum thread from 30 Mar 2017, updated over the years for Blender 2.80, 2.82, 2.91, 2.93+ (2.79 no longer maintained).
- **Parts:** a Roblox Studio plugin (library asset 716953901) + a Blender add-on (linked as Pastebin files in the thread).
- **Loop:**
  1. Studio: select a rig > **Export rig** > save the .obj.
  2. Blender: import the .obj > *Rbx Animations* sidebar tab > **Rebuild rig** (creates the armature).
  3. Pose mode, keyframe with the LocRot keying set.
  4. **Export animation** - the data is copied to the clipboard.
  5. Studio: **Load large animation** > paste > **Upload animation**.
- **Extras in the thread:** apply FBX animations (e.g. Mixamo) by mapping another armature onto the rebuilt rig by bone name; generate IK constraints (need manual tuning); XAXA's modified add-on adds R15 rotation limits.
- **Limits:** no skinned meshes/bones (use Studio's FBX importer for those); Motor6Ds must be direct children of their parent part; plugin and add-on versions must match (the `object.name = partnames[-index]` error = outdated add-on); clothing does not come across automatically.

## 2. Roblox-IK-R15 (TK-DZ, GitHub)
- **What:** `Rig15ik.blend` - an R15 rig with IK controllers (IcoSphere, Cube, Diamond, Star, SemiSphere shapes) - plus Den_S's `RbxAnimations.py` add-on and a README tutorial (animate, keyframe, export, import into Studio).
- **License:** no LICENSE file in the repo.
- **Why use it:** IK controls make walk cycles and planted-foot combat poses much faster than FK-only posing.

## When to use these vs other paths

Need | Best path
---|---
Animate a classic part-based R15/R6 rig in Blender | These tools
Skinned mesh character / imported FBX mocap | Studio Clip Editor FBX import ([[Clip Editor Import Settings - August 2026 Update]])
Mixamo / mocap with different bone names | Retarget first: [[Mixamo to R15 - Blender Retarget Workflow]]
Push meshes from Blender to Studio | Official [[Roblox Blender plugin]] (modeling transfer, not this animation loop)

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Roblox Blender plugin]] · [[Work with third-party software]] · [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]] · [[Moon Animator 2 - Paid Plugin Verdict]] · [[Free Rigging and Animation Helper Plugins]]

<!-- TDOD_GRAPH_END -->
