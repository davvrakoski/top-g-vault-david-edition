---
title: "ViewMode"
description: "Controls which debug rendering visualization overlay is displayed in the Studio viewport via `RenderSettings.ViewMode`."
api_type: enum
aliases: ["Enum.ViewMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ViewMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls which debug rendering visualization overlay is displayed in the Studio viewport via [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#ViewMode|RenderSettings.ViewMode]].*

## Description

Controls which debug rendering visualization overlay is drawn over the Studio viewport. The visualization highlights overdraw for geometry, transparency, or decals, or disables the overlay entirely. Assigned through [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#ViewMode|RenderSettings.ViewMode]], which defaults to [[30 Official Roblox Docs/API Reference/Enums/ViewMode|Enum.ViewMode.None]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | Disables the debug rendering visualization overlay; the default value of [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#ViewMode\|RenderSettings.ViewMode]]. |
| `GeometryComplexity` | 1 | Displays an overdraw visualization highlighting geometric complexity across rendered surfaces. |
| `Transparent` | 2 | Displays an overdraw visualization highlighting surfaces rendered with transparency. |
| `Decal` | 3 | Displays an overdraw visualization highlighting surfaces rendered with decals. |

---
*Source: [ViewMode](https://create.roblox.com/docs/reference/engine/enums/ViewMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
