---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
source_note: "22_Server_Engineering/02_Observability"
title: "Observability and Debug Logging"
tags: [roblox, blueprint, "cluster/server-engineering"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Observability and Debug Logging

Useful logs answer what happened without drowning the server.

Log categories:
- data load/save failure
- purchase/grant failure
- teleport/matchmaking failure
- suspicious remote rate patterns
- AI/pathfinding failures if abnormal
- version/migration errors

Add stable error codes such as `DATA_LOAD_003` so Discord screenshots and logs are searchable.

Do not log sensitive secrets/tokens.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Server Engineering - Hub]]

**Related notes:** [[Errors, Observability and Incident Response]] · [[Server Load Shedding]]

<!-- TDOD_GRAPH_END -->
