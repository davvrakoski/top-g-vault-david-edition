---
title: "VideoCaptureStartedResult"
description: "Describes the outcome of a video capture start request made through `CaptureService`."
api_type: enum
aliases: ["Enum.VideoCaptureStartedResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/VideoCaptureStartedResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the outcome of a video capture start request made through [[30 Official Roblox Docs/API Reference/Classes/CaptureService|CaptureService]].*

## Description

Describes the outcome of a video capture start request initiated via [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StartVideoCaptureAsync|CaptureService:StartVideoCaptureAsync()]]. The value is returned directly by that method and is also surfaced through the `UserVideoCaptureStartFailed` event when the result is not [[30 Official Roblox Docs/API Reference/Enums/VideoCaptureStartedResult|Enum.VideoCaptureStartedResult.Success]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 0 | Video capture started successfully. |
| `OtherError` | 1 | Video capture failed due to an unspecified internal error. |
| `CapturingAlready` | 2 | A video capture session is already in progress and a new one cannot be started. |
| `NoDeviceSupport` | 3 | The device does not have the required capture capabilities. |
| `NoSpaceOnDevice` | 4 | The device does not have sufficient storage space available to begin capturing video. |

---
*Source: [VideoCaptureStartedResult](https://create.roblox.com/docs/reference/engine/enums/VideoCaptureStartedResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
