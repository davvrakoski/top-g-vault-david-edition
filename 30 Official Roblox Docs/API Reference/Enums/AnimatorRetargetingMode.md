---
title: "AnimatorRetargetingMode"
description: "Animation Retargeting setting."
api_type: enum
aliases: ["Enum.AnimatorRetargetingMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AnimatorRetargetingMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Animation Retargeting setting.*

## Description

The AnimatorRetargetingMode Enum describes the setting for Animation Retargeting. Retargeting adapts animations to various character rigs based on their proportions.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Retargeting in default state, opt-in initially but subject to change. |
| `Disabled` | 1 | Animation retargeting is off; animations play exactly as authored without adapting joint transforms to the character's body proportions. |
| `Enabled` | 2 | Animation retargeting is always active; the Animator adapts animations to the character's body proportions regardless of the platform default. |

---
*Source: [AnimatorRetargetingMode](https://create.roblox.com/docs/reference/engine/enums/AnimatorRetargetingMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
