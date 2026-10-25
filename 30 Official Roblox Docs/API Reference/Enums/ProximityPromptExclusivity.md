---
title: "ProximityPromptExclusivity"
description: "Controls how a `ProximityPrompt` competes with other prompts for screen visibility."
api_type: enum
aliases: ["Enum.ProximityPromptExclusivity"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ProximityPromptExclusivity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how a [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] competes with other prompts for screen visibility.*

## Description

Controls whether a [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] is always shown, shares a single global display slot with all other prompts, or competes only with prompts bound to the same input key. Set via the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#Exclusivity|ProximityPrompt.Exclusivity]] property, which defaults to [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptExclusivity|Enum.ProximityPromptExclusivity.OnePerButton]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `OnePerButton` | 0 | One prompt will be shown per input [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]]. |
| `OneGlobally` | 1 | Only one prompt will be shown with this setting. |
| `AlwaysShow` | 2 | This prompt will always show when in range and visible. |

---
*Source: [ProximityPromptExclusivity](https://create.roblox.com/docs/reference/engine/enums/ProximityPromptExclusivity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
