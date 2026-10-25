---
title: "OutfitSource"
description: "Filters which outfits are returned by `AvatarEditorService:GetOutfitsAsync()` based on how they were obtained."
api_type: enum
aliases: ["Enum.OutfitSource"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/OutfitSource"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Filters which outfits are returned by [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitsAsync|AvatarEditorService:GetOutfitsAsync()]] based on how they were obtained.*

## Description

Specifies whether [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitsAsync|AvatarEditorService:GetOutfitsAsync()]] should return all of a user's outfits, only outfits the user created themselves, or only outfits the user purchased. Pass this value as the `outfitSource` parameter of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitsAsync|AvatarEditorService:GetOutfitsAsync()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `All` | 1 | Return all outfits regardless of whether they were created or purchased. |
| `Created` | 2 | Return only outfits that the user created themselves (editable outfits). |
| `Purchased` | 3 | Return only outfits that the user purchased (non-editable outfits). |

---
*Source: [OutfitSource](https://create.roblox.com/docs/reference/engine/enums/OutfitSource) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
