---
title: "TrackerMode"
description: "Describes the combination of input sources an `RTAnimationTracker` is currently using to drive animation."
api_type: enum
aliases: ["Enum.TrackerMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TrackerMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the combination of input sources an `RTAnimationTracker` is currently using to drive animation.*

## Description

Describes what combination of input inference modes an `RTAnimationTracker` is currently using. The value is read-only and reflects whether audio-to-curve (a2c) inference, video-to-curve (v2c) inference, both, or neither is active at a given moment.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | No tracking inference is active; the tracker is idle or has not successfully started. |
| `Audio` | 1 | Only audio-to-curve (lipsync) inference is active; no camera-based facial tracking is running. |
| `Video` | 2 | Only video-to-curve facial tracking is active; audio-based lipsync inference is not running. |
| `AudioVideo` | 3 | Both audio-to-curve lipsync inference and video-to-curve facial tracking are active simultaneously. |

---
*Source: [TrackerMode](https://create.roblox.com/docs/reference/engine/enums/TrackerMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
