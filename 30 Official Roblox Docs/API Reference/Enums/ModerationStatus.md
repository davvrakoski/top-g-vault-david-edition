---
title: "ModerationStatus"
description: "Indicates the moderation review state of an avatar outfit or asset."
api_type: enum
aliases: ["Enum.ModerationStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ModerationStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the moderation review state of an avatar outfit or asset.*

## Description

The `ModerationStatus` enum represents the current moderation review state of avatar content such as outfits and assets. It is returned by [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService|AvatarCreationService]] moderation events — [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#AvatarModerationCompleted|AvatarCreationService.AvatarModerationCompleted]], [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#AvatarAssetModerationCompleted|AvatarCreationService.AvatarAssetModerationCompleted]], and [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#AvatarOutfitModerationCompleted|AvatarCreationService.AvatarOutfitModerationCompleted]] — to communicate the outcome of a moderation check.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `ReviewedApproved` | 1 | The content completed moderation review and was approved for use. |
| `ReviewedRejected` | 2 | The content completed moderation review and was rejected. |
| `NotReviewed` | 3 | The content has been submitted but moderation review is still pending. |
| `NotApplicable` | 4 | Moderation review is not applicable to this content. |
| `Invalid` | 5 | An unrecognized or error moderation status returned when the server response cannot be mapped to a known value. |

---
*Source: [ModerationStatus](https://create.roblox.com/docs/reference/engine/enums/ModerationStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
