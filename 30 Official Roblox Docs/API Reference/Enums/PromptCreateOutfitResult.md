---
title: "PromptCreateOutfitResult"
description: "Result codes returned by `AvatarCreationService:PromptCreateMakeupAsync()` that describe the overall makeup look creation outcome."
api_type: enum
aliases: ["Enum.PromptCreateOutfitResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PromptCreateOutfitResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Result codes returned by [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateMakeupAsync|AvatarCreationService:PromptCreateMakeupAsync()]] that describe the overall makeup look creation outcome.*

## Description

Result codes returned by [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateMakeupAsync|PromptCreateMakeupAsync()]]. Use this enum for the overall creation outcome. For a [[30 Official Roblox Docs/API Reference/Enums/PromptCreateOutfitResult|PartialSuccess]] result, inspect the method's per-asset results to determine which submitted assets were created. Partial success does not guarantee that the makeup look itself was created.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 1 | All submitted makeup assets and the makeup look were created successfully. |
| `PartialSuccess` | 2 | At least one makeup asset was created, but one or more assets or the final makeup look composition did not succeed. |
| `CreationFailure` | 3 | No makeup assets could be created, so the makeup look was not created. |
| `PermissionDenied` | 4 | The player declined the makeup creation prompt. |
| `Timeout` | 5 | The makeup creation prompt timed out before the player responded. |
| `NoUserInput` | 6 | The player did not respond to the makeup creation prompt. |
| `UnknownFailure` | 7 | An unexpected or unclassified error prevented makeup look creation. |
| `UGCValidationFailed` | 8 | The makeup assets or creation tokens failed validation before upload. |

---
*Source: [PromptCreateOutfitResult](https://create.roblox.com/docs/reference/engine/enums/PromptCreateOutfitResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
