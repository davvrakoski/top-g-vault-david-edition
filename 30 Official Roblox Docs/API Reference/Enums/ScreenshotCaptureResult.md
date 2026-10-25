---
title: "ScreenshotCaptureResult"
description: "Describes the result of a screenshot capture initiated by `CaptureService:TakeScreenshotCaptureAsync()`."
api_type: enum
aliases: ["Enum.ScreenshotCaptureResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ScreenshotCaptureResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the result of a screenshot capture initiated by [[30 Official Roblox Docs/API Reference/Classes/CaptureService#TakeScreenshotCaptureAsync|CaptureService:TakeScreenshotCaptureAsync()]].*

## Description

The ScreenshotCaptureResult enum describes the result of a screenshot capture initiated through [[30 Official Roblox Docs/API Reference/Classes/CaptureService#TakeScreenshotCaptureAsync|CaptureService:TakeScreenshotCaptureAsync()]]. It is passed as the first argument to the `onCaptureReady` callback.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 0 | The screenshot capture completed successfully. |
| `OtherError` | 1 | The screenshot capture failed due to an unspecified error. |
| `NoDeviceSupport` | 2 | The device does not support screenshot captures. |
| `NoSpaceOnDevice` | 3 | The device does not have enough storage space to save the screenshot capture. |

---
*Source: [ScreenshotCaptureResult](https://create.roblox.com/docs/reference/engine/enums/ScreenshotCaptureResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
