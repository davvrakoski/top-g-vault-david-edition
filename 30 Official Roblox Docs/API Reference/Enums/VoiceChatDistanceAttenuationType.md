---
title: "VoiceChatDistanceAttenuationType"
description: "Enum used for preset distance attenuation curve options in the default voice chat setup."
api_type: enum
aliases: ["Enum.VoiceChatDistanceAttenuationType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/VoiceChatDistanceAttenuationType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Enum used for preset distance attenuation curve options in the default voice chat setup.*

## Description

Each value in this enum represents a distance attenuation curve that can be used by [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService|VoiceChatService]] when creating the default voice chat setup using [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] and [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] objects.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Inverse` | 0 | Represents a distance attenuation curve that follows the inverse-squared law. This is identical to the default distance attenuation of an [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] instance. |
| `Legacy` | 1 | Represents a linear-squared distance attenuation curve with a minimum distance of `7` and a maximum distance of `80`. This is identical to the distance attenuation used in the internal-only default voice setup that does not use [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]] and [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] objects. |

---
*Source: [VoiceChatDistanceAttenuationType](https://create.roblox.com/docs/reference/engine/enums/VoiceChatDistanceAttenuationType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
