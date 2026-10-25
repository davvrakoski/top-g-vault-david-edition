---
title: "VoiceChatService"
description: "**VoiceChatService** is responsible for voice chat's high-level functionality."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VoiceChatService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

***VoiceChatService** is responsible for voice chat's high-level functionality.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

**VoiceChatService** is responsible for voice chat's high-level functionality. This mostly consists of configuration options, and functions that are not specifically-controlled by more-specific instances.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#DefaultDistanceAttenuation\|DefaultDistanceAttenuation]] | [[30 Official Roblox Docs/API Reference/Enums/VoiceChatDistanceAttenuationType\|VoiceChatDistanceAttenuationType]] | Determines which distance attenuation curve the default voice chat setup uses when [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]] and [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] objects are generated. |
| [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#EnableDefaultVoice\|EnableDefaultVoice]] | boolean | Controls whether each voice-eligible player can be heard as though they were speaking through their character. |
| [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#EnableVoiceVolumeControls\|EnableVoiceVolumeControls]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Controls whether Roblox's built-in voice chat volume controls are available to players. |
| [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#UseAudioApi\|UseAudioApi]] | [[30 Official Roblox Docs/API Reference/Enums/AudioApiRollout\|AudioApiRollout]] | Controls whether voice chat is represented and controlled by [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]] objects. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#GetChatGroupsAsync\|GetChatGroupsAsync()]] | Array | Returns chat group IDs that indicate which players can voice chat together. |
| [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#IsVoiceEnabledForUserIdAsync\|IsVoiceEnabledForUserIdAsync()]] | boolean | Returns whether or not the given user has voice enabled. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### DefaultDistanceAttenuation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VoiceChatDistanceAttenuationType|VoiceChatDistanceAttenuationType]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Audio, Chat

This property controls the default distance attenuation curve assigned to any generated [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] instances in the default voice chat setup.

This property only has an effect if [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#EnableDefaultVoice|EnableDefaultVoice]] and [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#UseAudioApi|UseAudioApi]] are both enabled, since no [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] are otherwise generated.

### EnableDefaultVoice

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Audio, Chat

When enabled, each voice-eligible player can be heard as though they were speaking through their character. The implementation details of the voice setup depend on [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#UseAudioApi|UseAudioApi]].

When [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#UseAudioApi|UseAudioApi]] is [[30 Official Roblox Docs/API Reference/Enums/AudioApiRollout|Enabled]], disabling this property disables the default setup, but [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] will still work. Conversely, when [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#UseAudioApi|UseAudioApi]] is [[30 Official Roblox Docs/API Reference/Enums/AudioApiRollout|Disabled]], disabling the default voice setup effectively disables voice chat altogether.

### EnableVoiceVolumeControls

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Audio, Chat

This [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState]] property controls whether Roblox's built-in voice chat volume controls are available to players, including a global voice chat volume slider and per-user volume adjustments.

When set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enabled]], these controls are available to players. When set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Disabled]], the built-in controls are hidden, though creators can still implement their own custom voice volume controls. [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Default]] follows the default for this feature.

If [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#UseAudioApi|UseAudioApi]] is disabled, this property has no effect and built-in controls will be hidden.

### UseAudioApi

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioApiRollout|AudioApiRollout]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Audio, Chat

If [[30 Official Roblox Docs/API Reference/Enums/AudioApiRollout|Enabled]], the voice chat setup is represented and controlled by [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] objects. More specifically:

- An [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] will be created and parented to each voice-eligible [[30 Official Roblox Docs/API Reference/Classes/Player|Player]].
- An [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] will be created and parented to each voice-eligible player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]].
- An [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] will be created and parented to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]].

You can disable the default setup by setting [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#EnableDefaultVoice|VoiceChatService.EnableDefaultVoice]] to `false`.

If [[30 Official Roblox Docs/API Reference/Enums/AudioApiRollout|Disabled]], the voice chat setup is done through an internal-only system.

Currently, setting this to [[30 Official Roblox Docs/API Reference/Enums/AudioApiRollout|Automatic]] has the same meaning as [[30 Official Roblox Docs/API Reference/Enums/AudioApiRollout|Disabled]]. However, in the future, [[30 Official Roblox Docs/API Reference/Enums/AudioApiRollout|Automatic]] will become [[30 Official Roblox Docs/API Reference/Enums/AudioApiRollout|Enabled]], so that new experiences can achieve greater customization over voice.

## Methods

### GetChatGroupsAsync

```lua
VoiceChatService:GetChatGroupsAsync(players: Instances): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio, Chat · **Tags:** `Yields`

Returns a sorted array of arrays of chat group IDs for the given players. Each chat group ID is a string that represents a communication-compatible group within the current universe.

If two or more players share the same chat group ID, those players are eligible to voice chat with each other based on their age-check status, voice chat eligibility, and communication settings.

This method is server-side only and intended for real-time use cases such as matchmaking and teleporting. Chat group IDs are unique to the current universe, may change over time, and should not be stored once the user has left the experience. While you can hold onto the data returned for the purposes of gameplay while the user is in the experience, this data should not be stored after they've left.

To use this method, you must enable **Chat & Voice Groups APIs** in **Experience Settings** ⟩ **Communication** in Roblox Studio and agree to the Roblox Terms of Use.

In Roblox Studio this API is only available when the experience is running in **Team Test**.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `players` | Instances |  | A list of [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] currently in the experience to evaluate for voice chat compatibility. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A sorted array of arrays of chat group ID strings. Players who share a matching chat group ID are eligible to voice chat with each other. |

*Code samples for this member (`VoiceChatService-Chat-Groups-Teleport`, `VoiceChatService-GetChatGroupsAsync`) are published on the source page; their code is not part of the open-source repo.*

### IsVoiceEnabledForUserIdAsync

```lua
VoiceChatService:IsVoiceEnabledForUserIdAsync(userId: User): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Audio, Chat · **Tags:** `Yields`

Returns whether or not the given user has voice enabled. On the client-side, this can only be used to check the voice status of the local player. On the server-side, this can only check the voice status for players in that server.

This function can throw an error if the HTTP call fails.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] to check. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | If that user has voice enabled. |

*Code samples for this member (`VoiceChatService-IsVoiceEnabledForUserIdAsync`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [VoiceChatService](https://create.roblox.com/docs/reference/engine/classes/VoiceChatService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
