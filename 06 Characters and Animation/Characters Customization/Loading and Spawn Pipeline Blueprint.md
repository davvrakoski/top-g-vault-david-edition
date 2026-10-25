---
area: "06 Characters and Animation"
cluster: "Characters Customization"
source_note: "19_System_Blueprints/25_Loading_and_Spawn_Pipeline"
title: "Loading and Spawn Pipeline Blueprint"
tags: [roblox, blueprint, "cluster/characters-customization"]
verified: 2026-10-25
cssclasses: [tg-a06]
---

# Loading and Spawn Pipeline Blueprint

Target: player reaches controllable gameplay quickly.

1. ReplicatedFirst shows minimal loading UI.
2. Critical spawn-area content is available.
3. Player data loads with failure handling.
4. Character spawns/initializes.
5. UI/controllers initialize.
6. Streaming continues around player.
7. Optional/noncritical assets load later.

Do not preload the whole game just to make a progress bar reach 100%.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Customization - Hub]]

**Related notes:** [[Character Controllers]] · [[Character Customization]] · [[Character Damage, Limbs and Status Model]] · [[Character Customization Blueprint]]

<!-- TDOD_GRAPH_END -->
