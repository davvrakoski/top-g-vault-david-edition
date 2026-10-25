---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/tycoon-starters"
title: "Tycoon Starters - Factorial Defense and Industry Tycoon (MIT)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mit, tycoon, roblox-ts, flamework]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/homomorphist/factorial-defence-rbx
  - https://www.roblox.com/games/9391297088/Factorial-Defense
  - https://github.com/EnigmaDevelopmentGroup/Industry-Tycoon
cssclasses: [tg-a40]
---
# Tycoon Starters - Factorial Defense and Industry Tycoon (MIT)

Two small roblox-ts tycoon projects with clear MIT licenses. Neither is a polished product, but they are the cleanest permissive tycoon code found on GitHub (most "tycoon template" repos either have no license or are exploit-script spam).

| Project | Author | License | GitHub (as shown 2026-10-25) | What it is |
|---|---|---|---|---|
| Factorial Defense | homomorphist (Agapurnis) | MIT | about 5 stars, last push 31 Aug 2022 | Tycoon inspired by Miner's Haven, with tower defense elements planned; live at roblox.com/games/9391297088 |
| Industry Tycoon | Enigma Development Group | MIT | about 4 stars, 5 commits, last push 16 Feb 2024 | Early open-source factory tycoon in roblox-ts |

**Genre:** tycoon (factory / dropper).

## What you can reuse
- Factorial Defense: Flamework services and components, TestEZ and a mock DataStore in its dev tooling, commit hooks; a base to study for a Miner's Haven-style factory tycoon.
- Industry Tycoon: a minimal roblox-ts + Rojo tycoon skeleton to grow from.

## How to run them
**Factorial Defense**
1. `npm install` (runs `patch-package` and Husky through the `prepare` script).
2. `npm run build` (or `npm run watch`).
3. `npm run serve` (Rojo serve), connect the Rojo plugin.

**Industry Tycoon**
1. Install Aftman, `aftman install`.
2. `npm install`, then `npm run build` (or `npm run watch`).
3. `rojo serve default.project.json`, connect the Rojo plugin.

## Caveats
- Factorial Defense's author says it is a learning project and not a model to learn roblox-ts from. Its Flamework and roblox-ts versions are from 2022.
- Industry Tycoon is only a few commits deep; expect to write most of the game.
- "Inspired by Miner's Haven" is a design reference only; do not copy that game's name, models or item art.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Simulator Tycoon Starter Architecture]] · [[Tower Defense Starter Architecture]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
