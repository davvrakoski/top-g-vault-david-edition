---
title: "TrackerType"
description: "Specifies the type of motion tracking that an `RTAnimationTracker` performs."
api_type: enum
aliases: ["Enum.TrackerType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TrackerType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the type of motion tracking that an `RTAnimationTracker` performs.*

## Description

`TrackerType` controls which tracking modality the `RTAnimationTracker` uses to generate real-time animation data. Changing the `TrackerType` property shuts down the current tracking engine and reinitializes with the newly selected type.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | No tracking type is selected; the tracking engine does not initialize, and attempting to start tracking with this type set raises `TrackerError.UnsupportedDevice`. |
| `Face` | 1 | Enables face tracking from a connected video device (and optionally audio) to produce FACS blendshape weights and head-orientation data each step. |
| `UpperBody` | 2 | Reserved for upper-body motion tracking. Setting this type raises `TrackerError.UnsupportedDevice` on initialization. |

---
*Source: [TrackerType](https://create.roblox.com/docs/reference/engine/enums/TrackerType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
