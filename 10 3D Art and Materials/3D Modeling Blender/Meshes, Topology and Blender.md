---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
source_note: "04_3D_Art_Materials_Lighting/10_MESHES_TOPOLOGY_and_BLENDER"
title: "MESHES, TOPOLOGY & BLENDER"
tags: [roblox, tdod-vault, reference, "cluster/3d-modeling-blender"]
status: verified-baseline
cssclasses: [tg-a10]
---

# MESHES, TOPOLOGY & BLENDER

=================================================

BASIC TERMS:
Vertex = one point.
Edge = connection between vertices.
Face = polygon surface.
Triangle = 3-sided face.
Quad = 4-sided face.
N-gon = more than 4 sides.
Topology = how vertices/edges/faces flow.
UV = mapping 2D texture space to 3D geometry.
Normal = direction a surface faces for shading.
Rig = skeleton/bones.
Skinning = binding mesh deformation to bones.
Weight paint = how strongly bones affect vertices.
Retopology = rebuilding cleaner/lower-density geometry.
Decimation = automatically reducing geometry.
LOD = lower-detail representation at distance.

TRIANGLES VS QUADS:
- Real-time GPUs ultimately render triangles.
- Quads are often easier to edit, sculpt, loop-select, and deform cleanly in Blender.
- Good deformation topology matters around shoulders, elbows, knees, mouth, eyes.
- A model can look smooth with fewer polygons if silhouette, normals, UVs, textures, and materials are good.
- Hidden geometry still costs something. Remove useless internal surfaces when safe.
- Do not chase a mythical "perfect face count." Use the lowest geometry that preserves silhouette and deformation for the intended camera distance.

HIGH POLY:
Used for sculpting/baking/detail source.

MID POLY:
Useful for hero assets where silhouette and deformation matter.

LOW POLY:
Useful for background objects, stylized games, mobile scale, repeated props, LOD.

GOOD GAME ASSET PIPELINE:
Reference
-> blockout
-> high-detail sculpt if needed
-> retopology
-> UV unwrap
-> bake normals/AO if needed
-> texture
-> rig
-> weight paint
-> animation test
-> LOD/decimation
-> export
-> Roblox import
-> collision setup
-> performance test

BLENDER-READY CHECKLIST:
[ ] correct scale
[ ] applied transforms where appropriate
[ ] clean object names
[ ] correct normals
[ ] no accidental duplicate faces
[ ] no extreme non-manifold problems
[ ] UVs present
[ ] materials named clearly
[ ] skeleton hierarchy clean
[ ] deform bones only when exporting if appropriate
[ ] animation clips named
[ ] root/origin sensible
[ ] separate pieces intentionally separated
[ ] no random floating geometry

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[3D Modeling Blender - Hub]]

**Related notes:** [[Blender Game-Ready Audit]] · [[Tripo → Blender → Roblox Production Pipeline]] · [[Tripo - AI 3D Model Workflow]] · [[Prompt Library for Tripo - 3D Generation]]

<!-- TDOD_GRAPH_END -->
