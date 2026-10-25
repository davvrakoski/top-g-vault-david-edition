---
title: "AvatarSettingsClothingMode"
description: "Determines whether the experience applies a spatial bounding limit to layered clothing on player characters."
api_type: enum
aliases: ["Enum.AvatarSettingsClothingMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsClothingMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether the experience applies a spatial bounding limit to layered clothing on player characters.*

## Description

Determines whether the experience applies a spatial bounding limit to layered clothing on player characters. Used by `ClothingMode` to control how far layered clothing accessories can extend from the character body. When set to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsClothingMode|Enum.AvatarSettingsClothingMode.CustomLimit]], the engine reads `LimitBounds` and clips layered clothing deformation to those bounds. Defaults to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsClothingMode|Enum.AvatarSettingsClothingMode.PlayerChoice]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PlayerChoice` | 0 | No spatial limit is applied to layered clothing; the player's layered clothing accessories deform without a bounding constraint. |
| `CustomLimit` | 1 | Applies a custom spatial limit to layered clothing based on `LimitBounds`. |

---
*Source: [AvatarSettingsClothingMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsClothingMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
