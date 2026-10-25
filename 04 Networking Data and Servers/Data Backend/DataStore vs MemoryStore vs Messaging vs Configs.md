---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
source_note: "04_Data_Backend/02_MemoryStore_Messaging_Selection"
title: "DataStore vs MemoryStore vs Messaging vs Configs"
tags: [roblox, premium, "cluster/data-backend"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# DataStore vs MemoryStore vs Messaging vs Configs

Choose the service based on lifetime and access pattern.

| Need | Best starting point |
|---|---|
| Permanent inventory/progression | DataStoreService |
| Temporary matchmaking queue | MemoryStoreService Queue |
| Temporary ordered ranking | MemoryStore SortedMap |
| Temporary keyed shared state/cache | MemoryStore HashMap |
| Lightweight server-to-server notification | MessagingService |
| Read-mostly feature flags/config | Roblox Configs |
| External automation/API | Open Cloud |

Current Roblox documentation states MemoryStore values can live up to **45 days**, but they are still intended for temporary/high-throughput data rather than durable player saves.

Source: https://create.roblox.com/docs/cloud-services/data-stores-vs-memory-stores

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Data Backend - Hub]]

**Related notes:** [[Save Schema Migration Blueprint]] · [[DataStore Production Patterns]] · [[Data, Saving and Cross-server Systems]] · [[Leaderboard Blueprint]]

<!-- TDOD_GRAPH_END -->
