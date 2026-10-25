---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "03_Data_Performance_Worlds/08_PERFORMANCE_and_PROFILING"
title: "PERFORMANCE & PROFILING"
tags: [roblox, tdod-vault, reference, "cluster/performance"]
status: verified-baseline
cssclasses: [tg-a05]
---

# PERFORMANCE & PROFILING

=================================================

THE MOST IMPORTANT PERFORMANCE RULE:
PROFILE FIRST.

TOOLS:
- MicroProfiler
- Script Profiler
- Developer Console
- Stats
- network statistics
- device testing
- server test with multiple clients

COMMON CPU PROBLEMS:
- expensive Heartbeat/RenderStepped loops
- pathfinding every frame
- raycasting thousands of times per frame
- huge table scans
- deep clones
- excessive instance creation/destruction
- too many active NPC brains
- expensive physics
- too many event callbacks doing heavy work

COMMON GPU PROBLEMS:
- excessive transparency
- too many particles
- too many dynamic lights/shadows
- oversized meshes
- unnecessarily high render fidelity
- giant full-resolution textures everywhere
- too much screen-space post-processing
- expensive effects layered on top of each other

COMMON MEMORY PROBLEMS:
- giant ReplicatedStorage
- too many unique textures
- too many high-resolution meshes
- preloading the entire world
- duplicated assets
- retained references preventing cleanup

COMMON NETWORK PROBLEMS:
- firing remotes every frame
- sending huge tables
- replicating cosmetic-only objects from server
- sending full state instead of deltas
- needless property changes

OPTIMIZATION LADDER:
1. Remove work.
2. Do work less often.
3. Do work only near the player.
4. Do work only when state changes.
5. Batch work.
6. Cache safe results.
7. Pool frequently reused objects.
8. Stream content.
9. Lower detail at distance.
10. Parallelize proven CPU-heavy independent work.

NPC UPDATE TIERS:
0-50 studs: full behavior / combat
50-150: reduced sensing and path updates
150-300: simplified simulation
300+: sleep, despawn, or server-simplified logic

Do not use these distances blindly. Tune them to your game.

PARTICLE RULE:
A particle that nobody can see should not be updating.

LIGHT RULE:
Small decorative objects often do not need shadows.

NETWORK RULE:
Replicate state changes, not the same value 60 times per second.

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance - Hub]]

**Related notes:** [[Feature Design Template]] · [[Mobile Performance Deep Dive]] · [[Weather Performance Budgets]] · [[Performance Log]]

<!-- TDOD_GRAPH_END -->
