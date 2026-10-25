---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/maze-world"
title: "Maze World - Rojo Maze Game with Pets and Shop (MIT)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mit, rojo, roact, maze, pets]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/MayGo/maze-world
  - https://www.roblox.com/games/3376915546/Maze-World-Dynamic
cssclasses: [tg-a40]
---
# Maze World - Rojo Maze Game with Pets and Shop (MIT)

**Author:** MayGo · **License:** MIT · **GitHub:** about 35 stars, 21 forks, last push 2 Jan 2025 · **Live game:** roblox.com/games/3376915546

## What it is
A full Luau game where players pick an easy, medium or hard maze. Mazes are generated fresh each round, finishing earns coins, and coins buy trail and speed pets. The author wrote it to double as a Rojo + Roact boilerplate that "tries to cover most of the aspects of Roblox games".

**Genre:** puzzle / round-based maze race with light simulator economy.

## What you can reuse
- Procedural maze generation (algorithm credited to LuaMaze by shironecko).
- Waiting rooms, round flow, placement-based rewards, shop, pets, awards, statistics and collectables.
- Roact + Rodux UI (with Roact-Material and Roact-Animate), DataStore2 saving, GameAnalytics hooks.
- Workflow scripts: Remodel to split models into files, Tarmac for images.

## How to run it
1. Clone **with submodules** (`git clone --recursive ...`).
2. `npm i` (Prettier tooling only).
3. Run `./script/build-and-open.sh` to build `Game.rbxlx` with Rojo, or `rojo serve` and connect the plugin.
4. In Game Settings, allow HTTP requests and turn on Studio access to API services (DataStore2). Set `SaveInStudio` in ServerStorage to true to test saves.
5. Remove or replace the GameAnalytics keys in `GameAnalyticsServerInit.server.lua`.

## Caveats
- Uses older libraries (Roact, Rodux, DataStore2, Foreman). They still work but are no longer the community default; plan a migration if you build long-term on it.
- Art (faces, coin, cherry) was made by the author; the README states no separate art license, so the repo MIT applies. Credit LuaMaze too.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Lobby and Round System Blueprint]] · [[Desert Bus 2077 and RDC Project - Rojo Ecosystem Demo Games (MIT, CC0)]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
