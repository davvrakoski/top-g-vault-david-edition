---
area: "13 Growth and Monetization"
cluster: "LiveOps Social"
source_note: "19_System_Blueprints/08_Lobby_and_Round_System"
title: "Lobby and Round System Blueprint"
tags: [roblox, blueprint, "cluster/liveops-social"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Lobby and Round System Blueprint

State machine:
Waiting -> Countdown -> Loading -> Active -> Results -> Cleanup -> Waiting

Server owns round state and deadlines.

Each transition has:
- entry action
- exit action
- minimum requirements
- timeout
- recovery if players leave

Do not let UI timers become authoritative. Client displays the server's state/deadline.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[LiveOps Social - Hub]]

**Related notes:** [[LiveOps, Events and Content Rotation]] · [[Social Systems - Parties, Friends and Co-Play]] · [[Matchmaking Blueprint]]

<!-- TDOD_GRAPH_END -->
