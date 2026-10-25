---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
source_note: "02_Programming_Networking_Security/05_CLIENT-SERVER_ARCHITECTURE"
title: "CLIENT/SERVER ARCHITECTURE"
tags: [roblox, tdod-vault, reference, "cluster/inventory-economy"]
status: verified-baseline
cssclasses: [tg-a02]
---

# CLIENT/SERVER ARCHITECTURE

=================================================

CLIENT SHOULD HANDLE:
- camera
- input
- UI
- local animation feel
- cosmetic VFX
- cosmetic sound
- interpolation
- local prediction where appropriate
- non-authoritative presentation

SERVER SHOULD HANDLE:
- damage truth
- rewards
- inventory truth
- currency
- purchases
- progression
- enemy authoritative decisions
- anti-cheat validation
- save data
- match state
- important physics/game rules

REMOTE RULE:
Client says: "I attempted to attack."
Server decides: "Was that attack possible and what did it hit?"

BAD:
Client: "Give me 999999 coins."

GOOD:
Client: "I touched reward pickup ID 27."
Server:
- confirms pickup exists
- confirms player is close enough
- confirms it was not already taken
- awards configured amount

RemoteEvents:
One-way messages.

RemoteFunctions:
Request/response, but use carefully because yielding can create fragile chains.

UnreliableRemoteEvents:
Useful for continuously changing non-critical data where occasional packet loss is acceptable.

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Inventory Economy - Hub]]

**Related notes:** [[Crafting System Blueprint]] · [[Experiment Design for Roblox Games]] · [[Progression, XP, and Skill Tree Blueprint]] · [[Daily and Weekly Reward Blueprint]]

<!-- TDOD_GRAPH_END -->
