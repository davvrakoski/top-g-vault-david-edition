---
title: "CellOrientation"
description: "Specifies the corner orientation of a legacy terrain cell, used with the deprecated `Terrain:SetCell()` method."
api_type: enum
aliases: ["Enum.CellOrientation"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CellOrientation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the corner orientation of a legacy terrain cell, used with the deprecated [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetCell|Terrain:SetCell()]] method.*

> [!warning] Deprecated
> This enum is deprecated. It used to work with the legacy `Class.Terrain`
> engine to set the orientation of terrain cells.

## Description

Deprecated. Specifies the corner from which a legacy terrain cell's block begins, used with the deprecated [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetCell|Terrain:SetCell()]] and [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetCells|Terrain:SetCells()]] methods. When viewed from directly above (downward vertical perspective), the value identifies which corner of the cell the block occupies, ordered clockwise starting from the upper-left.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `NegZ` | 0 | Upper-left corner orientation when the cell is viewed from directly above. |
| `X` | 1 | Upper-right corner orientation when the cell is viewed from directly above. |
| `Z` | 2 | Lower-right corner orientation when the cell is viewed from directly above. |
| `NegX` | 3 | Lower-left corner orientation when the cell is viewed from directly above. |

---
*Source: [CellOrientation](https://create.roblox.com/docs/reference/engine/enums/CellOrientation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
