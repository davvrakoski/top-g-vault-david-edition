---
title: "FramerateManagerMode"
description: "Controls how the Frame Rate Manager (FRM) adjusts rendering quality to maintain target frame rates."
api_type: enum
aliases: ["Enum.FramerateManagerMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FramerateManagerMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how the Frame Rate Manager (FRM) adjusts rendering quality to maintain target frame rates.*

## Description

Controls how the Frame Rate Manager (FRM) dynamically scales rendering quality — including view distance, block count, and quality level — to meet frame rate targets. The FRM is enabled separately via [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#EnableFRM|RenderSettings.EnableFRM]]; this enum selects its operating mode when active.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Automatic` | 0 | The engine selects whether to run FRM based on hardware and platform context. This is the default. |
| `On` | 1 | FRM is explicitly enabled and dynamically adjusts rendering quality to meet frame rate targets. |
| `Off` | 2 | FRM quality throttling is disabled; block count is fixed at the baseline level regardless of frame rate. |

---
*Source: [FramerateManagerMode](https://create.roblox.com/docs/reference/engine/enums/FramerateManagerMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
