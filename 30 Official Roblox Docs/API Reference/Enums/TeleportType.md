---
title: "TeleportType"
description: "Determines the type of teleport destination for a `TeleportService` teleport call."
api_type: enum
aliases: ["Enum.TeleportType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TeleportType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the type of teleport destination for a [[30 Official Roblox Docs/API Reference/Classes/TeleportService|TeleportService]] teleport call.*

## Description

Determines the type of teleport destination for a [[30 Official Roblox Docs/API Reference/Classes/TeleportService|TeleportService]] teleport call.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `ToPlace` | 0 | The teleport destination is a place (no specific instance). |
| `ToInstance` | 1 | The teleport destination is an instance of a place. |
| `ToReservedServer` | 2 | The destination of the teleport is a reserved server (a place instance that is reserved for a select group of players). |
| `ToVIPServer` | 3 | The teleport destination is a VIP (player-owned private) server instance. |
| `ToInstanceBack` | 4 | The teleport destination is a previously-visited place instance (back navigation). |

---
*Source: [TeleportType](https://create.roblox.com/docs/reference/engine/enums/TeleportType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
