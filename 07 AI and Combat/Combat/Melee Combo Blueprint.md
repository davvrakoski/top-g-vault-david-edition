---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "19_System_Blueprints/14_Melee_Combo_System"
title: "Melee Combo Blueprint"
tags: [roblox, blueprint, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Melee Combo Blueprint

Each attack defines startup, active, recovery, combo window and next legal attacks.

State example:
Idle -> Attack1 -> Attack2 -> Attack3 -> Recovery

Input during a combo window queues the next attack. Input outside legal windows is rejected/ignored.

Server controls hit truth and cooldown; client controls responsive local presentation.

Use animation markers to open/close hit windows rather than guessing with arbitrary waits when possible.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[Damage and Status Effects Blueprint]] · [[Hitscan and Projectile Weapon Blueprint]] · [[Vehicle Damage and Impact Blueprint]] · [[Combat]]

<!-- TDOD_GRAPH_END -->
