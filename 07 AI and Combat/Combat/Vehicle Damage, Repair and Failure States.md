---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "23_Expanded_Knowledge/43_Vehicle_Damage_Repair_and_Failure_States"
title: "Vehicle Damage, Repair & Failure States"
tags: [roblox, premium, "cluster/vehicles", "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Vehicle Damage, Repair & Failure States

Separate vehicle health from cosmetic damage. Gameplay state may include engine health, tire condition, fuel/energy and disabled state; dents/smoke/sparks are presentation.

## Damage sources
Collisions, weapons, hazards and scripted events should route through one validated damage interface. Continuous contact needs cooldown/debouncing so one collision does not apply damage every physics step.

## Failure states
Normal -> Damaged -> Critical -> Disabled/Destroyed. Each transition should have readable audio/VFX.

## Lab
Crash the same vehicle at controlled speeds and verify damage curves are predictable rather than random.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[Vehicle Damage and Impact Blueprint]] · [[Combat]] · [[Dynamic Music and Combat States]] · [[In-Game Screenshot Staging for Marketing]]

<!-- TDOD_GRAPH_END -->
