---
title: "VoiceControlPath"
description: "Identifies which leg of a voice chat control-plane operation is being reported."
api_type: enum
aliases: ["Enum.VoiceControlPath"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/VoiceControlPath"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies which leg of a voice chat control-plane operation is being reported.*

## Description

Identifies which voice control-plane path triggered a [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService|VoiceChatService]] event such as `RelayCandidatesGathered` or `VoiceSetupFailed`: [[30 Official Roblox Docs/API Reference/Enums/VoiceControlPath|Enum.VoiceControlPath.Join]] (enter a voice room), [[30 Official Roblox Docs/API Reference/Enums/VoiceControlPath|Enum.VoiceControlPath.Publish]] (send local microphone audio), or [[30 Official Roblox Docs/API Reference/Enums/VoiceControlPath|Enum.VoiceControlPath.Subscribe]] (receive remote audio).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Publish` | 0 | Represents the outbound audio path, through which a client sends local microphone audio to the room. |
| `Subscribe` | 1 | Represents the inbound audio path, through which a client receives remote participants' audio streams. |
| `Join` | 2 | Represents the room-join path, through which a client establishes membership in a voice room. |

---
*Source: [VoiceControlPath](https://create.roblox.com/docs/reference/engine/enums/VoiceControlPath) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
