---
title: "AudioPlayer"
description: "Used to play audio assets."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioPlayer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Used to play audio assets.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] is used to play audio assets. It provides a single **Output** pin which can be connected to other pins via [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]].

*Code samples for this API (`audio-wiring---device-output`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioPlayer); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Asset\|Asset]] | ContentId | The asset to be loaded into the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#AssetId\|AssetId]] | string | **Deprecated.** The asset to be loaded into the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#AudioContent\|AudioContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The audio content to be loaded into the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#AutoLoad\|AutoLoad]] | boolean | Controls whether [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Asset\|Asset]] loads automatically once assigned. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#AutoPlay\|AutoPlay]] | boolean | Denotes whether this [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] starts playing as soon as it spawns in for the first time. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#IsPlaying\|IsPlaying]] | boolean | Denotes whether this [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] is currently playing or planning to play. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#IsReady\|IsReady]] | boolean | Denotes whether this [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] is loaded, buffered, and ready to play. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Looping\|Looping]] | boolean | Controls whether this [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] loops. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion\|LoopRegion]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | A range, in seconds, denoting a desired loop start and loop end within the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion\|PlaybackRegion]] of this [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion\|PlaybackRegion]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | Range in seconds denoting a desired start time (minimum) and stop time (maximum) within the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimeLength\|TimeLength]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackSpeed\|PlaybackSpeed]] | double | Controls how quickly the asset will be played, which controls its pitch. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimeLength\|TimeLength]] | double | Denotes the length of the loaded asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimePosition\|TimePosition]] | double | Tracks the current position of the playhead within the asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Volume\|Volume]] | float | Controls how loudly the asset will be played. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Cancel\|Cancel()]] | boolean | Attempts to cancel a pre-planned future `Play` or `Stop` command. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#GetWaveformAsync\|GetWaveformAsync()]] | Array | Returns a sampling of the waveform data for the loaded [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Asset\|Asset]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Play\|Play()]] | int64? | Plays the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] from wherever its [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimePosition\|TimePosition]] is. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Stop\|Stop()]] | int64? | Stops the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] wherever its [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimePosition\|TimePosition]] is. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Ended\|Ended]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] has completed playback and stopped. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Looped\|Looped]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] loops. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Asset

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** Audio

The asset to be loaded into the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]]. If [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#AutoLoad|AutoLoad]] is `true`, the asset loads immediately once this property is assigned. When loading is complete, [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#IsReady|IsReady]] becomes `true`.

### AssetId

> [!warning] Deprecated
> This property is deprecated; use `Class.AudioPlayer.Asset|Asset` instead.

**Type:** string

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/false · **Capabilities:** Audio · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

The asset to be loaded into the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]]. If [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#AutoLoad|AutoLoad]] is `true`, the asset loads immediately once this property is assigned. When loading is complete, [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#IsReady|IsReady]] becomes `true`.

### AudioContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** Audio

The audio content to be loaded into the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]]. If [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#AutoLoad|AutoLoad]] is `true`, the asset loads immediately once this property is assigned. When loading is complete, [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#IsReady|IsReady]] becomes `true`.

### AutoLoad

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** Audio

Controls whether [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Asset|Asset]] loads automatically once assigned. If `false`, the asset will load upon the first attempt to play.

### AutoPlay

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio

Denotes whether this [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] starts playing as soon as it enters the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] for the first time. This only applies to [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayers]] that are created or deserialized locally, and does not apply to [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayers]] generated via replication. This property is primarily used at edit time in Studio to have an [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] begin when entering a play session.

### IsPlaying

**Type:** boolean

**Security:** read None / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** false/false · **Capabilities:** Audio

Denotes whether this [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] is currently playing or planning to play. This property is read-only, but replicates. To play and stop an [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] at runtime, use the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Play|Play()]] and [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Stop|Stop()]] methods.

### IsReady

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** false/true · **Capabilities:** Audio · **Tags:** `ReadOnly`, `NotReplicated`

Denotes whether this [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] is loaded, buffered, and ready to play. Although uncommon, [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayers]] may have their assets unloaded at runtime if there is extreme memory pressure, in which case [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#IsReady|IsReady]] will become false.

### Looping

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio

Controls whether this [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] loops when exceeding the end of its [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimeLength|TimeLength]], [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion|LoopRegion]], or [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]].

### LoopRegion

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** Regions · **Loaded/Saved:** true/true · **Capabilities:** Audio

A range, in seconds, denoting a desired loop start and loop end within the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] of this [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]].

If the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion|LoopRegion]] minimum is **greater** than the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] minimum, the loop starts from the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion|LoopRegion]] minimum.

If the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion|LoopRegion]] minimum is **less** than the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] minimum, the loop starts from the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] minimum.

If the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion|LoopRegion]] maximum is **greater** than the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] maximum, the loop ends at the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] maximum.

If the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion|LoopRegion]] maximum is **less** than the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] maximum, the loop ends at exactly the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion|LoopRegion]] maximum.

If the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion|LoopRegion]] minimum **equals** the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion|LoopRegion]] maximum, the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] uses the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] property instead.

### PlaybackRegion

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** Regions · **Loaded/Saved:** true/true · **Capabilities:** Audio

Range in seconds denoting a desired start time (minimum) and stop time (maximum) within the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimeLength|TimeLength]].

If the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] minimum is **greater** than 0, the sound begins playing from the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] minimum time.

If the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] minimum is **less** than 0, the sound begins playing from 0.

If the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] maximum is **greater** than the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimeLength|TimeLength]], the sound stops at [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimeLength|TimeLength]].

If the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] maximum is **less** than the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimeLength|TimeLength]], the sound stops at exactly the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] maximum.

If the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] minimum **equals** the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#PlaybackRegion|PlaybackRegion]] maximum, the sound plays in its entirety.

### PlaybackSpeed

**Type:** double

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio

Multiplier controlling how quickly the asset will be played, directly controlling its perceived pitch. Ranges from 0 to 20.

### TimeLength

**Type:** double

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** false/true · **Capabilities:** Audio · **Tags:** `ReadOnly`, `NotReplicated`

Denotes the length of the loaded [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Asset|Asset]] in seconds.

### TimePosition

**Type:** double

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio

Tracks and controls the current position of the playhead within the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Asset|Asset]], in seconds.

### Volume

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Volume level which is multiplied onto the output audio stream, controlling how loudly the asset will be played. Ranges from 0 to 10.

## Methods

### Cancel

```lua
AudioPlayer:Cancel(actionId: int64?): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Attempts to cancel a [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Play|Play()]] or [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Stop|Stop()]] command that was scheduled to occur at a future time. When [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Play|Play()]] or [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Stop|Stop()]] is called with an `atTime` argument, the action is scheduled against [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetMixerTime|GetMixerTime()]] and the call returns a unique `actionId`. Passing that `actionId` to this method prevents the scheduled action from taking effect.

Returns `true` if the pending action was found and successfully cancelled. Returns `false` if the action has already occurred, was never scheduled, or the supplied `actionId` does not correspond to a pending action.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionId` | int64? |  | The unique-ID of a pre-planned `Play` or `Stop` command. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the cancellation was successful. Returns false if the action has already occurred, or otherwise does not exist. |

### GetConnectedWires

```lua
AudioPlayer:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] has one "Output" pin.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pin` | string |  | An input or output pin on this instance |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] |

### GetInputPins

```lua
AudioPlayer:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioPlayer:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetWaveformAsync

```lua
AudioPlayer:GetWaveformAsync(timeRange: NumberRange, samples: int): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `Yields`

Returns a sampling of the waveform data for the loaded [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Asset|Asset]], allowing you to check the volume of an asset over its full duration without playing it. Unlike [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer|AudioAnalyzer]], which measures volume levels of a live audio stream in real time, this method analyzes the asset ahead of time, making it suitable for waverform visualization or logic that needs audio content before playback begins.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `timeRange` | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] |  | The start and end time (in seconds) of the segment to read. |
| `samples` | int |  | The number of samples to return for the specified range. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A table of `samples` numbers ranging between -1 and 1 representing the sampled waveform, or an empty table if a waveform could not be read. |

### Play

```lua
AudioPlayer:Play(atTime: double?): int64?
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Plays the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] from wherever its [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimePosition|TimePosition]] is. Replicates from server to client. When `atTime` is provided, the action is scheduled against [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetMixerTime|GetMixerTime()]] for sample-accurate, framerate-independent timing — useful for rhythm games or any scenario where audio changes must align precisely with a beat.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `atTime` | double? |  | A specific time, based on [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetMixerTime\|GetMixerTime]], that this `AudioPlayer` should begin playing at. |

**Returns**

| Type | Description |
| --- | --- |
| int64? | If `atTime` was provided, a unique ID, which can be passed to [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Cancel\|Cancel()]]. |

### Stop

```lua
AudioPlayer:Stop(atTime: double?): int64?
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Stops the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] wherever its [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimePosition|TimePosition]] is. Replicates from server to client. When `atTime` is provided, the action is scheduled against [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetMixerTime|GetMixerTime()]] for sample-accurate, framerate-independent timing, enabling precise beat-synchronized stops or track transitions.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `atTime` | double? |  | A specific time, based on [[30 Official Roblox Docs/API Reference/Classes/SoundService#GetMixerTime\|GetMixerTime]], that this `AudioPlayer` should stop playing at. |

**Returns**

| Type | Description |
| --- | --- |
| int64? | If `atTime` was provided, a unique ID, which can be passed to [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Cancel\|Cancel()]]. |

## Events

### Ended

```lua
AudioPlayer.Ended()
```

**Capabilities:** Audio

Fires after the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] has completed playback and stopped. Note this event will **not** fire for audio with [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Looping|Looping]] set to `true` since it continues playing upon reaching its end. This event will also **not** fire when the audio is stopped before playback has completed; for this, use [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|AudioPlayer:GetPropertyChangedSignal()]] on the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#IsPlaying|IsPlaying]] property.

This event is often used to destroy an [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] when it has completed playback.

### Looped

```lua
AudioPlayer.Looped()
```

**Capabilities:** Audio

Event that fires after the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] loops. This happens when the audio reaches the end of its content (or the end of the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#LoopRegion|LoopRegion]] if it is active) and [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Looping|Looping]] is `true`.

This event does **not** fire if the audio is looped manually by changing its [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#TimePosition|TimePosition]].

### WiringChanged

```lua
AudioPlayer.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioPlayer](https://create.roblox.com/docs/reference/engine/classes/AudioPlayer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
