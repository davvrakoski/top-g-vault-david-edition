---
title: "AvatarSettingsScaleMode"
description: "Determines whether the experience enforces a custom height range on player characters or allows players to spawn at their natural avatar height."
api_type: enum
aliases: ["Enum.AvatarSettingsScaleMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsScaleMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether the experience enforces a custom height range on player characters or allows players to spawn at their natural avatar height.*

## Description

Determines whether the experience overrides player character height with a creator-defined range or leaves it at the player's own avatar height. Used by `ScaleMode`. When set to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsScaleMode|Enum.AvatarSettingsScaleMode.CustomScale]], the engine clamps character height to `CustomHeight` and applies layered clothing bounds from the resulting body extents. Defaults to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsScaleMode|Enum.AvatarSettingsScaleMode.PlayerChoice]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PlayerChoice` | 0 | Characters spawn at their natural avatar height without any experience-level height override. This is the default value. |
| `CustomScale` | 1 | The experience clamps the character's height to the range specified by `CustomHeight`, overriding the player's natural avatar height. |

---
*Source: [AvatarSettingsScaleMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsScaleMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
