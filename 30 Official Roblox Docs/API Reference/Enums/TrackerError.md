---
title: "TrackerError"
description: "Status and error codes reported by the face-tracking subsystem through the `TrackerError` events on `RTAnimationTracker` and `FaceAnimatorService`."
api_type: enum
aliases: ["Enum.TrackerError"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TrackerError"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Status and error codes reported by the face-tracking subsystem through the `TrackerError` events on `RTAnimationTracker` and `FaceAnimatorService`.*

## Description

Passed to `TrackerError` handlers on `RTAnimationTracker` and `FaceAnimatorService` to indicate why face tracking failed or stopped. [[30 Official Roblox Docs/API Reference/Enums/TrackerError|Enum.TrackerError.Ok]] is a clean state; other values cover initialization, service availability, video input, or audio input failures.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Ok` | 0 | No error; the tracker is operating normally. |
| `NoService` | 1 | A required engine service was unavailable when the tracker attempted to connect. |
| `InitFailed` | 2 | The tracker failed to create or initialize its tracking session. |
| `NoVideo` | 3 | Video input is unavailable because no camera device was found or the camera was disconnected. |
| `VideoError` | 4 | A generic video error occurred during face-tracking camera input processing. |
| `VideoNoPermission` | 5 | The user denied camera permission required for video-based face tracking. |
| `VideoUnsupported` | 6 | Video-based face tracking is not supported on this device or platform. |
| `NoAudio` | 7 | Audio input is unavailable because `SoundService` could not be found or connected. |
| `AudioError` | 8 | A generic audio error occurred during face-tracking audio input processing. |
| `AudioNoPermission` | 9 | The user denied microphone permission required for audio-based face tracking. |
| `UnsupportedDevice` | 10 | The current device or platform does not support face tracking. |

---
*Source: [TrackerError](https://create.roblox.com/docs/reference/engine/enums/TrackerError) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
