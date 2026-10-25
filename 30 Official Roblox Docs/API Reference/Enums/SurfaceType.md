---
title: "SurfaceType"
description: "Used to determine how a surface should be displayed on a part and how automatic surface joints should behave."
api_type: enum
aliases: ["Enum.SurfaceType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SurfaceType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used to determine how a surface should be displayed on a part and how automatic surface joints should behave.*

> [!warning] Deprecated
> **SurfaceType** joining is deprecated, leaving only visual changes on the
> affected `Class.Part`. It should not be used for future work.

## Description

Used to determine how a surface should be displayed on a part and how automatic surface joints should behave.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Smooth` | 0 | Adds no details on the surface. |
| `Glue` | 1 | Adds an "X" pattern across the surface. |
| `Weld` | 2 | Adds an "X" pattern across the surface. |
| `Studs` | 3 | Adds square studs across the surface. |
| `Inlet` | 4 | Adds square holes across the surface where studs would be. |
| `Universal` | 5 | Adds a checker pattern to the surface using studs and inlets. |
| `Hinge` | 6 | Adds a yellow hinge to the surface. Parts touching it stick to the surface, allowing for rotations using physics. This should not be used for future work and existing instances should be replaced with a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]]. |
| `Motor` | 7 | Functioned identically to a hinge with the addition of a grey ring. |
| `SteppingMotor` | 8 | Functioned identically to a motor. It may have functioned differently in the past, but that functionality is non-existent. |
| `SmoothNoOutlines` | 10 | Previously similar to **Smooth** with outlines but no longer relevant since outlines have been removed. |

---
*Source: [SurfaceType](https://create.roblox.com/docs/reference/engine/enums/SurfaceType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
