---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "05_Performance_Engineering/01_Performance_Audit_Procedure"
title: "Performance Audit Procedure"
tags: [roblox, premium, "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Performance Audit Procedure

Do not begin an optimization pass with "reduce polygons." Begin with measurements.

## Step 1 — Reproduce

Capture:
- device/emulator
- player count
- location/map state
- graphics level
- FPS/frame time
- server heartbeat behavior
- memory before and after 10–20 minutes
- network traffic

## Step 2 — Classify bottleneck

**CPU/script:** Script Profiler + MicroProfiler.
**GPU/render:** render/light/particle scopes and graphics-level comparison.
**Memory:** Developer Console memory categories and long-session trend.
**Network:** ProcessPackets, remote frequency, property churn.
**Physics:** assemblies, contacts, unanchored count, constraints.
**Join time:** replicated content, preload strategy, streaming.

## Step 3 — Fix largest cause first

Typical high-value fixes:
- remove unnecessary per-frame callbacks
- change polling to events
- reduce remote frequency and payload size
- keep cosmetic-only objects client-side
- enable/repair streaming
- sleep distant NPCs
- stagger expensive AI work
- cap debris/decals/particles
- reduce dynamic shadow-casting lights
- clean large replicated containers

## Step 4 — Measure again

Record before/after in `PERFORMANCE_LOG.md`. If the metric did not improve, revert or investigate further.

Roblox currently targets 60 FPS by default, roughly 16.67ms per frame with good pacing.

Sources:
- https://create.roblox.com/docs/performance-optimization
- https://create.roblox.com/docs/performance-optimization/improve
- https://create.roblox.com/docs/studio/optimization/scriptprofiler

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance - Hub]]

**Related notes:** [[Weather Performance Budgets]] · [[Performance Log]] · [[Performance Budget Template]] · [[Performance Log Template]]

<!-- TDOD_GRAPH_END -->
