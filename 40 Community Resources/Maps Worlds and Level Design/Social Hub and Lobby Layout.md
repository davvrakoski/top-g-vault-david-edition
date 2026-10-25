---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/social-hub-lobby-layout"
title: "Social Hub and Lobby Layout"
tags: [roblox, community, level-design, lobby, hub, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://www.above-the-garage.com/wienies/
  - https://book.leveldesignbook.com/process/layout/typology
  - https://create.roblox.com/docs/reference/engine/classes/SpawnLocation
  - https://create.roblox.com/docs/workspace/streaming/slim
---
# Social Hub and Lobby Layout

The lobby is your game's front door. In round-based games, simulators and hangouts, players spend a lot of time there, and it is where they decide to start a round, open the shop or leave. Its layout is level design like any other map.

## Hub and spoke (Disneyland and The Level Design Book)
Both Clarke-Willson's Disneyland article and The Level Design Book describe **hub and spoke**: a central hub, spokes out to areas, and players return to the hub to pick the next spoke. Disneyland puts a "weenie" (a big landmark) at the end of each spoke. In a lobby:

| Hub element | Lobby version |
|---|---|
| Central hub | The spawn plaza |
| Spokes | Short paths to: play portal/queue, shop, daily rewards, leaderboard, social area |
| Weenie per spoke | A big, animated, lit object over each destination (giant portal, shop sign, trophy) |
| Main spoke | The "Play" route is the widest, brightest and straight ahead of the spawn |

## Layout rules
- **Spawn facing Play.** Players should see the way into the game in the first second. Rotate every spawn pad toward it.
- **Short walks.** At 16 studs/s, a 100-stud walk is ~6 seconds. Keep every key destination within a few seconds of spawn; long lobby walks cost round starts.
- **Shop on the path, not behind it.** Put the shop beside the route to Play, not at the end of a separate dead end. Offer, don't block.
- **Queue pads in the open.** Party/queue pads where others can see who is waiting encourage joining. Put a countdown display above each.
- **A social corner.** Seats, a dance floor, a leaderboard wall: places to hang out between rounds without blocking the Play route.
- **Room for crowds.** Avatars cluster around portals and NPCs. Make the plaza and the space in front of portals wide, and spread several spawn pads so arrivals don't stack (SpawnLocation picks a random eligible spawn, but players can still overlap if they spawn at the same moment).
- **No combat or physics chaos near spawn.** Disable tools in the lobby or give the hub a no-damage zone.

## Keep it light
- The lobby is the first thing to load. Keep it small and cheap so join time stays short: few unique meshes, little transparency, few shadow-casting lights. Budgets: [[Map Performance Budgets - Draw Calls, Triangles and Mesh Reuse]].
- If the lobby overlooks a big world, use `SLIM` models for the distant view instead of loading the whole world at full detail.
- Seasonal events: swap decorations as a Model you clone in from `ServerStorage`, so the base lobby stays clean (same loading pattern as [[Map Rotation and Voting - Loading Maps from ServerStorage]]).

## Test it
Watch new players for the first 60 seconds: where do they look, where do they walk, how long until they enter a round? If most players wander to one corner first, that corner is your real "weenie"; put the Play portal there or move the distraction.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Lobby and Round System Blueprint]] · [[First 10 Minutes Retention Design]] · [[Wayfinding with Landmarks and Weenies]] · [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]]

<!-- TDOD_GRAPH_END -->
