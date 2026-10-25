---
area: "15 AI Tools and Workflow"
cluster: "Open Source Licensing"
source_note: "24_Visual_Reference_Production/29_Official_Roblox_Rendering_and_Art_Sources"
title: "Official Roblox Rendering & Art Sources — October 2026"
tags: [roblox, premium, visual-reference, "cluster/open-source-licensing"]
verified: 2026-10-25
cssclasses: [tg-a15]
---

# Official Roblox Rendering & Art Sources — October 2026

Use current official documentation for engine behavior and limits. These were checked during the visual-reference expansion.

## Core sources
- Lighting and effects: https://create.roblox.com/docs/environment
- Post-processing: https://create.roblox.com/docs/environment/post-processing-effects
- Terrain: https://create.roblox.com/docs/parts/terrain
- PBR / SurfaceAppearance: https://create.roblox.com/docs/art/modeling/surface-appearance
- Materials / MaterialVariant: https://create.roblox.com/docs/parts/materials
- Mesh specifications: https://create.roblox.com/docs/art/modeling/specifications
- Meshes: https://create.roblox.com/docs/parts/meshes
- Character appearance: https://create.roblox.com/docs/characters/appearance
- Layered accessories: https://create.roblox.com/docs/avatar/layered-accessories
- Characters / Avatar Setup: https://create.roblox.com/docs/characters
- Instance streaming: https://create.roblox.com/docs/workspace/streaming
- Performance improvement: https://create.roblox.com/docs/performance-optimization/improve
- Performance design: https://create.roblox.com/docs/performance-optimization/design
- Physics: https://create.roblox.com/docs/physics
- Network ownership: https://create.roblox.com/docs/physics/network-ownership

## Current facts worth remembering
- General individual meshes have a 20,000-triangle ceiling; avatar items have their own budgets.
- SurfaceAppearance supports PBR workflows; current official PBR documentation includes color, normal, roughness, metalness and emissive map support.
- MaterialVariant is useful for reusable tileable custom materials; SurfaceAppearance is for UV-mapped mesh appearance.
- Instance streaming dynamically loads/unloads world content and can improve join time, memory and performance.
- Physics network ownership can improve responsiveness/performance but creates security implications for gameplay-critical physics.

Recheck dated limits before a major release because Roblox changes.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Licensing - Hub|Open Source Licensing]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]]

<!-- TDOD_GRAPH_END -->
