---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
source_note: "07_3D_Art_Pipeline/01_Official_Mesh_Budgets_2026"
title: "Roblox Mesh and Avatar Geometry Specs — 2026 Snapshot"
tags: [roblox, premium, "cluster/3d-modeling-blender"]
verified: 2026-10-25
cssclasses: [tg-a10]
---

# Roblox Mesh and Avatar Geometry Specs — 2026 Snapshot

These are **platform limits/specifications**, not automatic recommended budgets for every prop.

## General imported mesh

Roblox's current general modeling specifications state an individual mesh cannot exceed **20,000 triangles**. Geometry should be watertight, avoid exposed backfaces/holes, and use quads where possible during modeling rather than relying on N-gons.

Source: https://create.roblox.com/docs/art/modeling/specifications

## Avatar Setup body guidance

Current Avatar Setup requirements list a total body mesh budget of **10,742 triangles**, with guidance including approximately:
- Head: 4,000 triangles
- Each arm: 1,248
- Each leg: 1,248
- Torso: 1,750

Avatar Setup processing can add geometry, so being exactly at the limit can still cause validation trouble.

Source: https://create.roblox.com/docs/avatar-setup/auto-setup-requirements

## Production recommendation

Do not use 20,000 triangles just because you are allowed to. Set budgets by role:
- hero/close camera
- gameplay prop
- repeated prop
- background prop
- impostor/LOD

Silhouette matters more than hidden edge loops.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[3D Modeling Blender - Hub]]

**Related notes:** [[Tripo - AI 3D Model Workflow]] · [[Prompt Library for Tripo - 3D Generation]] · [[Blender Game-Ready Audit]] · [[Tripo → Blender → Roblox Production Pipeline]]

<!-- TDOD_GRAPH_END -->
