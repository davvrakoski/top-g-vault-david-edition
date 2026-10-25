---
title: "UIDragDetectorBoundingBehavior"
description: "Used with `UIDragDetector` to determine bounding behavior of the dragged UI object when `UIDragDetector.BoundingUI` is set."
api_type: enum
aliases: ["Enum.UIDragDetectorBoundingBehavior"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UIDragDetectorBoundingBehavior"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used with [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] to determine bounding behavior of the dragged UI object when [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI|UIDragDetector.BoundingUI]] is set.*

## Description

Used with [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] to determine bounding behavior of the dragged UI object when [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI|UIDragDetector.BoundingUI]] is set.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Automatic` | 0 | Mimics **EntireObject** behavior for a UI object that's entirely contained by the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI\|BoundingUI]], or else **HitPoint** for a UI object that's partially outside the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI\|BoundingUI]]. |
| `EntireObject` | 1 | Bounds the entire dragged UI object within the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI\|BoundingUI]]. |
| `HitPoint` | 2 | Bounds the dragged UI only by the exact hit/grab point and its respective position after translation/rotation. |

---
*Source: [UIDragDetectorBoundingBehavior](https://create.roblox.com/docs/reference/engine/enums/UIDragDetectorBoundingBehavior) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
