---
title: "PredictiveStreamingMode"
description: "Used with `Workspace.PredictiveStreamingMode` to control whether the engine streams instances predictively."
api_type: enum
aliases: ["Enum.PredictiveStreamingMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PredictiveStreamingMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used with [[30 Official Roblox Docs/API Reference/Classes/Workspace#PredictiveStreamingMode|Workspace.PredictiveStreamingMode]] to control whether the engine streams instances predictively.*

## Description

Used by [[30 Official Roblox Docs/API Reference/Classes/Workspace#PredictiveStreamingMode|Workspace.PredictiveStreamingMode]] to control whether streaming pre-fetches content in the predicted direction of player movement, reducing visible pop-in. [[30 Official Roblox Docs/API Reference/Enums/PredictiveStreamingMode|Enum.PredictiveStreamingMode.Enabled]] uses player velocity and heading to pre-fetch beyond the current position-based radius. [[30 Official Roblox Docs/API Reference/Enums/PredictiveStreamingMode|Enum.PredictiveStreamingMode.Disabled]] uses only the position-based radius. [[30 Official Roblox Docs/API Reference/Enums/PredictiveStreamingMode|Enum.PredictiveStreamingMode.Default]] uses the engine's current default behavior for predictive streaming.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Uses the engine's current default behavior for predictive streaming. |
| `Enabled` | 1 | Enables predictive streaming, pre-fetching content in the direction of player movement to reduce pop-in. |
| `Disabled` | 2 | Disables predictive streaming; content is streamed based on the player's current position radius only. |

---
*Source: [PredictiveStreamingMode](https://create.roblox.com/docs/reference/engine/enums/PredictiveStreamingMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
