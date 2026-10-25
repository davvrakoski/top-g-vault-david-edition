---
title: "DragDetectorResponseStyle"
description: "Describes how the clicked object will be treated once the desired motion has been calculated."
api_type: enum
aliases: ["Enum.DragDetectorResponseStyle"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DragDetectorResponseStyle"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes how the clicked object will be treated once the desired motion has been calculated.*

## Description

Describes how the clicked object will be treated once the desired motion has been calculated.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Geometric` | 0 | For an [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored\|Anchored]] object both inside the running experience and in Studio edit mode, the position/orientation of the object will be updated to exactly reflect the proposed motion. For an unanchored object, behavior is the same as for an anchored object; however, in a running experience, the object will be anchored at the start of the drag and restored to unanchored upon drag release. |
| `Physical` | 1 | An [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored\|Anchored]] object will default to **Geometric** behavior as it is not affected by forces. An unanchored object will be moved by constraint forces that attempt to bring it to the desired position and/or orientation given by the proposed motion. |
| `Custom` | 2 | The object will not move at all, but [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragFrame\|DragFrame]] will still be updated and you can respond to drag manipulation however you'd like. |

---
*Source: [DragDetectorResponseStyle](https://create.roblox.com/docs/reference/engine/enums/DragDetectorResponseStyle) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
