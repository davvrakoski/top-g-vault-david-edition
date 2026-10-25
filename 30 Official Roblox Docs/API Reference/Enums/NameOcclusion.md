---
title: "NameOcclusion"
description: "The NameOcclusion Enum is used to set the `Humanoid.NameOcclusion` property."
api_type: enum
aliases: ["Enum.NameOcclusion"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/NameOcclusion"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The NameOcclusion Enum is used to set the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameOcclusion|Humanoid.NameOcclusion]] property.*

## Description

`NameOcclusion` controls whether overhead name labels on [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] characters are hidden when solid geometry blocks the line of sight between the viewer and the character. When the local player's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameOcclusion|Humanoid.NameOcclusion]] is set to `EnemyOcclusion` or `OccludeAll`, the engine performs a raycast; if the character's head is behind a solid part, the name label is not rendered for that frame. Setting the value to `NoOcclusion` skips the raycast entirely and names are always visible regardless of intervening geometry.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `NoOcclusion` | 0 | Do not occlude (hide) any humanoid names. |
| `EnemyOcclusion` | 1 | Occlude (hide) all enemy humanoid names. |
| `OccludeAll` | 2 | Occlude (hide) all humanoid names. |

---
*Source: [NameOcclusion](https://create.roblox.com/docs/reference/engine/enums/NameOcclusion) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
