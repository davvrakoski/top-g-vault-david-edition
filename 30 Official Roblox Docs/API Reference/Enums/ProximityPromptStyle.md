---
title: "ProximityPromptStyle"
description: "Specifies the visual style of a `ProximityPrompt`."
api_type: enum
aliases: ["Enum.ProximityPromptStyle"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ProximityPromptStyle"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the visual style of a [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]].*

## Description

Specifies the visual style used by a [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]]. The default value is [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptStyle|Enum.ProximityPromptStyle.Default]], which renders the built-in Roblox CoreScript UI. Set [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#Style|ProximityPrompt.Style]] to [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptStyle|Enum.ProximityPromptStyle.Custom]] to suppress the built-in UI and take full control of prompt rendering by listening to [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptShown|ProximityPromptService.PromptShown]] and [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptHidden|ProximityPromptService.PromptHidden]].

*Code samples for this API (`generating-a-custom-proximity-prompt`) are published on the [source page](https://create.roblox.com/docs/reference/engine/enums/ProximityPromptStyle); their code is not part of the open-source repo.*

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Built-in Roblox CoreScript prompt UI. |
| `Custom` | 1 | Suppresses the built-in prompt UI so you can render a custom prompt (see [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#Style\|ProximityPrompt.Style]]). |

---
*Source: [ProximityPromptStyle](https://create.roblox.com/docs/reference/engine/enums/ProximityPromptStyle) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
