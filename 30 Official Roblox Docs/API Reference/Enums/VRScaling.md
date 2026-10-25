---
title: "VRScaling"
description: "Controls whether `VRService` automatically adjusts the perceived scale of the world in VR to match the player's avatar size."
api_type: enum
aliases: ["Enum.VRScaling"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/VRScaling"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether [[30 Official Roblox Docs/API Reference/Classes/VRService|VRService]] automatically adjusts the perceived scale of the world in VR to match the player's avatar size.*

## Description

`VRScaling` is used by the [[30 Official Roblox Docs/API Reference/Classes/VRService#AutomaticScaling|VRService.AutomaticScaling]] property to determine how the engine scales the player's view in VR. When set to [[30 Official Roblox Docs/API Reference/Enums/VRScaling|Enum.VRScaling.World]], the engine automatically adjusts [[30 Official Roblox Docs/API Reference/Classes/Camera#HeadScale|Camera.HeadScale]] so that the scale of the world matches the player's avatar height, preserving immersion when avatars differ in size. When set to [[30 Official Roblox Docs/API Reference/Enums/VRScaling|Enum.VRScaling.Off]], no automatic adjustment is made and you can set [[30 Official Roblox Docs/API Reference/Classes/Camera#HeadScale|Camera.HeadScale]] manually to control the perceived world scale.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `World` | 0 | Adjusts [[30 Official Roblox Docs/API Reference/Classes/Camera#HeadScale\|Camera.HeadScale]] so that the world in VR is seen from the avatar's perspective. |
| `Off` | 1 | Disables VR automatic scaling; set [[30 Official Roblox Docs/API Reference/Classes/Camera#HeadScale\|Camera.HeadScale]] manually if needed. |

---
*Source: [VRScaling](https://create.roblox.com/docs/reference/engine/enums/VRScaling) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
