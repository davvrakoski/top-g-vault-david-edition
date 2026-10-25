---
title: "AccessModifierType"
description: "Determines whether an `AudioDeviceInput` user ID access list acts as an allow-list or a deny-list."
api_type: enum
aliases: ["Enum.AccessModifierType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AccessModifierType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether an [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] user ID access list acts as an allow-list or a deny-list.*

## Description

Determines whether the user IDs supplied to [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#SetUserIdAccessList|SetUserIdAccessList()]] are treated as an allow-list or a deny-list for hearing a particular [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]].

The default [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#AccessType|AccessType]] is [[30 Official Roblox Docs/API Reference/Enums/AccessModifierType|Enum.AccessModifierType.Deny]], meaning all users can hear the device unless explicitly excluded.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Allow` | 0 | User IDs in the access list are permitted to hear the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]] - all other users are blocked. |
| `Deny` | 1 | User IDs in the access list are blocked from hearing the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]] - all other users are permitted. |

---
*Source: [AccessModifierType](https://create.roblox.com/docs/reference/engine/enums/AccessModifierType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
