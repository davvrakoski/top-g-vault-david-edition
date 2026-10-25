---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
source_note: "19_System_Blueprints/19_Save_Schema_Migrations"
title: "Save Schema Migration Blueprint"
tags: [roblox, blueprint, "cluster/data-backend"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Save Schema Migration Blueprint

Every player save contains `Version`.

Migration pipeline:
```text
v1 -> v2 -> v3 -> current
```

Each migration is small and deterministic. Never assume every player logged in during the previous update.

Before shipping a migration:
- backup strategy
- test old fixture saves
- test missing fields
- test weird legacy values
- never destroy unknown data casually

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Data Backend - Hub]]

**Related notes:** [[Data, Saving and Cross-server Systems]] · [[Leaderboard Blueprint]] · [[DataStore Production Patterns]] · [[DataStore vs MemoryStore vs Messaging vs Configs]]

<!-- TDOD_GRAPH_END -->
