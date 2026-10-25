---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
source_note: "24_Visual_Reference_Production/26_Asset_vs_Effect_Decision_Matrix"
title: "Asset vs Effect Decision Matrix — What Should Be Geometry?"
tags: [roblox, premium, visual-reference, "cluster/3d-modeling-blender"]
verified: 2026-10-25
cssclasses: [tg-a10]
---

# Asset vs Effect Decision Matrix — What Should Be Geometry?

Many visual problems get expensive because developers solve them with the wrong tool.

## Use geometry when
- silhouette must hold from many angles,
- the object needs collision,
- the shape is persistent,
- parallax/depth is important,
- the detail is large enough to affect form.

## Use texture/normal/roughness when
- the detail is surface-level,
- it does not change silhouette,
- it repeats across material families,
- lighting should reveal it.

## Use particles when
- the element is transient,
- many small sprites/meshes form a volume,
- exact persistent geometry is unnecessary.

## Use Beam/Trail when
- you need a directional ribbon/line,
- sword motion, laser, arc, tether or streak is the read.

## Use lighting/post effects when
- the whole scene/player view needs a mood/response,
- not when one prop needs more geometry.

## Use Lua animation only when
behavior must change over time. A static rock does not need a Heartbeat connection.

## Example
Rock crack: normal map.
Large cliff fracture: geometry.
Dust: particles.
Sword streak: Trail/Beam.
Explosion damage: server logic.
Explosion fire: client VFX.

Related: [[Reference Decomposition Method — Turn Any Image Into a Build Plan|Reference Decomposition]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[3D Modeling Blender - Hub|3D Modeling Blender]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->
