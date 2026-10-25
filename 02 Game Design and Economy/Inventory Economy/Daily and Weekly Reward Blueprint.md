---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
source_note: "19_System_Blueprints/07_Daily_Weekly_Rewards"
title: "Daily and Weekly Reward Blueprint"
tags: [roblox, blueprint, "cluster/inventory-economy"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Daily and Weekly Reward Blueprint

Base rewards on server time, not the client's clock.

Track:
- last claim timestamp/day bucket
- streak if used
- reward table version

Protect against:
- replaying a remote
- client changing clock
- double claim from two servers

Be careful with manipulative streak design. Missing one day should not make the system feel punitive unless that is an intentional, appropriate design choice.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Inventory Economy - Hub]]

**Related notes:** [[Client - Server Architecture]] · [[Progression, XP, and Skill Tree Blueprint]] · [[Economy - Inflation, Sources and Sinks]] · [[Inventory, Items and Equipment]]

<!-- TDOD_GRAPH_END -->
