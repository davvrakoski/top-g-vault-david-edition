---
title: "UIDragDetectorDragStyle"
description: "Used with `UIDragDetector` as the paradigm to generate proposed motion, given a stream of input position vectors."
api_type: enum
aliases: ["Enum.UIDragDetectorDragStyle"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UIDragDetectorDragStyle"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used with [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] as the paradigm to generate proposed motion, given a stream of input position vectors.*

## Description

Used with [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] as the paradigm to generate proposed motion, given a stream of input position vectors.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `TranslatePlane` | 0 | 2D motion in the plane of the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollector]]. |
| `TranslateLine` | 1 | 1D motion along the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragAxis\|DragAxis]]. |
| `Rotate` | 2 | By default, rotation about the absolute center position of the detector's parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. If [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance\|ReferenceUIInstance]] is set, rotation happens about that instance's absolute center position. |
| `Scriptable` | 3 | Calculates desired motion via a custom function provided through [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SetDragStyleFunction\|SetDragStyleFunction()]]. |

---
*Source: [UIDragDetectorDragStyle](https://create.roblox.com/docs/reference/engine/enums/UIDragDetectorDragStyle) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
