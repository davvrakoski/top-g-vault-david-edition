---
title: "CreateOutfitFailure"
description: "Indicates why a `AvatarEditorService:PromptCreateOutfit()` call failed."
api_type: enum
aliases: ["Enum.CreateOutfitFailure"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CreateOutfitFailure"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates why a [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfit|AvatarEditorService:PromptCreateOutfit()]] call failed.*

## Description

Indicates the reason a [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfit|AvatarEditorService:PromptCreateOutfit()]] call did not successfully create an outfit. The failure code is surfaced through the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfitCompleted|AvatarEditorService.PromptCreateOutfitCompleted]] event alongside an [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult|Enum.AvatarPromptResult.Failed]] result.

*Code samples for this API (`AvatarEditorService-PromptCreateOutfitCompleted`) are published on the [source page](https://create.roblox.com/docs/reference/engine/enums/CreateOutfitFailure); their code is not part of the open-source repo.*

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `InvalidName` | 1 | The outfit name provided by the player was rejected as invalid. |
| `OutfitLimitReached` | 2 | The player has reached the maximum number of saved outfits. |
| `Other` | 3 | The outfit creation failed for an unspecified or unrecognized reason. |

---
*Source: [CreateOutfitFailure](https://create.roblox.com/docs/reference/engine/enums/CreateOutfitFailure) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
