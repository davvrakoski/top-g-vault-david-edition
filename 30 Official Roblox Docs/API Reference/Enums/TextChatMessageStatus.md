---
title: "TextChatMessageStatus"
description: "Indicates the status of a `TextChatMessage`."
api_type: enum
aliases: ["Enum.TextChatMessageStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TextChatMessageStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the status of a [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]].*

## Description

Indicates the status of a [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]]. The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Status|TextChatMessage.Status]] property is set by [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] to report the outcome of an attempted send. A status of [[30 Official Roblox Docs/API Reference/Enums/TextChatMessageStatus|Enum.TextChatMessageStatus.Success]] means the message passed all server-side checks; any other value identifies the reason the message was blocked or has not yet completed delivery.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 1 | Generic failed status for any other [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync\|TextChannel:SendAsync()]] failures. |
| `Success` | 2 | Message has no issues. |
| `Sending` | 3 | Message is sending. |
| `TextFilterFailed` | 4 | Text filter failed to process the message. |
| `Floodchecked` | 5 | Message is from a user sending messages too frequently. |
| `InvalidPrivacySettings` | 6 | Message can't be sent because of the user's chat privacy settings. |
| `InvalidTextChannelPermissions` | 7 | Message's [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]] is either not in the intended [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] or [[30 Official Roblox Docs/API Reference/Classes/TextSource#CanSend\|TextSource.CanSend]] is `false`. |
| `MessageTooLong` | 8 | Message is too long. |
| `ModerationTimeout` | 9 | Message can't be sent because the user has an active moderation timeout on chat. |

---
*Source: [TextChatMessageStatus](https://create.roblox.com/docs/reference/engine/enums/TextChatMessageStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
