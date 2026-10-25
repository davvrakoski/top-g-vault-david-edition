---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "19_System_Blueprints/20_Anti_Dupe_Transactions"
title: "Anti-Dupe Transaction Blueprint"
tags: [roblox, blueprint, "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Anti-Dupe Transaction Blueprint

Dupes happen when one valuable action can complete twice under race/retry/disconnect conditions.

Defenses:
- unique item IDs
- server-owned transactions
- idempotency/transaction IDs for sensitive operations
- lock/reservation state where necessary
- single authoritative grant point
- audit logs for high-value trades
- test two simultaneous requests

Do not rely on hiding remotes.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Networking Security - Hub]]

**Related notes:** [[Network Ownership and Physics Replication]] · [[Latency, Prediction and Reconciliation]] · [[Threat Modeling Every Roblox Feature]] · [[Remote Rate Limiting Pattern]]

<!-- TDOD_GRAPH_END -->
