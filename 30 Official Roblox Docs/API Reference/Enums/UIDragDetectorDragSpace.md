---
title: "UIDragDetectorDragSpace"
description: "Used with `DragDetector` to set the paradigm which defines the space of inputs/outputs from a custom drag function."
api_type: enum
aliases: ["Enum.UIDragDetectorDragSpace"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UIDragDetectorDragSpace"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used with [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] to set the paradigm which defines the space of inputs/outputs from a custom drag function.*

## Description

Used with [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] to set the paradigm which defines the space of inputs/outputs from a custom drag function registered through [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SetDragStyleFunction|SetDragStyleFunction()]] or [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#AddConstraintFunction|AddConstraintFunction()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Parent` | 0 | Designates the input and return values' space as the local space of the detector's parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. |
| `LayerCollector` | 1 | Designates the input and return values' space as that of the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollector]]. |
| `Reference` | 2 | Designates the input and return values' space as that of the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance\|ReferenceUIInstance]]. For [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRelativity\|DragRelativity]] and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2\|DragUDim2]] purposes, the `(0, 0)` origin is the absolute center position of the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance\|ReferenceUIInstance]].<br><br>If [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance\|ReferenceUIInstance]] is not `nil`, this will behave the same as **Parent**. |

---
*Source: [UIDragDetectorDragSpace](https://create.roblox.com/docs/reference/engine/enums/UIDragDetectorDragSpace) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
