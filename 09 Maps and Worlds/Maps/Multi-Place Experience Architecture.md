---
area: "09 Maps and Worlds"
cluster: "Maps"
source_note: "23_Expanded_Knowledge/02_Multi_Place_Experience_Architecture"
title: "Multi-Place Experience Architecture"
tags: [roblox, premium, "cluster/maps"]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Multi-Place Experience Architecture

Large Roblox experiences may use multiple places inside one universe. Treat place boundaries as an architectural decision, not a way to hide poor optimization.

## Use multiple places when
- a lobby and match have very different lifecycles,
- a dungeon/mission should boot independently,
- a huge experience benefits from isolated server populations,
- teams can develop areas with cleaner boundaries.

## Transfer contract
Before teleporting, define what must survive: player identity, selected loadout, matchmaking ticket, party ID and destination intent. Permanent progression should come from trusted server data, not from arbitrary client teleport payloads.

## Failure handling
Design for teleport failure, destination full, party split, stale matchmaking state, reconnect and duplicate requests. UI should explain what is happening instead of leaving the player staring at a frozen screen.

## Build rule
A place is not a database. Do not make each place invent its own copy of progression logic. Put shared schemas/config in a common source-controlled package and version changes deliberately.

## Lab
Prototype Lobby -> Mission -> Lobby with a fake reward. Confirm the reward is applied once, survives reconnect, and cannot be forged by editing client state.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps - Hub]]

**Related notes:** [[Advanced Map Readability and Navigation]] · [[Buildings, Interiors and Modular Streaming]] · [[Roblox Studio Basics]] · [[Large Maps, Streaming and World Design]]

<!-- TDOD_GRAPH_END -->
