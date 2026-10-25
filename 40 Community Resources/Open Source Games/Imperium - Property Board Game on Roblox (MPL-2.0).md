---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/imperium"
title: "Imperium - Property Board Game on Roblox (MPL-2.0)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mpl-2.0, board-game, lobby, rojo]
verified: 2026-10-25
license: "MPL-2.0"
sources:
  - https://github.com/Skekdog/Imperium
  - https://www.roblox.com/games/110109018598423/Imperium
cssclasses: [tg-a40]
---
# Imperium - Property Board Game on Roblox (MPL-2.0)

**Author:** Skekdog · **License:** MPL-2.0 (LICENSE.md), third-party licenses listed in `ExternalLicenses.md` (for example ProfileService, Apache-2.0) · **GitHub:** about 3 stars, 667 commits, last push 24 Oct 2026 · **Live game:** roblox.com/games/110109018598423

## What it is
A finished multiplayer property-trading board game that plays by classic Monopoly rules, with a separate lobby place and game place. Supports desktop, mobile and console. The author open-sourced it and says they will likely stop maintaining the Roblox version.

**Genre:** board game / turn-based party game.

## What you can reuse
- Lobby-to-match flow across two places (`Lobby.project.json`, `Game.project.json`).
- Turn order, dice, property ownership, trading and bankruptcy logic as a template for any turn-based board game.
- Cross-platform input and UI handling (desktop, mobile, console).

## How to run it
1. Install Rokit, then `rokit install` (Rojo 7.6.0 and Lune).
2. `rojo serve Game.project.json` (or `Lobby.project.json`) and connect the Rojo plugin, or `rojo build Game.project.json -o Game.rbxl`.
3. `Publish.luau` is a Lune script for publishing; read it before running and point it at your own places.

## Caveats
- **Trademark:** Monopoly is a Hasbro trademark and its board art and property names are protected. Keep the rules engine, but use your own name, board, money and theme. Do not reuse the Imperium name or logo either.
- **MPL-2.0 is file-level copyleft:** if you change one of its files, that file stays MPL-2.0 and you should publish its source (a public repo is simplest). Your own new files can use any license.
- The author calls the code low quality; budget time for cleanup.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[How to legally build on an open-source Roblox game]] · [[Reference IP, Originality and Asset Rights]] · [[Lobby and Round System Blueprint]]

<!-- TDOD_GRAPH_END -->
