---
title: "TrackerFaceTrackingStatus"
description: "Describes the current state of face tracking for the device camera used by `FaceAnimatorService`."
api_type: enum
aliases: ["Enum.TrackerFaceTrackingStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TrackerFaceTrackingStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the current state of face tracking for the device camera used by `FaceAnimatorService`.*

## Description

Describes the current state of face tracking as reported by the device camera tracker. Surfaced through `FaceTrackingStatusEnum`, which defaults to [[30 Official Roblox Docs/API Reference/Enums/TrackerFaceTrackingStatus|Enum.TrackerFaceTrackingStatus.FaceTrackingUninitialized]] until the tracker starts running.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `FaceTrackingSuccess` | 0 | Face tracking is active and a face is being tracked successfully. |
| `FaceTrackingNoFaceFound` | 1 | The tracker is running but no face has been detected in the camera feed. |
| `FaceTrackingUnknown` | 2 | The face tracking state is indeterminate or could not be mapped to a known status. |
| `FaceTrackingLost` | 3 | Face tracking was previously active but the face has been lost from the camera feed. |
| `FaceTrackingHasTrackingError` | 4 | Face tracking is active but has encountered an error that prevents reliable pose estimation. |
| `FaceTrackingIsOccluded` | 5 | A face is detected but is partially or fully occluded, reducing tracking reliability. |
| `FaceTrackingUninitialized` | 6 | Face tracking has not yet been initialized; this is the default state before the tracker starts. |

---
*Source: [TrackerFaceTrackingStatus](https://create.roblox.com/docs/reference/engine/enums/TrackerFaceTrackingStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
