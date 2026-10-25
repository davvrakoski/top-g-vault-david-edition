---
title: "BanHistoryPages"
description: "Returned by `Players:GetBanHistoryAsync` to view the entire ban and unban history of any UserId."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BanHistoryPages"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Returned by [[30 Official Roblox Docs/API Reference/Classes/Players#GetBanHistoryAsync|Players:GetBanHistoryAsync]] to view the entire ban and unban history of any UserId.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/BanHistoryPages|BanHistoryPages]] is returned by [[30 Official Roblox Docs/API Reference/Classes/Players#GetBanHistoryAsync|Players:GetBanHistoryAsync()]]. This instance allows an experience to view the entire ban and unban history of any player within the experience's universe.

The items within [[30 Official Roblox Docs/API Reference/Classes/BanHistoryPages|BanHistoryPages]] are tables with the following fields:

| Name | Type | Description |
| --- | --- | --- |
| `DisplayReason` | string | The `DisplayReason` that was shown to the user |
| `PrivateReason` | string | The `PrivateReason` that was sent with this ban. |
| `StartTime` | string | The time that this ban was applied in ISO 8601 format. |
| `Duration` | number | The length of the ban in seconds. If it is a permanent ban, it will be `-1`. |
| `Ban` | boolean | If the action was a ban, it will be `true`. If the action was an unban, it will be `false`. |
| `PlaceId` | number | The place in which a ban or unban was explicitly updated. This field is `-1` if the action was applied on the universe level. |

---
*Source: [BanHistoryPages](https://create.roblox.com/docs/reference/engine/classes/BanHistoryPages) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
