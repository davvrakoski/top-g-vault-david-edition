---
title: "MuteState"
description: "Describes whether a voice chat participant's microphone is actively transmitting audio."
api_type: enum
aliases: ["Enum.MuteState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/MuteState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes whether a voice chat participant's microphone is actively transmitting audio.*

## Description

[[30 Official Roblox Docs/API Reference/Enums/MuteState|Enum.MuteState]] is the microphone mute status of a local player in a voice chat session. It is passed in [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService|VoiceChatService]] events such as `VoiceChatPlayerMuteStateChangedClientToServer` and `VoiceChatPlayerMuteStateChangedServerToClient`. Defaults to [[30 Official Roblox Docs/API Reference/Enums/MuteState|Enum.MuteState.Unmuted]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unmuted` | 0 | The participant's microphone is active and transmitting audio. |
| `Muted` | 1 | The participant's microphone is muted and not transmitting audio. |

---
*Source: [MuteState](https://create.roblox.com/docs/reference/engine/enums/MuteState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
