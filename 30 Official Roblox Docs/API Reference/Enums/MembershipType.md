---
title: "MembershipType"
description: "The membership type of a Player."
api_type: enum
aliases: ["Enum.MembershipType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/MembershipType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The membership type of a Player.*

## Description

Describes the paid-membership tier associated with a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]. The value is exposed via the [[30 Official Roblox Docs/API Reference/Classes/Player#MembershipType|Player.MembershipType]] property, which defaults to [[30 Official Roblox Docs/API Reference/Enums/MembershipType|Enum.MembershipType.None]] and is set automatically by the server when the player joins. Prefer [[30 Official Roblox Docs/API Reference/Classes/Player#HasRobloxSubscription|Player.HasRobloxSubscription]] to check for an active paid subscription.

The legacy Builders Club tiers ([[30 Official Roblox Docs/API Reference/Enums/MembershipType|Enum.MembershipType.BuildersClub]], [[30 Official Roblox Docs/API Reference/Enums/MembershipType|Enum.MembershipType.TurboBuildersClub]], [[30 Official Roblox Docs/API Reference/Enums/MembershipType|Enum.MembershipType.OutrageousBuildersClub]]) are no longer available for purchase and are retained only for backward compatibility. All active paid memberships are represented by [[30 Official Roblox Docs/API Reference/Enums/MembershipType|Enum.MembershipType.Premium]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | The player does not have an active paid membership. |
| `BuildersClub` | 1 | Legacy Builders Club membership. No longer available for purchase; retained for compatibility. Active paid memberships use [[30 Official Roblox Docs/API Reference/Enums/MembershipType\|Enum.MembershipType.Premium]]. |
| `TurboBuildersClub` | 2 | Legacy Turbo Builders Club membership. No longer available for purchase; retained for compatibility. Active paid memberships use [[30 Official Roblox Docs/API Reference/Enums/MembershipType\|Enum.MembershipType.Premium]]. |
| `OutrageousBuildersClub` | 3 | Legacy Outrageous Builders Club membership. No longer available for purchase; retained for compatibility. Active paid memberships use [[30 Official Roblox Docs/API Reference/Enums/MembershipType\|Enum.MembershipType.Premium]]. |
| `Premium` | 4 | The player has an active Premium membership. |

---
*Source: [MembershipType](https://create.roblox.com/docs/reference/engine/enums/MembershipType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
