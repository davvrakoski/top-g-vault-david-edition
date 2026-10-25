---
title: "UIDragSpeedAxisMapping"
description: "Used with `UIDragDetector.UIDragSpeedAxisMapping` to determine the **X**/**Y** dimension dragging speeds."
api_type: enum
aliases: ["Enum.UIDragSpeedAxisMapping"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UIDragSpeedAxisMapping"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used with [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#UIDragSpeedAxisMapping|UIDragDetector.UIDragSpeedAxisMapping]] to determine the **X**/**Y** dimension dragging speeds.*

## Description

Used with [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#UIDragSpeedAxisMapping|UIDragDetector.UIDragSpeedAxisMapping]] to determine the **X**/**Y** dimension dragging speeds, based on the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SelectionModeDragSpeed|SelectionModeDragSpeed]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `XY` | 0 | Default setting for a detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#UIDragSpeedAxisMapping\|UIDragSpeedAxisMapping]] where the **X** and **Y** axis speeds are based off the **X** and **Y** [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]]/[[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] values respectively. |
| `XX` | 1 | Both the **X** and **Y** axis speeds are based off the **X** axis for [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]], while the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] values still apply to their respective axis. |
| `YY` | 2 | Both the **X** and **Y** axis speeds are based off the **Y** axis for [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]], while the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] values still apply to their respective axis. |

---
*Source: [UIDragSpeedAxisMapping](https://create.roblox.com/docs/reference/engine/enums/UIDragSpeedAxisMapping) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
