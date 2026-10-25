---
title: "RecommendationPreferenceType"
description: "Identifies the type of preference action (follow, unfollow, mute, or unmute) passed to `LogPreferenceEvent()`."
api_type: enum
aliases: ["Enum.RecommendationPreferenceType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RecommendationPreferenceType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies the type of preference action (follow, unfollow, mute, or unmute) passed to [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogPreferenceEvent|LogPreferenceEvent()]].*

## Description

The type of preference signal logged via [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogPreferenceEvent|LogPreferenceEvent]]. Preference signals capture follow, unfollow, mute, and unmute actions toward another user, a universe, or a custom content tag, and are used by the recommendation engine to personalize future results.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `AddFollow` | 0 | The user started following the target. |
| `RemoveFollow` | 1 | The user stopped following the target. |
| `AddMute` | 2 | The user muted the target. |
| `RemoveMute` | 3 | The user unmuted a previously muted target. |

---
*Source: [RecommendationPreferenceType](https://create.roblox.com/docs/reference/engine/enums/RecommendationPreferenceType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
