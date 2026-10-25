---
title: "RecommendationActionType"
description: "Describes the type of action a user took on a recommended item, used when logging action events via `RecommendationService:LogActionEvent()`."
api_type: enum
aliases: ["Enum.RecommendationActionType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RecommendationActionType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the type of action a user took on a recommended item, used when logging action events via [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogActionEvent|RecommendationService:LogActionEvent()]].*

## Description

Action a user performed on a recommended item. Pass as the first argument to [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogActionEvent|RecommendationService:LogActionEvent()]] to record interaction signals used for personalization.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `AddReaction` | 0 | The user added a reaction to the item, such as a "like". |
| `RemoveReaction` | 1 | The user removed a reaction from the item. |
| `Share` | 2 | The user shared the item. |
| `Report` | 3 | The user created an abuse report of the item. |
| `Comment` | 4 | The user commented on the item. |
| `Play` | 5 | The user joined an experience through the item, or played a mini-game associated with the item. |
| `Purchase` | 6 | The user made a purchase from the item. |

---
*Source: [RecommendationActionType](https://create.roblox.com/docs/reference/engine/enums/RecommendationActionType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
