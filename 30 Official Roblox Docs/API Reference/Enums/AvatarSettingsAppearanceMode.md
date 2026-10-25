---
title: "AvatarSettingsAppearanceMode"
description: "Determines how the avatar's body-part appearance is sourced in an experience that uses `AvatarBodyRules`."
api_type: enum
aliases: ["Enum.AvatarSettingsAppearanceMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsAppearanceMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines how the avatar's body-part appearance is sourced in an experience that uses `AvatarBodyRules`.*

## Description

Used by `AppearanceMode` to control whether players retain their own avatar body parts or the experience overrides them with custom assets. Defaults to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsAppearanceMode|Enum.AvatarSettingsAppearanceMode.PlayerChoice]].

When set to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsAppearanceMode|Enum.AvatarSettingsAppearanceMode.CustomParts]], individual body parts (head, face, torso, arms, legs, eyebrows, eyelashes, mood) can each be independently enabled and assigned a custom asset ID. When set to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsAppearanceMode|Enum.AvatarSettingsAppearanceMode.CustomBody]], the entire body is replaced as a single unit using `CustomBodyType` and `CustomBodyBundleId`.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PlayerChoice` | 0 | **Deprecated.** Players keep their own avatar body parts; the experience does not override any body-part assets. |
| `CustomParts` | 1 | **Deprecated.** The experience overrides individual body parts (head, face, torso, arms, legs) using per-part asset IDs and enablement settings on `AvatarBodyRules`. |
| `CustomBody` | 2 | **Deprecated.** The experience replaces the avatar's entire body as a single unit, using `CustomBodyType` and `CustomBodyBundleId`. |

---
*Source: [AvatarSettingsAppearanceMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsAppearanceMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
