---
title: "AvatarSettingsAnimationClipsMode"
description: "Determines whether avatar animation clips are defined by the experience or if they are determined by `AnimationPacksMode`."
api_type: enum
aliases: ["Enum.AvatarSettingsAnimationClipsMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsAnimationClipsMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines whether avatar animation clips are defined by the experience or if they are determined by `AnimationPacksMode`.*

## Description

Determines whether custom experience-defined avatar animation clips override the clips determined by the `AnimationPacksMode` setting. This enum is the type of `AnimationClipsMode`, which defaults to [[30 Official Roblox Docs/API Reference/Enums/AvatarSettingsAnimationClipsMode|Enum.AvatarSettingsAnimationClipsMode.PlayerChoice]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PlayerChoice` | 0 | **Deprecated.** The clips determined by the `AnimationPacksMode` are used, without experience-level overrides. |
| `CustomClips` | 1 | **Deprecated.** The experience overrides individual animation clips using the per-clip enabled and ID properties on `AvatarAnimationRules` (for example, `CustomRunAnimationEnabled` and `CustomRunAnimationId`). Only clips whose enabled flag is true are replaced. |

---
*Source: [AvatarSettingsAnimationClipsMode](https://create.roblox.com/docs/reference/engine/enums/AvatarSettingsAnimationClipsMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
