---
title: "ItemLineAlignment"
description: "Used for `UIListLayout.ItemLineAlignment` and `UIFlexItem.ItemLineAlignment` in a flex layout to define the cross-directional alignment of siblings or the parent within a line."
api_type: enum
aliases: ["Enum.ItemLineAlignment"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ItemLineAlignment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used for [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#ItemLineAlignment|UIListLayout.ItemLineAlignment]] and [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#ItemLineAlignment|UIFlexItem.ItemLineAlignment]] in a flex layout to define the cross-directional alignment of siblings or the parent within a line.*

## Description

In a [[30 Official Roblox Docs/UI/List and flex layouts#Flex layouts|flex layout]], this enum is used for the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#ItemLineAlignment|ItemLineAlignment]] property of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] to define the **cross-directional** alignment of siblings within a line. It is also used for the [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#ItemLineAlignment|ItemLineAlignment]] property of a specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem|UIFlexItem]] to define the cross-directional alignment of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] within the line.

*(image in the full Top G Vault)*

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Automatic` | 0 | Aligns the siblings of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout\|UIListLayout]] or the specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]] parent to the layout's [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#HorizontalAlignment\|HorizontalAlignment]] or [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#VerticalAlignment\|VerticalAlignment]], depending on its [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection\|FillDirection]]. If [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex\|HorizontalFlex]] or [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#VerticalFlex\|VerticalFlex]] is enabled for the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout\|UIListLayout]] cross‑direction, `Stretch` will be used for that direction. |
| `Start` | 1 | Aligns the siblings of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout\|UIListLayout]] or the specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]] parent to the line's **top** in a horizontal fill or the line's **left** in a vertical fill. |
| `Center` | 2 | Aligns the siblings of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout\|UIListLayout]] or the specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]] parent to the line's **center** in either a horizontal or vertical fill. |
| `End` | 3 | Aligns the siblings of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout\|UIListLayout]] or the specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]] parent to the line's **bottom** in a horizontal fill or the line's **right** in a vertical fill. |
| `Stretch` | 4 | Stretches the siblings of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout\|UIListLayout]] or the specific [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem\|UIFlexItem]] parent to fill the entire cross‑direction of the line in either a horizontal or vertical fill. |

---
*Source: [ItemLineAlignment](https://create.roblox.com/docs/reference/engine/enums/ItemLineAlignment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
