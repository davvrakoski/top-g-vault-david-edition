---
title: "TrackerLodFlagMode"
description: "Controls whether a real-time face-tracker feature (audio or video) is forced on, forced off, or left to the automatic LOD system."
api_type: enum
aliases: ["Enum.TrackerLodFlagMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TrackerLodFlagMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether a real-time face-tracker feature (audio or video) is forced on, forced off, or left to the automatic LOD system.*

## Description

Type of the `AudioMode` and `VideoMode` properties on `TrackerLodController`. Each defaults to [[30 Official Roblox Docs/API Reference/Enums/TrackerLodFlagMode|Enum.TrackerLodFlagMode.Auto]]. Lets a script force a tracker pipeline (audio-based or video-based facial animation) on or off, or leave the decision to the automatic LOD system.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `ForceFalse` | 0 | Forces the associated tracker feature disabled, regardless of the current LOD state. |
| `ForceTrue` | 1 | Forces the associated tracker feature enabled, regardless of the current LOD state. |
| `Auto` | 2 | Defers the enabled/disabled decision to the automatic LOD system. |

---
*Source: [TrackerLodFlagMode](https://create.roblox.com/docs/reference/engine/enums/TrackerLodFlagMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
