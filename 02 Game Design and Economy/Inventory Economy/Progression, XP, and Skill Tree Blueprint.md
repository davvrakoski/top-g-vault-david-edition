---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
source_note: "19_System_Blueprints/06_Progression_XP_Skills"
title: "Progression, XP, and Skill Tree Blueprint"
tags: [roblox, blueprint, "cluster/inventory-economy"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Progression, XP, and Skill Tree Blueprint

Keep progression math in shared or server configuration but award truth on server.

Define:
- XP curve function/table
- level cap
- unlock table
- skill prerequisites
- respec rules

For large curves, test time-to-level using simulated sessions. A formula can be mathematically clean but miserable to play.

Always version skill trees so changing prerequisites does not corrupt old saves.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Inventory Economy - Hub]]

**Related notes:** [[Experiment Design for Roblox Games]] · [[Client - Server Architecture]] · [[Daily and Weekly Reward Blueprint]] · [[Economy - Inflation, Sources and Sinks]]

<!-- TDOD_GRAPH_END -->
