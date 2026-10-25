---
title: "FrameStyle"
description: "Used to set the style of a `Frame`."
api_type: enum
aliases: ["Enum.FrameStyle"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FrameStyle"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used to set the style of a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]].*

## Description

The **FrameStyle** enum is used to set the style of a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Custom` | 0 | Uses the frame's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|GuiObject.BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|GuiObject.BorderColor3]], and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency\|GuiObject.BackgroundTransparency]] properties to determine the frame's appearance. It has no padding; elements with the position `Datatype.UDim2.new(0, 0, 0, 0)` will appear at the frame's top-left corner. |
| `ChatBlue` | 1 | Causes the frame to appear similar to a [[30 Official Roblox Docs/API Reference/Classes/Dialog\|Dialog]] with its [[30 Official Roblox Docs/API Reference/Classes/Dialog#Tone\|Tone]] property set to [[30 Official Roblox Docs/API Reference/Enums/DialogTone\|Enum.DialogTone.Neutral]]. Like **ChatGreen** and **ChatRed**, this has a padding of fifteen pixels on all sides. |
| `RobloxSquare` | 2 | Causes the frame to appear as a translucent dark gray rectangle with a padding of five pixels on all sides. |
| `RobloxRound` | 3 | Causes the frame to appear as a translucent dark gray rectangle with rounded edges. Like **RobloxSquare**, this has a padding of five pixels on all sides. |
| `ChatGreen` | 4 | Causes the frame to appear similar to a [[30 Official Roblox Docs/API Reference/Classes/Dialog\|Dialog]] with its [[30 Official Roblox Docs/API Reference/Classes/Dialog#Tone\|Tone]] property set to [[30 Official Roblox Docs/API Reference/Enums/DialogTone\|Enum.DialogTone.Friendly]]. Like **ChatBlue** and **ChatRed**, this has a padding of fifteen pixels on all sides. |
| `ChatRed` | 5 | Causes the frame to appear similar to a [[30 Official Roblox Docs/API Reference/Classes/Dialog\|Dialog]] with its [[30 Official Roblox Docs/API Reference/Classes/Dialog#Tone\|Tone]] property set to [[30 Official Roblox Docs/API Reference/Enums/DialogTone\|Enum.DialogTone.Enemy]]. Like **ChatBlue** and **ChatGreen**, this has a padding of fifteen pixels on all sides. |
| `DropShadow` | 6 | Causes the frame to appear as a translucent gray rectangle with blurred sides. The blur is more apparent on the bottom edge. It has a padding of eight pixels on all sides. |

---
*Source: [FrameStyle](https://create.roblox.com/docs/reference/engine/enums/FrameStyle) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
