---
title: "TeleportMethod"
description: "Identifies which `TeleportService` API method initiated a teleport."
api_type: enum
aliases: ["Enum.TeleportMethod"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TeleportMethod"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies which [[30 Official Roblox Docs/API Reference/Classes/TeleportService|TeleportService]] API method initiated a teleport.*

## Description

`TeleportMethod` identifies the [[30 Official Roblox Docs/API Reference/Classes/TeleportService|TeleportService]] call that initiated a given teleport. Each enum item corresponds to a specific public [[30 Official Roblox Docs/API Reference/Classes/TeleportService|TeleportService]] method.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `TeleportToSpawnByName` | 0 | Teleport was initiated by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToSpawnByName\|TeleportService:TeleportToSpawnByName()]], which sends a player to a named [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] in a place. |
| `TeleportToPlaceInstance` | 1 | Teleport was initiated by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToPlaceInstance\|TeleportService:TeleportToPlaceInstance()]], which sends a player to a specific running server instance identified by its `instanceId`. |
| `TeleportToPrivateServer` | 2 | Teleport was initiated by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToPrivateServer\|TeleportService:TeleportToPrivateServer()]], which sends players to a reserved server using an access code. |
| `TeleportPartyAsync` | 3 | Teleport was initiated by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportPartyAsync\|TeleportService:TeleportPartyAsync()]], which sends a group of players to a place together. |
| `TeleportToVIPServer` | 4 | Teleport was initiated to a VIP (creator-owned private) server; the engine upgrades the method tag to this value when VIP server credentials are present at teleport time. |
| `TeleportToInstanceBack` | 5 | Teleport was initiated by back-navigation, returning a player to a specific prior place instance. |
| `TeleportUnknown` | 6 | Fallback value used when the teleport method cannot be determined. |

---
*Source: [TeleportMethod](https://create.roblox.com/docs/reference/engine/enums/TeleportMethod) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
