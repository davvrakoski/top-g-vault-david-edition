---
title: "CameraSpeedAdjustBinding"
description: "Controls which input gesture adjusts the Studio camera's fly speed while navigating."
api_type: enum
aliases: ["Enum.CameraSpeedAdjustBinding"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CameraSpeedAdjustBinding"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls which input gesture adjusts the Studio camera's fly speed while navigating.*

## Description

Controls which mouse-and-keyboard gesture is used to adjust the Studio camera's fly speed while navigating in the 3D viewport. The selected binding intercepts the mouse scroll wheel (or touchpad pan gesture) when the designated modifier is active, changing camera speed instead of zooming. This setting is exposed in Studio's **Camera** preferences as `Camera Speed Adjust Binding` and defaults to [[30 Official Roblox Docs/API Reference/Enums/CameraSpeedAdjustBinding|Enum.CameraSpeedAdjustBinding.RmbScroll]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | No input gesture is bound to camera speed adjustment; the scroll wheel always zooms. |
| `RmbScroll` | 1 | Scrolling while holding the right mouse button adjusts the camera fly speed instead of zooming. |
| `AltScroll` | 2 | Scrolling while holding Alt adjusts the camera fly speed instead of zooming. |

---
*Source: [CameraSpeedAdjustBinding](https://create.roblox.com/docs/reference/engine/enums/CameraSpeedAdjustBinding) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
