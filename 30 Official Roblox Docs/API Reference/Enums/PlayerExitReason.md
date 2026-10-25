---
title: "PlayerExitReason"
description: "An enum that specifies the reason for **Players.PlayerRemoving** signal."
api_type: enum
aliases: ["Enum.PlayerExitReason"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PlayerExitReason"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*An enum that specifies the reason for **Players.PlayerRemoving** signal.*

## Description

Second argument in [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerRemoving|Players.PlayerRemoving]]. Helps identify whether a kick was caused by the Roblox platform or the Creator.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | Catch-all for all other disconnect reasons. |
| `PlatformKick` | 1 | User was kicked by Roblox systems, such as being blocked while in a Private Server. |
| `CreatorKick` | 2 | Creator called **Player:Kick()** |

---
*Source: [PlayerExitReason](https://create.roblox.com/docs/reference/engine/enums/PlayerExitReason) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
