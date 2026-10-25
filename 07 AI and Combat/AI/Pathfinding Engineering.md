---
area: "07 AI and Combat"
cluster: "AI"
source_note: "06_AI_NPC_Combat/04_Pathfinding_Engineering"
title: "Pathfinding Engineering"
tags: [roblox, premium, "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Pathfinding Engineering

Pathfinding should be event- and need-driven.

Recompute when:
- no path exists
- `Path.Blocked` affects a future waypoint
- target has moved enough to invalidate path
- NPC is stuck
- navigation mode changed

Do not recompute just because a Heartbeat fired.

For crowds:
- stagger requests
- cap concurrent path creation
- use simple direct movement when line of sight is clear
- share broad target information when useful
- avoid every NPC choosing the exact same waypoint
- validate AgentRadius/Height/CanJump/CanClimb against the rig

Source: https://create.roblox.com/docs/characters/pathfinding

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[AI - Hub]]

**Related notes:** [[NPC Vision and Hearing Model]] · [[Scalable NPC Update Scheduler]] · [[Git Branch and Review Workflow]] · [[Zombie Crowd Director Blueprint]]

<!-- TDOD_GRAPH_END -->
