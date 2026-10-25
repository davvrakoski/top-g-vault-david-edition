---
title: "PlayerPlatformActivationStatus"
description: "Describes whether a player is new, active, lapsed, or reactivated on Roblox."
api_type: enum
aliases: ["Enum.PlayerPlatformActivationStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PlayerPlatformActivationStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes whether a player is new, active, lapsed, or reactivated on Roblox.*

## Description

The `PlayerPlatformActivationStatus` enum describes a player's platform-wide activity status on Roblox, based on the last 60 days.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | Segment data is unavailable. |
| `New` | 1 | The player signed up for Roblox within the last 60 days. |
| `Active` | 2 | The player played on Roblox in the last 60 days and is not `New` or `Reactivated`. |
| `Lapsed` | 3 | The player has not played on Roblox in the last 60 days. |
| `Reactivated` | 4 | The player returned to Roblox within the last 60 days after being `Lapsed`. |

---
*Source: [PlayerPlatformActivationStatus](https://create.roblox.com/docs/reference/engine/enums/PlayerPlatformActivationStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
