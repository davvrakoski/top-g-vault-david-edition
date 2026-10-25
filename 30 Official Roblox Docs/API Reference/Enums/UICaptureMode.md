---
title: "UICaptureMode"
description: "Used to determine what UI elements should be captured with `CaptureService`."
api_type: enum
aliases: ["Enum.UICaptureMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UICaptureMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used to determine what UI elements should be captured with [[30 Official Roblox Docs/API Reference/Classes/CaptureService|CaptureService]].*

## Description

Controls which UI layers are composited into screenshots and video captures taken by [[30 Official Roblox Docs/API Reference/Classes/CaptureService|CaptureService]]. When [[30 Official Roblox Docs/API Reference/Enums/UICaptureMode|Enum.UICaptureMode.All]], both [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] and [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] elements are rendered into the output. When [[30 Official Roblox Docs/API Reference/Enums/UICaptureMode|Enum.UICaptureMode.None]], no UI is included and the capture shows only the 3D scene.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `All` | 0 | Capture all UI elements. |
| `None` | 1 | Capture no UI elements. |

---
*Source: [UICaptureMode](https://create.roblox.com/docs/reference/engine/enums/UICaptureMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
