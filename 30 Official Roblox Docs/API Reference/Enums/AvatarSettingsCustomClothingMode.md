---
title: "AvatarSettingsCustomClothingMode"
description: "Determines whether an experience overrides a player's classic 2D or layered 3D clothing with creator-specified assets or preserves the player's own clothing choices."
api_type: enum
aliases: ["Enum.AvatarSettingsCustomClothingMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsCustomClothingMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether an experience overrides a player's classic 2D or layered 3D clothing with creator-specified assets or preserves the player's own clothing choices.*

## Description

Determines whether the classic 2D clothing or layered 3D clothing worn by player avatars in an experience is controlled by the creator or left to each player's own selection. Used by `AvatarClothingRules.CustomClothingMode` within `AvatarSettings`.

When set to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsCustomClothingMode|Enum.AvatarSettingsCustomClothingMode.CustomClothing]], the engine applies the asset IDs from the `AvatarClothingRules` custom clothing properties to each player's [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] on join, replacing the player's equipped clothing.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PlayerChoice` | 0 | **Deprecated.** Players keep their own clothing selections. The experience does not override clothing assets. This is the default value. |
| `CustomClothing` | 1 | **Deprecated.** The experience enforces creator-specified clothing assets from `AvatarClothingRules`, overriding each player's own equipped clothing. |

---
*Source: [AvatarSettingsCustomClothingMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsCustomClothingMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
