---
title: "VideoFrame"
description: "A GUI object that renders a rectangle, like a `Frame` does, with a moving video image."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VideoFrame"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A GUI object that renders a rectangle, like a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] does, with a moving video image.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

A VideoFrame renders a rectangle, like a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] does, with a moving video image. The video must be from a file uploaded to the Roblox website.

The video is scaled to fit the entirety of the rectangle, but looks best when displayed at its native resolution.

## 2D and 3D Sound

A VideoFrame placed underneath [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] on a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] will emit its sound from that part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]].

A VideoFrame exhibits the Doppler effect, meaning its frequency and pitch varies with the relative motion of whatever part it is attached to.

The volume of the VideoFrame will be determined by the distance between the client's sound listener (by default the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] position) and the position of the VideoFrame's part.

A VideoFrame is considered **"global"** if it is not placed underneath SurfaceGui on a BasePart. In this case, the sound will play at the same volume throughout the entire place.

*Code samples for this API (`creating-and-playing-a-video`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/VideoFrame); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#IsLoaded\|IsLoaded]] | boolean | Indicates when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] has loaded from Roblox servers and is ready to play. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Looped\|Looped]] | boolean | Sets whether or not the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] repeats once it has finished when it is playing. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#MaximumResolution\|MaximumResolution]] | [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize\|VideoSampleSize]] | Internal-only. Caps the resolution the video is allowed to stream at, expressed as an [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize\|Enum.VideoSampleSize]]. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Playing\|Playing]] | boolean | Indicates whether the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] is currently playing. It can be set to start or pause playback. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Resolution\|Resolution]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Gets the original source resolution of the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] file. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#RollOffMaxDistance\|RollOffMaxDistance]] | float | The maximum distance, in studs, a listener can be from the video's part and still hear its audio. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#RollOffMinDistance\|RollOffMinDistance]] | float | The minimum distance, in studs, at which the video's audio starts to attenuate. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#RollOffMode\|RollOffMode]] | [[30 Official Roblox Docs/API Reference/Enums/RollOffMode\|RollOffMode]] | Controls how the video's audio volume attenuates with distance. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#TimeLength\|TimeLength]] | double | Indicates the length of the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#TimePosition\|TimePosition]] | double | Indicates the progress in seconds of the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]]. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|Video]] | ContentId | The content ID of the video file a [[30 Official Roblox Docs/API Reference/Classes/VideoFrame\|VideoFrame]] object is associated with. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#VideoContent\|VideoContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The video content a [[30 Official Roblox Docs/API Reference/Classes/VideoFrame\|VideoFrame]] is associated with, as either an asset content ID (same value as [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|Video]]) or a direct reference to a [[30 Official Roblox Docs/API Reference/Classes/VideoCapture\|VideoCapture]] object for local screen recordings. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Volume\|Volume]] | float | Indicates how loud the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] is currently playing back. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Pause\|Pause()]] | () | Sets [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Playing\|VideoFrame.Playing]] to `false`, pausing playback if the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] is playing. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Play\|Play()]] | () | Sets [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Playing\|VideoFrame.Playing]] to `true`, playing the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] from the current [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#TimePosition\|VideoFrame.TimePosition]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#DidLoop\|DidLoop]] | `video` | Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] loops. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Ended\|Ended]] | `video` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] has completed playback and stopped. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Loaded\|Loaded]] | `video` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] is loaded. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Paused\|Paused]] | `video` | This event fires whenever the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] is paused using [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Pause\|VideoFrame:Pause()]] or by setting [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Playing\|VideoFrame.Playing]] to false. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Played\|Played]] | `video` | Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|VideoFrame.Video]] is played using the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Play\|VideoFrame:Play()]] function or by setting [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Playing\|VideoFrame.Playing]] to true. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### IsLoaded

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** false/false · **Capabilities:** Audio, UI · **Tags:** `ReadOnly`, `NotReplicated`

This property will be true when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] has loaded from Roblox servers and is ready to play.

### Looped

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

This property sets whether or not the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] repeats once it has finished when it is playing.

### MaximumResolution

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize|VideoSampleSize]]

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI, InternalTest · **Tags:** `Hidden`

Internal-only. Caps the resolution the video is allowed to stream at, as an [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize|Enum.VideoSampleSize]] rather than exact pixel dimensions.

The video may still stream below the cap on a slow connection. Defaults to [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize|Enum.VideoSampleSize.Full]].

### Playing

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI · **Tags:** `NotReplicated`

This property indicates whether the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] is currently playing. It can be set to start or pause playback as an alternative to the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Play|VideoFrame:Play()]] and [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Pause|VideoFrame:Pause()]] functions.

### Resolution

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** false/false · **Capabilities:** Audio, UI · **Tags:** `ReadOnly`, `NotReplicated`

This property gets the original source resolution of the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] file.

### RollOffMaxDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

The maximum distance, in studs, a client's listener can be from the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]]'s part and still hear its audio. Defaults to `10000`.

This property only affects playback when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] is 3D, as described in the class's "2D and 3D Sound" section; it has no effect on a global [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]]. How `RollOffMaxDistance` affects the attenuation of the sound depends on the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#RollOffMode|RollOffMode]] property.

### RollOffMinDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

The minimum distance, in studs, at which the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]]'s audio begins to attenuate (decrease in volume). Defaults to `1`.

This property only affects playback when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] is 3D, as described in the class's "2D and 3D Sound" section; it has no effect on a global [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]]. How `RollOffMinDistance` affects the attenuation of the sound depends on the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#RollOffMode|RollOffMode]] property.

### RollOffMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RollOffMode|RollOffMode]]

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

Controls how the volume of the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]]'s audio attenuates (fades out) as the distance between the listener and the video's part changes. Defaults to [[30 Official Roblox Docs/API Reference/Enums/RollOffMode|Enum.RollOffMode.Inverse]].

This property only affects playback when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] is 3D, as described in the class's "2D and 3D Sound" section; it has no effect on a global [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]]. For details on the different modes, see [[30 Official Roblox Docs/API Reference/Enums/RollOffMode|Enum.RollOffMode]].

### TimeLength

**Type:** double

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** false/false · **Capabilities:** Audio, UI · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates the length of the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] in seconds. If the video is not loaded, this value will be 0.

### TimePosition

**Type:** double

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI · **Tags:** `NotReplicated`

This property indicates the progress in seconds of the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]]. It can be changed to move the playback position of the video both before and during playback.

### Video

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

The content ID of the video file a [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] object is associated with. To save resources and improve performance, set this property to `""` when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] is not visible or in use.

*Code samples for this member (`creating-and-playing-a-video`) are published on the source page; their code is not part of the open-source repo.*

### VideoContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

The video content a [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] object is associated with. Setting this property is equivalent to setting [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|Video]], and reading it returns a content ID equal to [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|Video]].

When referencing a video by content ID, build the value with the corresponding [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] constructor: [[30 Official Roblox Docs/API Reference/Datatypes/Content#fromAssetId|Content.fromAssetId()]] for a numeric asset ID, or [[30 Official Roblox Docs/API Reference/Datatypes/Content#fromUri|Content.fromUri()]] for an `rbxassetid://` URI.

Unlike [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|Video]], which only accepts a content ID string, `VideoContent` can also hold a direct reference to a [[30 Official Roblox Docs/API Reference/Classes/VideoCapture|VideoCapture]] object, such as one retrieved through [[30 Official Roblox Docs/API Reference/Classes/CaptureService#ReadCapturesFromGalleryAsync|CaptureService:ReadCapturesFromGalleryAsync()]]. This lets a local screen recording play back on the `VideoFrame` without first uploading it to Roblox. Build the value with [[30 Official Roblox Docs/API Reference/Datatypes/Content#fromObject|Content.fromObject()]], for example `videoFrame.VideoContent = Content.fromObject(capture)`.

### Volume

**Type:** float

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** Audio, UI

This property determines how loud the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] plays back. It can be set to a number between 0 and 100.

## Methods

### Pause

```lua
VideoFrame:Pause(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio, UI

Sets [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Playing|VideoFrame.Playing]] to `false`, pausing playback if the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] is playing.

As [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#TimePosition|VideoFrame.TimePosition]] is not reset, when the video is resumed it will continue from its previous position.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Play

```lua
VideoFrame:Play(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio, UI

Sets [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Playing|VideoFrame.Playing]] to `true`, playing the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] from the current [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#TimePosition|VideoFrame.TimePosition]]. To save resources and improve performance, set the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] property to `""` when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] is not visible or in use.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`creating-and-playing-a-video`) are published on the source page; their code is not part of the open-source repo.*

## Events

### DidLoop

```lua
VideoFrame.DidLoop(video: string)
```

**Capabilities:** Audio, UI

An event that fires whenever the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] loops. Returns the content ID of the video.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `video` | string |  | The content ID of the video that looped. |

### Ended

```lua
VideoFrame.Ended(video: string)
```

**Capabilities:** Audio, UI

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] has completed playback and stopped.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `video` | string |  | The content ID of the paused that ended. |

### Loaded

```lua
VideoFrame.Loaded(video: string)
```

**Capabilities:** Audio, UI

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] is loaded.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `video` | string |  | The content ID of the loaded video. |

### Paused

```lua
VideoFrame.Paused(video: string)
```

**Capabilities:** Audio, UI

This event fires whenever the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] is paused using [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Pause|VideoFrame:Pause()]] or by setting [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Playing|VideoFrame.Playing]] to false.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `video` | string |  | The content ID of the paused video. |

### Played

```lua
VideoFrame.Played(video: string)
```

**Capabilities:** Audio, UI

This event fires whenever the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video|VideoFrame.Video]] is played using the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Play|VideoFrame:Play()]] function or by setting [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Playing|VideoFrame.Playing]] to true.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `video` | string |  | The content ID of the played video. |

---
*Source: [VideoFrame](https://create.roblox.com/docs/reference/engine/classes/VideoFrame) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
