---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/r15-joint-map-retargeting"
title: "R15 Joint Map for Retargeting"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "original reference table (no third-party content)"
sources:
  - https://create.roblox.com/docs/avatar/character-bodies/specifications
  - https://create.roblox.com/docs/characters/adaptive-animation
  - https://rancidmilk.itch.io/free-character-animations
cssclasses: [tg-a40]
---

# R15 Joint Map for Retargeting

> **Use:** paste-ready bone map when retargeting Mixamo, CMU/BVH or Quaternius-style clips onto a standard R15 rig (Rokoko add-on, Blender constraints, or any retargeter). Standard R15 = **15 parts**, which is also the minimum joint count Adaptive Animation asks for.

## R15 parts and the Motor6D that drives each

R15 part (bone) | Parent | Motor6D name
---|---|---
LowerTorso | HumanoidRootPart | Root
UpperTorso | LowerTorso | Waist
Head | UpperTorso | Neck
LeftUpperArm / RightUpperArm | UpperTorso | LeftShoulder / RightShoulder
LeftLowerArm / RightLowerArm | Upper arm | LeftElbow / RightElbow
LeftHand / RightHand | Lower arm | LeftWrist / RightWrist
LeftUpperLeg / RightUpperLeg | LowerTorso | LeftHip / RightHip
LeftLowerLeg / RightLowerLeg | Upper leg | LeftKnee / RightKnee
LeftFoot / RightFoot | Lower leg | LeftAnkle / RightAnkle

## Source skeleton to R15

R15 target | Mixamo (`mixamorig:`) | CMU BVH (cgspeed style) | Notes
---|---|---|---
LowerTorso | Hips | Hips | Carries root translation; keep in-place clips flat
UpperTorso | Spine2 (or Spine1) | Spine1 / Spine | Map **one** spine bone only
Head | Head (Neck unmapped) | Head (Neck unmapped) | Or map Neck if the head looks stiff; never both
LeftUpperArm | LeftArm | LeftArm | Leave LeftShoulder (clavicle) unmapped
LeftLowerArm | LeftForeArm | LeftForeArm |
LeftHand | LeftHand | LeftHand | Fingers dropped on standard R15
LeftUpperLeg | LeftUpLeg | LeftUpLeg |
LeftLowerLeg | LeftLeg | LeftLeg |
LeftFoot | LeftFoot | LeftFoot | Toe bones unmapped
(right side) | mirror of the left | mirror of the left |

Bone names in BVH conversions vary by converter; check the hierarchy in Blender's outliner and adapt the middle column.

## Rules that save hours
- **One source bone per R15 part.** Extra spine/neck/clavicle bones must be left unmapped or baked into their parent first.
- **Same rest pose:** put both rigs in the same T- or A-pose before baking. Rest-pose mismatch = twisted forearms and inward elbows.
- **Root vs hips:** Roblox moves characters with the Humanoid; strip forward travel from LowerTorso for loops ([[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]]).
- **Advanced R15** rigs (higher-fidelity mannequins) add finger and extra spine/shoulder bones; map fingers only if your target really has them.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Mixamo to R15 - Blender Retarget Workflow]] · [[Rokoko Blender Add-on - Free Retargeting]] · [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]] · [[Character body specifications]]

<!-- TDOD_GRAPH_END -->
