---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/open-world-layout"
title: "Open World Layout - POIs, Triangle Rule and Travel Time"
tags: [roblox, community, level-design, open-world, streaming, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/ruskis-tutorial-5-how-to-design-an-open-world-map/3554962
  - https://book.leveldesignbook.com/process/preproduction/pacing
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/workspace/streaming/slim
---
# Open World Layout - POIs, Triangle Rule and Travel Time

Open worlds on Roblox fail in a predictable way: a huge terrain map with a few buildings, where players walk for a minute, see nothing and leave. This note turns Ruski's open-world tutorial into numbers you can build with, and adds the Roblox streaming limits that change the design.

## Ruski's method (DevForum, March 2025)
*Ruski's Tutorial #5 - How to design an open world map* (Trustmeimrussian) prefers a compact map full of unique areas over a massive, repetitive one. The key tools:

- **Points of interest (POIs) first.** Cities, lakes, camps: places big enough to name on a minimap. Plan them before the map's shape.
- **A landmark per POI.** A tower, bridge, statue or odd building that is recognisable from far away (see [[Wayfinding with Landmarks and Weenies]]).
- **Triangle rule.** Connect POIs in triangles and keep at least three POIs on the horizon so players always have choices.
- **Travel time about 40 seconds** between POIs (depending on the game).
- **Spheres of interest.** Draw equal circles around POIs; where circles overlap, add **in-between locations** (campsite, cabin, bridge, farm).
- **Loot about 15-20 seconds** of walking off a main path.
- **Main path obvious, optional paths subtle** (broad lit entrances vs curved or hidden ones).
- Roughly **75% day / 25% night** if you have a cycle, and keep everything navigable in the dark and in bad weather.
- **Boundaries that match the look**: if something isn't enterable, it shouldn't look enterable.

His nine-step workflow: pre-plan POIs and spawn; block out POIs with the triangle rule; mark biome borders; main paths; spheres of interest; in-between locations; **playtest travel distances**; indirect paths; loot spots.

## Turning seconds into studs
At the default `WalkSpeed` of 16 studs/s (arithmetic, not from the tutorial):

| Rule | Seconds | Studs on foot | With a 2.5x vehicle (40 studs/s) |
|---|---|---|---|
| POI spacing | ~40 s | ~640 studs | ~1,600 studs |
| Loot off the main path | 15-20 s | 240-320 studs | - |
| "Something new on screen" | ~10 s | ~160 studs | ~400 studs |

If your game has sprinting, mounts or cars, design spacing around the **main** way players travel, and add detail along roads at vehicle spacing.

## Roblox-specific constraints
- **Streaming radius vs landmark distance.** New places stream by default, and the recommended `StreamingTargetRadius` is 1024 studs. POIs ~640 studs apart are fine, but landmarks you want visible from two or three POIs away (1,300-2,000 studs) will not be on the client. Set landmark models to `LevelOfDetail = SLIM` so a cheap stand-in renders when the full model is streamed out (see [[SLIM, RenderFidelity and LOD Choices for Map Builders]]).
- **Distance from the origin.** `Workspace.FallenPartsDestroyHeight` is clamped to +/-50,000 because parts behave badly far from the origin (floating point). Keep the whole playable world well inside that, centred near (0, 0, 0).
- **Detail where players look.** Ruski recommends detailing main paths and high-traffic areas, using big bulky props elsewhere, and reusing meshes with rotation and scale. Your heatmaps tell you where the traffic actually is: [[Position and Death Heatmaps for Map Playtests]].
- **Split when it's too big.** Very large worlds can become multiple places linked by teleports; see [[Multi-Place Experience Architecture]].

## Pacing an open world
The Level Design Book notes that open worlds have little scripted pacing, so **layout and metrics do the work**. One example it cites (Assassin's Creed missions, GDC 2016): concentric zones that get smaller and denser toward the objective. In Roblox terms: sparse, safe terrain far from a POI; more props, enemies and loot in rings as you get closer.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Open World RPG Starter Architecture]] · [[Large World Streaming Architecture]] · [[Streaming Open World Lab]] · [[Biome Zone Detection for Lighting and Ambience Swaps]]

<!-- TDOD_GRAPH_END -->
