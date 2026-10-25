---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/nexus-battles"
title: "Nexus Battles - Round-Based Roblox Battle Remake (MIT)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mit, round-based, pvp, rojo]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/TheNexusAvenger/Nexus-Battles
cssclasses: [tg-a40]
---
# Nexus Battles - Round-Based Roblox Battle Remake (MIT)

**Author:** TheNexusAvenger (Nexus Development; also author of Nexus VR Character Model and Nexus Admin) · **License:** MIT · **GitHub:** about 2 stars, 257 commits, **archived** 6 Jan 2023

## What it is
A re-implementation of Roblox Battle (the original, Remastered and 2018 Edition event games) on current Roblox systems, combined with the parallel round system from the author's Ultimate Boxing. Several rounds can run at once, so players spend less time idling and new modes such as elimination become possible.

**Genre:** round-based PvP arena / minigame battles.

## What you can reuse
- A parallel round system: any mode starts as soon as enough players are free, instead of one global intermission.
- Mode framework with elimination and other custom modes.
- A Rojo project with git submodules and tests (`test/ReplicatedStorage`).

## How to run it
1. Clone with submodules (`git clone --recursive https://github.com/TheNexusAvenger/Nexus-Battles`).
2. `rojo build --output nexus-battles.rbxlx`
3. Open the file in Studio. Use `rojo serve` only for development (the README warns live sync struggles with its Unions).

## Caveats
- The README allows republishing as-is without asking, on condition you do not claim the project as your own. Keep the credit.
- "Roblox Battle" is Roblox's own event branding. Rename the game, and check every model in the built place: if any map piece or asset came from Roblox's original events, replace it rather than assume the MIT license covers it.
- Archived; no updates.
- The same author's "Witching Hour Remastered" is **not** in this catalogue: its README says it was rebuilt partly from leaked models.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Lobby and Round System Blueprint]] · [[Round PvP Starter Architecture]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
