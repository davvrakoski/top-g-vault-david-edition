---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/zombie-strike"
title: "Zombie Strike - Kampfkarren Co-op Zombie Shooter Source (MPL-2.0)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mpl-2.0, zombie, shooter, roblox-ts, rojo, tarmac]
verified: 2026-10-25
license: "MPL-2.0"
sources:
  - https://github.com/Kampfkarren/zombie-strike
  - https://rowatcher.com/games/1298774291/zombie-strike
cssclasses: [tg-a40]
---
# Zombie Strike - Kampfkarren Co-op Zombie Shooter Source (MPL-2.0)

**Author:** Kampfkarren (creator of selene and other well-known Roblox tools; the game's own description also credits Megahammer) · **License:** MPL-2.0 (LICENSE.md) · **GitHub:** about 88 stars, 665 commits, last push 5 Aug 2020, **archived** on 21 Apr 2023 · **Game:** Zombie Strike on Roblox (place 1298774291), published 2019

## What it is
The public source repository of a real, large Roblox game: a zombie shooter where players take down hordes and giant bosses. The code is split into a hub place and a mission place, so players gather in the hub and launch into missions together. It is a rare chance to read the code of a game that a third-party stats site puts at over 200 million visits.

**Genre:** zombie shooter with hub + mission places.

## What you can reuse
- Two-place structure: `hub.project.json` (lobby, shops, equipment) and `mission.project.json` (the combat run), with shared `Core` and `Equipment` code.
- Mixed Luau + roblox-ts (Roact) codebase, Tarmac-managed image assets, TestEZ tests, selene lint config.
- Zombie, boss and equipment code as references for any wave or mission shooter.

## How to run it
1. Clone with submodules (`git clone --recursive`), since `vendor/` uses git submodules.
2. `npm install` (roblox-ts types and Roact).
3. Compile: `rbxtsc -w -i ts_include/ -r hub.project.json -p hub.tsconfig.json` (this is `watch-hub.sh`; use `watch-mission.sh` for the mission place).
4. `rojo serve hub.project.json` (or `mission.project.json`) and connect the Rojo plugin in a new place.
5. Expect to rebuild maps and models: the project files reference the original place IDs and uploaded asset IDs, and map geometry does not appear in the source tree.

## Caveats
- **MPL-2.0 file-level copyleft:** modified files from this repo stay MPL-2.0 and their source should be published; your own new files are yours.
- The Zombie Strike name, logo, and art uploaded to Roblox are not granted by the code license. Use your own title and art.
- Old toolchain (2020 roblox-ts, Roact). Treat as a reference to study and lift systems from, not a drop-in base.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Zombie Survival Starter Architecture]] · [[Zombie Crowd Director Blueprint]] · [[FPS TPS Starter Architecture]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
