---
title: "OutfitType"
description: "Categorizes a saved player outfit by its content type, used to filter or specify outfit type in `AvatarEditorService` methods."
api_type: enum
aliases: ["Enum.OutfitType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/OutfitType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Categorizes a saved player outfit by its content type, used to filter or specify outfit type in [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService|AvatarEditorService]] methods.*

## Description

`OutfitType` is an enum used with [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService|AvatarEditorService]] to distinguish saved player outfits by their content. It is accepted by [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitsAsync|AvatarEditorService:GetOutfitsAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfits|AvatarEditorService:GetOutfits()]] as a filter.

The most common values are [[30 Official Roblox Docs/API Reference/Enums/OutfitType|Enum.OutfitType.Avatar]] (a full-body outfit) and [[30 Official Roblox Docs/API Reference/Enums/OutfitType|Enum.OutfitType.Makeup]] (a makeup-only configuration). Passing [[30 Official Roblox Docs/API Reference/Enums/OutfitType|Enum.OutfitType.All]] to a query method returns outfits of every type with no filtering applied.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `All` | 1 | Returns outfits of every type, with no filtering applied. |
| `Avatar` | 2 | A full-body avatar outfit. |
| `DynamicHead` | 3 | An outfit containing a dynamic head. |
| `Shoes` | 4 | An outfit consisting of a pair of shoes. |
| `Makeup` | 5 | An outfit consisting of makeup items applied to the avatar's face. |

---
*Source: [OutfitType](https://create.roblox.com/docs/reference/engine/enums/OutfitType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
