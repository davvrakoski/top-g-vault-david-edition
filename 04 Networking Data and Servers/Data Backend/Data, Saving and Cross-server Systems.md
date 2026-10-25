---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
source_note: "03_Data_Performance_Worlds/07_DATA_SAVING_and_CROSS-SERVER_SYSTEMS"
title: "DATA, SAVING & CROSS-SERVER SYSTEMS"
tags: [roblox, tdod-vault, reference, "cluster/data-backend"]
status: verified-baseline
cssclasses: [tg-a04]
---

# DATA, SAVING & CROSS-SERVER SYSTEMS

=================================================

Use DataStoreService for:
- permanent inventory
- progression
- settings
- unlocks
- stats that must persist

Use MemoryStoreService for:
- matchmaking queues
- temporary cross-server state
- frequently updated ephemeral coordination
- short-lived locks
- server browser-like coordination

Use MessagingService for:
- broadcasting lightweight events between servers

SAVE DESIGN:
PlayerData = {
  Version = 3,
  Coins = 0,
  Level = 1,
  XP = 0,
  Inventory = {},
  Settings = {},
  Unlocks = {}
}

RULES:
- Version saved schemas.
- Handle failures/retries.
- Never assume a save call succeeds.
- Avoid saving every frame.
- Save periodically and at important checkpoints.
- Use UpdateAsync-style conflict-safe patterns when appropriate.
- Test against a separate test experience, not production data.
- Do not blindly enable Studio API access against live production stores.

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Data Backend - Hub]]

**Related notes:** [[DataStore Production Patterns]] · [[DataStore vs MemoryStore vs Messaging vs Configs]] · [[Leaderboard Blueprint]] · [[Save Schema Migration Blueprint]]

<!-- TDOD_GRAPH_END -->
