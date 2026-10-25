---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
source_note: "21_Advanced_Math/01_Dot_Cross_and_FOV"
title: "Dot Product, Cross Product, and FOV"
tags: [roblox, blueprint, "cluster/math-geometry"]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Dot Product, Cross Product, and FOV

Dot product tells alignment.

```luau
local direction = (target - origin).Unit
local dot = forward:Dot(direction)
```

Use it for vision cones, front/back attacks, aim assist and directional animation logic.

Cross product gives a perpendicular direction and helps determine left/right orientation and construct coordinate bases.

```luau
local side = forward:Cross(Vector3.yAxis)
```

Visualize these vectors with debug beams/parts while learning.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Math Geometry - Hub]]

**Related notes:** [[Math Learning Path for Roblox Developers]] · [[Math for Game Development]]

<!-- TDOD_GRAPH_END -->
