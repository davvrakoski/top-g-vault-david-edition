---
title: "UIDragDetectorResponseStyle"
description: "Describes how the clicked `GuiObject` will be treated once the desired motion has been calculated."
api_type: enum
aliases: ["Enum.UIDragDetectorResponseStyle"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UIDragDetectorResponseStyle"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes how the clicked [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] will be treated once the desired motion has been calculated.*

## Description

Describes how the clicked [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] will be treated once the desired motion has been calculated.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Offset` | 0 | Move by the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] values of the detector's parent's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position\|GuiObject.Position]] value. |
| `Scale` | 1 | Move by the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]] values of the detector's parent's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position\|GuiObject.Position]] value. |
| `CustomOffset` | 2 | The UI element will not move at all, but the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] values of the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2\|DragUDim2]] will still be updated and the detector's events will still fire, allowing you to respond to drag manipulation however you'd like. |
| `CustomScale` | 3 | The UI element will not move at all, but the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]] values of the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2\|DragUDim2]] will still be updated and the detector's events will still fire, allowing you to respond to drag manipulation however you'd like. |

---
*Source: [UIDragDetectorResponseStyle](https://create.roblox.com/docs/reference/engine/enums/UIDragDetectorResponseStyle) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
