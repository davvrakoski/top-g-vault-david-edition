---
title: "WhisperChatPrivacyMode"
description: "Describes which other players a player allows to initiate a whisper (direct) chat with them in an experience."
api_type: enum
aliases: ["Enum.WhisperChatPrivacyMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/WhisperChatPrivacyMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes which other players a player allows to initiate a whisper (direct) chat with them in an experience.*

## Description

Describes which other players a player allows to initiate a whisper (direct) chat with them in an experience. A whisper chat is only permitted when **both** the sender and the recipient have [[30 Official Roblox Docs/API Reference/Enums/WhisperChatPrivacyMode|Enum.WhisperChatPrivacyMode.AllUsers]]; if either player's mode is [[30 Official Roblox Docs/API Reference/Enums/WhisperChatPrivacyMode|Enum.WhisperChatPrivacyMode.NoOne]], the private chat is blocked. The setting comes from the player's account privacy configuration and is applied when the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object is created. Defaults to [[30 Official Roblox Docs/API Reference/Enums/WhisperChatPrivacyMode|Enum.WhisperChatPrivacyMode.NoOne]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `AllUsers` | 0 | The player allows any other player in the experience to initiate a whisper chat with them. |
| `NoOne` | 1 | The player does not allow any other player to initiate a whisper chat with them. |

---
*Source: [WhisperChatPrivacyMode](https://create.roblox.com/docs/reference/engine/enums/WhisperChatPrivacyMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
