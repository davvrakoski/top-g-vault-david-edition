---
title: "UIFlexAlignment"
description: "In a `UIListLayout` flex layout, specifies how to distribute extra space in the parent container."
api_type: enum
aliases: ["Enum.UIFlexAlignment"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UIFlexAlignment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*In a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] flex layout, specifies how to distribute extra space in the parent container.*

## Description

In a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] flex layout, specifies how to distribute extra horizontal space in a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex|HorizontalFlex]] layout or vertical space in a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#VerticalFlex|VerticalFlex]] layout.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | No flex behavior; siblings maintain their defined width or height. |
| `Fill` | 1 | Siblings resize to fill the entire parent container, overriding their defined width or height. |
| `SpaceAround` | 2 | Siblings maintain their defined width or height. Equal spacing is added on both sides of each sibling. |
| `SpaceBetween` | 3 | Siblings maintain their defined width or height. Equal spacing is added **between** siblings, but no additional space is added **around** siblings. |
| `SpaceEvenly` | 4 | Siblings maintain their defined width or height. Equal spacing is added both **between** and **around** siblings. |

---
*Source: [UIFlexAlignment](https://create.roblox.com/docs/reference/engine/enums/UIFlexAlignment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
