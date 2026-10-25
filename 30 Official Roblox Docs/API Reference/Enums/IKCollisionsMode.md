---
title: "IKCollisionsMode"
description: "Controls which parts in the workspace participate in collision resolution when `WorldRoot:IKMoveTo()` drives a part toward a target `CFrame`."
api_type: enum
aliases: ["Enum.IKCollisionsMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/IKCollisionsMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls which parts in the workspace participate in collision resolution when [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#IKMoveTo|WorldRoot:IKMoveTo()]] drives a part toward a target [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].*

## Description

Controls which parts in the workspace participate in collision resolution when [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#IKMoveTo|WorldRoot:IKMoveTo()]] drives a part toward a target [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] via inverse kinematics.

The three [[30 Official Roblox Docs/API Reference/Enums/IKCollisionsMode|Enum.IKCollisionsMode]] values offer a spectrum of collision fidelity. [[30 Official Roblox Docs/API Reference/Enums/IKCollisionsMode|Enum.IKCollisionsMode.NoCollisions]] ignores the rest of the workspace and moves only the mechanism being dragged (fastest, most permissive). [[30 Official Roblox Docs/API Reference/Enums/IKCollisionsMode|Enum.IKCollisionsMode.OtherMechanismsAnchored]] keeps the dragged mechanism physically correct against the scene but treats other objects as immovable anchors. [[30 Official Roblox Docs/API Reference/Enums/IKCollisionsMode|Enum.IKCollisionsMode.IncludeContactedMechanisms]] lets the dragged mechanism push unanchored objects, so the entire contacted set participates in resolution.

[[30 Official Roblox Docs/API Reference/Classes/WorldRoot#IKMoveTo|WorldRoot:IKMoveTo()]] defaults to [[30 Official Roblox Docs/API Reference/Enums/IKCollisionsMode|Enum.IKCollisionsMode.OtherMechanismsAnchored]] when no collisions mode is supplied.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `NoCollisions` | 0 | Only the part and any parts directly joined to it via joints/[[30 Official Roblox Docs/API Reference/Classes/Constraint\|constraints]] will be involved in the resolution; everything else in the workspace will be treated as though it doesn't exist. |
| `OtherMechanismsAnchored` | 1 | Only the part and any parts directly joined to it via joints/[[30 Official Roblox Docs/API Reference/Classes/Constraint\|constraints]] will be moved during resolution, but they will collide with other objects in the workspace. |
| `IncludeContactedMechanisms` | 2 | The part, any parts directly joined to it via joints/[[30 Official Roblox Docs/API Reference/Classes/Constraint\|constraints]], and any parts which it comes into contact with during the solve will be moved during the resolution. That is, the moved parts will be allowed to "push" other unanchored parts in the workspace out of the way in order to get to the target position. |

---
*Source: [IKCollisionsMode](https://create.roblox.com/docs/reference/engine/enums/IKCollisionsMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
