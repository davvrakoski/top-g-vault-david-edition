---
title: "VideoCaptureResult"
description: "Indicates whether a video capture session ended successfully or the reason it was interrupted."
api_type: enum
aliases: ["Enum.VideoCaptureResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/VideoCaptureResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates whether a video capture session ended successfully or the reason it was interrupted.*

## Description

Passed as the `result` argument of `UserVideoCaptureFailed` when a video capture session ends. [[30 Official Roblox Docs/API Reference/Enums/VideoCaptureResult|Enum.VideoCaptureResult.Success]] means the capture completed normally; other values identify why recording stopped.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 0 | Video capture ended normally without any errors. |
| `OtherError` | 1 | Video capture stopped due to an unspecified internal error. |
| `ScreenSizeChanged` | 2 | Video capture was interrupted because the screen dimensions changed while recording was in progress. |
| `TimeLimitReached` | 3 | Video capture was stopped automatically because the maximum allowed recording duration was reached. |

---
*Source: [VideoCaptureResult](https://create.roblox.com/docs/reference/engine/enums/VideoCaptureResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
