---
title: "GraphicsOptimizationMode"
description: "Specifies the player's preferred trade-off between rendering quality and frame rate when using manual graphics quality."
api_type: enum
aliases: ["Enum.GraphicsOptimizationMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/GraphicsOptimizationMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the player's preferred trade-off between rendering quality and frame rate when using manual graphics quality.*

## Description

Preferred trade-off between visual quality and performance for [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#GraphicsOptimizationMode|UserGameSettings.GraphicsOptimizationMode]] when the player uses **manual** graphics quality. This setting has no effect when graphics quality is automatic. Defaults to [[30 Official Roblox Docs/API Reference/Enums/GraphicsOptimizationMode|Enum.GraphicsOptimizationMode.Balanced]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Performance` | 0 | Prefers frame rate over visual fidelity, corresponding to manual render quality levels 1–3. |
| `Balanced` | 1 | Middle-ground preference, corresponding to manual render quality levels 4–7. This is the default of [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#GraphicsOptimizationMode\|UserGameSettings.GraphicsOptimizationMode]]. |
| `Quality` | 2 | Prefers visual fidelity over frame rate, corresponding to manual render quality levels 8–10. |

---
*Source: [GraphicsOptimizationMode](https://create.roblox.com/docs/reference/engine/enums/GraphicsOptimizationMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
