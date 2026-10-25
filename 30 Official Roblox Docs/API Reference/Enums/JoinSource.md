---
title: "JoinSource"
description: "Identifies the context in which a player joined an experience via a deeplink."
api_type: enum
aliases: ["Enum.JoinSource"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/JoinSource"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies the context in which a player joined an experience via a deeplink.*

## Description

Identifies the context in which a player joined an experience via a deeplink. The value is available as the `JoinSource` key in the `GameJoinContext` table returned by [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|Player:GetJoinData()]]. Experiences can inspect this value on [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|Players.PlayerAdded]] to customize the player's starting state depending on how they arrived.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `CreatedItemAttribution` | 1 | The player joined by following an attribution link for an item created inside an experience. |

---
*Source: [JoinSource](https://create.roblox.com/docs/reference/engine/enums/JoinSource) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
