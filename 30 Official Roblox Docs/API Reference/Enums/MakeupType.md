---
title: "MakeupType"
description: "The category of makeup asset applied to an avatar through a `MakeupDescription`."
api_type: enum
aliases: ["Enum.MakeupType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/MakeupType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The category of makeup asset applied to an avatar through a [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription|MakeupDescription]].*

## Description

`MakeupType` categorizes the region of the avatar face that a [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription|MakeupDescription]] targets. Each `MakeupDescription` child of a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] carries a `MakeupType` that determines which platform asset type is used when loading and compositing the makeup layer. Multiple layers of the same type can be stacked; their compositing order is controlled by [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription#Order|MakeupDescription.Order]]. Makeup is only supported on R15 characters with [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] heads.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Face` | 0 | Makeup asset applied broadly across the face, such as blush or foundation; the default value of [[30 Official Roblox Docs/API Reference/Classes/MakeupDescription#MakeupType\|MakeupDescription.MakeupType]]. |
| `Lip` | 1 | Makeup asset targeting the lip area, such as lipstick or lip gloss. |
| `Eye` | 2 | Makeup asset targeting the eye region, such as eyeshadow or eyeliner. |

---
*Source: [MakeupType](https://create.roblox.com/docs/reference/engine/enums/MakeupType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
