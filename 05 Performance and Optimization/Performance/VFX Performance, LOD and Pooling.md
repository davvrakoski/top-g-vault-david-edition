---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "24_Visual_Reference_Production/18_VFX_Performance_LOD_and_Pooling"
title: "VFX Performance, LOD & Pooling"
tags: [roblox, premium, visual-reference, "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# VFX Performance, LOD & Pooling

High-quality VFX must survive the worst combat scene, not just a one-effect showcase.

## Main costs
- transparent overdraw,
- large particle counts,
- long particle lifetimes,
- dynamic lights/shadows,
- too many unique textures/materials,
- per-frame Lua control,
- replicated cosmetic instances,
- physics debris.

## Effect LOD
Define effect tiers by camera distance/quality:
**Near:** full effect.
**Mid:** remove secondary particles/lights.
**Far:** one simple flash/trail or nothing.
**Off-screen:** do not spend cosmetic work unless audio/gameplay requires it.

## Client/server split
Server handles truth. Clients handle most purely cosmetic presentation. Do not stream hundreds of cosmetic particle property changes from the server.

## Pooling
Pool expensive/repeated containers when profiling proves churn is a problem. A bad pool that retains thousands of objects can use more memory than normal creation/destruction.

## Stress test
Create a room that triggers the maximum realistic number of simultaneous attacks/explosions. Profile CPU/GPU/memory and tune from that case.

Related: [[Performance Audit Procedure|Performance Audit]] · [[Object Pooling Without Making a Mess|Object Pooling]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance - Hub|Performance]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->
