---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "19_System_Blueprints/12_Damage_Status_Effects"
title: "Damage and Status Effects Blueprint"
tags: [roblox, blueprint, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Damage and Status Effects Blueprint

Damage packet fields might include:
- source
- target
- base amount
- damage type
- attack ID
- hit position

Server pipeline:
validate -> modifiers -> armor/resistance -> invulnerability -> health -> status effects -> death -> rewards.

Status effect definition:
- ID
- duration
- stack rule
- tick interval
- stat modifiers
- VFX tag

Avoid each weapon directly editing Humanoid health with unrelated rules.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[Server-Authoritative Melee Pattern]] · [[Config-Driven Weapons]] · [[Hitscan and Projectile Weapon Blueprint]] · [[Melee Combo Blueprint]]

<!-- TDOD_GRAPH_END -->
