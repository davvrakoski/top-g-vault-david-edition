---
title: "SortOrder"
description: "Used by `UIGridStyleLayout.SortOrder` to order the elements in the layout."
api_type: enum
aliases: ["Enum.SortOrder"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SortOrder"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used by [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder|UIGridStyleLayout.SortOrder]] to order the elements in the layout.*

## Description

Used by [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder|UIGridStyleLayout.SortOrder]] to order the elements in the layout.

*(image in the full Top G Vault)*

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Name` | 0 | Elements are ordered by their [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Instance.Name]] in alphanumeric order. |
| `Custom` | 1 | **Deprecated.** Elements are ordered by the function passed to [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SetCustomSortFunction\|UIGridStyleLayout:SetCustomSortFunction()]]. |
| `LayoutOrder` | 2 | Elements are ordered by [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder\|GuiObject.LayoutOrder]] in ascending order; for example `0` will be placed before `1`. |

---
*Source: [SortOrder](https://create.roblox.com/docs/reference/engine/enums/SortOrder) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
