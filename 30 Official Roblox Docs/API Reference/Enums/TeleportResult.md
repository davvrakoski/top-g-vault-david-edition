---
title: "TeleportResult"
description: "Describes the result of a teleport."
api_type: enum
aliases: ["Enum.TeleportResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TeleportResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the result of a teleport.*

## Description

Describes the result of a teleport.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 0 | The teleport was successful. |
| `Failure` | 1 | The teleport failed for an unknown reason. |
| `GameNotFound` | 2 | The game that this player attempted to teleport to could not be found. |
| `GameEnded` | 3 | The game that this player attempted to teleport to has ended. |
| `GameFull` | 4 | The game that this player attempted to teleport to is full. |
| `Unauthorized` | 5 | The player is not authorized to complete this teleport. |
| `Flooded` | 6 | Too many teleport requests have been made recently. |
| `IsTeleporting` | 7 | The player is currently being teleported. |

---
*Source: [TeleportResult](https://create.roblox.com/docs/reference/engine/enums/TeleportResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
