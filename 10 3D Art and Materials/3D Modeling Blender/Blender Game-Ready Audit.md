---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
source_note: "07_3D_Art_Pipeline/03_Blender_Game_Ready_Audit"
title: "Blender Game-Ready Audit"
tags: [roblox, premium, "cluster/3d-modeling-blender"]
verified: 2026-10-25
cssclasses: [tg-a10]
---

# Blender Game-Ready Audit

## Geometry
- silhouette clean at intended camera distance
- no accidental internal shells
- normals correct
- no unintended doubles
- no destructive modifiers accidentally left unresolved
- triangulation outcome inspected before export when deformation matters

## Topology
- deformation loops around shoulders/elbows/knees
- face topology supports desired expression if animated
- no tiny dense patches that do nothing visually
- avoid long skinny triangles where they create shading/deformation issues

## UV
- no accidental zero-area islands
- seams in sensible locations
- texel density consistent by role
- no wasteful empty atlas space

## Rig
- bind pose correct
- bone names consistent
- weights normalized
- extreme pose test
- no accessory bound to wrong bone

## Export/import
- scale tested with a known Roblox reference
- orientation correct
- material count intentional
- FBX/GLTF options documented for the team
- Roblox import warnings resolved rather than ignored

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[3D Modeling Blender - Hub]]

**Related notes:** [[Prompt Library for Tripo - 3D Generation]] · [[Roblox Mesh and Avatar Geometry Specs — 2026 Snapshot]] · [[Tripo → Blender → Roblox Production Pipeline]] · [[Meshes, Topology and Blender]]

<!-- TDOD_GRAPH_END -->
