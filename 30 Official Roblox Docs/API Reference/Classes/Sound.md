---
title: "Sound"
description: "An object that emits sound. This object can be placed within a `BasePart` or `Attachment` to emit a sound from a particular position within a place or world, or it can be attached elsewhere to play the sound at a constant volume throughout the entire place."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Sound"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that emits sound. This object can be placed within a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] to emit a sound from a particular position within a place or world, or it can be attached elsewhere to play the sound at a constant volume throughout the entire place.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is an object that emits sound. When placed in a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], this object will emit its sound from that part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]] or the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldPosition|Attachment.WorldPosition]]. In this placement, a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] exhibits the Doppler effect, meaning its frequency and pitch varies with the relative motion of whatever attachment or part it is attached to. Additionally, its volume will be determined by the distance between the client's sound listener (by default the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] position) and the position of the sound's parent. For more information, see [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMode|RollOffMode]].

A sound is considered "global" if it is **not** parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]. In this case, the sound will play at the same volume throughout the entire place.

*Code samples for this API (`Sound-3D-Parent`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Sound); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#AudioContent\|AudioContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | A reference to an audio asset. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#EmitterSize\|EmitterSize]] | float | **Deprecated.** The minimum distance, in studs, at which a 3D [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] (direct child of a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]]) will begin to attenuate (decrease in volume). |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#IsLoaded\|IsLoaded]] | boolean | This property is `true` when the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] has loaded from Roblox servers and is ready to play. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#IsPaused\|IsPaused]] | boolean | Read-only property which returns `true` when the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is not playing. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#IsPlaying\|IsPlaying]] | boolean | Read-only property which returns `true` when the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is playing. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#isPlaying\|isPlaying]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Looped\|Looped]] | boolean | Sets whether or not the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] repeats once it has finished playing. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#LoopRegion\|LoopRegion]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | A range denoting a desired loop start and loop end within the [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion\|PlaybackRegion]], in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#MaxDistance\|MaxDistance]] | float | **Deprecated.** The maximum distance, in studs, a client's listener can be from the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound\s]] origin and still hear it. Only applies to Sounds parented to a [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] (3D sounds). |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#MinDistance\|MinDistance]] | float | **Deprecated.** The minimum distance at which a 3D [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] (direct child of a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]]) will begin to attenuate. Effectively, the emitter size. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Pitch\|Pitch]] | float | **Deprecated.** Sets how high pitched and fast a [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is when it is played. The greater the integer, the higher and faster the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackLoudness\|PlaybackLoudness]] | double | A number between `0` and `1000` indicating how loud the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is currently playing back. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion\|PlaybackRegion]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | A range denoting a desired start and stop time within the [[30 Official Roblox Docs/API Reference/Classes/Sound#TimeLength\|TimeLength]], in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegionsEnabled\|PlaybackRegionsEnabled]] | boolean | If `true`, this property gives your [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] access to the [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion\|PlaybackRegion]] and [[30 Official Roblox Docs/API Reference/Classes/Sound#LoopRegion\|LoopRegion]] properties which can more-accurately control its playback. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackSpeed\|PlaybackSpeed]] | float | Determines the speed at which a [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] will play, with higher values causing the sound to play faster and at a higher pitch. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Playing\|Playing]] | boolean | Indicates whether the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is currently playing. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#PlayOnRemove\|PlayOnRemove]] | boolean | When `true`, the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] will play when it is removed from the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance\|RollOffMaxDistance]] | float | The maximum distance, in studs, a client's listener can be from the sound's origin and still hear it. Only applies to [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sounds]] parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance\|RollOffMinDistance]] | float | The minimum distance, in studs, at which a [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] which is parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] will begin to attenuate (decrease in volume). |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMode\|RollOffMode]] | [[30 Official Roblox Docs/API Reference/Enums/RollOffMode\|RollOffMode]] | Controls how the volume of a [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] which is parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] attenuates (fades out) as the distance between the listener and parent changes. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundGroup\|SoundGroup]] | [[30 Official Roblox Docs/API Reference/Classes/SoundGroup\|SoundGroup]] | The [[30 Official Roblox Docs/API Reference/Classes/SoundGroup\|SoundGroup]] that is linked to this [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundId\|SoundId]] | ContentId | Content ID of the sound file to associate with the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#TimeLength\|TimeLength]] | double | The length of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition\|TimePosition]] | double | Progress of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] in seconds. Can be changed to move the playback position of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] both before and during playback. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Volume\|Volume]] | float | The volume of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Pause\|Pause()]] | () | Pauses playback of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] if it is playing. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Pause\|pause()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Play\|Play()]] | () | Plays the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Play\|play()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Resume\|Resume()]] | () | Resumes the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Stop\|Stop()]] | () | Stops the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Stop\|stop()]] | () | **Deprecated.**  |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#DidLoop\|DidLoop]] | `soundId`, `numOfTimesLooped` | Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] loops. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Ended\|Ended]] | `soundId` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] has completed playback and stopped. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Loaded\|Loaded]] | `soundId` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is loaded. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Paused\|Paused]] | `soundId` | Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is paused using [[30 Official Roblox Docs/API Reference/Classes/Sound#Pause\|Pause()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Played\|Played]] | `soundId` | Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is played using [[30 Official Roblox Docs/API Reference/Classes/Sound#Play\|Play()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Resumed\|Resumed]] | `soundId` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is resumed using [[30 Official Roblox Docs/API Reference/Classes/Sound#Resume\|Resume()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Sound#Stopped\|Stopped]] | `soundId` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] is stopped through using [[30 Official Roblox Docs/API Reference/Classes/Sound#Stop\|Stop()]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AudioContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

This property is a reference to an audio asset.

### EmitterSize

> [!warning] Deprecated
> This property has deprecated in favor of `Class.Sound.RollOffMinDistance`
> and `Class.Sound.RollOffMaxDistance` which should be used instead in new
> work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** LegacySound · **Tags:** `Deprecated`

The minimum distance, in studs, at which a 3D [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] (direct child of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]) will begin to attenuate (decrease in volume).

Sounds parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] that are descendants of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] are considered 3D sounds and their volume while playing is dependent on the distance between the client's sound listener ([[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] position by default) and the Sound's parent. Two properties influence this behavior EmitterSize and [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMode|Sound.RollOffMode]].

The way the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] attenuates (fades out) after the distance between the listener and the sound exceeds the EmitterSize is determined by RollOffMode.

*Code samples for this member (`Sound-3D-Parent`) are published on the source page; their code is not part of the open-source repo.*

### IsLoaded

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** false/false · **Capabilities:** LegacySound · **Tags:** `ReadOnly`, `NotReplicated`

This property is `true` when the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] has loaded from Roblox servers and is ready to play. You can use this property and the [[30 Official Roblox Docs/API Reference/Classes/Sound#Loaded|Loaded]] event to verify a sound has loaded before playing it.

*Code samples for this member (`Sound-Loaded`) are published on the source page; their code is not part of the open-source repo.*

### IsPaused

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** false/false · **Capabilities:** LegacySound · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

This read-only property returns `true` when the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is not playing. Note that it can return `true` if a sound has been paused using [[30 Official Roblox Docs/API Reference/Classes/Sound#Pause|Pause()]], if it has been stopped using [[30 Official Roblox Docs/API Reference/Classes/Sound#Stop|Stop()]], or the sound has never been played.

As [[30 Official Roblox Docs/API Reference/Classes/Sound#IsPaused|IsPaused]] is read-only, it cannot be used to stop the sound; [[30 Official Roblox Docs/API Reference/Classes/Sound#Stop|Stop()]] or [[30 Official Roblox Docs/API Reference/Classes/Sound#Pause|Pause()]] should be used instead.

*Code samples for this member (`Sound-IsPlaying-IsPaused`) are published on the source page; their code is not part of the open-source repo.*

### IsPlaying

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** false/false · **Capabilities:** LegacySound · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

This read-only property returns true when the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is playing.

As [[30 Official Roblox Docs/API Reference/Classes/Sound#IsPlaying|IsPlaying]] is read-only, it cannot be used to play the sound; [[30 Official Roblox Docs/API Reference/Classes/Sound#Play|Play()]] should be used instead.

*Code samples for this member (`Sound-IsPlaying-IsPaused`) are published on the source page; their code is not part of the open-source repo.*

### isPlaying

> [!warning] Deprecated
> This deprecated property is a variant of `Class.Sound.IsPlaying` which
> should be used instead.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** LegacySound · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

### Looped

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

This sets whether or not the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] repeats once it has finished playing. Looped sounds are suitable for a range of applications including music and background ambient sounds.

The [[30 Official Roblox Docs/API Reference/Classes/Sound#DidLoop|DidLoop]] event can be used to track the number of times as sound has looped.

*Code samples for this member (`Sound-Looping-2`) are published on the source page; their code is not part of the open-source repo.*

### LoopRegion

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** Regions · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

A range denoting a desired loop start and loop end within the [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion]], in seconds.

- If [[30 Official Roblox Docs/API Reference/Classes/Sound#LoopRegion|LoopRegion.Min]] `>` [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Min]], the loop starts from [[30 Official Roblox Docs/API Reference/Classes/Sound#LoopRegion|LoopRegion.Min]].

- If [[30 Official Roblox Docs/API Reference/Classes/Sound#LoopRegion|LoopRegion.Min]] `<` [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Min]], the loop starts from [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Min]].

- If [[30 Official Roblox Docs/API Reference/Classes/Sound#LoopRegion|LoopRegion.Max]] `>` [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Max]], the loop starts at [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Max]].

- If [[30 Official Roblox Docs/API Reference/Classes/Sound#LoopRegion|LoopRegion.Max]] `<` [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Max]], the loop starts at **exactly** that time.

- If [[30 Official Roblox Docs/API Reference/Classes/Sound#LoopRegion|LoopRegion.Min]] `==` [[30 Official Roblox Docs/API Reference/Classes/Sound#LoopRegion|LoopRegion.Max]], the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] uses the [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion]] property instead.

### MaxDistance

> [!warning] Deprecated
> This property has deprecated in favor of `Class.Sound.RollOffMinDistance`
> and `Class.Sound.RollOffMaxDistance` which should be used instead in new
> work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** LegacySound · **Tags:** `Deprecated`

The maximum distance, in studs, a client's listener can be from the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] origin and still hear it. Only applies to Sounds parented to a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] (3D sounds).

How MaxDistance impacts the attenuation of a sound (manner in which it fades out) is dependent on the [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMode|Sound.RollOffMode]] property. When RollOffMode is set to use an inverse type distance model (Inverse or InverseTapered) the MaxDistance will not effect the attenuation of the sound. This means that low values for MaxDistance will cause the sound to abruptly cut off when the listener reaches the MaxDistance. In most cases this is not desirable and developers are advised not to use low MaxDistance values.

When RollOffMode is set to a linear type distance model (Linear or LinearSquared) the sound will attenuate between [[30 Official Roblox Docs/API Reference/Classes/Sound#EmitterSize|Sound.EmitterSize]] and MaxDistance (with playback volume reaching zero at MaxDistance). This is less realistic, but in some cases allows attenuation to be handled in a more intuitive way.

*Code samples for this member (`Sound-MaxDistance`) are published on the source page; their code is not part of the open-source repo.*

### MinDistance

> [!warning] Deprecated
> MinDistance has been superseded by `Class.Sound.EmitterSize`, whose name
> better describes this properties behavior.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** LegacySound · **Tags:** `Deprecated`

The minimum distance at which a 3D [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] (direct child of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]) will begin to attenuate. Effectively, the emitter size.

### Pitch

> [!warning] Deprecated
> This property has been deprecated in favor of `Class.Sound.PlaybackSpeed`
> whose name suits the behavior better.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** LegacySound · **Tags:** `Deprecated`

Sets how high pitched and fast a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is when it is played. The greater the integer, the higher and faster the sound is.

### PlaybackLoudness

**Type:** double

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** false/false · **Capabilities:** LegacySound · **Tags:** `ReadOnly`, `NotReplicated`

A number between `0` and `1000` indicating how loud the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is currently playing back. This property reflects the amplitude of the sound's playback in the instance of time it is read.

*Code samples for this member (`Sound-PlaybackLoudness`) are published on the source page; their code is not part of the open-source repo.*

### PlaybackRegion

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** Regions · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

A range denoting a desired start and stop time within the [[30 Official Roblox Docs/API Reference/Classes/Sound#TimeLength|TimeLength]], in seconds.

- If [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Min]] `>` `0`, the sound begins to play from the [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Min]] time.

- If [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Min]] `<` `0`, the sound begins to play from `0`.

- If [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Max]] `>` [[30 Official Roblox Docs/API Reference/Classes/Sound#TimeLength|Sound.TimeLength]], the sound stops at [[30 Official Roblox Docs/API Reference/Classes/Sound#TimeLength|Sound.TimeLength]].

- If [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Max]] `<` [[30 Official Roblox Docs/API Reference/Classes/Sound#TimeLength|Sound.TimeLength]], the sound stops at **exactly** that time.

- If [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Min]] `==` [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion.Max]], this property is inactive.

### PlaybackRegionsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

If `true`, this property gives your [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] access to the [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackRegion|PlaybackRegion]] and [[30 Official Roblox Docs/API Reference/Classes/Sound#LoopRegion|LoopRegion]] properties which can more-accurately control its playback.

### PlaybackSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** LegacySound · **Tags:** `NotReplicated`

Determines the speed at which a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] will play, with higher values causing the sound to play faster and at a higher pitch.

*Code samples for this member (`Sound-PlaybackSpeed`) are published on the source page; their code is not part of the open-source repo.*

### Playing

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** LegacySound · **Tags:** `NotReplicated`

Indicates whether the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is currently playing. This can be toggled, and this property will always replicate.

In Studio's [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, while in **Edit** mode, toggling [[30 Official Roblox Docs/API Reference/Classes/Sound#Playing|Playing]] to `true` does not begin playing the sound, but the sound will begin playing during runtime.

This property should not be confused with [[30 Official Roblox Docs/API Reference/Classes/Sound#IsPlaying|IsPlaying]] which is a read-only property.

Note that when [[30 Official Roblox Docs/API Reference/Classes/Sound#Playing|Playing]] is set to `false`, the [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition|TimePosition]] property of the sound will not reset, meaning that when [[30 Official Roblox Docs/API Reference/Classes/Sound#Playing|Playing]] is set to `true` again, the audio will continue from the time position it was at when it was stopped. However, if the [[30 Official Roblox Docs/API Reference/Classes/Sound#Play|Play()]] function is used to resume the sound, the time position will reset to `0`.

*Code samples for this member (`Sound-Playing`) are published on the source page; their code is not part of the open-source repo.*

### PlayOnRemove

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

When `true`, the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] will play when it is removed from the experience by parenting the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or one if its ancestors to `nil`. This means all of the following will cause the sound to play when [[30 Official Roblox Docs/API Reference/Classes/Sound#PlayOnRemove|PlayOnRemove]] is `true`:

- `sound:Destroy()`
- `sound.Parent = nil`
- `sound.Parent.Parent = nil`

### RollOffMaxDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Emitter · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

The maximum distance, in studs, a client's listener can be from the sound's origin and still hear it. Only applies to [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]].

How [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMaxDistance|RollOffMaxDistance]] impacts the attenuation of a sound (manner in which it fades out) is dependent on the [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMode|RollOffMode]] property.

### RollOffMinDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Emitter · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

The minimum distance, in studs, at which a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] which is parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] will begin to attenuate (decrease in volume).

How [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance|RollOffMinDistance]] impacts the attenuation of a sound (manner in which it fades out) is dependent on the [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMode|RollOffMode]] property.

### RollOffMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RollOffMode|RollOffMode]]

**Thread safety:** ReadSafe · **Category:** Emitter · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

This property controls how the volume of a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] which is parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] attenuates (fades out) as the distance between the listener and parent changes.

For details on the different modes, see [[30 Official Roblox Docs/API Reference/Enums/RollOffMode|Enum.RollOffMode]].

### SoundGroup

**Type:** [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]]

**Thread safety:** ReadSafe · **Category:** Routing · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

The [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] that is linked to this [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]].

### SoundId

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

This property is the content ID of the sound file to associate with the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]]. See [[30 Official Roblox Docs/Audio/Audio assets|Audio Assets]] for more information.

### TimeLength

**Type:** double

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** false/false · **Capabilities:** LegacySound · **Tags:** `ReadOnly`, `NotReplicated`

The length of the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] in seconds. If the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is not loaded, this value will be `0`.

This property is often used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackSpeed|PlaybackSpeed]] to adjust the speed of a sound so that it lasts for a specific duration.

*Code samples for this member (`Sound-PlaybackSpeed-TimeLength`) are published on the source page; their code is not part of the open-source repo.*

### TimePosition

**Type:** double

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** LegacySound · **Tags:** `NotReplicated`

This property reflects the progress of the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] in seconds. It can be changed to move the playback position of the sound both before and during playback.

As a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is played, [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition|TimePosition]] increases at a rate of [[30 Official Roblox Docs/API Reference/Classes/Sound#PlaybackSpeed|PlaybackSpeed]] per second. Once [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition|TimePosition]] reaches [[30 Official Roblox Docs/API Reference/Classes/Sound#TimeLength|TimeLength]], the sound will stop unless it is [[30 Official Roblox Docs/API Reference/Classes/Sound#Looped|Looped]].

Note that setting [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition|TimePosition]] to a value greater than the length in a looped track will not cause it to wrap around. If that behavior is desired, consider the following code snippet:

*Code samples for this member (`Sound-TimePosition`, `Sound-TimePosition-2`) are published on the source page; their code is not part of the open-source repo.*

### Volume

**Type:** float

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

The volume of the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]]. Can be set between `0` and `10` and defaults to `0.5`.

Note that if the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is a member of a [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]], its playback volume (but not its [[30 Official Roblox Docs/API Reference/Classes/Sound#Volume|Volume]] property) will be influenced by the group's [[30 Official Roblox Docs/API Reference/Classes/SoundGroup#Volume|SoundGroup.Volume]] property.

## Methods

### Pause

```lua
Sound:Pause(): ()
```

**Thread safety:** Unsafe · **Capabilities:** LegacySound

This method pauses playback of the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] if it is playing, setting [[30 Official Roblox Docs/API Reference/Classes/Sound#Playing|Playing]] to `false`. Unlike [[30 Official Roblox Docs/API Reference/Classes/Sound#Stop|Stop()]], it does not reset [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition|TimePosition]], meaning the sound can be resumed using [[30 Official Roblox Docs/API Reference/Classes/Sound#Resume|Resume()]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Sound-Functions`) are published on the source page; their code is not part of the open-source repo.*

### pause

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Sound:Pause()` which
> should be used instead.

```lua
Sound:pause(): ()
```

**Thread safety:** Unsafe · **Capabilities:** LegacySound · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Play

```lua
Sound:Play(): ()
```

**Thread safety:** Unsafe · **Capabilities:** LegacySound

This method plays the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] and sets [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition|TimePosition]] to the last value set by a script (or `0` if it has not been set), then sets [[30 Official Roblox Docs/API Reference/Classes/Sound#Playing|Playing]] to `true`.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Sound-Functions`) are published on the source page; their code is not part of the open-source repo.*

### play

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Sound:Play()` which should
> be used instead.

```lua
Sound:play(): ()
```

**Thread safety:** Unsafe · **Capabilities:** LegacySound · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Resume

```lua
Sound:Resume(): ()
```

**Thread safety:** Unsafe · **Capabilities:** LegacySound

This method resumes the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] and sets [[30 Official Roblox Docs/API Reference/Classes/Sound#Playing|Playing]] to `true`. Does not alter [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition|TimePosition]] and thus can be used to resume playback of a sound paused through [[30 Official Roblox Docs/API Reference/Classes/Sound#Pause|Pause()]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Sound-Functions`) are published on the source page; their code is not part of the open-source repo.*

### Stop

```lua
Sound:Stop(): ()
```

**Thread safety:** Unsafe · **Capabilities:** LegacySound

This method stops the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] and sets [[30 Official Roblox Docs/API Reference/Classes/Sound#Playing|Playing]] to `false`, then sets [[30 Official Roblox Docs/API Reference/Classes/Sound#TimePosition|TimePosition]] to `0`.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Sound-Functions`) are published on the source page; their code is not part of the open-source repo.*

### stop

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Sound:Stop()` which should
> be used instead.

```lua
Sound:stop(): ()
```

**Thread safety:** Unsafe · **Capabilities:** LegacySound · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### DidLoop

```lua
Sound.DidLoop(soundId: string, numOfTimesLooped: int)
```

**Capabilities:** LegacySound

Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] loops. Returns `soundId` and `numOfTimesLooped`, giving the content ID of the sound and the number of times looped respectively.

When the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is stopped through [[30 Official Roblox Docs/API Reference/Classes/Sound#Stop|Stop()]], the looped counter resets meaning the next [[30 Official Roblox Docs/API Reference/Classes/Sound#DidLoop|DidLoop]] event will return `1` for `numOfTimesLooped`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `soundId` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundId\|SoundId]] of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] that looped. |
| `numOfTimesLooped` | int |  | The number of times the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] has looped. |

*Code samples for this member (`Sound-Looping-2`) are published on the source page; their code is not part of the open-source repo.*

### Ended

```lua
Sound.Ended(soundId: string)
```

**Capabilities:** LegacySound

Fires when the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] has completed playback and stopped. This event is often used to destroy a sound when it has completed playback:

```
sound:Play()
sound.Ended:Wait()
sound:Destroy()
```

Note that this event will **not** fire for sounds with [[30 Official Roblox Docs/API Reference/Classes/Sound#Looped|Looped]] set to `true`, as they continue playing upon reaching their end. This event will also **not** fire when the sound is stopped before playback has completed; for this use the [[30 Official Roblox Docs/API Reference/Classes/Sound#Stopped|Stopped]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `soundId` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundId\|SoundId]] of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] that has ended. |

### Loaded

```lua
Sound.Loaded(soundId: string)
```

**Capabilities:** LegacySound

Fires when the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is loaded.

As this event only fires at the time the sound is loaded, it's recommended to check the sound's [[30 Official Roblox Docs/API Reference/Classes/Sound#IsLoaded|IsLoaded]] property prior to connecting to this event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `soundId` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundId\|SoundId]] of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] that loaded. |

*Code samples for this member (`Sound-Loaded`) are published on the source page; their code is not part of the open-source repo.*

### Paused

```lua
Sound.Paused(soundId: string)
```

**Capabilities:** LegacySound

Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is paused using [[30 Official Roblox Docs/API Reference/Classes/Sound#Pause|Pause()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `soundId` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundId\|SoundId]] of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] that was paused. |

*Code samples for this member (`Sound-Functions`) are published on the source page; their code is not part of the open-source repo.*

### Played

```lua
Sound.Played(soundId: string)
```

**Capabilities:** LegacySound

Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is played using [[30 Official Roblox Docs/API Reference/Classes/Sound#Play|Play()]]. This event will **not** fire if the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is played due to [[30 Official Roblox Docs/API Reference/Classes/Sound#PlayOnRemove|PlayOnRemove]] being set to `true` and the sound being destroyed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `soundId` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundId\|SoundId]] of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] that was played. |

*Code samples for this member (`Sound-Functions`) are published on the source page; their code is not part of the open-source repo.*

### Resumed

```lua
Sound.Resumed(soundId: string)
```

**Capabilities:** LegacySound

Fires when the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is resumed using [[30 Official Roblox Docs/API Reference/Classes/Sound#Resume|Resume()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `soundId` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundId\|SoundId]] of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] being resumed. |

*Code samples for this member (`Sound-Functions`) are published on the source page; their code is not part of the open-source repo.*

### Stopped

```lua
Sound.Stopped(soundId: string)
```

**Capabilities:** LegacySound

Fires when the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] is stopped through using [[30 Official Roblox Docs/API Reference/Classes/Sound#Stop|Stop()]]. Destroying a sound while it is playing will not cause this event to fire.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `soundId` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundId\|SoundId]] of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] that stopped. |

*Code samples for this member (`Sound-Functions`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Sound](https://create.roblox.com/docs/reference/engine/classes/Sound) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
