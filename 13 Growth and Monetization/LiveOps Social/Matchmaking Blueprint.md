---
area: "13 Growth and Monetization"
cluster: "LiveOps Social"
source_note: "19_System_Blueprints/09_Matchmaking"
title: "Matchmaking Blueprint"
tags: [roblox, blueprint, "cluster/liveops-social"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Matchmaking Blueprint

For cross-server matchmaking, MemoryStore queues/maps are a common foundation.

Candidate data:
- player/group ID
- skill bucket
- region/preference if applicable
- enqueue time
- party size

Matchmaker periodically forms valid groups, reserves/creates destination, and teleports with failure handling.

Design for duplicate enqueue, stale entries, teleport failure, party member leaving, and matchmaker restart.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[LiveOps Social - Hub]]

**Related notes:** [[Social Systems - Parties, Friends and Co-Play]] · [[Lobby and Round System Blueprint]] · [[LiveOps, Events and Content Rotation]]

<!-- TDOD_GRAPH_END -->
