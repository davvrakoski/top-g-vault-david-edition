---
title: "CaptureService"
description: "A service which provides control over screenshot and video capture features."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CaptureService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service which provides control over screenshot and video capture features.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`CaptureService` is a client-side service that allows developers to control how the screenshot and video capture feature integrates with their experiences. It can be used to include preset moments where a capture is automatically taken for a user, and that user can then save, share, or delete the capture.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureScreenshot\|CaptureScreenshot()]] | () | Takes a screenshot and provides a temporary `contentId` to identify it. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CheckUploadCaptureStatusAsync\|CheckUploadCaptureStatusAsync()]] | Tuple | Polls the status of an in-progress capture upload started by [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StartUploadCaptureAsync\|StartUploadCaptureAsync()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#PromptCaptureGalleryPermissionAsync\|PromptCaptureGalleryPermissionAsync()]] | boolean | Prompts the user for permission to access their local capture gallery. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#PromptSaveCapturesToGallery\|PromptSaveCapturesToGallery()]] | () | Prompts the user to save specified captures to their gallery. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#PromptShareCapture\|PromptShareCapture()]] | () | Prompts the user to share a specified capture. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#ReadCapturesFromGalleryAsync\|ReadCapturesFromGalleryAsync()]] | Tuple | Returns a paginated list of captures from the user's gallery. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StartUploadCaptureAsync\|StartUploadCaptureAsync()]] | Tuple | Begins uploading a capture to the asset system and returns a token used to poll the upload's status. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StartVideoCaptureAsync\|StartVideoCaptureAsync()]] | [[30 Official Roblox Docs/API Reference/Enums/VideoCaptureStartedResult\|VideoCaptureStartedResult]] | Initiates a video capture recording. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StopVideoCapture\|StopVideoCapture()]] | () | Ends a video capture initiated by [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StartVideoCaptureAsync\|StartVideoCaptureAsync()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#TakeScreenshotCaptureAsync\|TakeScreenshotCaptureAsync()]] | () | Initiates a screenshot capture. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#UploadCaptureAsync\|UploadCaptureAsync()]] | Tuple | Uploads a capture to the asset system and returns the result and asset ID. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureBegan\|CaptureBegan]] | `captureType` | Fires immediately before a capture begins. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureEnded\|CaptureEnded]] | `captureType` | Fires after a capture finishes. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureSaved\|CaptureSaved]] | `captureInfo` | **Deprecated.** Fires when a screenshot capture is saved to the user's gallery. |
| [[30 Official Roblox Docs/API Reference/Classes/CaptureService#UserCaptureSaved\|UserCaptureSaved]] | `captureContentId` | Fires when the user saves a capture. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CaptureScreenshot

```lua
CaptureService:CaptureScreenshot(onCaptureReady: Function): ()
```

**Thread safety:** Unsafe · **Capabilities:** Capture

This method captures a screenshot for the user but does not immediately save it to their **Captures** gallery within the experience's main menu. Instead, a temporary `contentId` is created to identify the new capture.

Note that any screenshots taken by this method will not be accessible via [[30 Official Roblox Docs/API Reference/Classes/CaptureService#ReadCapturesFromGalleryAsync|ReadCapturesFromGalleryAsync()]] or be uploadable via [[30 Official Roblox Docs/API Reference/Classes/CaptureService#UploadCaptureAsync|UploadCaptureAsync()]].

The `onCaptureReady` callback can be used to prompt the user to save or share the screenshot:

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `onCaptureReady` | Function |  | A callback function that is called with the `contentId` of the new capture once it is ready. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`CaptureService-CaptureScreenshot`) are published on the source page; their code is not part of the open-source repo.*

### CheckUploadCaptureStatusAsync

```lua
CaptureService:CheckUploadCaptureStatusAsync(token: string): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Capture · **Tags:** `Yields`

Client-side function that checks the status of a capture upload started with [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StartUploadCaptureAsync|StartUploadCaptureAsync()]], using the returned `token`. Returns a tuple of the current [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult|Enum.UploadCaptureResult]] and, once the upload finishes successfully, the asset ID of the uploaded capture.

Poll until a terminal state. While processing, the result is [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult|Enum.UploadCaptureResult.UploadPending]] and the asset ID is `0`. [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult|Enum.UploadCaptureResult.Success]] includes the final asset ID; [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult|Enum.UploadCaptureResult.CaptureModerated]] means moderation rejected the capture; [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult|Enum.UploadCaptureResult.UploadFailed]] means the upload did not complete.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | string |  | The token returned by [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StartUploadCaptureAsync\|StartUploadCaptureAsync()]] that identifies the in-progress upload. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Tuple of (result: [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult\|Enum.UploadCaptureResult]], assetId: `number`) |

### PromptCaptureGalleryPermissionAsync

```lua
CaptureService:PromptCaptureGalleryPermissionAsync(captureGalleryPermission: CaptureGalleryPermission): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Capture · **Tags:** `Yields`

This client-side function prompts a user for permission to access their local captures. Once they have accepted or rejected the prompt, it returns a boolean representing their choice. This function is a necessary prerequisite to `ReadCapturesFromGalleryAsync` and `UploadCaptureAsync`, as both of these require gallery permissions to work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `captureGalleryPermission` | [[30 Official Roblox Docs/API Reference/Enums/CaptureGalleryPermission\|CaptureGalleryPermission]] |  | An [[30 Official Roblox Docs/API Reference/Enums/CaptureGalleryPermission\|Enum.CaptureGalleryPermission]] representing the type of access for which the user will be prompted. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean representing whether or not the user has allowed access to their captures. |

*Code samples for this member (`PromptCaptureGalleryPermissionAsync-example`) are published on the source page; their code is not part of the open-source repo.*

### PromptSaveCapturesToGallery

```lua
CaptureService:PromptSaveCapturesToGallery(captures: Array, resultCallback: Function): ()
```

**Thread safety:** Unsafe · **Capabilities:** Capture

This method prompts the user to save the captures identified by the provided `contentIds` or [[30 Official Roblox Docs/API Reference/Classes/Capture|Capture]] objects to their **Captures** gallery within the experience's main menu.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `captures` | Array |  | An array of content IDs and/or [[30 Official Roblox Docs/API Reference/Classes/Capture\|Capture]] objects. |
| `resultCallback` | Function |  | A callback function that will be invoked with a dictionary mapping each `contentId` and/or [[30 Official Roblox Docs/API Reference/Classes/Capture\|Capture]] object to a boolean indicating if the user accepted saving that capture. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptShareCapture

```lua
CaptureService:PromptShareCapture(captureContent: Content, launchData: string, onAcceptedCallback: Function, onDeniedCallback: Function): ()
```

**Thread safety:** Unsafe · **Capabilities:** Capture

This method prompts the user to share the capture identified by the provided `contentId` or [[30 Official Roblox Docs/API Reference/Classes/Capture|Capture]] object using the native share sheet on their device.

The capture is shared along with an invite link to the experience when supported. Not all devices support including both a screenshot or video and an invite link.

The `launchData` will be available in the `launchData` field for users who join through the invite link.

For users or devices who are not eligible to use share sheets, this method prompts them to download the capture instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `captureContent` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] containing a `contentId` or [[30 Official Roblox Docs/API Reference/Classes/Capture\|Capture]] object. |
| `launchData` | string |  | An optional string to include as launch data in the invite link. |
| `onAcceptedCallback` | Function |  | An optional callback function invoked if the user accepts sharing. |
| `onDeniedCallback` | Function |  | An optional callback function invoked if the user denies sharing. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`CaptureService-PromptShareCapture`) are published on the source page; their code is not part of the open-source repo.*

### ReadCapturesFromGalleryAsync

```lua
CaptureService:ReadCapturesFromGalleryAsync(captureTypeFilters: Array = {}, readFromAllEligibleExperiences: boolean = False): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Capture · **Tags:** `Yields`

This client-side function returns a paginated list of captures from the user's gallery as a [[30 Official Roblox Docs/API Reference/Classes/CapturesPages|CapturesPages]] object sorted reverse-chronologically, which can be used to iterate through the captures. The results can be filtered by capture type with the `captureTypeFilters` parameter. If this parameter isn't provided, the function returns all captures.

If `readFromAllEligibleExperiences` is `true`, captures from all eligible experiences will be read. If `false`, only those from the current experience will be read. Additionally, captures taken with [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureScreenshot|CaptureScreenshot()]] and subsequently saved with [[30 Official Roblox Docs/API Reference/Classes/CaptureService#PromptSaveCapturesToGallery|PromptSaveCapturesToGallery()]] will not be returned by this method.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `captureTypeFilters` | Array | `{}` | An array of [[30 Official Roblox Docs/API Reference/Enums/CaptureType\|Enum.CaptureType]]. |
| `readFromAllEligibleExperiences` | boolean | `False` | A boolean; default is `false`. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Tuple of (result: [[30 Official Roblox Docs/API Reference/Enums/ReadCapturesFromGalleryResult\|Enum.ReadCapturesFromGalleryResult]], capturesPages: [[30 Official Roblox Docs/API Reference/Classes/CapturesPages\|CapturesPages]]) |

*Code samples for this member (`ReadCapturesFromGalleryAsync-example`) are published on the source page; their code is not part of the open-source repo.*

### StartUploadCaptureAsync

```lua
CaptureService:StartUploadCaptureAsync(capture: Capture): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Capture · **Tags:** `Yields`

Client-side function that begins uploading a [[30 Official Roblox Docs/API Reference/Classes/Capture|Capture]] (for example, one from [[30 Official Roblox Docs/API Reference/Classes/CaptureService#ReadCapturesFromGalleryAsync|ReadCapturesFromGalleryAsync()]]) to the asset system. Unlike [[30 Official Roblox Docs/API Reference/Classes/CaptureService#UploadCaptureAsync|UploadCaptureAsync()]], which blocks until the asset is created, this returns as soon as the upload starts with a tuple of [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult|Enum.UploadCaptureResult]] and a `token` string. Use this when the user might leave before the upload finishes; a pending `UploadCaptureAsync` is lost if the player leaves. Pass the token to [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CheckUploadCaptureStatusAsync|CheckUploadCaptureStatusAsync()]] to poll for completion and the resulting asset ID.

The user must grant gallery access through [[30 Official Roblox Docs/API Reference/Classes/CaptureService#PromptCaptureGalleryPermissionAsync|PromptCaptureGalleryPermissionAsync()]]; without it, the result is [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult|Enum.UploadCaptureResult.NeedPermission]]. The capture must be eligible and present in the gallery. Uploads are rate-limited per user and return [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult|Enum.UploadCaptureResult.UploadQuotaReached]] when exceeded.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `capture` | [[30 Official Roblox Docs/API Reference/Classes/Capture\|Capture]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Capture\|Capture]] to upload. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Tuple of (result: [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult\|Enum.UploadCaptureResult]], token: `string`) |

### StartVideoCaptureAsync

```lua
CaptureService:StartVideoCaptureAsync(onCaptureReady: Function, captureParams: Dictionary = nil): VideoCaptureStartedResult
```

**Thread safety:** Unsafe · **Capabilities:** Capture · **Tags:** `Yields`

This method initiates a video capture recording. The recording will continue until the [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StopVideoCapture|StopVideoCapture()]] method is called, or when 30 seconds have passed, whichever comes first. During the video recording, all user voices are muted.

The `onCaptureReady` callback can be used to prompt the user to save or share the video capture.

The `captureParams` parameter is currently non-operational.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `onCaptureReady` | Function |  | A callback function that is called on video capture completion with a [[30 Official Roblox Docs/API Reference/Enums/VideoCaptureResult\|Enum.VideoCaptureResult]] and, if successful, a [[30 Official Roblox Docs/API Reference/Classes/VideoCapture\|VideoCapture]]. |
| `captureParams` | Dictionary | `nil` | A dictionary of optional parameters that modify capture behavior. Currently non-operational. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/VideoCaptureStartedResult\|VideoCaptureStartedResult]] | A [[30 Official Roblox Docs/API Reference/Enums/VideoCaptureStartedResult\|Enum.VideoCaptureStartedResult]] indicating whether the video recording started successfully. |

*Code samples for this member (`CaptureService-StartVideoCaptureAsync`) are published on the source page; their code is not part of the open-source repo.*

### StopVideoCapture

```lua
CaptureService:StopVideoCapture(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Capture

This method ends a video capture that was started by the [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StartVideoCaptureAsync|StartVideoCaptureAsync()]] method.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### TakeScreenshotCaptureAsync

```lua
CaptureService:TakeScreenshotCaptureAsync(onCaptureReady: Function, captureParams: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Capture

This method initiates a screenshot capture. The `onCaptureReady` callback can be used to prompt the user to save or share the screenshot capture.

Use the [[30 Official Roblox Docs/API Reference/Enums/UICaptureMode|Enum.UICaptureMode]] parameter in `captureParams` to specify whether UI elements should be in the screenshot. By default, this is set to [[30 Official Roblox Docs/API Reference/Enums/UICaptureMode|Enum.UICaptureMode.None]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `onCaptureReady` | Function |  | A callback function that is called on screenshot capture completion with a [[30 Official Roblox Docs/API Reference/Enums/ScreenshotCaptureResult\|Enum.ScreenshotCaptureResult]] and, if successful, a [[30 Official Roblox Docs/API Reference/Classes/ScreenshotCapture\|ScreenshotCapture]]. |
| `captureParams` | Dictionary | `nil` | A dictionary that modifies capture behavior. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`CaptureService-TakeScreenshotCaptureAsync`) are published on the source page; their code is not part of the open-source repo.*

### UploadCaptureAsync

```lua
CaptureService:UploadCaptureAsync(capture: Capture): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Capture · **Tags:** `Yields`

This client-side function uploads a capture, like one retrieved from `ReadCapturesFromGalleryAsync`, to the asset system. It returns a tuple of the result and the asset ID.

Notes:

- This function will only work properly if the Maturity and Compliance questionnaire has been filled out for the experience.
- For video capture types, there is an upload limit of 20 videos per day per user; when that limit is exceeded, the result is [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult|Enum.UploadCaptureResult.UploadQuotaReached]], which lets you distinguish quota exhaustion from other failures.
- This function can take up to several minutes to finish executing, and the user will need to remain in the experience.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `capture` | [[30 Official Roblox Docs/API Reference/Classes/Capture\|Capture]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Capture\|Capture]] to upload. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Tuple of (result: [[30 Official Roblox Docs/API Reference/Enums/UploadCaptureResult\|Enum.UploadCaptureResult]], assetId: `number`) |

*Code samples for this member (`UploadCaptureAsync-example`) are published on the source page; their code is not part of the open-source repo.*

## Events

### CaptureBegan

```lua
CaptureService.CaptureBegan(captureType: CaptureType)
```

**Capabilities:** Capture

This event fires right before a new capture is taken. It can be used to customize the capture experience, for example by hiding certain GUI elements.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `captureType` | [[30 Official Roblox Docs/API Reference/Enums/CaptureType\|CaptureType]] |  | An [[30 Official Roblox Docs/API Reference/Enums/CaptureType\|Enum.CaptureType]] indicating whether the capture is a screenshot or video. |

### CaptureEnded

```lua
CaptureService.CaptureEnded(captureType: CaptureType)
```

**Capabilities:** Capture

This event fires after a new capture completes. It can be used to restore any changes made when the [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureBegan|CaptureBegan]] event fired.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `captureType` | [[30 Official Roblox Docs/API Reference/Enums/CaptureType\|CaptureType]] |  | An [[30 Official Roblox Docs/API Reference/Enums/CaptureType\|Enum.CaptureType]] indicating whether the capture was a screenshot or video. |

### CaptureSaved

> [!warning] Deprecated
> This event has been superseded by the
> `Class.CaptureService.UserCaptureSaved|UserCaptureSaved` event.

```lua
CaptureService.CaptureSaved(captureInfo: Dictionary)
```

**Capabilities:** Capture · **Tags:** `Deprecated`

Fires when a screenshot capture is saved to the user's gallery. Provides a `captureInfo` dictionary with `contentId`, `filePath`, and `type`. Fires only for screenshot captures, not video captures.

Deprecated; use [[30 Official Roblox Docs/API Reference/Classes/CaptureService#UserCaptureSaved|UserCaptureSaved]] instead, which fires with the saved capture's `contentId` directly.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `captureInfo` | Dictionary |  | A dictionary containing `contentId`, `filePath`, and `type` fields describing the saved capture. |

### UserCaptureSaved

```lua
CaptureService.UserCaptureSaved(captureContentId: ContentId)
```

**Capabilities:** Capture

This event fires when the user saves a screenshot using the Roblox screenshot capture UI. It can be used for analytics or to prompt the user to share their capture.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `captureContentId` | ContentId |  | The `contentId` identifying the screenshot that the user saved. |

---
*Source: [CaptureService](https://create.roblox.com/docs/reference/engine/classes/CaptureService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
