---
title: "VoiceChatState"
description: "Describes the connection state of a local player's voice chat session."
api_type: enum
aliases: ["Enum.VoiceChatState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/VoiceChatState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the connection state of a local player's voice chat session.*

## Description

Describes the connection state of a local player's voice chat session. The session progresses through the [[30 Official Roblox Docs/API Reference/Enums/VoiceChatState|Enum.VoiceChatState]] items from idle, through joining, to joined, and then to leaving, ended, or failed when the session concludes.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Idle` | 0 | The player is not connected to voice chat and no join attempt is in progress. |
| `Joining` | 1 | A voice chat join attempt is in progress for the first time. |
| `JoiningRetry` | 2 | A voice chat join is being retried after a previous attempt did not succeed. |
| `Joined` | 3 | The player has successfully joined the voice chat session and is actively connected. |
| `Leaving` | 4 | The player is in the process of disconnecting from the voice chat session. |
| `Ended` | 5 | The voice chat session has ended normally. |
| `Failed` | 6 | The voice chat session ended due to an error, such as a failure to join or a mid-session error. |

---
*Source: [VoiceChatState](https://create.roblox.com/docs/reference/engine/enums/VoiceChatState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
