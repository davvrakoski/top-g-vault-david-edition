---
title: "CellMaterial"
description: "Material values for individual cells in the deprecated legacy voxel-based `Terrain` engine."
api_type: enum
aliases: ["Enum.CellMaterial"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CellMaterial"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Material values for individual cells in the deprecated legacy voxel-based [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] engine.*

> [!warning] Deprecated
> This enum is deprecated. It used to work with the legacy `Class.Terrain`
> engine to set the material of terrain cells.

## Description

Deprecated. Material values for individual cells in the legacy voxel-based [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] engine. These values were passed to the deprecated [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetCell|Terrain:SetCell()]] and [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetCells|Terrain:SetCells()]] methods. When a legacy place is loaded, the engine converts these cell materials to their closest equivalents in the modern smooth terrain system. Use [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] with the current terrain APIs instead.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Empty` | 0 | Represents an air (unfilled) cell in the legacy voxel terrain; converted to air in the modern terrain system. |
| `Grass` | 1 | A green grassy cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Grass]] in the modern terrain system. |
| `Sand` | 2 | A sandy cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Sand]] in the modern terrain system. |
| `Brick` | 3 | A red brick cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Brick]] in the modern terrain system. |
| `Granite` | 4 | A speckled stone cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Slate]] in the modern terrain system. |
| `Asphalt` | 5 | A dark paved road cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Asphalt]] in the modern terrain system. |
| `Iron` | 6 | A dark metallic cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Concrete]] in the modern terrain system. |
| `Aluminum` | 7 | A metallic silver cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Concrete]] in the modern terrain system. |
| `Gold` | 8 | A golden metallic cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Concrete]] in the modern terrain system. |
| `WoodPlank` | 9 | A flat wooden plank cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.WoodPlanks]] in the modern terrain system. |
| `WoodLog` | 10 | A round wooden log cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.WoodPlanks]] in the modern terrain system. |
| `Gravel` | 11 | A loose-stone cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Asphalt]] in the modern terrain system. |
| `CinderBlock` | 12 | A rough masonry cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Concrete]] in the modern terrain system. |
| `MossyStone` | 13 | A weathered stone cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Pavement]] in the modern terrain system. |
| `Cement` | 14 | A gray cement cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Concrete]] in the modern terrain system. |
| `RedPlastic` | 15 | A red-tinted cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Sandstone]] in the modern terrain system. |
| `BluePlastic` | 16 | A blue-tinted cell material in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Ice]] in the modern terrain system. |
| `Water` | 17 | A water-filled cell in the legacy voxel terrain, converted to [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material.Water]] in the modern terrain system. |

---
*Source: [CellMaterial](https://create.roblox.com/docs/reference/engine/enums/CellMaterial) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
