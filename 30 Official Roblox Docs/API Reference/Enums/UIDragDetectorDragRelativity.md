---
title: "UIDragDetectorDragRelativity"
description: "Used with `DragDetector` to set the paradigm which defines the relativity of inputs/outputs from a custom drag function."
api_type: enum
aliases: ["Enum.UIDragDetectorDragRelativity"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UIDragDetectorDragRelativity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used with [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] to set the paradigm which defines the relativity of inputs/outputs from a custom drag function.*

## Description

Used with [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] to set the paradigm which defines the relativity of inputs/outputs from a custom drag function registered through [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SetDragStyleFunction|SetDragStyleFunction()]] or [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#AddConstraintFunction|AddConstraintFunction()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Absolute` | 0 | Designates the input and return values as the absolute target position/rotation in the space defined by [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragSpace\|DragSpace]]. |
| `Relative` | 1 | Designates the input and return values as the change from the current position/rotation in the space defined by [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragSpace\|DragSpace]]. |

---
*Source: [UIDragDetectorDragRelativity](https://create.roblox.com/docs/reference/engine/enums/UIDragDetectorDragRelativity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
