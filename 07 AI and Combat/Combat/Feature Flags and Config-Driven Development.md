---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "18_Advanced_Architecture/03_Feature_Flags_and_Config"
title: "Feature Flags and Config-Driven Development"
tags: [roblox, premium, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Feature Flags and Config-Driven Development

Separate balancing/content values from code when possible.

Config can control:
- weapon damage
- NPC sensing ranges
- weather probabilities
- economy rewards
- UI experiment variants

Feature flags can stage:
- new combat
- new tutorial
- seasonal UI

A flag needs:
- owner
- default
- rollout plan
- removal date after permanent decision

Do not leave 70 dead flags forever.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[Projectile Ballistics Math]] · [[Combat Feel Tuning Worksheet]] · [[Server-Authoritative Melee Pattern]] · [[Config-Driven Weapons]]

<!-- TDOD_GRAPH_END -->
