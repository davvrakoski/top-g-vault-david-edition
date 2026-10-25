---
title: "SlimTintMode"
description: "Determines the color-coding mode used by the SLIM debug tint overlay in the Developer Console."
api_type: enum
aliases: ["Enum.SlimTintMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SlimTintMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the color-coding mode used by the SLIM debug tint overlay in the Developer Console.*

## Description

Determines the color-coding mode used by the SLIM debug tint overlay. Select a mode via the **DebugVisualizations** panel in the Developer Console to color-code meshes by different criteria.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | No tint is applied. Meshes render with their normal appearance. |
| `LevelOfDetail` | 1 | Colors each mesh by its current level of detail. Blue is the coarsest, red the finest, and every rank in between maps to a fixed color. A given color always means the same LOD rank across every mesh, with the exception that each mesh's own highest available LOD is always shown red. |
| `DataModelState` | 5 | Colors SLIM models by whether their DataModel instances are streamed in or out. Green indicates streamed in (full DataModel present); yellow indicates streamed out (a placeholder). Both are still rendered via SLIM. |
| `TranscoderStatus` | 6 | Colors each SLIM model by its [[30 Official Roblox Docs/API Reference/Enums/SlimTranscoderStatus\|Enum.SlimTranscoderStatus]]. Follow the link to see which color maps to each status. |

---
*Source: [SlimTintMode](https://create.roblox.com/docs/reference/engine/enums/SlimTintMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
