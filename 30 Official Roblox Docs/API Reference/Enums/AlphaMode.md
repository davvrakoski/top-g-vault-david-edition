---
title: "AlphaMode"
description: "Used by `SurfaceAppearance.AlphaMode` to determine how the alpha channel of the `SurfaceAppearance.ColorMap` of a `SurfaceAppearance` is used."
api_type: enum
aliases: ["Enum.AlphaMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AlphaMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used by [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#AlphaMode|SurfaceAppearance.AlphaMode]] to determine how the alpha channel of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|SurfaceAppearance.ColorMap]] of a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] is used.*

## Description

Used by [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#AlphaMode|SurfaceAppearance.AlphaMode]] to determine how the alpha channel of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|SurfaceAppearance.ColorMap]] of a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] is used.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Overlay` | 0 | Overlays the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap\|ColorMap]] on top of the underlying part color based on the map's alpha channel. |
| `Transparency` | 1 | Uses the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap\|ColorMap]] alpha channel to control the transparency of the surface. |
| `TintMask` | 2 | Uses the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap\|ColorMap]] alpha channel to control the amount of [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color\|SurfaceAppearance.Color]] tinting. |
| `Opaque` | 3 | Ignores the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap\|ColorMap]] alpha channel and assumes an opacity value of 1 everywhere. |

---
*Source: [AlphaMode](https://create.roblox.com/docs/reference/engine/enums/AlphaMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
