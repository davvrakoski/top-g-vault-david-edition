---
title: "TeleportState"
description: "Determines the current teleportation state of a player."
api_type: enum
aliases: ["Enum.TeleportState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TeleportState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the current teleportation state of a player.*

## Description

Represents each stage of a player teleport as reported by the [[30 Official Roblox Docs/API Reference/Classes/Player#OnTeleport|Player.OnTeleport]] event. Scripts connect to [[30 Official Roblox Docs/API Reference/Classes/Player#OnTeleport|Player.OnTeleport]] to observe state changes throughout the teleport lifecycle and react accordingly — for example, showing a loading screen when `InProgress` fires or displaying an error when `Failed` fires.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `RequestedFromServer` | 0 | The server has requested that the client teleport. |
| `Started` | 1 | The client has started attempting to teleport. |
| `WaitingForServer` | 2 | The client is waiting for the server to respond to the teleport request. |
| `Failed` | 3 | The teleport failed. |
| `InProgress` | 4 | The teleport is currently in progress. The player usually disconnects and teleports to the destination after this. |

---
*Source: [TeleportState](https://create.roblox.com/docs/reference/engine/enums/TeleportState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
