---
title: "LocationType"
description: "Specifies how `HeatmapService` determines a player's representative world position for heatmap data collection."
api_type: enum
aliases: ["Enum.LocationType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/LocationType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies how `HeatmapService` determines a player's representative world position for heatmap data collection.*

## Description

Controls which point in 3D space is sampled as a player's location when `HeatmapService` records positional heatmap events. The value is stored per [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] and defaults to [[30 Official Roblox Docs/API Reference/Enums/LocationType|Enum.LocationType.Character]]. See the items below for each sampling mode.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Character` | 0 | Use the player's character model world position as the heatmap location (default). |
| `Camera` | 1 | Use the current workspace camera's world position as the player's heatmap location. |
| `ObjectPosition` | 2 | Use the world position of a configured target object as the player's heatmap location. |

---
*Source: [LocationType](https://create.roblox.com/docs/reference/engine/enums/LocationType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
