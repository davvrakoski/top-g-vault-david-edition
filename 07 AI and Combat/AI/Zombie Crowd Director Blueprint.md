---
area: "07 AI and Combat"
cluster: "AI"
source_note: "19_System_Blueprints/15_Zombie_Crowd_Director"
title: "Zombie Crowd Director Blueprint"
tags: [roblox, blueprint, "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Zombie Crowd Director Blueprint

Separate population management from individual zombie brains.

Director responsibilities:
- target population by zone
- spawn budget per second
- despawn/recycle rules
- density caps
- player visibility checks
- difficulty pressure

Zombie brain responsibilities:
- local perception
- navigation
- combat
- animation/state

This prevents every zombie from independently deciding global population behavior.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[AI - Hub]]

**Related notes:** [[Pathfinding Engineering]] · [[Git Branch and Review Workflow]] · [[Advanced NPC - AI Behavior]] · [[Encounter Director and Pacing]]

<!-- TDOD_GRAPH_END -->
