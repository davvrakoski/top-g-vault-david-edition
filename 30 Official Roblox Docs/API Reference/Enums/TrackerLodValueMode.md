---
title: "TrackerLodValueMode"
description: "Controls how the video LOD level is selected for the face-tracking pipeline in `TrackerLodController`."
api_type: enum
aliases: ["Enum.TrackerLodValueMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TrackerLodValueMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how the video LOD level is selected for the face-tracking pipeline in `TrackerLodController`.*

## Description

Specifies whether the face-tracking video LOD level is chosen automatically by the performance-adaptive LOD controller or forced to a fixed level. Used by `VideoLodMode`, which defaults to [[30 Official Roblox Docs/API Reference/Enums/TrackerLodValueMode|Enum.TrackerLodValueMode.Auto]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Force0` | 0 | Forces the face-tracking video pipeline to LOD level 0, the faster but less accurate processing mode. |
| `Force1` | 1 | Forces the face-tracking video pipeline to LOD level 1, the more accurate but more resource-intensive processing mode. |
| `Auto` | 2 | The LOD controller selects the video LOD level automatically based on real-time performance metrics. |

---
*Source: [TrackerLodValueMode](https://create.roblox.com/docs/reference/engine/enums/TrackerLodValueMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
