---
title: "AvatarSettingsCustomAccessoryMode"
description: "Determines whether `AvatarAccessoryRules` replaces player accessories with experience-defined custom accessories."
api_type: enum
aliases: ["Enum.AvatarSettingsCustomAccessoryMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsCustomAccessoryMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether `AvatarAccessoryRules` replaces player accessories with experience-defined custom accessories.*

## Description

Determines whether `AvatarAccessoryRules` replaces the player's rigid accessories with experience-defined custom accessories. Used by `CustomAccessoryMode`, which defaults to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCustomAccessoryMode|Enum.AvatarSettingsCustomAccessoryMode.PlayerChoice]]. When set to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCustomAccessoryMode|Enum.AvatarSettingsCustomAccessoryMode.CustomAccessories]], the engine removes existing player accessories in each enabled slot and replaces them with the asset IDs specified by the per-slot `Custom*AccessoryEnabled` and `Custom*AccessoryId` properties on `AvatarAccessoryRules`.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PlayerChoice` | 0 | **Deprecated.** No custom accessory replacement is applied; the player's own accessory choices are displayed without modification. |
| `CustomAccessories` | 1 | **Deprecated.** The experience replaces player accessories with custom accessories defined by the per-slot properties on `AvatarAccessoryRules`. |

---
*Source: [AvatarSettingsCustomAccessoryMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsCustomAccessoryMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
