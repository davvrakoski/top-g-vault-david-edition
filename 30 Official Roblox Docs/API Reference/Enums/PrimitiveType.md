---
title: "PrimitiveType"
description: "Identifies the base primitive shape of a `BasePart` node within a CSG operation graph."
api_type: enum
aliases: ["Enum.PrimitiveType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PrimitiveType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies the base primitive shape of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] node within a CSG operation graph.*

## Description

Identifies the base primitive shape of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] node within a CSG (Constructive Solid Geometry) operation graph (`OperationGraph`). Used when performing union, negate, and intersect operations to determine how each input part's geometry is represented during the operation.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Null` | 0 | Sentinel value indicating no valid primitive shape; used for uninitialized or invalid nodes in a CSG operation graph. |
| `Ball` | 1 | A spherical primitive shape, corresponding to the ball/sphere geometry of a [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]]. |
| `Cylinder` | 2 | A cylindrical primitive shape, corresponding to the cylinder geometry of a [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]]. |
| `Block` | 3 | A box primitive shape, corresponding to the standard rectangular block geometry of a [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]]; the default primitive type for new Part nodes in a CSG operation graph. |
| `Wedge` | 4 | A wedge primitive shape, corresponding to the geometry of a [[30 Official Roblox Docs/API Reference/Classes/WedgePart\|WedgePart]]. |
| `CornerWedge` | 5 | A corner wedge primitive shape, corresponding to the geometry of a [[30 Official Roblox Docs/API Reference/Classes/CornerWedgePart\|CornerWedgePart]]. |

---
*Source: [PrimitiveType](https://create.roblox.com/docs/reference/engine/enums/PrimitiveType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
