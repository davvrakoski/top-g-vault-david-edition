---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
source_note: "19_System_Blueprints/03_Crafting_System"
title: "Crafting System Blueprint"
tags: [roblox, blueprint, "cluster/inventory-economy"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Crafting System Blueprint

Recipe definitions should be server-owned configuration.

Recipe contains:
- recipe ID
- ingredients + quantities
- station requirement
- unlock requirement
- craft duration
- outputs

Transaction:
1. validate recipe
2. validate station/range if applicable
3. validate ingredients
4. reserve/remove inputs atomically in server state
5. produce output
6. save/replicate

Do not let the client send the output it wants.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Inventory Economy - Hub]]

**Related notes:** [[Crafting Data and Content Tools]] · [[Inventory and Equipment Blueprint]] · [[Experiment Design for Roblox Games]] · [[Client - Server Architecture]]

<!-- TDOD_GRAPH_END -->
