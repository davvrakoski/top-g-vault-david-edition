---
title: "CameraType"
description: "Describes the camera behavior mode if using the default PlayerScripts."
api_type: enum
aliases: ["Enum.CameraType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CameraType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the camera behavior mode if using the default PlayerScripts.*

## Description

The CameraType Enum is used in [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|Camera.CameraType]] to set the behavior of the Camera object.

Attach, Watch, Track, and Follow all require a valid [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraSubject|Camera.CameraSubject]] to work properly.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Fixed` | 0 | Camera is stationary. |
| `Attach` | 1 | Camera moves with the subject at a fixed offset and will rotate as the subject rotates. |
| `Watch` | 2 | Camera is stationary but will rotate to keep the subject in the center of the screen. |
| `Track` | 3 | Camera moves with the subject but does not rotate automatically. |
| `Follow` | 4 | Camera moves with the subject and rotates to keep the subject in the center. |
| `Custom` | 5 | Default mode used by Roblox core scripts. |
| `Scriptable` | 6 | No default behavior. Used when developers need to script custom behavior. |
| `Orbital` | 7 | The camera has a fixed Y position, but can be rotated around the player. |

---
*Source: [CameraType](https://create.roblox.com/docs/reference/engine/enums/CameraType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
