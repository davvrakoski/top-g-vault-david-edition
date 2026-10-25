---
title: "PermissionLevelShown"
description: "Used to set the highest permission level that APIs have to have in order to be shown in the Object Browser."
api_type: enum
aliases: ["Enum.PermissionLevelShown"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PermissionLevelShown"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used to set the highest permission level that APIs have to have in order to be shown in the Object Browser.*

## Description

Used to set the highest permission level that APIs have to have in order to be shown in the Object Browser.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Game` | 0 | Member must have no security permissions in order to be shown. |
| `RobloxGame` | 1 | Member must have security permissions less than or equal to **RobloxPlaceSecurity** to be shown. |
| `RobloxScript` | 2 | Member must have security permissions less than or equal to **RobloxScriptSecurity** to be shown. |
| `Studio` | 3 | Member must have security permissions less than or equal to **LocalUserSecurity** to be shown. |
| `Roblox` | 4 | Member is shown no matter what security it has. |

---
*Source: [PermissionLevelShown](https://create.roblox.com/docs/reference/engine/enums/PermissionLevelShown) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
