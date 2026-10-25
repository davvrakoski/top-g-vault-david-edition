---
title: "FriendPages"
description: "A special version of `Pages` that contains information about a player's friends."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/FriendPages"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A special version of [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] that contains information about a player's friends.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

FriendPages is a special version of [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] returned by [[30 Official Roblox Docs/API Reference/Classes/Players#GetFriendsAsync|Players:GetFriendsAsync()]]. The items contained within include information about a player's friends and have the following structure:

| Name | Type | Description |
| --- | --- | --- |
| `DisplayName` | string | The current display name of the friend. |
| `Id` | int64 | The user ID of the friend. |
| `Username` | string | The username of the friend. |

See the code samples for how to iterate over a player's friends.

*Code samples for this API (`print-roblox-friends`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/FriendPages); their code is not part of the open-source repo.*

---
*Source: [FriendPages](https://create.roblox.com/docs/reference/engine/classes/FriendPages) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
