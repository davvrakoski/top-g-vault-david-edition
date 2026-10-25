---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/desert-bus-rdc-project"
title: "Desert Bus 2077 and RDC Project - Rojo Ecosystem Demo Games (MIT, CC0)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mit, cc0, rojo, tarmac, remodel, demo]
verified: 2026-10-25
license: "MIT (Desert Bus 2077); CC0-1.0 (RDC Project)"
sources:
  - https://github.com/rojo-rbx/desert-bus-2077
  - https://github.com/LPGhatguy/rdc-project
cssclasses: [tg-a40]
---
# Desert Bus 2077 and RDC Project - Rojo Ecosystem Demo Games (MIT, CC0)

Two small demo games from the people behind Rojo (LPGhatguy / the rojo-rbx org). They are not games to ship, but they are the reference for **how a fully file-based Roblox game repo is laid out**, and later community games (for example [[Maze World - Rojo Maze Game with Pets and Shop (MIT)]]) were built on top of them.

| Project | License | GitHub (as shown 2026-10-25) | What it is |
|---|---|---|---|
| Desert Bus 2077 | MIT (LICENSE.txt) | rojo-rbx org (originally under Roblox), about 37 stars, last commit 8 Jun 2021 | Drive a hover-bus in real time from Los Angeles to Sacramento in 2077; a deliberately dull joke game made to show the whole toolchain |
| RDC Project | CC0-1.0 | LPGhatguy, about 24 stars, archived 12 Jul 2020 | RDC 2018 demo: Roact and Rodux used beyond UI, an inventory on E, pick-up items, a replicated Rodux store, typed remotes |

**Genre:** tech demos (driving joke game; item pickup sandbox).

## What you can reuse
- Desert Bus 2077: Rojo build, Remodel deployment scripts, Tarmac asset upload and Foreman tool pinning, wired together end to end. Copy the folder layout for your own game.
- RDC Project: replicated state store pattern, runtime-typed RemoteEvents (`Typer.lua`), inventory UI. CC0, so no credit is required.

## How to run them
**Desert Bus 2077**
1. Install Foreman 1.0.0+, then `foreman install`.
2. `rojo build -o Place.rbxlx`
3. Open `Place.rbxlx` in Studio (`start Place.rbxlx` on Windows).
4. `rojo serve` and connect the plugin for live sync.

**RDC Project**
1. Clone with submodules.
2. Open `RDC.rbxl` in Studio and play solo or as server + client; for live code, sync with Rojo using `rojo.json` (an old Rojo 0.4-era config; use a matching old Rojo or port it to `default.project.json`).

## Caveats
- Both use pre-2021 tooling (Foreman, old Rojo configs); modern projects use Rokit.
- RDC Project's author says it is experimental, not a best-practice model.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Script Sync vs Rojo — 2026 Decision Guide]] · [[Moving an Existing Place to Rojo - syncback and rbxlx-to-rojo]] · [[Open-Source Roblox Shortlist — Reviewed Starting Points]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
