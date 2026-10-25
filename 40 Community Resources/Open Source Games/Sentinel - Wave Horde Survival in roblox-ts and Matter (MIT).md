---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/sentinel-core"
title: "Sentinel - Wave Horde Survival in roblox-ts and Matter (MIT)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mit, roblox-ts, ecs, matter, wave-survival]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/LastTalon/sentinel-core
  - https://lasttalon.github.io/sentinel-core/
cssclasses: [tg-a40]
---
# Sentinel - Wave Horde Survival in roblox-ts and Matter (MIT)

**Author:** LastTalon (Lucas Gangstad) · **License:** MIT (LICENSE.md) · **GitHub:** about 13 stars, last push 7 Oct 2023

## What it is
An unfinished cooperative, hero-based, wave-based horde survival game. Its interest is architectural: it is one of the few public Roblox games built on the **Matter ECS** with roblox-ts, plus automated tests that run in a real Roblox place.

**Genre:** co-op wave survival / horde shooter (early prototype).

## What you can reuse
- An ECS game layout: Matter systems, matter-hooks, Plasma debug UI, Rewire hot reload.
- Separate project files for production (`default.project.json`), build and test.
- A CI-friendly test flow using `run-in-roblox`.

## How to run it
1. Install Node.js and Aftman, then `aftman install` (Rojo and friends).
2. `npm install`
3. `npm run rojo` - builds the test target, then watches and serves `test.project.json` with Rojo; connect the Rojo plugin in Studio.
4. `npm run rojo:build` writes `build.rbxl`; `npm test` builds and runs the tests (needs `run-in-roblox` and Studio installed).

## Caveats
- The README itself says more details are still to come; expect a skeleton, not a finished loop.
- Check the `assets` folder before reuse; the page gives no separate asset license, so the repo MIT is the only stated term.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[ECS on Roblox - When It Fits]] · [[Zombie Survival Starter Architecture]] · [[Zombie Crowd Director Blueprint]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
