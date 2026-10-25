---
title: "RibbonTool"
description: "Identifies a Studio ribbon toolbar tool, used with `Plugin:GetSelectedRibbonTool()` and `Plugin:SelectRibbonTool()`."
api_type: enum
aliases: ["Enum.RibbonTool"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RibbonTool"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies a Studio ribbon toolbar tool, used with [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetSelectedRibbonTool|Plugin:GetSelectedRibbonTool()]] and [[30 Official Roblox Docs/API Reference/Classes/Plugin#SelectRibbonTool|Plugin:SelectRibbonTool()]].*

## Description

[[30 Official Roblox Docs/API Reference/Enums/RibbonTool|Enum.RibbonTool]] represents the set of built-in tools available on the Roblox Studio ribbon toolbar. Values from this enum are returned by [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetSelectedRibbonTool|Plugin:GetSelectedRibbonTool()]] to identify which tool is currently active, and passed to [[30 Official Roblox Docs/API Reference/Classes/Plugin#SelectRibbonTool|Plugin:SelectRibbonTool()]] to programmatically activate a tool from a plugin script.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Select` | 0 | The **Select** tool, which selects objects in the viewport. |
| `Scale` | 1 | The **Scale** tool, which resizes selected parts along their axes. |
| `Rotate` | 2 | The **Rotate** tool, which rotates selected parts around the three primary axes. |
| `Move` | 3 | The **Move** tool, which translates selected parts along the three primary axes. |
| `Transform` | 4 | The **Transform** tool, which provides combined move, scale, and rotate handles in a single gizmo. |
| `ColorPicker` | 5 | The **Color** tool, which opens the color picker to paint the color of selected parts. |
| `MaterialPicker` | 6 | **Deprecated.** Deprecated ribbon **Color**/**Material** picker tool; use **Material Manager** instead. |
| `Group` | 7 | The **Group** tool, which groups the selected objects into a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. |
| `Ungroup` | 8 | The **Ungroup** tool, which dissolves a selected Model and promotes its children to the parent container. |
| `None` | 9 | Represents no ribbon tool being active. |
| `PivotEditor` | 10 | The **Edit Pivot** tool, which repositions the pivot point of selected parts or models. |

---
*Source: [RibbonTool](https://create.roblox.com/docs/reference/engine/enums/RibbonTool) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
