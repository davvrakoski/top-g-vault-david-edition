---
title: "BorderMode"
description: "Used by `GuiObject.BorderMode` to determine where borders are placed."
api_type: enum
aliases: ["Enum.BorderMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/BorderMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used by [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderMode|GuiObject.BorderMode]] to determine where borders are placed.*

## Description

Determines in what matter the border of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] is laid out relative to its actual dimensions. It is used by the property of the same name, [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderMode|GuiObject.BorderMode]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Outline` | 0 | As [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel\|GuiObject.BorderSizePixel]] increases, the border grows outward. The dimensions of the GuiObject's contents do not change. |
| `Middle` | 1 | As [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel\|GuiObject.BorderSizePixel]] increases, the border grows evenly inward and outward. The dimensions of the GuiObject's contents are reduced at a 1:1 ratio. |
| `Inset` | 2 | As [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel\|GuiObject.BorderSizePixel]] increases, the border grows evenly inward only. The dimensions of the GuiObject's contents are reduced at a 1:2 ratio. |

---
*Source: [BorderMode](https://create.roblox.com/docs/reference/engine/enums/BorderMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
