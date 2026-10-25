---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/release-regression-dashboard"
title: "Release Regression Check - Performance Dashboard by Place Version"
tags: [roblox, community, "cluster/performance-and-security", analytics, live-ops, profiling]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/production/analytics/performance
  - https://create.roblox.com/docs/performance-optimization/monitor
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
---
# Release Regression Check - Performance Dashboard by Place Version

Studio can't show what your update does to an Android phone with 3 GB of RAM. The **Performance dashboard** can, once real players arrive. This is a repeatable post-release routine built from the Creator Hub's dashboard documentation. Run it about 1 hour, about 24 hours and about 7 days after every publish.

## Before you rely on it

- Go to **Creator Hub > Creations > your game > Monitoring > Performance**. You need to be the owner or have analytics permissions.
- Client and server **charts appear only for games with at least 100 daily active users**. Below that, use on-device profiling (see [[Performance Hotkeys and Overlays - Quick Reference]]).
- Read percentiles, not averages. **P10** server heartbeat of 40 means 10% of servers run at or below 40 FPS. Your worst players live in the **P10** (FPS) and **P90** (memory, CPU) lines.

## The routine

| Step | Where | Red flag (from the docs) |
|---|---|---|
| 1. Break down by **Place Version** | *Breakdown by* menu | The newest version is worse than the previous one on any chart |
| 2. **Unexpected out-of-memory exits** | Client tab | A spike after the update means a memory regression |
| 3. **Client memory usage percentage** by OS | Client tab | A line nearing 100% (for example Android) means most of those devices are at risk of crashing |
| 4. **Client crash rate** (and **crash count** if the line is dashed) | Client tab | A spike after the update. A dashed line means a small, noisy sample |
| 5. **Client CPU time** | Client tab | Over **16 ms** per frame means under 60 FPS |
| 6. **Server frame rate** and **CPU time** | Server tab | Below 60 FPS / over 16 ms |
| 7. **Server memory** and **memory by age** | Server tab | Over about **3 GB**, or rising as servers get older (a leak) |
| 8. **Cores used per server** | Server tab | Low cores with high CPU time: look at Parallel Luau before paying for compute |
| 9. **Roblox update** annotations | All charts | A shift that lines up with a platform release, not your publish |

The server CPU and memory charts **drill down by process group** (physics, rendering, scripts). The CPU names match **MicroProfiler** labels, and the memory names match `Enum.DeveloperMemoryTag`. So when the dashboard flags a group, take a server MicroProfiler dump and filter to that group.

## When something regressed

1. The docs' first step: check your recent updates and **consider rolling back** if the impact is severe.
2. Reproduce on your **baseline device** in long sessions (10 to 15 minutes, to catch thermal throttling and slow leaks). The Creator Hub's own worked example is a table that grows forever, found by watching memory over a long session.
3. Fix it, publish, then confirm on the dashboard using the Place Version breakdown.

## Release log template

```text
Version: ____  Published: ____ (UTC)
+1h   OOM exits: __  Crash rate: __  P10 client FPS: __  Server P10 FPS: __
+24h  Same + server memory by age trend: rising / flat
+7d   Same + session time vs previous version
Verdict: keep / hotfix / rollback   Owner: ____
```

## Credits

Roblox Creator Hub: *Performance* dashboard, *Monitor performance* and *Test on hardware* (CC BY 4.0). The routine and template are original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Monitor performance]] · [[Server Heartbeat, Ping and Bandwidth Monitoring]] · [[Release Rings and Rollback Strategy]] · [[Performance Log Template]] · [[Developer Console Memory Categories Explained]]

<!-- TDOD_GRAPH_END -->
