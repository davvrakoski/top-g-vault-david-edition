---
title: "CollisionFidelity"
description: "Determines behavior of the collision hitbox for `MeshPart` and `PartOperation` instances."
api_type: enum
aliases: ["Enum.CollisionFidelity"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CollisionFidelity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines behavior of the collision hitbox for [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] instances.*

## Description

Determines behavior of the collision hitbox for [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] instances. See [[30 Official Roblox Docs/Workspace/Collisions|here]] for a visual representation of the various options.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Collision model uses a voxel-based convex-hull decomposition that is relatively fast but may not be highly accurate, especially for holes, doorways, and cavities in general. |
| `Hull` | 1 | Collision model uses the convex hull of the visual mesh. |
| `Box` | 2 | Collision model uses a bounding box that encompasses the visual mesh. |
| `PreciseConvexDecomposition` | 3 | Collison model uses a convex-hull decomposition of the visual mesh which is computed by a variation of an algorithm called HACD. This option is the most accurate representation of collision geometry for complex objects with built-in tolerances to reduce the total number of convex-hulls by compromising on accuracy when justified. |
| `Tunable` | 4 | Collision model that supports precision tuning of convex decomposition fidelity. |

---
*Source: [CollisionFidelity](https://create.roblox.com/docs/reference/engine/enums/CollisionFidelity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
