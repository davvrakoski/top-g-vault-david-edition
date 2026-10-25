---
title: "RecommendationPreferenceTargetType"
description: "Identifies the kind of entity that a preference signal targets when logged via `LogPreferenceEvent()`."
api_type: enum
aliases: ["Enum.RecommendationPreferenceTargetType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RecommendationPreferenceTargetType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies the kind of entity that a preference signal targets when logged via [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogPreferenceEvent|LogPreferenceEvent()]].*

## Description

The kind of entity a preference signal targets when logged via [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogPreferenceEvent|LogPreferenceEvent]]. Determines how the `targetId` parameter is interpreted.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `User` | 0 | The target is another Roblox user. The `targetId` is the user key. |
| `Universe` | 1 | The target is a universe. The `targetId` is the universe ID as a string. |
| `CustomTag` | 2 | The target is a custom content tag. The `targetId` is the tag string. |

---
*Source: [RecommendationPreferenceTargetType](https://create.roblox.com/docs/reference/engine/enums/RecommendationPreferenceTargetType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
