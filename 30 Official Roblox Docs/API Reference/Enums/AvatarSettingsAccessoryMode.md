---
title: "AvatarSettingsAccessoryMode"
description: "Determines whether `AvatarAccessoryRules` enforces custom size limits on rigid accessories worn by player avatars."
api_type: enum
aliases: ["Enum.AvatarSettingsAccessoryMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsAccessoryMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether `AvatarAccessoryRules` enforces custom size limits on rigid accessories worn by player avatars.*

## Description

Determines whether `AvatarAccessoryRules` enforces custom size limits on rigid (non-layered) accessories worn by player avatars in the experience. Used by `AccessoryMode`, which defaults to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsAccessoryMode|Enum.AvatarSettingsAccessoryMode.PlayerChoice]]. When set to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsAccessoryMode|Enum.AvatarSettingsAccessoryMode.CustomLimit]], the engine evaluates each rigid accessory against `LimitBounds` and applies the enforcement strategy in `LimitMethod`.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PlayerChoice` | 0 | No custom size limits are applied to rigid accessories; the player's own accessory choices are displayed without modification. |
| `CustomLimit` | 1 | The experience enforces custom size limits on rigid accessories using the LimitBounds and LimitMethod properties of `AvatarAccessoryRules`. |

---
*Source: [AvatarSettingsAccessoryMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsAccessoryMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
