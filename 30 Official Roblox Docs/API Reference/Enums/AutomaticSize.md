---
title: "AutomaticSize"
description: "UI objects with `AutomaticSize` enabled will increase in size up to maximum size allowed by the parent (if there is one) and no smaller than the `Size` property bounds."
api_type: enum
aliases: ["Enum.AutomaticSize"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AutomaticSize"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*UI objects with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] enabled will increase in size up to maximum size allowed by the parent (if there is one) and no smaller than the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] property bounds.*

## Description

UI objects with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] enabled will increase in size up to maximum size allowed by the parent (if there is one) and no smaller than the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] property bounds. To enable [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|Enum.AutomaticSize]], set the value to an enum value other than `None`.

This enum is used by [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|GuiObject.AutomaticSize]] and [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AutomaticCanvasSize|ScrollingFrame.AutomaticCanvasSize]] to determine whether and how resizing occurs based on child content.

For more information, see [[30 Official Roblox Docs/UI/Size modifiers and constraints#Automatic sizing|Automatic Sizing]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | Default sizing behavior. |
| `X` | 1 | Automatically resize element along the **X** axis to fit child contents. |
| `Y` | 2 | Automatically resize element along the **Y** axis to fit child contents. Text objects will only resize along the **Y** axis if their `TextWrapped` property is enabled. |
| `XY` | 3 | Automatically resize element along the **X** and **Y** axes to fit child contents. |

---
*Source: [AutomaticSize](https://create.roblox.com/docs/reference/engine/enums/AutomaticSize) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
