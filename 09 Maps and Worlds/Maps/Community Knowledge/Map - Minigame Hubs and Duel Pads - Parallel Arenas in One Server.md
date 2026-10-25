---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Minigame Hubs and Duel Pads - Parallel Arenas in One Server"
tags: [roblox, community-knowledge, maps, minigames, arenas, lobby, pvp]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/PVInstance
  - https://create.roblox.com/docs/workspace/collisions
  - https://create.roblox.com/docs/projects/teleport
  - https://create.roblox.com/docs/reference/engine/classes/TeleportService
  - https://create.roblox.com/docs/workspace/streaming
---
# Map - Minigame Hubs and Duel Pads - Parallel Arenas in One Server

Many popular Roblox games run several small matches at once inside one server: 1v1 duel pads, 2v2 boxing rings, a row of party minigames. Players step on a pad, a countdown starts, and they are moved into a private arena while the rest of the server keeps hanging out. Map rotation (one map for everyone) doesn't fit this; you need **arena slots**, queue pads and a clean way back to the hub.

## One server or a reserved server?
| Approach | When | Cost |
|---|---|---|
| **Parallel arenas in the same place** | Short matches (1-5 min), 2-8 players, friends want to watch and rejoin fast | All arenas share server CPU and memory |
| **Reserved server per match** (`TeleportService:ReserveServerAsync` or `TeleportOptions.ShouldReserveServer`) | Long matches, bigger teams, heavy maps, ranked play | Loading screen, server hop, data handoff |

Note: the older `TeleportService:ReserveServer` is marked deprecated in the API reference; use `ReserveServerAsync`.

## Hub layout
- **Pads in a visible row or ring** near spawn, each with a big number or game name, a player count ("1/2") and a countdown above it. Players join pads that already have someone waiting, so visibility fills matches.
- **Spectator screens or windows** into arenas give the hub something to watch. A cheap version: a balcony overlooking one "featured" arena built into the hub.
- **Leave space around pads** for players who are just looking, so they don't trigger the pad by accident. Use a small raised pad with a `ProximityPrompt` or a short "stand still for 2 seconds" rule.

## Arena slots
Build one arena `Model` per mode in `ServerStorage`. At server start, either:
- **Pre-place N copies** far from the hub (fast, fixed memory), or
- **Clone on demand** into free slots and destroy after the match (less memory when idle, a small hitch on clone).

Place slots more than your streaming radius apart (for `StreamingTargetRadius` 1024, use 1,500-2,000 studs) and away from the hub, so players in one arena don't stream or see others. Move whole arenas with `Model:PivotTo`, and move players with `character:PivotTo(spawnCFrame)` after calling `Player:RequestStreamAroundAsync` on the destination.

## Match flow (server)
1. Pad fills (count players inside a box zone every 0.5 s on the server).
2. Countdown 3-5 s; if someone steps off, cancel.
3. Find a free slot, mark it busy, move the arena there if needed.
4. Teleport players to the arena spawns, give the mode's tools, start the timer.
5. On win/timeout: award, remove tools, teleport everyone back to hub spawn points, reset the arena (re-clone or reset changed parts), free the slot.
6. Handle leaving: `PlayerRemoving` and character death during a match must end or adjust it.

## Keeping matches separate
- **Collision groups** per arena are rarely needed if arenas are far apart, but projectiles and explosions should only check players registered in that match. Keep a `match.players` set and ignore everyone else on the server.
- Use **per-match teams** in your own data, not Roblox `Team` objects, if several matches use "Red vs Blue" at once.
- Spectators: give them a camera view (client sets `Camera.CFrame` to a viewpoint in the arena) and set `Player.ReplicationFocus` on the server to a part in that arena so it streams in, then back to `nil`.

## Scaling numbers
- Small 1v1 arenas: 30-60 studs across, two spawns facing each other with cover between (see sightlines note).
- Count arenas: `ceil(maxPlayers / playersPerMatch)` slots means everyone could play at once; usually half of that is enough.
- Reset cost: re-cloning a 200-part arena is cheap; a 5,000-part one is not. Keep arenas simple.

## Pitfalls
- Players resetting during the countdown and keeping their pad spot.
- Tools from one minigame leaking into the hub.
- Two matches claiming the same slot because the busy flag was set after a yield. Mark the slot busy first, then yield.

## Related
[[Maps - Hub]] - [[Map Rotation and Voting - Loading Maps from ServerStorage]] - [[Social Hub and Lobby Layout]] - [[TeleportService Flows With Data and Reserved Servers]] - [[Map - Instanced Interior Slots - Pooled Copies and Streaming for Many Players]]
