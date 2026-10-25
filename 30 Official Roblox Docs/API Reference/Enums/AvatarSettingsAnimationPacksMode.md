---
title: "AvatarSettingsAnimationPacksMode"
description: "Determines which base animation pack is applied to avatar characters, controlling whether players use their own equipped animations or the experience forces a standard R15 or R6 animation set."
api_type: enum
aliases: ["Enum.AvatarSettingsAnimationPacksMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsAnimationPacksMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines which base animation pack is applied to avatar characters, controlling whether players use their own equipped animations or the experience forces a standard R15 or R6 animation set.*

## Description

Determines which base animation pack (locomotion assets such as run, walk, fall, jump, idle, swim, swim idle, and climb) is applied to avatar characters. This is the type of `AvatarAnimationRules.AnimationPacksMode`, which defaults to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsAnimationPacksMode|Enum.AvatarSettingsAnimationPacksMode.PlayerChoice]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PlayerChoice` | 0 | The player's own equipped animation pack is used. The character's Animate script supplies the animations without experience-level overrides. |
| `StandardR15` | 1 | The experience forces the standard R15 animation pack on all characters, overriding player-equipped animations with a fixed set of R15 locomotion clips. |
| `StandardR6` | 2 | The experience forces the standard R6 animation pack on all (R15) characters, overriding player-equipped animations with a fixed set of R6-style locomotion clips plus additional R6-style emote and tool animations. |

---
*Source: [AvatarSettingsAnimationPacksMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsAnimationPacksMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
