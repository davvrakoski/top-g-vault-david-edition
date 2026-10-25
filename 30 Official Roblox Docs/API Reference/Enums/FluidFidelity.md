---
title: "FluidFidelity"
description: "Determines the geometric representation used to compute aerodynamic forces."
api_type: enum
aliases: ["Enum.FluidFidelity"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FluidFidelity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the geometric representation used to compute aerodynamic forces.*

## Description

Determines the geometric representation used to compute aerodynamic forces and torques for [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] instances.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Automatic` | 0 | Let the physics engine select the geometric representation for aerodynamic force and torque calculations. |
| `UseCollisionGeometry` | 1 | Use the current collision geometry specified by [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity\|TriangleMeshPart.CollisionFidelity]] for aerodynamic force and torque calculations . |
| `UsePreciseGeometry` | 2 | Force the engine to compute aerodynamic forces and torques using a more precise geometry representation based on the original mesh. This option may increase join and replication time if used on a large scale. |

---
*Source: [FluidFidelity](https://create.roblox.com/docs/reference/engine/enums/FluidFidelity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
