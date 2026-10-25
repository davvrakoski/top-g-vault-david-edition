---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/free-animations-on-r6"
title: "Free Animations on R6 Rigs - What Transfers"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "original workflow text"
sources:
  - https://devforum.roblox.com/t/converting-r15-animations-to-r6/611816
  - https://devforum.roblox.com/t/34729
  - https://devforum.roblox.com/t/mixamo-plugin-released/2298825
cssclasses: [tg-a40]
---

# Free Animations on R6 Rigs - What Transfers

> Many combat/"battlegrounds" games still use **R6** for its readable blocky silhouette. Almost every free animation source (Mixamo, mocap, Quaternius, Rokoko) is built for a full humanoid skeleton, which maps to **R15**. Getting it onto R6 is a lossy conversion - plan for cleanup.

## Why R6 is harder
- R6 has **6 body parts** (Head, Torso, Left/Right Arm, Left/Right Leg) and **no elbows, knees, wrists, ankles or waist**. Joints: RootJoint (HumanoidRootPart to Torso), Neck, Left/Right Shoulder, Left/Right Hip.
- A mocap punch is mostly elbow extension and torso twist; on R6 neither exists, so the motion must be re-expressed as **whole-arm and whole-body rotation**.
- An R15 animation ID **will not play on R6** (and the reverse); you need a separate upload per rig type.
- No reliable R15-to-R6 converter exists: a 2020 DevForum thread asking for one found only an R6-to-R15 plugin and the advice to convert by hand.

## Workable path
1. **Pick clips that read without elbows/knees:** big swings, kicks with straight legs, idles, emotes with arm raises, leans. Skip fine hand work and crouch walks.
2. In Blender, build the R6 rig with Den_S's exporter (supports part-based R6 rigs) - [[Blender Rig Exporter and R15 IK Rig - Community Tools]].
3. **Constrain, don't map 1:1:** aim each R6 limb at the end of the source limb (e.g. Damped Track from the R6 arm to the source hand/wrist bone, leg to the ankle). That keeps the *direction* of a bent limb, which is what the eye reads on R6.
4. Torso follows the source **chest** bone (not the hips) so twists survive; RootJoint follows the hips for bob and lean.
5. Bake, then re-time: R6 motions usually need **bigger, snappier** poses than the mocap to read; push key poses further and trim in-betweens.
6. Export with the add-on's clipboard upload, publish under the game owner.

## When to hand-animate instead
For signature combat moves on R6, keyframing from scratch in the Clip Editor (or Moon Animator) is usually faster than fixing converted mocap. Use the mocap only as **timing reference** - play it beside your rig and match its anticipation/impact frames ([[Combat Animation Authoring Tips]]).

## Mixamo-on-R6 plugins
A 2023 DevForum "Mixamo plugin" added R6 versions of Mixamo clips from a built-in list; that redistributes Mixamo data, so it is not recommended here ([[Mixamo - License Terms for Roblox Games]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]] · [[R15 Joint Map for Retargeting]] · [[Free Rigging and Animation Helper Plugins]] · [[Combat Animation Authoring Tips]]

<!-- TDOD_GRAPH_END -->
