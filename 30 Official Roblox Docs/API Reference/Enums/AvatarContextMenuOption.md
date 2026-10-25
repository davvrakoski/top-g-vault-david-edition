---
title: "AvatarContextMenuOption"
description: "Options for the Avatar Context Menu, a menu that allows users to interact with other players' characters in an experience."
api_type: enum
aliases: ["Enum.AvatarContextMenuOption"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarContextMenuOption"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Options for the Avatar Context Menu, a menu that allows users to interact with other players' characters in an experience.*

## Description

Options for the [[30 Official Roblox Docs/Players/Avatar Context Menu|Avatar Context Menu]] (ACM), a menu that allows users to interact with other players' characters in an experience. Pass these values to [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCore|StarterGui:SetCore()]] with the `"AddAvatarContextMenuOption"` or `"RemoveAvatarContextMenuOption"` options to add or remove default actions from the menu.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Friend` | 0 | Sends a friend request to the selected user. |
| `Chat` | 1 | Opens a private conversation with the selected user in the in-game chat. |
| `Emote` | 2 | Plays a wave emote animation directed at the selected user. |
| `InspectMenu` | 3 | Opens the Avatar Inspect Menu to view the selected user's avatar and equipped items. |

---
*Source: [AvatarContextMenuOption](https://create.roblox.com/docs/reference/engine/enums/AvatarContextMenuOption) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
