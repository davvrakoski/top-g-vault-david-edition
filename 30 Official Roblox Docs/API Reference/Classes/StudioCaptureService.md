---
title: "StudioCaptureService"
description: "A Studio-only service that lets plugins capture screenshots of the active place's 3D viewport."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StudioCaptureService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A Studio-only service that lets plugins capture screenshots of the active place's 3D viewport.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`StudioCaptureService` is a Studio-only service that lets plugins capture screenshots of the active place's 3D viewport. Use [[30 Official Roblox Docs/API Reference/Classes/StudioCaptureService#RequestScreenshotPermissionAsync|RequestScreenshotPermissionAsync()]] to obtain the user's permission, [[30 Official Roblox Docs/API Reference/Classes/StudioCaptureService#CanCaptureScreenshot|CanCaptureScreenshot()]] to check whether a capture is currently possible, and [[30 Official Roblox Docs/API Reference/Classes/StudioCaptureService#CaptureScreenshot|CaptureScreenshot()]] to request an image of the current view. All members require plugin security and are only available within Studio.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioCaptureService#CanCaptureScreenshot\|CanCaptureScreenshot()]] | boolean | Returns whether a screenshot can currently be captured. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioCaptureService#CaptureScreenshot\|CaptureScreenshot()]] | [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture\|StudioScreenshotCapture]] | Captures a screenshot of the active place according to the provided options. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioCaptureService#RequestScreenshotPermissionAsync\|RequestScreenshotPermissionAsync()]] | boolean | Requests the user's permission for the plugin to capture screenshots from the Studio 3D view. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CanCaptureScreenshot

```lua
StudioCaptureService:CanCaptureScreenshot(): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns `false` when there is a known reason a screenshot cannot be captured — for example, when this is not the active [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] or the plugin does not have permission — and `true` otherwise. A return value of `true` does not guarantee that [[30 Official Roblox Docs/API Reference/Classes/StudioCaptureService#CaptureScreenshot|CaptureScreenshot()]] will succeed, because conditions can change between the two calls.

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean that is `false` when a screenshot is known to be uncapturable, or `true` otherwise. |

### CaptureScreenshot

```lua
StudioCaptureService:CaptureScreenshot(screenshotOptions: Dictionary): StudioScreenshotCapture
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Captures a screenshot of the active [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] according to `screenshotOptions` and returns a [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture|StudioScreenshotCapture]] in the requested format. If an image of the requested size cannot be captured at the requested position, the capture fails rather than clipping the image.

The `screenshotOptions` dictionary accepts the following keys:

- `Position` — a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] top-left offset of the captured region. Must be non-negative and defaults to `(0, 0)`.
- `CaptureSize` — a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] size of the region to capture. Both components must be positive.
- `OutputSize` — a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] size of the returned image. Both components must be positive; when it differs from `CaptureSize`, `ResampleMode` must also be provided.
- `ResampleMode` — the resampling filter used when `OutputSize` differs from `CaptureSize`.
- `Format` — an [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureScreenshotFormat|Enum.StudioCaptureScreenshotFormat]] for the returned buffer. Defaults to [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureScreenshotFormat|Enum.StudioCaptureScreenshotFormat.RGBA8]].
- `UICaptureMode` — an [[30 Official Roblox Docs/API Reference/Enums/UICaptureMode|Enum.UICaptureMode]] controlling whether UI is included in the capture. Defaults to [[30 Official Roblox Docs/API Reference/Enums/UICaptureMode|Enum.UICaptureMode.All]].

The returned [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture|StudioScreenshotCapture]] is populated asynchronously: its image buffer becomes available only after the capture and encoding complete, and any errors are reported on the capture object.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `screenshotOptions` | Dictionary |  | A dictionary of options controlling the capture, such as `Position`, `CaptureSize`, `OutputSize`, `ResampleMode`, `Format`, and `UICaptureMode`. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture\|StudioScreenshotCapture]] | A [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture\|StudioScreenshotCapture]] that holds the requested image in the requested format. |

### RequestScreenshotPermissionAsync

```lua
StudioCaptureService:RequestScreenshotPermissionAsync(): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

This yielding function asks the user to grant the plugin permission to capture screenshots from their Studio 3D view, returning `true` if permission is granted and `false` otherwise. It can return immediately without prompting when the plugin's permission is already known from an earlier session, and it returns `false` without prompting when the global screenshot setting is disabled.

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean that is `true` if the user granted permission and `false` otherwise. |

---
*Source: [StudioCaptureService](https://create.roblox.com/docs/reference/engine/classes/StudioCaptureService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
