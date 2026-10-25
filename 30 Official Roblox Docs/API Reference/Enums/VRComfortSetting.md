---
title: "VRComfortSetting"
description: "Named presets for VR comfort assists such as vignette, smooth rotation, and third-person follow camera."
api_type: enum
aliases: ["Enum.VRComfortSetting"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/VRComfortSetting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Named presets for VR comfort assists such as vignette, smooth rotation, and third-person follow camera.*

## Description

Named presets for VR comfort assists. `Comfort`, `Normal`, and `Expert` are fixed combinations of vignette, smooth rotation, and third-person follow camera. `Custom` is not a fixed combination: it lets those assists be configured independently. The [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings|UserGameSettings]] property that stores this value is RobloxScript-secured and hidden from the Properties window.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Comfort` | 0 | Most restrictive comfort preset: enables vignette, disables smooth rotation, and disables the third-person follow camera. |
| `Normal` | 1 | Default balanced preset: enables vignette and third-person follow camera while keeping smooth rotation disabled. |
| `Expert` | 2 | Least restrictive comfort preset: disables vignette and enables both smooth rotation and the third-person follow camera. |
| `Custom` | 3 | Lets vignette, smooth rotation, and third-person follow camera be configured independently rather than as a fixed preset. |

---
*Source: [VRComfortSetting](https://create.roblox.com/docs/reference/engine/enums/VRComfortSetting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
