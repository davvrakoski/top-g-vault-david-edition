---
title: "PromptCreateAvatarResult"
description: "Result codes returned by `AvatarCreationService:PromptCreateAvatarAsync()` indicating whether avatar creation succeeded or why it failed."
api_type: enum
aliases: ["Enum.PromptCreateAvatarResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PromptCreateAvatarResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Result codes returned by [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|AvatarCreationService:PromptCreateAvatarAsync()]] indicating whether avatar creation succeeded or why it failed.*

## Description

Result codes returned by [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|AvatarCreationService:PromptCreateAvatarAsync()]] to indicate the outcome of an in-experience avatar creation flow. A value of [[30 Official Roblox Docs/API Reference/Enums/PromptCreateAvatarResult|Enum.PromptCreateAvatarResult.Success]] means the avatar was created and published; all other values identify the failure reason so the experience can surface an appropriate message to the player.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 1 | The avatar was successfully created and published to the player's account. |
| `PermissionDenied` | 2 | The player explicitly declined the avatar creation consent prompt. |
| `Timeout` | 3 | The avatar creation consent prompt timed out before the player responded. |
| `UploadFailed` | 4 | The avatar assets passed validation but the server-side upload or bundle creation step failed. |
| `NoUserInput` | 5 | The player did not interact with the avatar creation consent prompt before it closed. |
| `InvalidHumanoidDescription` | 6 | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] supplied to [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync\|AvatarCreationService:PromptCreateAvatarAsync()]] was invalid and could not be used to create an avatar. |
| `UGCValidationFailed` | 7 | The avatar's geometry or content failed Roblox's UGC (User-Generated Content) validation checks. |
| `ModeratedName` | 8 | The proposed avatar name or description was rejected by Roblox moderation. |
| `MaxOutfits` | 9 | The player has reached the maximum number of outfits allowed on their Roblox account. |
| `PurchaseFailure` | 10 | The avatar creation attempt failed because the player did not have sufficient Robux to cover the required purchase. |
| `UnknownFailure` | 11 | An unexpected or unclassified failure occurred during avatar creation. |
| `TokenInvalid` | 12 | The creation token provided to [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync\|AvatarCreationService:PromptCreateAvatarAsync()]] was not valid or did not match the current experience. |

---
*Source: [PromptCreateAvatarResult](https://create.roblox.com/docs/reference/engine/enums/PromptCreateAvatarResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
