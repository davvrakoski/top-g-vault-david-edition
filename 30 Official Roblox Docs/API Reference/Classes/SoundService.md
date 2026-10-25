---
title: "SoundService"
description: "A service that determines various aspects of how the audio engine works. Most of its properties affect how `Sounds` play in the experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SoundService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that determines various aspects of how the audio engine works. Most of its properties affect how [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] play in the experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

A service that determines various aspects of how the audio engine works. Most of its properties affect how [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] play in the experience, while others affect the behavior of instances in the advanced audio system such as [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayers]] and [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]].

[[30 Official Roblox Docs/API Reference/Classes/SoundService|SoundService]] is also often used to store [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroups]], although this is not mandatory for groups to work.

*Code samples for this API (`SoundService-Reverb-System`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/SoundService); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#AcousticSimulationEnabled\|AcousticSimulationEnabled]] | boolean | Determines whether acoustic simulation is enabled globally in the advanced audio system. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#AmbientReverb\|AmbientReverb]] | [[30 Official Roblox Docs/API Reference/Enums/ReverbType\|ReverbType]] | The ambient sound environment preset applied to all [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sounds]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#CharacterSoundsUseNewApi\|CharacterSoundsUseNewApi]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Determines whether the default character sounds will use instances in the advanced audio system vs. [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sounds]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#DefaultListenerLocation\|DefaultListenerLocation]] | [[30 Official Roblox Docs/API Reference/Enums/ListenerLocation\|ListenerLocation]] | Determines where (if anywhere) to place an [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] by default. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#DistanceFactor\|DistanceFactor]] | float | The number of studs to be considered a meter by [[30 Official Roblox Docs/API Reference/Classes/SoundService\|SoundService]] when simulating the Doppler effect for [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sounds]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#DopplerScale\|DopplerScale]] | float | Degree to which the pitch of a [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] varies due to the Doppler effect. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#ListenerCFrame\|ListenerCFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] that is used as the listener's position if [[30 Official Roblox Docs/API Reference/Classes/SoundService#ListenerType\|ListenerType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#ListenerObject\|ListenerObject]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] whose translation or coordinate frame is used as the listener's position if [[30 Official Roblox Docs/API Reference/Classes/SoundService#ListenerType\|ListenerType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.ObjectPosition]] or [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.ObjectCFrame]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#ListenerType\|ListenerType]] | [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|ListenerType]] | The current listener type used by 3D [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sounds]] to determine where they will be heard from. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#RespectFilteringEnabled\|RespectFilteringEnabled]] | boolean | Sets whether [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] playback from a client will replicate to the server. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#RolloffScale\|RolloffScale]] | float | Determines how fast the volume of a [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] attenuates beyond its [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|Sound.RollOffMinDistance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#VolumetricAudio\|VolumetricAudio]] | [[30 Official Roblox Docs/API Reference/Enums/VolumetricAudio\|VolumetricAudio]] | Determines whether certain spatialized [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sounds]] emit volumetrically, throughout the space of their parent object. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetListener\|GetListener()]] | Tuple | Returns the current listener type used by [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sounds]], as well as what that listener is currently set to. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetMixerTime\|GetMixerTime()]] | double | Returns a number in seconds which increases as the audio engine mixes. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#OpenAttenuationCurveEditor\|OpenAttenuationCurveEditor()]] | () | Opens the attenuation curve editor in Studio for the provided [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] or [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] instances. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#OpenDirectionalCurveEditor\|OpenDirectionalCurveEditor()]] | () | Opens the directional curve editor in Studio for the provided [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] or [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] instances. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#PlayLocalSound\|PlayLocalSound()]] | () | Plays a copy of a [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] locally, such that it will only be heard by the client calling this method. |
| [[30 Official Roblox Docs/API Reference/Classes/SoundService#SetListener\|SetListener()]] | () | Sets the listener used by [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sounds]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AcousticSimulationEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Audio

Determines at a global level whether sound from [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] and [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListeners]] should automatically implement features of acoustic simulation, such as occlusion (being muffled through walls), diffraction (bending around corners), and reverberation (echoing off of walls).

If set to `false`, these instances will not simulate these features, regardless of their individual [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#AcousticSimulationEnabled|AcousticSimulationEnabled]] settings.

### AmbientReverb

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ReverbType|ReverbType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Audio

A reverb preset that should be applied to all [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] in the experience.

Each [[30 Official Roblox Docs/API Reference/Enums/ReverbType|Enum.ReverbType]] option for this property corresponds to a preset available in the FMOD sound engine. For example, when [[30 Official Roblox Docs/API Reference/Classes/SoundService#AmbientReverb|AmbientReverb]] is set to [[30 Official Roblox Docs/API Reference/Enums/ReverbType|Enum.ReverbType.Hangar]], [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] will have reverb applied to simulate being in a large enclosed space.

Note that this only affects [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] and **not** instances in the advanced audio system such as [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayers]] and [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]]. See [[30 Official Roblox Docs/API Reference/Classes/AudioReverb|AudioReverb]] for a way to apply reverb in that system.

### CharacterSoundsUseNewApi

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Audio

Determines which set of instances core scripts will use to create default character sounds. If set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState.Enabled]], it will use instances in the advanced audio system such as [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayers]] and [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]]. If set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState.Disabled]], it will use instances in the legacy sound system such as [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]].

### DefaultListenerLocation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ListenerLocation|ListenerLocation]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Listening · **Loaded/Saved:** true/true · **Capabilities:** Audio

Determines where to place an [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] by default. The [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] will automatically be wired to a [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] and will have an empty [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener.InteractionGroup]] set.

See [[30 Official Roblox Docs/API Reference/Enums/ListenerLocation|Enum.ListenerLocation]] for detailed descriptions of each option.

### DistanceFactor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Audio

The number of studs to be considered a meter by [[30 Official Roblox Docs/API Reference/Classes/SoundService|SoundService]] when simulating the Doppler effect for [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]]. This impacts any [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]].

By default, this property is `3.33`, meaning that a meter is considered 3.33 studs for the purposes of simulating the Doppler effect. The greater the [[30 Official Roblox Docs/API Reference/Classes/SoundService#DistanceFactor|DistanceFactor]], the faster the listener has to travel relative to [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] in order to experience the same Doppler shift.

It's recommended that you only change this property if the objects in your experience are scaled differently from what they represent. For example, if your character is meant to be very small (but is normal-sized in the engine), you may want to increase [[30 Official Roblox Docs/API Reference/Classes/SoundService#DistanceFactor|SoundService.DistanceFactor]].

Note that this does not impact the behavior of instances in the advanced audio system, such as [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] or [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]].

### DopplerScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Audio

This property determines the degree to which the pitch of a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] varies due to the Doppler effect. This impacts any [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]].

The Doppler effect is a phenomenon whereby the pitch of a sound changes as the source and observer of the sound move further away or closer together, which is stronger the more quickly they are moving. Increasing [[30 Official Roblox Docs/API Reference/Classes/SoundService#DopplerScale|SoundService.DopplerScale]] exaggerates the impact of this effect, whereas decreasing it minimizes it. By default, the value of this property is `1`.

Note that this does not impact the behavior of instances in the advanced audio system, such as [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] or [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]].

### ListenerCFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Listening · **Loaded/Saved:** true/true · **Capabilities:** Audio

This property is only functional when [[30 Official Roblox Docs/API Reference/Classes/SoundService#ListenerType|ListenerType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ListenerType|Enum.ListenerType.CFrame]]. In that scenario, this property determines the world space position from which 3D [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] are heard by the player.

### ListenerObject

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Listening · **Loaded/Saved:** true/true · **Capabilities:** Audio

This property is only functional when [[30 Official Roblox Docs/API Reference/Classes/SoundService#ListenerType|ListenerType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ListenerType|Enum.ListenerType.ObjectPosition]] or [[30 Official Roblox Docs/API Reference/Enums/ListenerType|Enum.ListenerType.ObjectCFrame]]. In that scenario, this property determines which [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] will be used to determine the position from which 3D [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] are heard by the player. This property can only be set to [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] with a position, such as a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]. If it is set to `nil`, 3D [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] will not be heard by the player.

### ListenerType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ListenerType|ListenerType]]

**Thread safety:** ReadSafe · **Category:** Listening · **Loaded/Saved:** true/true · **Capabilities:** Audio

The listener type for any 3D [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] in the experience, effectively the point from which 3D [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] audio in the experience is heard by the player. For [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], the listener influences the volume and left/right balance of a playing sound. By default, this listener is set to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]].

Note that this does not affect the listener location when using the advanced audio system; see [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] for a way to set the listener location within that system.

This property may not yet be enabled for all creators. Until full rollout, use [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetListener|SoundService:GetListener()]] and [[30 Official Roblox Docs/API Reference/Classes/SoundService#SetListener|SoundService:SetListener()]] instead.

### RespectFilteringEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Audio

This property determines whether [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] playback is replicated from the client to the server, and therefore from the server. In other words, when a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] calls [[30 Official Roblox Docs/API Reference/Classes/Sound#Play|Play()]] and this property is `true`, the sound will only play on the respective client. If this property is `false`, other clients will also hear the sound.

Default is `true`, meaning filtering is enabled.

### RolloffScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Audio

Determines how fast the volume of a spatialized [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] attenuates. This impacts any [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]].

A higher [[30 Official Roblox Docs/API Reference/Classes/SoundService#RolloffScale|RolloffScale]] means the volume of a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] will attenuate more rapidly as the distance between the listener and the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] grows. More precisely, the volume of the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] will still start attenuating at a distance equal to [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance|Sound.RollOffMinDistance]], but the attenuation curve will be steeper or more gradual based on the value of [[30 Official Roblox Docs/API Reference/Classes/SoundService#RolloffScale|RolloffScale]]. Note that the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] will still be inaudible past its the [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance|Sound.RollOffMaxDistance]] regardless of the value of [[30 Official Roblox Docs/API Reference/Classes/SoundService#RolloffScale|SoundService.RolloffScale]].

Note that this property does not affect the behavior of instances in the advanced audio system, such as [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]]. See [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#SetDistanceAttenuation|AudioEmitter:SetDistanceAttenuation]] for a way to apply custom attenuation in that system.

### VolumetricAudio

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VolumetricAudio|VolumetricAudio]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Audio · **Tags:** `NotScriptable`

Determines whether any [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] parented to a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] emit volumetrically. If set to [[30 Official Roblox Docs/API Reference/Enums/VolumetricAudio|Enum.VolumetricAudio.Enabled]], the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] will simulate being emitted from every point in the interior of the [[30 Official Roblox Docs/API Reference/Classes/Part|Part]]. If set to [[30 Official Roblox Docs/API Reference/Enums/VolumetricAudio|Enum.VolumetricAudio.Disabled]], the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] will only emit from a single point in the center of the [[30 Official Roblox Docs/API Reference/Classes/Part|Part]].

Note that this does not impact [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] parented to other objects, such as [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]]. This also does not impact the behavior of instances in the advanced audio system such as [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]].

## Methods

### GetListener

```lua
SoundService:GetListener(): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns the current listener type used by [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] and what object or position that listener is currently set to. This is the point from which [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] audio in the experience is heard by the player. By default, the listener is set to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]]. The listener can be changed using [[30 Official Roblox Docs/API Reference/Classes/SoundService#SetListener|SetListener()]].

Note that this does not affect the listener location when using the advanced audio system. See [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] for a way to set the listener location in that system.

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A table containing two results. The first result is the listener's [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType]] and the second result is dependent on that type:<br><br>\| Listener Type \| Description \| \| --- \| --- \| \| [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.Camera]] \| Does not return a listener object as [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|CurrentCamera]] is always used. \| \| [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.CFrame]] \| Returns the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] used in [[30 Official Roblox Docs/API Reference/Classes/SoundService#SetListener\|SetListener()]]. \| \| [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.ObjectPosition]] \| Returns the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] used in [[30 Official Roblox Docs/API Reference/Classes/SoundService#SetListener\|SetListener()]]. \| \| [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.ObjectCFrame]] \| Returns the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] used in [[30 Official Roblox Docs/API Reference/Classes/SoundService#SetListener\|SetListener()]]. \| |

### GetMixerTime

```lua
SoundService:GetMixerTime(): double
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns a number in seconds that increases as the audio engine produces output. Because this clock is derived from the number of audio samples the mixer has processed, it is stable, sample-accurate, and monotonically increasing, which makes it suitable for scheduling audible changes at precise moments.

Use this value as the basis for the `atTime` argument of methods that support scheduling playback to begin or end at an exact point in the future, such as [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Play|Play()]] and [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Stop|Stop()]]. Those methods expect times derived from [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetMixerTime|GetMixerTime()]].

Note, [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetMixerTime|GetMixerTime()]] starts at an arbitrary value, and can differ between machines. It is not suitable for synchronizing audio across sessions or networks.

**Returns**

| Type | Description |
| --- | --- |
| double | A number in seconds. This value is stable, sample-accurate, and monotonically-increasing. It's intended to be used for scheduling audible changes at precise times. |

### OpenAttenuationCurveEditor

```lua
SoundService:OpenAttenuationCurveEditor(selectedCurveObjects: Instances): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Audio

Opens the attenuation curve editor in Studio for the provided [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] or [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] instances.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `selectedCurveObjects` | Instances |  | A list of [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitters]] or [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListeners]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### OpenDirectionalCurveEditor

```lua
SoundService:OpenDirectionalCurveEditor(selectedCurveObjects: Instances): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Audio

Opens the directional curve editor in Studio for the provided [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] or [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] instances. This method is intended for use by Studio plugins that need to programmatically surface the editor, in the same way a user would open it from the Properties window.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `selectedCurveObjects` | Instances |  | A list of [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitters]] or [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListeners]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PlayLocalSound

```lua
SoundService:PlayLocalSound(sound: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Plays a copy of a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] locally. The [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] will only be heard by the client calling this method, regardless of where it's parented to.

Some properties of the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] will be carried over into the copy. These include its [[30 Official Roblox Docs/API Reference/Classes/Sound#Volume|Sound.Volume]], [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition|Sound.TimePosition]], [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackSpeed|Sound.PlaybackSpeed]], and any spatialization and effects that are applied to it, including through [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundGroup|SoundGroups]]. Properties that do not affect the copy include [[30 Official Roblox Docs/API Reference/Classes/Sound#Looped|Sound.Looped]] and [[30 Official Roblox Docs/API Reference/Classes/SoundService#AmbientReverb|SoundService.AmbientReverb]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] to be played. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetListener

```lua
SoundService:SetListener(listenerType: ListenerType, listener: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Sets the listener type for any [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] in the experience, which defines the point from which [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] audio in the experience is heard by the player. For [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], the listener influences the volume and left/right balance of a playing sound. By default, this listener is set to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]].

Note that this does not affect the listener location when using the advanced audio system. See [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] for a way to set the listener location in that system.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `listenerType` | [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|ListenerType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType]] of the listener. |
| `listener` | Tuple |  | Dependent on the [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType]]. Use a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] for [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.ObjectPosition]] or [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.ObjectCFrame]], a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.CFrame]], or `nil` for [[30 Official Roblox Docs/API Reference/Enums/ListenerType\|Enum.ListenerType.Camera]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [SoundService](https://create.roblox.com/docs/reference/engine/classes/SoundService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
