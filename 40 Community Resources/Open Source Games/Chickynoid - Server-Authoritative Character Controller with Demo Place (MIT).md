---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/chickynoid"
title: "Chickynoid - Server-Authoritative Character Controller with Demo Place (MIT)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mit, fps, anti-cheat, networking, framework]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/easy-games/chickynoid
  - https://www.roblox.com/games/8289135181/Chickynoid
cssclasses: [tg-a40]
---
# Chickynoid - Server-Authoritative Character Controller with Demo Place (MIT)

**Authors:** MrChickenRocket and Brooke (development sponsored by easy.gg) · **License:** MIT · **GitHub:** about 265 stars, 399 commits, last push 27 May 2024 · **Demo:** roblox.com/games/8289135181 (also in the repo's `example/` folder)

## What it is
A framework that replaces Roblox Humanoid characters with a fully server-authoritative controller, the way Quake-style shooters work: the client sends only inputs, predicts locally and rolls back when the server disagrees. The repo's default Rojo project builds the same playable demo place that is live on Roblox. The README names Anarchy Arena as a released game using it.

**Genre:** FPS / arena shooter framework with playable sample.

## What you can reuse
- Movement that cannot be speed- or fly-hacked, with client prediction and rollback.
- Raycast and projectile weapons with server-side hit detection and lag compensation.
- Custom collision, per-client selective replication, compressed network data, a server bot/NPC system and a Knit-like mod system.

## How to run it
1. Install Foreman, then `foreman install` (Rojo 7.0.0, Wally, Remodel, StyLua, selene). If the `Packages` folders under `src/` are empty after cloning, run `wally install`.
2. `rojo serve default.project.json` (the project is named `example` and maps `example/workspace`, `example/client` and the `src/` packages), then connect the Rojo plugin in an empty place. Or `rojo build -o Chickynoid.rbxl` and open the file.
3. Press Play to try the sample, then read the `Examples` folders in ReplicatedFirst and ServerScriptService.

## Caveats
- The authors warn it is not drop-in and suits only teams comfortable with serious engineering.
- Characters are fixed-size boxes; no pushing or riding physics parts; collision is parts, terrain and convex-hull meshes only.
- Keep the MIT notice in your game's credits or a LICENSE ModuleScript.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Server-Side Movement Validation and Anti-Exploit Checks]] · [[FPS TPS Starter Architecture]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
