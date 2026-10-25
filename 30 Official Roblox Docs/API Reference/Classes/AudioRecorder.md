---
title: "AudioRecorder"
description: "Records audio streams in-experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioRecorder"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Records audio streams in-experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal
- **Tags:** `NotBrowsable`

## Description

**This API is in development and is not available yet.**

`AudioRecorder` records audio streams in-experience with a fixed time limit of 60 seconds. The results can be loaded into an [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] for playback.

At this time, [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] cannot be recorded. The [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#GetUnrecordableInstancesAsync|GetUnrecordableInstancesAsync()]] method can be used to check specifically which instances aren't recordable.

*Code samples for this API (`audio-recorder`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioRecorder); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#IsRecording\|IsRecording]] | boolean | Whether the `AudioRecorder` is currently recording. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#TimeLength\|TimeLength]] | double | The current length of the recording in seconds. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#CanRecordAsync\|CanRecordAsync()]] | boolean | Returns whether the `AudioRecorder` can currently record. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#Clear\|Clear()]] | () | Clears out the recording from the `AudioRecorder`. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#GetTemporaryContent\|GetTemporaryContent()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Returns a `Content` object representing the current audio recording. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#GetUnrecordableInstancesAsync\|GetUnrecordableInstancesAsync()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]> | Returns any instances which cannot be recorded. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#RecordAsync\|RecordAsync()]] | () | Starts recording audio. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#Stop\|Stop()]] | () | Stops recording audio. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder\|AudioRecorder]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### IsRecording

**Type:** boolean

**Security:** read None / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Returns whether the `AudioRecorder` is currently recording.

### TimeLength

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Audio · **Tags:** `ReadOnly`, `NotReplicated`

Returns the current length of the recording in seconds.

## Methods

### CanRecordAsync

```lua
AudioRecorder:CanRecordAsync(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `Yields`

Returns whether the `AudioRecorder` can currently record. For instance, this will return `false` if the current recording data has reached the recording time limit. To clear the recording, use [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#Clear|Clear()]].

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if recording is possible, `false` otherwise. |

### Clear

```lua
AudioRecorder:Clear(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Clears out the recording from the `AudioRecorder`.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetConnectedWires

```lua
AudioRecorder:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder|AudioRecorder]] has one "Input" pin.

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
AudioRecorder:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder|AudioRecorder]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioRecorder:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder|AudioRecorder]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetTemporaryContent

```lua
AudioRecorder:GetTemporaryContent(): Content
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns recorded content that can be played back with [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]]. The content retrieved from this method is only valid in the current session.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | A temporary `Content` ID that can be used with [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]]. |

### GetUnrecordableInstancesAsync

```lua
AudioRecorder:GetUnrecordableInstancesAsync(): List<Instance>
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `Yields`

Traverses the audio graph, starting from this recorder's inputs, to find unrecordable instances. Currently, [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] is not recordable.

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]> | A table of [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] that are not recordable. |

### RecordAsync

```lua
AudioRecorder:RecordAsync(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `Yields`

Starts recording audio. If [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder#CanRecordAsync|CanRecordAsync()]] returns `true`, recording begins. If recording cannot begin, this method produces an error.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Stop

```lua
AudioRecorder:Stop(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Stops recording audio.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### WiringChanged

```lua
AudioRecorder.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder|AudioRecorder]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder\|AudioRecorder]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder\|AudioRecorder]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioRecorder](https://create.roblox.com/docs/reference/engine/classes/AudioRecorder) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
