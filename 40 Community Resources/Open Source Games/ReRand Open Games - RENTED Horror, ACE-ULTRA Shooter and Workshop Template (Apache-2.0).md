---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/rerand-open-games"
title: "ReRand Open Games - RENTED Horror, ACE-ULTRA Shooter and Workshop Template (Apache-2.0)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", apache-2.0, horror, fps, pvp, rojo, template]
verified: 2026-10-25
license: "Apache-2.0 (code); MIT (RENTED-assets)"
sources:
  - https://github.com/ReRand/RENTED_old_rbx
  - https://github.com/ReRand/ACE-ULTRA_old
  - https://github.com/ReRand/Workshop
  - https://github.com/ReRand/RENTED-assets
  - https://www.roblox.com/games/15492975108/RENTED
  - https://www.roblox.com/games/16818877120/ACE-ULTRA
cssclasses: [tg-a40]
---
# ReRand Open Games - RENTED Horror, ACE-ULTRA Shooter and Workshop Template (Apache-2.0)

**Studio:** ReRand Studios (copyright 2024) · **License:** Apache-2.0 on the game repos, MIT on the asset repo · **GitHub:** small (2 stars each), RENTED last push 19 Nov 2024 (default branch `v2`), ACE-ULTRA last push 1 Apr 2025, Workshop last push 10 May 2024

| Repo | What it is | Genre |
|---|---|---|
| RENTED_old_rbx | Unfinished first-person "sit and survive" horror: defend a run-down burger restaurant from cultists and spirits | Horror (FNAF-style survival) |
| ACE-ULTRA_old | First-person multiplayer PvP shooter built around fast movement and style, inspired by ULTRAKILL | FPS / arena PvP |
| Workshop | The studio's empty repo template (README, Rojo project, license, disclaimer) | Template |
| RENTED-assets | Used and unused textures and images for RENTED (git submodule of RENTED) | Assets |

## What you can reuse
- A horror night-survival loop and a movement-heavy FPS, both as Rojo source.
- The Workshop template as a ready Rojo + Aftman starter with a licence and disclaimer layout.

## How to run them (from the READMEs)
1. Install VS Code and the Rojo extension; from the command palette open Rojo and install the Studio plugin.
2. Clone the repo. For RENTED, also pull the `Assets` submodule (`git submodule update --init`).
3. Open the folder in VS Code, start live sync with `default.project.json`.
4. In Studio, open the Rojo plugin and connect to localhost.

## Caveats (read these)
- The READMEs add a disclaimer on top of Apache-2.0: the games are shared for modding and education, and the studio asks you not to scam players, break Roblox rules, bypass their badges or purchases, or **re-upload without adding something transformative**. Treat that as a condition of goodwill and build something clearly your own.
- Apache-2.0: keep the LICENSE and copyright notice, mark files you changed, and do not use the ReRand names or logos.
- The RENTED-assets README says many images are pixelated versions of existing textures. Their original source is not stated, so do not ship those images; make or license your own.
- ACE-ULTRA is inspired by ULTRAKILL; do not copy that game's name, art or audio.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Horror Starter Architecture]] · [[FPS TPS Starter Architecture]] · [[How to legally build on an open-source Roblox game]] · [[IP, Licensing and Asset Due Diligence]]

<!-- TDOD_GRAPH_END -->
