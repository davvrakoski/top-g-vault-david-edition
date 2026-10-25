---
title: "DraggerMovementMode"
description: "Controls whether `DraggerService` moves parts geometrically or with physics simulation during Studio drag operations."
api_type: enum
aliases: ["Enum.DraggerMovementMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DraggerMovementMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether [[30 Official Roblox Docs/API Reference/Classes/DraggerService|DraggerService]] moves parts geometrically or with physics simulation during Studio drag operations.*

## Description

Controls whether Studio's drag tool moves parts by directly setting their positions and orientations ([[30 Official Roblox Docs/API Reference/Enums/DraggerMovementMode|Enum.DraggerMovementMode.Geometric]]) or by simulating physics and respecting [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] during the drag ([[30 Official Roblox Docs/API Reference/Enums/DraggerMovementMode|Enum.DraggerMovementMode.Physical]]). The active mode is set via [[30 Official Roblox Docs/API Reference/Classes/DraggerService#DraggerMovementMode|DraggerService.DraggerMovementMode]], which defaults to [[30 Official Roblox Docs/API Reference/Enums/DraggerMovementMode|Enum.DraggerMovementMode.Geometric]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Geometric` | 0 | Parts are moved by directly updating their position and orientation, ignoring physics and constraints. |
| `Physical` | 1 | Parts are moved by applying physics impulses, so constraints and collisions are respected during the drag. |

---
*Source: [DraggerMovementMode](https://create.roblox.com/docs/reference/engine/enums/DraggerMovementMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
