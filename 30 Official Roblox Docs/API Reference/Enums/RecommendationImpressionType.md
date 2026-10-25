---
title: "RecommendationImpressionType"
description: "Specifies the outcome of rendering a recommended item, passed to `RecommendationService:LogImpressionEvent()` to indicate whether the item was shown to the user."
api_type: enum
aliases: ["Enum.RecommendationImpressionType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RecommendationImpressionType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the outcome of rendering a recommended item, passed to [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogImpressionEvent|RecommendationService:LogImpressionEvent()]] to indicate whether the item was shown to the user.*

## Description

`RecommendationImpressionType` is used as the `impressionType` argument to [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogImpressionEvent|RecommendationService:LogImpressionEvent()]]. It tells the Roblox recommendation backend whether a given item was successfully rendered on the client ([[30 Official Roblox Docs/API Reference/Enums/RecommendationImpressionType|Enum.RecommendationImpressionType.View]]) or whether a rendering error prevented the user from seeing it ([[30 Official Roblox Docs/API Reference/Enums/RecommendationImpressionType|Enum.RecommendationImpressionType.NotViewable]]). The backend uses `NotViewable` as a negative signal when ranking future recommendations.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `View` | 0 | A complete view of the item. |
| `NotViewable` | 1 | The item has failed to render. |

---
*Source: [RecommendationImpressionType](https://create.roblox.com/docs/reference/engine/enums/RecommendationImpressionType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
