---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "19_System_Blueprints/16_Vehicle_Damage_and_Impact"
title: "Vehicle Damage and Impact Blueprint"
tags: [roblox, blueprint, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Vehicle Damage and Impact Blueprint

Vehicle system owns speed/impact context; target damage system owns health consequences.

Impact damage can use:
- relative speed
- vehicle mass/class
- target type
- cooldown per target
- clamp/minimum threshold

Do not apply damage continuously every physics contact step. Use impact events/cooldowns so one collision does not create dozens of damage calls.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[Hitscan and Projectile Weapon Blueprint]] · [[Melee Combo Blueprint]] · [[Combat]] · [[Vehicle Damage, Repair and Failure States]]

<!-- TDOD_GRAPH_END -->
