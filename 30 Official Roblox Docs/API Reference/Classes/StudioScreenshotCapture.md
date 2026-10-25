---
title: "StudioScreenshotCapture"
description: "Represents a single screenshot captured from Studio, exposing the resulting image buffer and the parameters the capture was taken with."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StudioScreenshotCapture"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a single screenshot captured from Studio, exposing the resulting image buffer and the parameters the capture was taken with.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Studio-only capture result that requires plugin security — not available in published experiences. Produced by [[30 Official Roblox Docs/API Reference/Classes/StudioCaptureService#CaptureScreenshot|CaptureScreenshot()]] and `CapturePluginGui()`. It holds the encoded image data together with the region and format used for the capture, and reports progress through [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferStatus|BufferStatus]].

The image is populated asynchronously. [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferStatus|BufferStatus]] defaults to [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.NotStarted]], becomes [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Pending]] while capturing and encoding, [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Ready]] once the image is available, or [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Error]] if capture failed. Retrieve the image with [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#GetBuffer|GetBuffer()]], read failure details with [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#GetErrors|GetErrors()]], and produce a resized copy with [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#ScaleAsync|ScaleAsync()]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferFormat\|BufferFormat]] | [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureScreenshotFormat\|StudioCaptureScreenshotFormat]] | The pixel format of the image data returned by [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#GetBuffer\|GetBuffer()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferStatus\|BufferStatus]] | [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus\|StudioCaptureBufferStatus]] | Reflects the current state of the capture as its image data is produced. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#OriginalSize\|OriginalSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The size, in pixels, of the region available for capture from [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#Position\|Position]] to the edge of the Studio view. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The top-left corner, in pixels, of the captured region within the Studio view. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#Resolution\|Resolution]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The pixel dimensions of the captured image. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#UICaptureMode\|UICaptureMode]] | [[30 Official Roblox Docs/API Reference/Enums/UICaptureMode\|UICaptureMode]] | Indicates which user-interface layers were included in the capture. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#GetBuffer\|GetBuffer()]] | buffer | Returns the captured image data as a buffer in the capture's pixel format. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#GetErrors\|GetErrors()]] | Array | Returns an array of error messages recorded during the capture. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#ScaleAsync\|ScaleAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture\|StudioScreenshotCapture]] | Produces a new capture containing a resized copy of this capture's image. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BufferFormat

**Type:** [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureScreenshotFormat|StudioCaptureScreenshotFormat]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureScreenshotFormat|Enum.StudioCaptureScreenshotFormat]] the capture's image data is encoded in, and therefore the format of the buffer returned by [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#GetBuffer|GetBuffer()]]. Defaults to [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureScreenshotFormat|Enum.StudioCaptureScreenshotFormat.RGBA8]], in which the buffer holds four bytes (red, green, blue, alpha) per pixel; when [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureScreenshotFormat|Enum.StudioCaptureScreenshotFormat.PNG]], the buffer holds a PNG-encoded image. This property is read-only and reflects the `Format` requested when the capture was created.

### BufferStatus

**Type:** [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|StudioCaptureBufferStatus]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus]] describing where the capture is in its lifecycle. Defaults to [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.NotStarted]], is set to [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Pending]] while the image is being captured and encoded, becomes [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Ready]] once the image data is available, and becomes [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Error]] if the capture fails. Only when the value is [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Ready]] does [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#GetBuffer|GetBuffer()]] return image data; otherwise that method raises an error. This property is read-only.

### OriginalSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

The pixel size of the capturable region measured from [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#Position|Position]] to the bottom-right corner of the Studio view, computed as the screen resolution minus the capture position and clamped to be non-negative. It describes the source area before any cropping or scaling, as distinct from [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#Resolution|Resolution]], which is the pixel size of the encoded image. This property is read-only.

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

The pixel offset of the top-left corner of the captured region from the top-left of the Studio view. It reflects the `Position` supplied when the capture was requested, defaulting to `(0, 0)` when none is given. This property is read-only.

### Resolution

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

The width and height, in pixels, of the encoded image held by the capture. It is set once the image has been captured and encoded (when [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferStatus|BufferStatus]] becomes [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Ready]]), and for a capture produced by [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#ScaleAsync|ScaleAsync()]] it equals the requested output size. This property is read-only.

### UICaptureMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UICaptureMode|UICaptureMode]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Enums/UICaptureMode|Enum.UICaptureMode]] that determines which user interface is composited into the captured image. Defaults to [[30 Official Roblox Docs/API Reference/Enums/UICaptureMode|Enum.UICaptureMode.All]], meaning all UI is included, and reflects the `UICaptureMode` requested when the capture was created. This property is read-only.

## Methods

### GetBuffer

```lua
StudioScreenshotCapture:GetBuffer(): buffer
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the captured screenshot as a `buffer` encoded in the capture's [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferFormat|BufferFormat]]. This method only succeeds when [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferStatus|BufferStatus]] is [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Ready]]; if the image is not yet available or the capture failed, it raises an error instead of returning a buffer.

**Returns**

| Type | Description |
| --- | --- |
| buffer | A buffer containing the captured image data in the capture's [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferFormat\|BufferFormat]]. |

### GetErrors

```lua
StudioScreenshotCapture:GetErrors(): Array
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns an array of the error messages recorded for this capture. The array is empty when no errors have occurred; when [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferStatus|BufferStatus]] is [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Error]], it contains one or more messages describing why the capture or scale failed.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings describing any errors that occurred during the capture. |

### ScaleAsync

```lua
StudioScreenshotCapture:ScaleAsync(strategy: ResamplerMode, newSize: Vector2): StudioScreenshotCapture
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Returns a new [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture|StudioScreenshotCapture]] whose image is computed from this capture, resized to `newSize` using the given [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode|Enum.ResamplerMode]]. The original capture is not modified. [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode|Enum.ResamplerMode.Default]] resamples with bilinear filtering, while [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode|Enum.ResamplerMode.Pixelated]] uses nearest-neighbor (point) sampling; the scaled capture inherits this capture's [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#Position|Position]], [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#OriginalSize|OriginalSize]], [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferFormat|BufferFormat]], and [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#UICaptureMode|UICaptureMode]].

This method yields until the scaled image has been encoded. It errors if `newSize` is not positive, or if this capture's [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferStatus|BufferStatus]] is not [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureBufferStatus|Enum.StudioCaptureBufferStatus.Ready]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `strategy` | [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode\|ResamplerMode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode\|Enum.ResamplerMode]] used to resample the image. [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode\|Enum.ResamplerMode.Default]] applies bilinear filtering; [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode\|Enum.ResamplerMode.Pixelated]] applies nearest-neighbor (point) sampling. |
| `newSize` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The width and height, in pixels, of the scaled image. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture\|StudioScreenshotCapture]] | A new [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture\|StudioScreenshotCapture]] whose image is this capture scaled to `newSize`. |

---
*Source: [StudioScreenshotCapture](https://create.roblox.com/docs/reference/engine/classes/StudioScreenshotCapture) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
