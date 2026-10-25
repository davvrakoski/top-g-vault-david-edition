---
title: "TrackerPromptEvent"
description: "Indicates the type of prompt fired by the face tracker when a runtime condition requires user attention."
api_type: enum
aliases: ["Enum.TrackerPromptEvent"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TrackerPromptEvent"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the type of prompt fired by the face tracker when a runtime condition requires user attention.*

## Description

Enumerates the categories of prompt events raised by `RTAnimationTracker` and `FaceAnimatorService` via their `TrackerPrompt` events. Each value describes a distinct condition that the face-tracking system wants to surface to experience code so that the experience can react — for example, by displaying UI guidance to the user.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `LODCameraRecommendDisable` | 0 | The LOD controller has determined that device performance is insufficient to sustain camera-based face tracking and recommends disabling camera input. |

---
*Source: [TrackerPromptEvent](https://create.roblox.com/docs/reference/engine/enums/TrackerPromptEvent) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
