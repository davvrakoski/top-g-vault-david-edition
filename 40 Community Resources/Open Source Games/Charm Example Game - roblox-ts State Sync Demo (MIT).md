---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/charm-example"
title: "Charm Example Game - roblox-ts State Sync Demo (MIT)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mit, roblox-ts, state-management]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/littensy/charm-example
  - https://www.roblox.com/games/18805522597
cssclasses: [tg-a40]
---
# Charm Example Game - roblox-ts State Sync Demo (MIT)

**Author:** littensy · **License:** MIT (LICENSE.md) · **GitHub:** about 28 stars, last push 26 Dec 2024 · **Live demo:** roblox.com/games/18805522597

## What it is
A small published game built to show how to structure a roblox-ts project around **Charm** (atom-based state). It is a starter skeleton more than a full game: the value is the wiring, not the content.

**Genre:** game template / framework sample.

## What you can reuse
- Server-to-client state sync with Charm, including a payload filter that strips data a player should not see before it is sent (`filter-payload.ts`).
- Vide UI, Lapis data store wrapper, and Jest (jsdotlua port) unit tests running in Studio.
- A clean pnpm + ESLint + Prettier + Selene setup to copy into a new project.

## How to run it
1. `git clone https://github.com/littensy/charm-example.git` then `cd charm-example`
2. `pnpm install`
3. `pnpm compile` then `pnpm build` (outputs a place file to open in Studio).
4. Optional tests: Jest Lua needs the `FFlagEnableLoadModule` flag (`sh bin/jest-flag.sh` on macOS), then press F8 (Run) in Studio.

## Caveats
- Very little gameplay; treat it as the base layer you add your own game loop to.
- Libraries (Charm, Vide, Lapis, Jest) keep their own licenses; check each before redistributing source.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Slither - roblox-ts Casual Snake Game (MIT)]] · [[Modern roblox-ts Template - Flamework Starter (Unlicense)]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
