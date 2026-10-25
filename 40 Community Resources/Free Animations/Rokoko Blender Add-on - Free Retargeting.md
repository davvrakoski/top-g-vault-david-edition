---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/rokoko-blender-addon-retargeting"
title: "Rokoko Blender Add-on - Free Retargeting"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "Add-on: MIT per README badge, LGPL-3.0 per LICENSE.md (repo is inconsistent) - tool only, nothing is bundled"
sources:
  - https://github.com/Rokoko/rokoko-studio-live-blender
  - https://raw.githubusercontent.com/Rokoko/rokoko-studio-live-blender/master/README.md
  - https://support.rokoko.com/hc/en-us/articles/4410463481489-Retarget-an-animation-in-Blender
cssclasses: [tg-a40]
---

# Rokoko Blender Add-on - Free Retargeting

> **What:** Rokoko's open-source "Studio Live" Blender add-on. Its live-streaming half needs Rokoko hardware/Studio; its **retargeting half works on any two armatures for free**, which makes it the go-to free retargeter for getting Mixamo / mocap clips onto an R15 rig.

## Facts checked on the source pages
Item | Value
---|---
Creator | Rokoko (official repo `Rokoko/rokoko-studio-live-blender`)
Cost | Free; Rokoko support says retargeting is not a paid feature
License | README badge says **MIT**; the repo's LICENSE.md is shown as **LGPL-3.0**. Either way you are only *using* the tool; animations you make keep the source clip's license
Requirements | Blender 2.80+; internet during install (it downloads libraries)
Rokoko's own description | a fairly "simple" retargeting feature, mainly for visualizing mocap on other meshes

## Retarget steps (from the README)
1. Rokoko tab > **Retargeting** panel.
2. Pick **Source** (armature with animation) and **Target** (your R15 rig), click **Build Bone List**.
3. Fix missing or wrong pairs (use [[R15 Joint Map for Retargeting]]).
4. **Auto Scale** if the rigs differ in size; set **Use Pose** and make sure both rigs are in the same pose.
5. **Retarget Animation** - a baked action appears on the target.

## Tips for Roblox users
- Fix the bone list once, then keep a saved .blend with the R15 target and the mapping set up; append each new Mixamo clip into it so the next retarget is one click. (Check your add-on version's panel for a bone-list import/export option; the README does not document one.)
- Retarget onto the **official Roblox R15 mannequin** (see [[Mixamo to R15 - Blender Retarget Workflow]]) rather than a hand-made rig; its joint names already match what Studio expects.
- If the add-on lags behind the newest Blender release (reviewers note this happens), keep an older Blender LTS just for retargeting.
- For long batches, retarget, then export with Roblox's FBX settings (Add Leaf Bones off, Simplify 0).

## Alternatives
- **Expy Kit** (pKrime, GitHub): rig conversion and "bind to active armature" tools; the repo page shows no license, so treat it as tool-only.
- **Den_S Blender Rig Exporter**: bone-name mapping onto a Roblox Motor6D rig, see [[Blender Rig Exporter and R15 IK Rig - Community Tools]].
- **Paid:** Auto-Rig Pro (used by the RancidMilk CMU conversion) - not free, listed only for context.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Mixamo to R15 - Blender Retarget Workflow]] · [[R15 Joint Map for Retargeting]] · [[Importing FBX Animations and Retargeting - Kenney Rig Walkthrough]] · [[Roblox Blender plugin]]

<!-- TDOD_GRAPH_END -->
