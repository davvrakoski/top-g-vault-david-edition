---
title: "CaptureType"
description: "Indicates whether a capture is a screenshot or a video recording."
api_type: enum
aliases: ["Enum.CaptureType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CaptureType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates whether a capture is a screenshot or a video recording.*

## Description

Indicates whether a capture is a screenshot or a video recording. [[30 Official Roblox Docs/API Reference/Classes/CaptureService|CaptureService]] passes this value in [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureBegan|CaptureService.CaptureBegan]] and [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureEnded|CaptureService.CaptureEnded]], and accepts an array of [[30 Official Roblox Docs/API Reference/Enums/CaptureType|Enum.CaptureType]] values as the `captureTypeFilters` argument of [[30 Official Roblox Docs/API Reference/Classes/CaptureService#ReadCapturesFromGalleryAsync|CaptureService:ReadCapturesFromGalleryAsync()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Screenshot` | 1 | The capture is a screenshot image. |
| `Video` | 2 | The capture is a video recording. |

---
*Source: [CaptureType](https://create.roblox.com/docs/reference/engine/enums/CaptureType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
