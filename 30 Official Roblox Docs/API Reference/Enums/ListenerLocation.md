---
title: "ListenerLocation"
description: "Enum used with `SoundService.DefaultListenerLocation` to determine where an `AudioListener` is placed by default."
api_type: enum
aliases: ["Enum.ListenerLocation"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ListenerLocation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Enum used with [[30 Official Roblox Docs/API Reference/Classes/SoundService#DefaultListenerLocation|SoundService.DefaultListenerLocation]] to determine where an [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] is placed by default.*

## Description

Enum used with [[30 Official Roblox Docs/API Reference/Classes/SoundService#DefaultListenerLocation|SoundService.DefaultListenerLocation]] to determine where an [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] is placed by default.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Behavior depends on the value of [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#EnableDefaultVoice\|VoiceChatService.EnableDefaultVoice]] and [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#UseAudioApi\|VoiceChatService.UseAudioApi]]. When using the default voice setup with the audio API, this behaves similarly to `Camera`. |
| `None` | 1 | No [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] will be created by default, but they can be created separately by scripts. |
| `Character` | 2 | All of the following, resulting in the world being heard from the position of your character while matching the orientation of your camera.<br><br>- An [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] will be created and parented to the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]] of the local player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Character]] model.<br><br>- An [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] will be created and parented to the [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]].<br><br>- An [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput\|AudioDeviceOutput]] will be created and parented to [[30 Official Roblox Docs/API Reference/Classes/SoundService\|SoundService]].<br><br>- A [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] will be created and parented to the previously-created [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]. The wire's [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|SourceInstance]] will be set to the previously-created [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] and its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|TargetInstance]] will be set to the previously-created [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput\|AudioDeviceOutput]].<br><br>- The previously-created [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] will be updated once per frame to face the same direction as [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|Workspace.CurrentCamera]]. |
| `Camera` | 3 | All of the following, resulting in the world being heard from the perspective (postition and orientation) of the camera.<br><br>- An [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] will be created and parented to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|Workspace.CurrentCamera]]. - An [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput\|AudioDeviceOutput]] will be created and parented to [[30 Official Roblox Docs/API Reference/Classes/SoundService\|SoundService]]. - A [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] will be created and parented to the previously-created [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]. The wire's [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|SourceInstance]] will be set to the previously-created [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] and its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|TargetInstance]] will be set to the previously-created [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput\|AudioDeviceOutput]]. |

---
*Source: [ListenerLocation](https://create.roblox.com/docs/reference/engine/enums/ListenerLocation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
