---
title: "Limb"
description: "Describes which limb a particular Instance belongs to (assuming the Instance is part of a Humanoid)."
api_type: enum
aliases: ["Enum.Limb"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/Limb"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes which limb a particular Instance belongs to (assuming the Instance is part of a Humanoid).*

## Description

Describes which limb a particular Instance belongs to (assuming the Instance is part of a Humanoid). Passing an Instance to the Humanoid:GetLimb() function will return the Limb for the Instance.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Head` | 0 | If the limb is a part of the Humanoid's Head. |
| `Torso` | 1 | If the limb is a part of the Humanoid's Torso. This includes UpperTorso and LowerTorso for R15 rigs. |
| `LeftArm` | 2 | If the limb is a part of the Humanoid's Left Arm. This includes UpperLeftArm, LowerLeftArm, and LeftHand for R15 rigs. |
| `RightArm` | 3 | If the limb is a part of the Humanoid's Right Arm. This includes UpperRightArm, LowerRightArm and RightHand for R15 rigs. |
| `LeftLeg` | 4 | If the limb is a part of the Humanoid's Left Leg. This includes UpperLeftLeg, LowerLeftLeg and LeftFoot for R15 rigs. |
| `RightLeg` | 5 | If the limb is a part of the Humanoid's Right Leg. This includes UpperRightLeg, LowerRightLeg, and RightFoot for R15 rigs. |
| `Unknown` | 6 | If a part is not a limb (e.g. running the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetLimb\|Humanoid:GetLimb()]] function and passing it an accessory which is a sibling of the Humanoid will return this value). |

---
*Source: [Limb](https://create.roblox.com/docs/reference/engine/enums/Limb) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
