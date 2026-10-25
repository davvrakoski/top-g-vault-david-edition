---
title: "VideoPlayer"
description: "Used to play video assets."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VideoPlayer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Used to play video assets.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotBrowsable`

## Description

An instance for playing video assets. It can be connected to a [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] to show the video and can be connected to audio instances via a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] to play the audio track.

*Code samples for this API (`video-player-server`, `video-player-client`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/VideoPlayer); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#AutoLoadInStudio\|AutoLoadInStudio]] | boolean | Loads the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] while in Studio Edit mode. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#AutoPlayInStudio\|AutoPlayInStudio]] | boolean | Plays the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] while in Studio Edit mode. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#IsLoaded\|IsLoaded]] | boolean | Indicates when the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] has loaded and is ready to play. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#IsPlaying\|IsPlaying]] | boolean | Denotes whether this [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer\|VideoPlayer]] is currently playing. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Looping\|Looping]] | boolean | Controls whether this [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer\|VideoPlayer]] loops. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#MaximumResolution\|MaximumResolution]] | [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize\|VideoSampleSize]] | Caps the resolution of decoded video frames for this [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer\|VideoPlayer]]. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#PlaybackSpeed\|PlaybackSpeed]] | float | Controls the speed at which the video is played. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Resolution\|Resolution]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Gets the original source resolution of the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] file. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#TimeLength\|TimeLength]] | double | Indicates the length of the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#TimePosition\|TimePosition]] | double | Indicates the progress in seconds of the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]]. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The asset to be loaded into the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer\|VideoPlayer]]. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Volume\|Volume]] | float | Controls how loudly the audio track will be played. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#LoadAsync\|LoadAsync()]] | [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|AssetFetchStatus]] | Loads the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] before it is played. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Pause\|Pause()]] | () | Pauses the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer\|VideoPlayer]] wherever its [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#TimePosition\|TimePosition]] is. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Play\|Play()]] | () | Plays the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer\|VideoPlayer]] from wherever its [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#TimePosition\|TimePosition]] is. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Unload\|Unload()]] | () | Unloads the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoPlayer.VideoContent]] to save resources. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#DidEnd\|DidEnd]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] has completed playback and stopped. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#DidLoop\|DidLoop]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] loops. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#PlayFailed\|PlayFailed]] | `error` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer\|VideoPlayer]] fails to load or play its [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]]. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer\|VideoPlayer]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoLoadInStudio

**Type:** boolean

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** false/false · **Capabilities:** Audio, UI · **Tags:** `NotReplicated`, `NotScriptable`

By default, [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] does not load while in Studio Edit mode and shows no output when wired to [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]] to reduce studio memory usage. Toggle this option to load [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] while in Studio Edit mode.

### AutoPlayInStudio

**Type:** boolean

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** false/false · **Capabilities:** Audio, UI · **Tags:** `NotReplicated`, `NotScriptable`

Plays the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] while in Studio Edit mode. [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#AutoLoadInStudio|AutoLoadInStudio]] must be on for this option to show.

### IsLoaded

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** false/false · **Capabilities:** Audio, UI · **Tags:** `ReadOnly`, `NotReplicated`

This property is true when the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] has loaded and is ready to play.

### IsPlaying

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** false/false · **Capabilities:** Audio, UI · **Tags:** `ReadOnly`, `NotReplicated`

Denotes whether this [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] is currently playing. This property is read-only, but replicates. To play and pause a [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] at runtime, use the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Play|Play()]] and [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Pause|Pause()]] methods.

### Looping

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

Controls whether this [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] loops after reaching the end of its [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#TimeLength|TimeLength]].

### MaximumResolution

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize|VideoSampleSize]]

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI, InternalTest · **Tags:** `Hidden`

The maximum resolution, as an [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize|Enum.VideoSampleSize]] value, that the video decoder produces when playing this [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]]. Defaults to [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize|Enum.VideoSampleSize.Full]], which doesn't limit the decoded resolution. Lower [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize|Enum.VideoSampleSize]] values reduce the resolution the decoder outputs, which can lower memory usage on constrained devices.

### PlaybackSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

Multiplier that controls how quickly the video plays, directly controlling the perceived pitch of the audio track. Ranges from 0 to 1.

### Resolution

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** false/false · **Capabilities:** Audio, UI · **Tags:** `ReadOnly`, `NotReplicated`

This property gets the original source resolution of the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] file.

### TimeLength

**Type:** double

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** false/false · **Capabilities:** Audio, UI · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates the length of the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] in seconds. If the video is not loaded, this value is 0.

### TimePosition

**Type:** double

**Thread safety:** ReadSafe · **Category:** Playback · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

This property indicates the progress in seconds of the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]]. It can be changed to move the playback position of the video both before and during playback.

### VideoContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Asset · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

The content ID of the video file a [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] object is associated with. To save resources and improve performance, call the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Unload|Unload()]] method to unload the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] when the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] is not visible or in use.

### Volume

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

Volume level, which is multiplied onto the output audio stream, controlling how loudly the audio track plays. Ranges from 0 to 3.

## Methods

### GetConnectedWires

```lua
VideoPlayer:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio, UI

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] has one "Output" pin.

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
VideoPlayer:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio, UI

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
VideoPlayer:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio, UI

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### LoadAsync

```lua
VideoPlayer:LoadAsync(): AssetFetchStatus
```

**Thread safety:** Unsafe · **Capabilities:** Audio, UI · **Tags:** `Yields`

[[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] is typically only loaded when [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Play|Play()]] is called, causing some buffering delay. This function can preload [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] so that it can be immediately played when [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Play|Play()]] is called. Loading videos can consume a significant amount of device memory.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|AssetFetchStatus]] | An [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus]] describing the outcome of the load — [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus.Success]] once the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] has loaded, or a failure status such as [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus.Failure]] or [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus.TimedOut]] if it could not be fetched. |

### Pause

```lua
VideoPlayer:Pause(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio, UI

Pauses the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] wherever its [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#TimePosition|TimePosition]] is. Replicates from server to client.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Play

```lua
VideoPlayer:Play(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio, UI

Plays the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] from wherever its [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#TimePosition|TimePosition]] is. Replicates from server to client. To save resources and improve performance, call the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Unload|Unload()]] method to unload the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] when the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] is not visible or in use.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Unload

```lua
VideoPlayer:Unload(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio, UI

Unloads the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]] to save resources. After calling this method, the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#IsLoaded|IsLoaded]] property is false, and the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#TimePosition|TimePosition]] resets to 0. To play the video again, the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#LoadAsync|LoadAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#Play|Play()]] method must be called to reload the video.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### DidEnd

```lua
VideoPlayer.DidEnd()
```

**Capabilities:** Audio, UI

Fires after the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] has completed playback and stopped. Note this event does **not** fire for videos with [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|Looped]] set to `true` since it continues playing upon reaching its end. This event also does **not** fire when the video is stopped before playback has completed; for this, use [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|VideoPlayer:GetPropertyChangedSignal()]] on the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#IsPlaying|IsPlaying]] property.

### DidLoop

```lua
VideoPlayer.DidLoop()
```

**Capabilities:** Audio, UI

Event that fires after the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] loops. This happens when the video reaches the end of its content. This event does **not** fire if the video is looped manually by changing its [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#TimePosition|TimePosition]].

### PlayFailed

```lua
VideoPlayer.PlayFailed(error: AssetFetchStatus)
```

**Capabilities:** Audio, UI

Fires when the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] fails to load or play its [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent|VideoContent]]. The `error` parameter is an [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus|Enum.AssetFetchStatus]] value that describes why the content couldn't be fetched.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `error` | [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|AssetFetchStatus]] |  | An [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus\|Enum.AssetFetchStatus]] value describing why the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer#VideoContent\|VideoContent]] failed to load. |

### WiringChanged

```lua
VideoPlayer.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio, UI

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance was connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer\|VideoPlayer]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer\|VideoPlayer]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [VideoPlayer](https://create.roblox.com/docs/reference/engine/classes/VideoPlayer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
