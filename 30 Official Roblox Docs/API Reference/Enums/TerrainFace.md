---
title: "TerrainFace"
description: "Identifies which face direction of a terrain voxel a `TerrainDetail` object overrides."
api_type: enum
aliases: ["Enum.TerrainFace"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TerrainFace"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies which face direction of a terrain voxel a [[30 Official Roblox Docs/API Reference/Classes/TerrainDetail|TerrainDetail]] object overrides.*

## Description

Identifies which face direction of a terrain voxel a [[30 Official Roblox Docs/API Reference/Classes/TerrainDetail|TerrainDetail]] object targets. Terrain renders its top (+Y), side (horizontal), and bottom (-Y) faces independently; this enum lets each [[30 Official Roblox Docs/API Reference/Classes/TerrainDetail|TerrainDetail]] child of a [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] declare which of those three surfaces it overrides.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Top` | 0 | The top (+Y) face of a terrain voxel. |
| `Side` | 1 | The horizontal (side) faces of a terrain voxel, perpendicular to the Y axis. |
| `Bottom` | 2 | The bottom (-Y) face of a terrain voxel. |

---
*Source: [TerrainFace](https://create.roblox.com/docs/reference/engine/enums/TerrainFace) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
