---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/roblox-battle-royale-kit"
title: "Roblox Battle Royale Kit - Official (Limited Use License)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", official, battle-royale, limited-use-license]
verified: 2026-10-25
license: "Roblox Limited Use License"
sources:
  - https://create.roblox.com/docs/resources/battle-royale
  - https://create.roblox.com/docs/resources/limited-use-license
  - https://www.roblox.com/games/5158731546/Roblox-Battle-Royale
cssclasses: [tg-a40]
---
# Roblox Battle Royale Kit - Official (Limited Use License)

**Publisher:** Roblox (built by internal Roblox developers) · **Terms:** Roblox's **Limited Use License** (stated on the kit page) · **Live game:** roblox.com/games/5158731546

## What it is
A complete battle royale: drop onto a large island, find weapons and vehicles, build and destroy structures, stay out of the storm, be the last one standing.

**Genre:** battle royale / third-person shooter.

## What you can reuse
- Third-person camera code.
- Ranged weapon system with 9 preconfigured weapons.
- Building system (tile connectivity by bitmask) and destruction system.
- The storm, minimap and pickup (rarity) systems.
- Four modes: Last One Standing, Solo Deathmatch, Team Deathmatch, Free Play.

## How to get it (from Roblox's installation page)
1. Download `RobloxBattleRoyale.zip` from the kit's Installation and setup page (hosted on Roblox's docs asset server). It holds `Lobby.rbxl`, `Gameplay.rbxl` and `Queue.rbxl`.
2. Open `Lobby.rbxl` and publish it as a new experience.
3. In the Asset Manager add five more places: Gameplay, Queue (Default), Queue (Deathmatch), Queue (Team Deathmatch), Queue (Free Play).
4. Paste each place ID into the `_places` table of the MainConfiguration script (ReplicatedFirst > Configurations) and republish.
5. Set Server Fill to Maximum on all six places.
6. Copy the same `_places` table into `Gameplay.rbxl` and `Queue.rbxl`, then publish them over their place slots.
Full steps: [[Installation and setup]] and [[Run the game]] in the official docs area.

## Terms in plain words
The Limited Use License lets you build the kit into your own Roblox experiences and modify its source for that purpose. It is non-exclusive, non-transferable and **revocable**; you may not remove attribution, use it outside Roblox, or claim ownership; Roblox keeps all rights and can end the license. Read [[Limited use license]] before shipping.

## Caveats
- The docs warn that processes and features may have changed since the kit was written; expect to update APIs.
- A heavy kit for mobile; profile memory and draw calls before launch.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[30 Official Roblox Docs/Resources/Battle Royale/Battle Royale|Battle Royale (official docs)]] · [[Limited use license]] · [[Battle Royale Template by Ericthestein (MIT)]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
