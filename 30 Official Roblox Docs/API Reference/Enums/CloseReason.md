---
title: "CloseReason"
description: "Specifies the reason for the experience server shutdown."
api_type: enum
aliases: ["Enum.CloseReason"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CloseReason"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the reason for the experience server shutdown.*

## Description

Specifies the reason for the experience server shutdown. This enum value is the first parameter passed to functions bound by [[30 Official Roblox Docs/API Reference/Classes/DataModel#BindToClose|BindToClose()]].

The **DeveloperShutdown** value must always be passed to functions bound by [[30 Official Roblox Docs/API Reference/Classes/DataModel#BindToClose|BindToClose()]] when they're called in Studio.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | The server shut down for an unknown reason. |
| `RobloxMaintenance` | 1 | The server shut down for maintenance. |
| `DeveloperShutdown` | 2 | The experience developer has shut down the server, or functions bound by [[30 Official Roblox Docs/API Reference/Classes/DataModel#BindToClose\|BindToClose()]] have been called inside Studio. |
| `DeveloperUpdate` | 3 | The experience developer has migrated the server to a new place version. |
| `ServerEmpty` | 4 | The last player has left and the experience is empty. |
| `OutOfMemory` | 5 | The experience has hit the memory limit for the game server. |
| `Moderation` | 6 | The server was shut down because the experience or place was taken down for moderation. |

---
*Source: [CloseReason](https://create.roblox.com/docs/reference/engine/enums/CloseReason) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
