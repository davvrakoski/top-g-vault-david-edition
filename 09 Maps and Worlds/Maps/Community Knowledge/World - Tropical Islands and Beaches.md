---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Tropical Islands and Beaches"
tags: [roblox, community-knowledge, maps, island, beach, water]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/parts/terrain
  - https://create.roblox.com/docs/education/build-it-play-it-create-and-destroy/island-terrain
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://kenney.nl/assets/pirate-kit
  - https://kenney.nl/assets/watercraft-kit
---
# World - Tropical Islands and Beaches

An island is the most self-explaining map in games: the water is the boundary, the peak is the landmark, and the beach ring is the path. It is a great first open map because players never get lost. The work is in making the coastline read well and keeping the water cheap.

## Layout plan
1. **Concentric rings:** sea -> reef / shallows -> beach (20-40 studs wide) -> palm belt -> jungle -> hill or volcano in the centre. Each ring is a different color band seen from anywhere.
2. **Off-centre peak.** Put the summit closer to one shore; the asymmetry tells players which side is "front".
3. **One harbour or pier** as the spawn/hub, a lighthouse on the far point as a counter-landmark.
4. **Satellite islets** 150-400 studs out give boat or swim goals and secrets.
5. **A coastal path** around the whole island so players can always find their way back.

## Terrain recipe
- `Water` sea at one fixed level, `Sand` beach sloping gently into it (shallow slope = readable shallows), `Rock`/`Basalt` headlands, `LeafyGrass` and `Grass` inland.
- Paint a band of shallow water over sand so the sea goes from pale turquoise to deep blue; that gradient comes from depth plus `Terrain.WaterColor` and `WaterTransparency`.
- Calm water: keep `WaterWaveSize` low (around 0.1-0.2) and `WaterWaveSpeed` modest; big waves read as storms.
- The Roblox "Build It, Play It" island-terrain lesson is a good step-by-step starting point.

## Key kits
- Kenney **Pirate Kit** (palms, ships, docks, barrels) and **Watercraft Kit**: CC0, bundle-safe.
- Kenney **Nature Kit** palms and rocks; Poly Haven CC0 rocks for a realistic version.

## Lighting tips
- High sun, saturated sky, `Atmosphere` light and blue-white (Density around 0.25-0.35) so distant islets fade but stay visible.
- Sunset over the sea is the screenshot. Set `GeographicLatitude` and orientation so the sun sets over open water, not over the hill.
- Bloom slightly up for sparkle on water; keep it subtle or the sand glows.

## Performance budget
- Terrain water is costly when it covers huge areas players can see. Keep the playable sea area modest and let `Atmosphere` fade the horizon.
- Palms: 2-4 meshes reused, `CastShadow` only near paths.
- Don't fill the ocean floor far from shore - nobody sees it. A shallow shelf around the island is enough.

## Common mistakes
- Beach too steep, so the shallows vanish and the coastline reads as a cliff.
- Sea level not matching the dock height; boats float above or below the pier.
- Invisible walls in the sea. Use distance (a current, a fog bank, or a "you're too far" respawn) instead.
- Swimming forever to nowhere: give every visible islet a reason to visit.

## Related
[[Maps - Hub]] - [[Terrain Water Gameplay - Swimming Checks, Disabling Swim and Water Settings]] - [[Lake, Dock and Stylized Water Scene]] - [[Stylized Coastal Mountain Biome — Roblox Production Recipe]]
