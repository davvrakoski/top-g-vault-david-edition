---
title: "ChatRestrictionStatus"
description: "Describes the chat restriction status that a third-party platform reports for a user."
api_type: enum
aliases: ["Enum.ChatRestrictionStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ChatRestrictionStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the chat restriction status that a third-party platform reports for a user.*

## Description

The `ChatRestrictionStatus` enum represents whether a user is permitted to participate in text or voice chat as determined by a third-party platform such as Xbox or PlayStation. Platform-level restrictions reflect parental controls, age restrictions, or account-level communication settings that the platform enforces independently of Roblox. This status is surfaced through properties such as [[30 Official Roblox Docs/API Reference/Classes/Player#ThirdPartyTextChatRestrictionStatus|Player.ThirdPartyTextChatRestrictionStatus]], `FriendCommunicationRestrictionStatus`, and `VoiceChatRestrictionStatus`, all of which default to [[30 Official Roblox Docs/API Reference/Enums/ChatRestrictionStatus|Enum.ChatRestrictionStatus.Unknown]] until the platform reports a definitive value.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | The platform's chat restriction status for the user has not yet been determined; this is the default value for all ChatRestrictionStatus properties. |
| `NotRestricted` | 1 | The third-party platform has confirmed the user has no chat restrictions in effect. |
| `Restricted` | 2 | The third-party platform has reported the user is restricted from chat, typically due to parental controls or platform communication settings. |

---
*Source: [ChatRestrictionStatus](https://create.roblox.com/docs/reference/engine/enums/ChatRestrictionStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
