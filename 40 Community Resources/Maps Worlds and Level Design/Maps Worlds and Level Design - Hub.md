---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/hub"
title: "Maps Worlds and Level Design - Hub"
tags: [roblox, community, level-design, maps, hub, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "mixed - see each note; all text is original summaries, all Luau is original"
sources:
  - https://book.leveldesignbook.com/
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art
  - https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146
  - https://devforum.roblox.com/t/ruskis-tutorial-5-how-to-design-an-open-world-map/3554962
---
# Maps Worlds and Level Design - Hub

Level design for Roblox: how to lay out maps that players can read, that play fairly, that run on a phone, and that you can measure. Community sources (DevForum tutorials, The Level Design Book, Disneyland and city-planning ideas) are summarized in our own words and turned into Roblox numbers; every script is original Luau. Checked **2026-10-25**.

> **Start here:** [[Level Design Reading List for Roblox Builders]] for the sources and what you may do with each, then [[Map Blockout to Art Pass Workflow]] (in 09 Maps and Worlds) for the build process.

## Layout principles
- [[Wayfinding with Landmarks and Weenies]] - Disneyland "weenies", Lynch's paths/edges/districts/nodes/landmarks, landmarks that survive streaming.
- [[Guiding Players with Light, Color and Affordance]] - four lighting passes, colour language, cheap guidance lights.
- [[Sightlines, Cover and Chokepoints for PvP Maps]] - utility/cost/information, soft vs hard cover as properties, a sightline-measuring tool.
- [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]] - how SpawnLocation really picks, ForceField limits, a safest-spawn script.
- [[Scale in Studs - Real-World Sizes Converted]] - 1 stud = 0.28 m, avatar heights, real sizes in studs, Roblox limits that beat realism.
- [[Map Boundaries, Kill Planes and Out-of-Bounds Handling]] - believable edges, player-only walls with collision groups, server out-of-bounds checks.

## Map types by genre
- [[Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane]] - PvP shapes, mirror vs 180-degree rotational symmetry (with a copy script).
- [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]] - sawtooth difficulty, teach-test-twist, checkpoint script.
- [[Tycoon Plot Layout and Plot Assignment]] - plot patterns, fair layouts, claim/release script.
- [[Horror Map Design - Pacing, Loops and Readable Darkness]] - intensity graphs, chase loops, readable dark.
- [[Open World Layout - POIs, Triangle Rule and Travel Time]] - Ruski's POI method in studs, streaming radius vs landmarks.
- [[Social Hub and Lobby Layout]] - hub and spoke lobbies, spawn facing Play, short walks.

## Terrain and building
- [[Real-World Heightmaps - Free DEM Sources and Licenses]] - USGS 3DEP, Copernicus GLO-30, Tangram Heightmapper, scale maths.
- [[Procedural Terrain with math.noise and WriteVoxels]] - seeded, chunked terrain generator with height/slope materials and water.
- [[Modular Kit Grid Audit - Module Sizes and an Off-Grid Finder]] - module sizes, find and snap off-grid pieces.
- [[Biome Zone Detection for Lighting and Ambience Swaps]] - streaming-proof zones in ReplicatedStorage, per-biome looks.

## Interiors, rounds and generation
- [[Interiors, Doors and Portals - In-Place Teleports vs Separate Places]] - real vs off-map interiors vs places, a portal script with pre-streaming.
- [[Map Rotation and Voting - Loading Maps from ServerStorage]] - map prefab rules, safe vote module, pre-streamed spawns.
- [[Room-Chain Generation with Connector Attachments]] - Doors-style room chains with entrance/exit attachments and overlap checks.
- [[Tile Grid Generation with Adjacency Rules]] - WFC-style tile solver with sockets and rotations.

## Performance
- [[Map Performance Budgets - Draw Calls, Triangles and Mesh Reuse]] - published budgets and per-zone splits.
- [[Map Audit Command Bar Script - Parts, Mesh IDs, Collision and Shadows]] - one report of what your map is made of.
- [[SLIM, RenderFidelity and LOD Choices for Map Builders]] - which LOD lever to use, SLIM rules and limits.
- [[Zone Visibility Culling for Indoor and City Maps]] - precomputed zone visibility and distance culling for non-streaming places.

## Playtesting and analytics
- [[Position and Death Heatmaps for Map Playtests]] - DataStore-backed heatmap collector and Studio visualizer.
- [[Zone and Stage Funnels with AnalyticsService]] - first-time zone funnels and deaths per zone.

## Reference
- [[Level Design Reading List for Roblox Builders]] - sources, authors and licenses.

## Already elsewhere in the vault (not repeated here)
Blockout phases, greybox colour code and metrics gym: [[Map Blockout to Art Pass Workflow]]. Kenney modular kits: [[Modular Kits from the Kenney FBX Library]]. Terrain Editor, heightmap import facts, MaterialVariants: [[Terrain Tools, Expanded Terrain and Material Variants]]. Genre lighting presets and blending code: [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]]. Streaming scripting: [[StreamingEnabled Gotchas and Streaming-Safe Client Code]]. Teleports between places: [[TeleportService Flows With Data and Reserved Servers]]. NPC pathfinding modifiers and links: [[Enemy AI Pathing Loop with PathfindingService]]. Collision fidelity: [[FBX Import Settings, Scale and Collision Fidelity]]. Official three-lane greybox: [[Greybox your environment]]. Area hubs: [[Maps - Hub]] and [[Terrain Vegetation - Hub]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Maps - Hub]] · [[Terrain Vegetation - Hub]] · [[Lighting - Hub]] · [[Procedural Generation - Hub]]

<!-- TDOD_GRAPH_END -->
