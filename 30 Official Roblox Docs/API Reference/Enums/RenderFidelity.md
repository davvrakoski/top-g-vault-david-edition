---
title: "RenderFidelity"
description: "Determines the level of detail that solid modeled and mesh parts will be shown in."
api_type: enum
aliases: ["Enum.RenderFidelity"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RenderFidelity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the level of detail that solid modeled and mesh parts will be shown in.*

## Description

This enum determines the level of detail that [[30 Official Roblox Docs/Parts/Meshes|meshes]] and [[30 Official Roblox Docs/Parts/Solid modeling|solid modeled]] parts will be shown in. The default is **Automatic**, meaning the object's detail is based on its distance from the camera as outlined in the following table.

| Distance From Camera | Render Fidelity |
| --- | --- |
| Less than 250 studs | Highest |
| 250 to 500 studs | Medium |
| 500 or more studs | Lowest |

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Automatic` | 0 | Object's level of detail is dynamically controlled by its distance from the camera (see table above). |
| `Precise` | 1 | Object is rendered in the highest fidelity regardless of its distance from the camera. |
| `Performance` | 2 | Push performance as much as possible, trying to maintain quality if possible, and discarding appearance if that's necessary to reach performance. This means that the performance will always be excellent, but mesh visuals may be affected negatively. |

---
*Source: [RenderFidelity](https://create.roblox.com/docs/reference/engine/enums/RenderFidelity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
