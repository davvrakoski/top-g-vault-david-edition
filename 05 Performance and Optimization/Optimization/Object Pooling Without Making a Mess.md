---
area: "05 Performance and Optimization"
cluster: "Optimization"
source_note: "05_Performance_Engineering/06_Object_Pooling_Pattern"
title: "Object Pooling Without Making a Mess"
tags: [roblox, premium, "cluster/optimization"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Object Pooling Without Making a Mess

Pooling is useful when creating/destroying the same expensive object type frequently. It is not automatically faster for everything.

Good candidates:
- repeated projectile visuals
- blood/dust impact emitters
- temporary damage-number frames
- debris shells

Poor candidates:
- rare objects
- objects with complicated state that is easy to forget to reset
- objects whose memory footprint is more harmful than creation cost

Reset checklist before returning an object:
- connections disconnected
- velocity reset
- transparency reset
- particle emitters disabled/cleared
- attributes reset
- parent moved to pool container
- ownership/state references cleared

Measure allocation/GC behavior before deciding pooling is necessary.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Optimization - Hub]]

**Related notes:** [[Production Labs]] · [[Spatial Hash for Nearby Queries]] · [[Memory Leaks and Lifecycle Management]] · [[Instance Streaming Deep Dive]]

<!-- TDOD_GRAPH_END -->
