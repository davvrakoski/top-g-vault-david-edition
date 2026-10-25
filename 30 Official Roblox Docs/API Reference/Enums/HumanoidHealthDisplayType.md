---
title: "HumanoidHealthDisplayType"
description: "Controls under what circumstances the `Humanoid` health bar is displayed."
api_type: enum
aliases: ["Enum.HumanoidHealthDisplayType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/HumanoidHealthDisplayType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls under what circumstances the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] health bar is displayed.*

## Description

Controls when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] health bar is displayed. This works in conjunction with the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth|Humanoid.MaxHealth]] property which must have a value higher than zero or the health bar doesn't display.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `DisplayWhenDamaged` | 0 | The humanoid's health bar is only visible when the humanoid is not at full health (assuming `MaxHealth` is greater than zero). |
| `AlwaysOn` | 1 | The humanoid's health bar is always visible (assuming `MaxHealth` is greater than zero). |
| `AlwaysOff` | 2 | The humanoid's health bar is never visible. |

---
*Source: [HumanoidHealthDisplayType](https://create.roblox.com/docs/reference/engine/enums/HumanoidHealthDisplayType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
