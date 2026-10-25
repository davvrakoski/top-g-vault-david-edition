---
title: "Technology"
description: "Enum used by `Lighting.Technology` to represent the different lighting systems available for rendering the 3D world."
api_type: enum
aliases: ["Enum.Technology"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/Technology"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Enum used by [[30 Official Roblox Docs/API Reference/Classes/Lighting#Technology|Lighting.Technology]] to represent the different lighting systems available for rendering the 3D world.*

## Description

This enum represents the different lighting systems available for rendering the 3D world. It is used by the [[30 Official Roblox Docs/API Reference/Classes/Lighting#Technology|Lighting.Technology]] property.

Note that [[30 Official Roblox Docs/API Reference/Classes/Lighting#Technology|Lighting.Technology]] has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Lighting#LightingStyle|LightingStyle]] which determines the artistic intent behind lighting, and [[30 Official Roblox Docs/API Reference/Classes/Lighting#PrioritizeLightingQuality|PrioritizeLightingQuality]] which indicates whether you prefer lighting/shading quality or view distance to scale down first.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Legacy` | 0 | **Deprecated.**  |
| `Voxel` | 1 | Uses a 4×4×4 voxel map for light and shadow calculation. |
| `Compatibility` | 2 | **Deprecated.** Simulates the removed legacy technology and is now deprecated. To achieve a similar look, use `Voxel` Lighting and add a [[30 Official Roblox Docs/API Reference/Classes/ColorGradingEffect\|ColorGradingEffect]] post‑processing effect set to the [[30 Official Roblox Docs/API Reference/Enums/TonemapperPreset\|Retro]] preset. |
| `ShadowMap` | 3 | Features shadow mapping that produces more realistic and crisp shadows from sunlight or directional light sources. |
| `Future` | 4 | Features the most advanced technology for high-fidelity lighting and shadows. |
| `Unified` | 5 | **Deprecated.**  |

---
*Source: [Technology](https://create.roblox.com/docs/reference/engine/enums/Technology) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
