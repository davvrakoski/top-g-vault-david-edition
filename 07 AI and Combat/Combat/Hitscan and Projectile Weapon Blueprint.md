---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "19_System_Blueprints/13_Hitscan_and_Projectile_Weapons"
title: "Hitscan and Projectile Weapon Blueprint"
tags: [roblox, blueprint, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Hitscan and Projectile Weapon Blueprint

## Hitscan
Client can immediately render muzzle flash/tracer. Server validates fire cadence, ammo, origin/aim plausibility and performs authoritative hit decision or reconciliation strategy.

## Projectile
Decide whether projectile is:
- authoritative physical object
- server-simulated data with client visuals
- hybrid/predicted presentation

For many fast cosmetic projectiles, spawning full server physics objects can be unnecessary replication/physics cost.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[Config-Driven Weapons]] · [[Damage and Status Effects Blueprint]] · [[Melee Combo Blueprint]] · [[Vehicle Damage and Impact Blueprint]]

<!-- TDOD_GRAPH_END -->
