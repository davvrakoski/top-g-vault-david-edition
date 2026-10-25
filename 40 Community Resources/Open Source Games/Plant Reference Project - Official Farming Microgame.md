---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/plant-reference-project"
title: "Plant Reference Project - Official Farming Microgame"
tags: [roblox, community, open-source, games, "cluster/open-source-games", official, uncopylocked, farming, simulator, reference]
verified: 2026-10-25
license: "Uncopylocked by Roblox; no separate license (Roblox Terms apply)"
sources:
  - https://create.roblox.com/docs/resources/plant-reference-project
  - https://www.roblox.com/games/14353060924/Plant
cssclasses: [tg-a40]
---
# Plant Reference Project - Official Farming Microgame

**Publisher:** Roblox · **Terms:** uncopylocked by the creator (Roblox) on Roblox; no separate license. The docs page tells you to open it with **Edit in Studio**; Roblox's Terms apply. · **Game:** roblox.com/games/14353060924

## What it is
A small but production-style farming game: plant and water seeds, harvest the plants, sell them. Roblox wrote a long design doc alongside it explaining every trade-off, so it doubles as a lesson in how Roblox engineers structure a live game.

**Genre:** farming / simulator.

## What you can reuse
- Session and player data saving (PlayerDataServer / PlayerDataClient).
- UI layer management (`UIHandler`: HUD vs Menu layers, imperative UI with reusable components).
- Client-server networking module, first-time user experience (FTUE) flow.
- Soft and hard currency purchases (Market), per-player farm plots (FarmManagerServer), walk speed control, objects that follow characters, and zone detection.
- Strictly typed Luau class pattern.

## How to use it
1. Open roblox.com/games/14353060924, click the three-dot menu, choose **Edit in Studio**.
2. **File > Save to Roblox As** a new experience.
3. Read [[Plant reference project]] (the vault's copy of the doc) while you explore the code.

## Caveats
- It is a reference microgame; content (plants, map) is minimal on purpose.
- Uncopylocked is not a trademark grant; publish under your own name and art.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Plant reference project]] · [[Simulator Tycoon Starter Architecture]] · [[Tutorial, Onboarding and FTUE]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
