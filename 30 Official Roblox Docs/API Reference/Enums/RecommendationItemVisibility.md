---
title: "RecommendationItemVisibility"
description: "Controls whether a registered recommendation item is publicly discoverable or restricted to private access."
api_type: enum
aliases: ["Enum.RecommendationItemVisibility"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RecommendationItemVisibility"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether a registered recommendation item is publicly discoverable or restricted to private access.*

## Description

Controls whether a recommendation item registered via [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#RegisterItemAsync|RecommendationService:RegisterItemAsync()]] or updated via [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#UpdateItemAsync|RecommendationService:UpdateItemAsync()]] is publicly discoverable by the recommendation system or kept private. Pass the desired value in the `Visibility` field of the request dictionary.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Private` | 0 | The recommendation item is not surfaced to other players by the recommendation system. |
| `Public` | 1 | The recommendation item is discoverable and may be surfaced to other players by the recommendation system. |

---
*Source: [RecommendationItemVisibility](https://create.roblox.com/docs/reference/engine/enums/RecommendationItemVisibility) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
