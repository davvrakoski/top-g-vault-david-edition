---
area: "03 Scripting and Systems"
cluster: "Scripting"
source_note: "18_Advanced_Architecture/01_Service_Controller_Boundaries"
title: "Service and Controller Boundaries"
tags: [roblox, premium, "cluster/scripting"]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Service and Controller Boundaries

You do not need a framework to use good boundaries.

Server service examples:
- CombatService
- InventoryService
- DataService
- MatchService
- NPCService

Client controller examples:
- InputController
- CameraController
- UIController
- VFXController

Shared:
- types
- immutable configs
- utility math
- remotes definitions

A module should own one clear domain. If a `GameManager` knows currency, AI, UI, weapons, weather, and saving, it is probably too broad.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Scripting - Hub]]

**Related notes:** [[Remote Protocol Versioning]] · [[Cooldown Module]] · [[Events vs Polling]] · [[Weighted Random Selection]]

<!-- TDOD_GRAPH_END -->
