---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "21_Advanced_Math/02_Ballistics"
title: "Projectile Ballistics Math"
tags: [roblox, blueprint, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Projectile Ballistics Math

Ignoring drag, projectile position over time is conceptually:

`p(t) = p0 + v0*t + 0.5*g*t^2`

Where:
- p0 = start position
- v0 = initial velocity
- g = acceleration/gravity vector

Use this to understand arcs, prediction and grenade trajectories. In an actual Roblox implementation, decide whether engine physics, custom simulation, or raycast stepping best fits gameplay/performance/networking.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[Dynamic Music and Combat States]] · [[In-Game Screenshot Staging for Marketing]] · [[Combat Feel Tuning Worksheet]] · [[Feature Flags and Config-Driven Development]]

<!-- TDOD_GRAPH_END -->
