---
title: "UIFlexMode"
description: "Used with `UIFlexItem.FlexMode` to define how the parent `GuiObject` grows or shrinks."
api_type: enum
aliases: ["Enum.UIFlexMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UIFlexMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used with [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#FlexMode|UIFlexItem.FlexMode]] to define how the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] grows or shrinks.*

## Description

Used with [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#FlexMode|UIFlexItem.FlexMode]] to define how the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] grows or shrinks with available space in the container.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | The parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] is unaffected and neither shrinks nor grows. |
| `Grow` | 1 | Sets an effective `1:0` grow‑shrink ratio on the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. Objects set to `Grow` never shrink below their basis size, so overflow may occur if the container becomes smaller than the flex line's combined basis size. |
| `Shrink` | 2 | Sets an effective `0:1` grow‑shrink ratio on the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. Objects set to `Shrink` never grow above their basis size, so underflow may occur if the container becomes larger than the flex line's combined basis size. |
| `Fill` | 3 | Sets an effective `1:1` grow‑shrink ratio on the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. This setting ensures the flex line always fills the container, even if the container size changes. |
| `Custom` | 4 | Enables the [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#GrowRatio\|GrowRatio]] and [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#ShrinkRatio\|ShrinkRatio]] properties for the [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]], allowing for relative growth or shrinking of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] in a ratio compared to other flex objects also under control of a [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]]. |

---
*Source: [UIFlexMode](https://create.roblox.com/docs/reference/engine/enums/UIFlexMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
