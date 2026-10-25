---
title: "CellBlock"
description: "Deprecated enum specifying the geometric block shape of a legacy voxel terrain cell, used with the removed `Terrain:SetCell()` method."
api_type: enum
aliases: ["Enum.CellBlock"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CellBlock"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Deprecated enum specifying the geometric block shape of a legacy voxel terrain cell, used with the removed [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetCell|Terrain:SetCell()]] method.*

> [!warning] Deprecated
> This enum is deprecated. It used to work with `Class.Terrain:SetCell()` - a
> function that is no longer supported by the `Class.Terrain` engine.

## Description

Specifies the geometric shape of a legacy voxel terrain cell, used with the deprecated [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetCell|Terrain:SetCell()]] and [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetCells|Terrain:SetCells()]] methods. Each value corresponds to one of the five reflected block shapes in the old voxel terrain system. This enum and the methods that consume it are deprecated; use smooth terrain APIs instead.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Solid` | 0 | A legacy voxel cell that is completely filled, occupying the full cell volume. |
| `VerticalWedge` | 1 | A legacy voxel cell shaped as a vertical wedge, occupying half of a full cell's volume. |
| `CornerWedge` | 2 | A legacy voxel cell shaped as a corner wedge, occupying approximately one-third of a full cell's volume. |
| `InverseCornerWedge` | 3 | A legacy voxel cell shaped as an inverse corner wedge, occupying approximately two-thirds of a full cell's volume. |
| `HorizontalWedge` | 4 | A legacy voxel cell shaped as a horizontal wedge, occupying half of a full cell's volume. |

---
*Source: [CellBlock](https://create.roblox.com/docs/reference/engine/enums/CellBlock) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
