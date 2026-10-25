---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/server-authority-2026-community"
title: "Server Authority 2026 - What the Community Learned"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/full-release-ship-fair-and-competitive-games-with-server-authority/4727993
  - https://devforum.roblox.com/t/server-authority-tech-deep-dive-engineering-insights/4624565
  - https://devforum.roblox.com/t/server-authority-how-to-make-enemies-deal-smooth-knockback-on-the-player/4815257
  - https://devforum.roblox.com/t/full-release-the-future-of-character-movement-character-controller-library/4565267
cssclasses: [tg-a40]
---

# Server Authority 2026 - What the Community Learned

Roblox shipped **Server Authority** to all games in July 2026 (client beta in May). The server becomes the source of truth for simulated movement, with client prediction and rollback so input still feels instant. This note collects what engineers and developers said in the release threads; for the API itself see [[AuthorityMode]] and [[PredictionMode]].

## Key facts from Roblox engineers

- **It is opt-in, and will stay a choice.** @Khanovich pointed out many big games (MMOs, Destiny 2) use client-authoritative movement on purpose; Roblox's default distributed authority remains important.
- **The input path is fixed:** all player input must go through **Input Actions** ([[Input Action System]]); it's the only client-to-server data the server accepts for the simulation. Your control code runs under **`RunService:BindToSimulation`** on both client and server.
- **Default PlayerScripts already do this** for avatar movement when Server Authority is on (@DustMage1337).
- **RemoteEvents are not time-synced** with the simulation (can be off by roughly 40-50 ms). Shooting via a remote is fine but causes some misprediction; Roblox said it is looking at synchronized remotes and server-side rewind APIs.
- **Zero mispredictions is not the goal**, smooth play is.
- Tools and Backpacks became fully supported at full release.

## Pain points developers reported

- **Random mispredictions** even with no scripts (@avodey, beta) and **spikes during rollbacks** (@HealthyKarl).
- **Server-caused forces feel bad.** @Dfzoz: knockback applied by the server (`ApplyImpulse` on an enemy hit) rubber-bands, because the client has nothing to predict. Workarounds discussed: drive the effect from something the client can also simulate (a projectile with prediction on), or wait for smoother rollback tools.
- **R6 + Character Controller Library + Server Authority** was reported as unplayable at launch by @Chark_Proto, who stayed on regular Humanoids.
- With the Character Controller Library, `Player.DevEnableMouseLock` gets set to false (shift-lock off) in places that use it.

## Should you turn it on?

| Turn it on | Wait |
|---|---|
| Competitive PvP, sports, racing where speed/teleport cheats hurt | Physics-heavy games with lots of server-driven forces (knockback, explosions) |
| Projects starting now that can use Input Actions from day one | Large existing codebases built on custom remotes for movement |
| Teams ready to test mispredictions on bad connections | R6 games relying on the new controller library |

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Network Protocol and Server Authority]] · [[Latency, Prediction and Reconciliation]] · [[Lag Compensation and Server Rewind for Melee and Hitscan]] · [[Character Controller Library]]

<!-- TDOD_GRAPH_END -->
