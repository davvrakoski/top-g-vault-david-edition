---
title: "StudioCaptureScreenshotFormat"
description: "Specifies the pixel format of the image buffer stored in a `StudioScreenshotCapture` object."
api_type: enum
aliases: ["Enum.StudioCaptureScreenshotFormat"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/StudioCaptureScreenshotFormat"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the pixel format of the image buffer stored in a [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture|StudioScreenshotCapture]] object.*

## Description

Specifies the pixel format used when [[30 Official Roblox Docs/API Reference/Classes/StudioCaptureService#CaptureScreenshot|StudioCaptureService:CaptureScreenshot()]] stores the captured image. Pass this value as the `Format` key in the options table to [[30 Official Roblox Docs/API Reference/Classes/StudioCaptureService#CaptureScreenshot|StudioCaptureService:CaptureScreenshot()]]; it is then reflected as the read-only [[30 Official Roblox Docs/API Reference/Classes/StudioScreenshotCapture#BufferFormat|StudioScreenshotCapture.BufferFormat]] property. When `Format` is omitted, the capture defaults to [[30 Official Roblox Docs/API Reference/Enums/StudioCaptureScreenshotFormat|Enum.StudioCaptureScreenshotFormat.RGBA8]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `RGBA8` | 0 | The buffer contains raw, uncompressed RGBA pixel data with 8 bits per channel (4 bytes per pixel). |
| `PNG` | 1 | The buffer contains a complete PNG-encoded image. |

---
*Source: [StudioCaptureScreenshotFormat](https://create.roblox.com/docs/reference/engine/enums/StudioCaptureScreenshotFormat) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
