---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "05_Performance_Engineering/02_Performance_Budget_Template"
title: "Performance Budget Template"
tags: [roblox, premium, "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Performance Budget Template

Budgets should be targets you measure, not universal Roblox laws.

```text
TARGET DEVICES:
TARGET SERVER SIZE:
TARGET FPS:
TARGET JOIN TIME:

CLIENT
- frame time target:
- script time target:
- memory target by device tier:
- active particles near camera:
- shadow-casting local lights:
- max active ragdolls:
- max visible NPCs:

SERVER
- heartbeat/frame target:
- active full AI:
- reduced AI:
- path requests/second target:
- expensive raycasts/second target:
- remote messages/player/second by system:
- save writes/minute:

CONTENT
- mesh triangle budget by role:
  hero:
  gameplay prop:
  background prop:
- texture target by visible screen size:
- debris lifetime:
- decal cap per zone:
```

The point is to catch regressions. A fixed "every model must be 5,000 triangles" rule is usually worse than a role- and distance-based budget.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance - Hub]]

**Related notes:** [[Performance Log]] · [[Performance Audit Procedure]] · [[Performance Log Template]] · [[Feature Design Template]]

<!-- TDOD_GRAPH_END -->
