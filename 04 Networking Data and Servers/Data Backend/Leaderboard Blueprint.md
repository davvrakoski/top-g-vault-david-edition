---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
source_note: "19_System_Blueprints/10_Leaderboards"
title: "Leaderboard Blueprint"
tags: [roblox, blueprint, "cluster/data-backend"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Leaderboard Blueprint

Choose leaderboard type first:

Persistent all-time -> DataStore/OrderedDataStore pattern.
Temporary seasonal/daily high-throughput -> MemoryStore may be useful depending on design, with durable finalization if history must persist.

Never accept a score from client without validating how it was earned.

For competitive boards, log enough evidence to investigate impossible score jumps.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Data Backend - Hub]]

**Related notes:** [[DataStore vs MemoryStore vs Messaging vs Configs]] · [[Data, Saving and Cross-server Systems]] · [[Save Schema Migration Blueprint]] · [[DataStore Production Patterns]]

<!-- TDOD_GRAPH_END -->
