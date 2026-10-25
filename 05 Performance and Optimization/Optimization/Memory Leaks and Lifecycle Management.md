---
area: "05 Performance and Optimization"
cluster: "Optimization"
source_note: "23_Expanded_Knowledge/21_Memory_Leaks_and_Lifecycle_Management"
title: "Memory Leaks & Lifecycle Management"
tags: [roblox, premium, "cluster/optimization"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Memory Leaks & Lifecycle Management

Long-session performance bugs often come from objects that were supposed to die but still have references or connections.

## Common leaks
- event connections never disconnected,
- tables holding destroyed instances,
- caches that only grow,
- UI screens duplicated on every open,
- temporary VFX never cleaned,
- task loops that survive the feature that created them.

## Lifecycle pattern
Every system that creates resources should have a clear cleanup path. Group connections/tasks/instances in a cleanup container and destroy them together when state ends.

## Test
Memory should not grow forever while repeatedly opening the same menu or replaying the same round.

## Lab
Run a 100-cycle test: open/close inventory or spawn/despawn an NPC 100 times. Compare memory and instance counts before/after.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Optimization - Hub]]

**Related notes:** [[Spatial Hash for Nearby Queries]] · [[Object Pooling Without Making a Mess]] · [[Instance Streaming Deep Dive]] · [[Production Labs]]

<!-- TDOD_GRAPH_END -->
