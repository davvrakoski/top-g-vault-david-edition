---
title: "TrackerExtrapolationFlagMode"
description: "Controls how the face-tracking pipeline extrapolates animation data between camera frames on the `TrackerLodController`."
api_type: enum
aliases: ["Enum.TrackerExtrapolationFlagMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TrackerExtrapolationFlagMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how the face-tracking pipeline extrapolates animation data between camera frames on the `TrackerLodController`.*

## Description

Controls how the face-tracking pipeline extrapolates animation data between camera frames. This mode is set via `VideoExtrapolationMode` on `TrackerLodController` and determines whether the tracker infers intermediate facial poses and FACS (Facial Action Coding System) blend-shape values when the camera delivers frames at a lower rate than the animation update rate.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `ForceDisabled` | 0 | Disables all extrapolation so that facial animation updates only when a new camera frame is processed. |
| `ExtrapolateFacsAndPose` | 1 | Extrapolates both FACS blend-shape values and head-pose data between camera frames. |
| `ExtrapolateFacsOnly` | 2 | Extrapolates only FACS blend-shape values between camera frames, leaving head-pose data unchanged. |
| `Auto` | 3 | Lets the `TrackerLodController` automatically select the extrapolation strategy based on current performance conditions. |

---
*Source: [TrackerExtrapolationFlagMode](https://create.roblox.com/docs/reference/engine/enums/TrackerExtrapolationFlagMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
