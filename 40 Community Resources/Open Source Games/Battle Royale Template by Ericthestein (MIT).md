---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/ericthestein-battle-royale-template"
title: "Battle Royale Template by Ericthestein (MIT)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mit, battle-royale, rbxl, template]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/Ericthestein/Roblox-Battle-Royale-Template
  - https://www.roblox.com/games/2850063392/Battle-Royale-Template
cssclasses: [tg-a40]
---
# Battle Royale Template by Ericthestein (MIT)

**Author:** Eric Stein (Ericthestein) · **License:** MIT (LICENSE) · **GitHub:** about 7 stars, 9 commits, last push 12 Sep 2019 · **Published copy:** roblox.com/games/2850063392

## What it is
A single `.rbxl` place that gives you the bones of a battle royale: intermission, a drop ship, a weapons pool and match UI. It is old and simple, which makes it easy to read in one sitting.

**Genre:** battle royale template.

## What you can reuse
- **Main Game Loop** script in ServerScriptService with tunable globals (intermission length, minimum players).
- **Weapons** folder in ServerStorage: drag in new Tools to add them to the pool.
- **Plane** model in ServerStorage as the drop ship (move it to Workspace to edit, set its PrimaryPart, move it back).
- **Game Info** ScreenGui in StarterGui for match status.

## How to run it
1. Download `BattleRoyaleTemplate.rbxl` from the repo.
2. Open it in Studio, press Play with 2+ test players (Test > Clients and Servers) to see a match start.
3. Change the globals at the top of the Main Game Loop script.

## Caveats
- 2019 code: no storm/zone system is described; expect to add zone shrink, loot and spectating.
- The README does not say where the bundled weapons and plane came from; replace or verify each before publishing.
- For a larger official kit see [[Roblox Battle Royale Kit - Official (Limited Use License)]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Round PvP Starter Architecture]] · [[Coding Roblox Games Made Easy - Book Obby and Battle Royale Demos (MIT)]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
