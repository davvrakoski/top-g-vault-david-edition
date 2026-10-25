---
title: "DragDetectorPermissionPolicy"
description: "Used to control the permission level for which players can interact with a `DragDetector`."
api_type: enum
aliases: ["Enum.DragDetectorPermissionPolicy"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DragDetectorPermissionPolicy"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used to control the permission level for which players can interact with a [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]].*

## Description

Used to control the permission level for which players can interact with a [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] through its [[30 Official Roblox Docs/API Reference/Classes/DragDetector#PermissionPolicy|PermissionPolicy]] property.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Nobody` | 0 | No players can interact with the [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |
| `Everybody` | 1 | All players can interact with the [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |
| `Scriptable` | 2 | Invokes the function registered via [[30 Official Roblox Docs/API Reference/Classes/DragDetector#SetPermissionPolicyFunction\|DragDetector:SetPermissionPolicyFunction()]], enabling/disabling the detector based on whether the function returns `true` or `false`. |

---
*Source: [DragDetectorPermissionPolicy](https://create.roblox.com/docs/reference/engine/enums/DragDetectorPermissionPolicy) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
