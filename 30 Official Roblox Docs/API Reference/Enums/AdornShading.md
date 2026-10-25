---
title: "AdornShading"
description: "Determines the shading material and render pass used to draw a handle adornment."
api_type: enum
aliases: ["Enum.AdornShading"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AdornShading"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the shading material and render pass used to draw a handle adornment.*

## Description

Used by the `Shading` property on handle adornments ([[30 Official Roblox Docs/API Reference/Classes/BoxHandleAdornment|BoxHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/SphereHandleAdornment|SphereHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/CylinderHandleAdornment|CylinderHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/ConeHandleAdornment|ConeHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PyramidHandleAdornment|PyramidHandleAdornment]]) to control whether the adornment is drawn unlit or lit by the scene, and whether it renders through occluding geometry or on top of everything.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Draws the adornment unlit and occluded by scene geometry like an ordinary world object. |
| `Shaded` | 1 | Draws the adornment lit by scene lighting and occluded by scene geometry. |
| `XRay` | 2 | Draws the adornment unlit and visible through geometry that would otherwise occlude it. |
| `XRayShaded` | 3 | Draws the adornment lit by scene lighting and visible through geometry that would otherwise occlude it. |
| `AlwaysOnTop` | 4 | Draws the adornment unlit on top of all other geometry with no depth testing. |

---
*Source: [AdornShading](https://create.roblox.com/docs/reference/engine/enums/AdornShading) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
