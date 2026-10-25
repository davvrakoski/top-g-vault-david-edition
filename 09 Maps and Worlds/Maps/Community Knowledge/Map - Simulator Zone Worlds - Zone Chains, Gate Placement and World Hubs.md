---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Simulator Zone Worlds - Zone Chains, Gate Placement and World Hubs"
tags: [roblox, community-knowledge, maps, simulator, zones, progression]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.raphkoster.com/?p=2597
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/projects/teleport
---
# Map - Simulator Zone Worlds - Zone Chains, Gate Placement and World Hubs

A simulator's map is its progression bar. Each zone is a price wall with a new resource behind it, and the zone door is the goal players stare at the most. The layout has to show the next zone, make the trip between grinding and selling short, and keep the whole world light enough for phones even after 20 zones.

## Zone chain shapes
| Shape | How it looks | Good for | Watch out |
|---|---|---|---|
| **Linear chain** | Spawn - Zone 1 - gate - Zone 2 - gate ... | First 5-8 zones; very clear | Late players walk through every old zone; add a teleport menu |
| **Ring around spawn** | Zones arranged around a central hub, each gate faces the hub | 6-10 zones in one world; short walks back to sell | Hub gets crowded; keep it open |
| **Worlds** | Each set of zones is a separate "world" reached by a portal or teleport | 10+ zones, new themes, big updates | Content must stream or load; more places to maintain |

Most big simulators combine them: a linear chain inside each world, and a world hub or teleport menu between worlds.

## Gate placement
Raph Koster's zone design lessons (raphkoster.com) map well to simulator gates:
- **Zones are enclosed pockets** with their own look (walls, tree lines, cliffs), so each one feels like a place.
- **Few, obvious connections.** Players build a mental graph; one gate in and one gate out per zone keeps it simple.
- **Make the transition dramatic.** A gate is usually a passage between two tall things; a tight passage opening onto a wide view sells the new zone.
- **No invisible walls.** Blocking should match something visible (a gate, a force field, a cliff).

Simulator-specific rules:
1. **Let players see the next zone.** Place the gate where the locked zone's best landmark (a giant crystal, a castle) is visible through it. Seeing the reward is the motivation.
2. **Put the price on the gate in world space** (`SurfaceGui` or `BillboardGui`), with the player's own progress ("12.4K / 50K") so it updates per player on the client.
3. **The gate is per player.** One player unlocking must not open it for everyone. Use client-side gate parts or collision groups (see the gating note).
4. **Sell point and upgrade shop within a short walk** of each zone's grind area, or a sell pad in every zone. A 30-second walk to sell is fun once and tedious the hundredth time.

## Sizing a zone
- Size from **resource nodes**, not from looks: enough nodes that 10-15 players in one zone are not fighting over them. If node respawn is 10 seconds and a player clears one every 2 seconds, each player needs ~5 nodes; 12 players need ~60.
- Walk time across a zone: 10-20 seconds at the boosted speeds players have by then. If your game sells speed upgrades, check zones at both base and max speed.
- Cluster nodes in groups with small gaps so players can see the next cluster from the current one.

## World hubs and teleports
- Late-game players need a **teleport menu** to any unlocked zone. Teleport them with `PivotTo` on the character after a server-side unlock check.
- With streaming on, call `Player:RequestStreamAroundAsync(position)` before moving the character so the zone's ground is loaded when they arrive (Engine API: it asks the server to stream the area in, with an optional timeout).
- Separate places per world (via `TeleportService`) only when one place gets too heavy; it adds a loading screen and server hop.
- Give each world's hub the same layout (spawn, sell, shop, egg, gate in the same relative positions) so players never relearn where things are.

## Eggs, leaderboards and social proof
Put egg stands and the leaderboard **on the main path out of spawn**, not in a side room. Big pets following players and auras near the gate show new players what is coming.

## Performance
Twenty detailed zones in one place is a lot of memory. Group each zone in a `Model` with `ModelStreamingMode` left at default so it can stream out, use repeating meshes, and keep unique art for the landmark and the gate.

## Related
[[Maps - Hub]] - [[Simulator Genre Breakdown - Click, Upgrade, Zone, Rebirth]] - [[Gating Map Areas - Per-Player Barriers with Collision Groups and Local Parts]] - [[Case Study - Pet Simulator 99]] - [[Wayfinding with Landmarks and Weenies]]
