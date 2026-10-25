---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
source_note: "23_Expanded_Knowledge/01_Terrain_and_Biome_Production"
title: "Terrain & Biome Production"
tags: [roblox, premium, "cluster/terrain-vegetation"]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Terrain & Biome Production

A Roblox environment should be designed as a gameplay system, not as one giant art scene.

## Production pipeline
1. Block out the playable route with primitive geometry first.
2. Prove traversal, sightlines, objectives, spawn locations, cover and landmark visibility.
3. Split the world into districts or streaming regions.
4. Build a reusable biome kit: ground materials, rocks, trees, bushes, decals, ambience and weather hooks.
5. Replace blockout only after navigation works.

## Terrain rules
- Large silhouettes matter more than micro-detail.
- Keep traversal surfaces readable; beautiful terrain that catches characters is bad terrain.
- Avoid thousands of tiny unique props when a reusable kit can produce the same visual richness.
- Use terrain, buildings and foliage as occlusion so the player is not rendering the entire map at once.
- Test slopes with every locomotion state and vehicle class.

## Vegetation
Use density tiers. Hero vegetation can be detailed near important paths; background foliage should be cheaper. Disable unnecessary collision on grass and decorative plants. Trees need intentional collision proxies rather than complex mesh collision when possible.

## Biome data
Represent a biome as data: lighting preset, weather probabilities, ambience, foliage set, enemy table, loot table and material palette. This lets designers tune a region without rewriting systems.

## Lab
Build one 300–500 stud district using only a reusable kit. Profile it empty, then with gameplay, then with maximum expected players. Record memory, frame time and network behavior in PERFORMANCE_LOG.md.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Terrain Vegetation - Hub]]

**Related notes:** [[Vegetation, Grass, and Trees Blueprint]]

<!-- TDOD_GRAPH_END -->
