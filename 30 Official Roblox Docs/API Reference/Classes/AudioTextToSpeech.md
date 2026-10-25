---
title: "AudioTextToSpeech"
description: "Plays text as speech audio."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioTextToSpeech"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Plays text as speech audio.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] is used to play text as speech audio. It provides a single **Output** pin which can be connected to other pins via [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]].

Roblox uses the following formula to throttle requests for this API based on the number of players in your experience: `max requests per minute per experience = 1 + (6 * number_of_concurrent_users)`. You can purchase additional usage using [[30 Official Roblox Docs/Cloud Services/Extended Services|Extended Services]].

There is also a client-side throttle of 4 requests per second per user.

For a more in-depth look, see [[30 Official Roblox Docs/Audio/Audio objects#Text-to-speech|Text-to-speech]].

*Code samples for this API (`audio-wiring---text-to-speech`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioTextToSpeech); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#AutoLocalize\|AutoLocalize]] | boolean | Controls whether [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Text\|AudioTextToSpeech.Text]] is automatically translated into the player's language and routed to an appropriate voice. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#IsLoaded\|IsLoaded]] | boolean | Denotes whether the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] object is loaded, buffered, and ready to play. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#IsPlaying\|IsPlaying]] | boolean | Denotes whether the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] object is currently playing. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Looping\|Looping]] | boolean | Controls whether the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] object loops. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Pitch\|Pitch]] | float | Controls the pitch of the generated speech audio, which will be independent of its speed. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#PlaybackSpeed\|PlaybackSpeed]] | float | Controls how quickly the speech audio will be played, which controls its pitch. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Speed\|Speed]] | float | Controls the speed of the generated speech audio, which will be independent of its pitch. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Text\|Text]] | string | The text to be converted into speech audio by [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#TimeLength\|TimeLength]] | double | Denotes the length of the generated speech audio. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#TimePosition\|TimePosition]] | double | Tracks the current position of the playhead within the generated speech audio. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#VoiceId\|VoiceId]] | string | The voice style to be used by [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Volume\|Volume]] | float | Controls how loudly the generated speech audio will be played. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#GetWaveformAsync\|GetWaveformAsync()]] | Array | Returns a sampling of the waveform data for the generated audio. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#LoadAsync\|LoadAsync()]] | [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|AssetFetchStatus]] | Generates speech audio. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Pause\|Pause()]] | () | Pauses the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] object wherever its [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#TimePosition\|TimePosition]] is. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Play\|Play()]] | () | Plays the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] from wherever its [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#TimePosition\|TimePosition]] is. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Unload\|Unload()]] | () | Unload the generated speech audio. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Ended\|Ended]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] object has completed playback and paused. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Looped\|Looped]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] object loops. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoLocalize

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** Audio

When set to `true`, [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Text|AudioTextToSpeech.Text]] is automatically translated into the player's language and routed to the most appropriate [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#VoiceId|AudioTextToSpeech.VoiceId]]. For example, if a female voice ID is used in English, Roblox routes to a female voice for other languages.

Text-to-speech currently supports automatic translation between the following languages:

- Arabic
- Chinese (Mandarin)
- English
- French
- German
- Hindi
- Italian
- Japanese
- Korean
- Portuguese
- Spanish

Defaults to `true`.

### IsLoaded

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** false/true · **Capabilities:** Audio · **Tags:** `ReadOnly`, `NotReplicated`

Denotes whether the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object is loaded, buffered, and ready to play. Although uncommon, [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] objects may have their assets unloaded at runtime if there is extreme memory pressure, in which case [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#IsLoaded|IsLoaded]] will become false.

### IsPlaying

**Type:** boolean

**Security:** read None / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** false/false · **Capabilities:** Audio

Denotes whether the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object is currently playing. This property is read-only, but replicates. To play and stop an [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object at runtime, use the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Play|Play()]] and [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Pause|Pause()]] methods.

### Looping

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio

Controls whether the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object loops when exceeding the end of its [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#TimeLength|TimeLength]].

### Pitch

**Type:** float

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** Audio

A value in musical semitones. The pitch of the generated speech audio is shifted from its default value by `AudioTextToSpeech.Pitch` semitones. Ranges from -12.0 to 12.0.

### PlaybackSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio

Multiplier controlling how quickly the speech audio will be played, directly controlling its perceived pitch. Ranges from 0 to 20.

### Speed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** Audio

Multiplier controlling the speed of the generated speech audio. Ranges from 0.5 to 2.0.

### Text

**Type:** string

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** Audio

The text to be converted into speech audio by [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]]. The text has a maximum length of 300 characters.

### TimeLength

**Type:** double

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** false/true · **Capabilities:** Audio · **Tags:** `ReadOnly`, `NotReplicated`

Denotes the generated speech audio in seconds.

### TimePosition

**Type:** double

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio

Tracks and controls the current position of the playhead within the generated speech audio, in seconds.

### VoiceId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** Audio

The voice style to be used by [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]]. A list of available voices and their corresponding VoiceIds can be found in the [[30 Official Roblox Docs/Audio/Audio objects#List of artificial voices|list of artificial voices]].

Roblox automatically translates [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Text|AudioTextToSpeech.Text]] into the player's language and routes it to an appropriate voice when [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#AutoLocalize|AudioTextToSpeech.AutoLocalize]] is `true`.

### Volume

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Volume level which is multiplied onto the output audio stream, controlling how loudly the generated speech audio will be played. Ranges from 0 to 3.

## Methods

### GetConnectedWires

```lua
AudioTextToSpeech:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] has one "Output" pin.

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
AudioTextToSpeech:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioTextToSpeech:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetWaveformAsync

```lua
AudioTextToSpeech:GetWaveformAsync(timeRange: NumberRange, samples: int): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `Yields`

Returns a sampling of the waveform data for the generated text-to-speech audio. This can be used to check the volume of the audio over the course of its duration without playing it.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `timeRange` | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] |  | The start and end time (in seconds) of the segment to read. |
| `samples` | int |  | The number of samples to return for the specified range. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A table of `samples` numbers ranging between -1 and 1 representing the sampled waveform, |

### LoadAsync

```lua
AudioTextToSpeech:LoadAsync(): AssetFetchStatus
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `Yields`

A blocking call that begins the generation of speech audio based on the current parameters. It will yield until the speech generation either completes or fails. Status is returned by an AssetFetchStatus value.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|AssetFetchStatus]] | An [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus]] — [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Success]] once the speech audio has been generated, or [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Failure]] if generation could not be completed. |

### Pause

```lua
AudioTextToSpeech:Pause(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Pauses the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object wherever its [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#TimePosition|TimePosition]] is. Replicates from server to client.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Play

```lua
AudioTextToSpeech:Play(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Plays the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] from wherever its [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#TimePosition|TimePosition]] is. Replicates from server to client.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Unload

```lua
AudioTextToSpeech:Unload(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Frees resources by unloading the generated speech audio.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### Ended

```lua
AudioTextToSpeech.Ended()
```

**Capabilities:** Audio

Fires after the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object has completed playback and paused. Note this event will **not** fire for audio with [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Looped|Looped]] set to `true` since it continues playing upon reaching its end. This event will also **not** fire when the audio is paused before playback has completed; for this, use [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|AudioTextToSpeech:GetPropertyChangedSignal()]] on the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#IsPlaying|IsPlaying]] property.

This event may be used to destroy an [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object when it has completed playback.

### Looped

```lua
AudioTextToSpeech.Looped()
```

**Capabilities:** Audio

Event that fires after the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] object loops. This happens when the audio reaches the end of its content and [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#Looping|Looping]] is `true`.

This event does **not** fire if the audio is looped manually by changing its [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech#TimePosition|TimePosition]].

### WiringChanged

```lua
AudioTextToSpeech.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech\|AudioTextToSpeech]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioTextToSpeech](https://create.roblox.com/docs/reference/engine/classes/AudioTextToSpeech) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
