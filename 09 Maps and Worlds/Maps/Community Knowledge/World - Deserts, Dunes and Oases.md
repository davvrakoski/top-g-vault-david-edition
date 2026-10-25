---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Deserts, Dunes and Oases"
tags: [roblox, community-knowledge, maps, desert, terrain, open-world]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/parts/terrain
  - https://create.roblox.com/docs/environment/atmosphere
  - https://create.roblox.com/docs/environment/lighting
  - https://ambientcg.com/
  - https://kenney.nl/assets/retro-urban-kit
---
# World - Deserts, Dunes and Oases

Deserts look easy (just sand) and play badly by default: no landmarks, no cover, one flat color, and a sun that bleaches everything. A good desert is a map of **points of interest separated by readable emptiness**, with heat and haze doing the mood work. This note covers open sand and dune fields; for rock walls see the canyon note.

## Layout plan
1. **Pick 4-7 POIs** (oasis, wrecked plane, mining town, temple, gas station, radio mast) and place them so each is visible from at least one other. In open sand, the sightline *is* the path.
2. **Dunes as walls.** Long dune ridges (30-60 studs high) split the map into basins. Players cross ridges at saddles; those saddles are where you put encounters.
3. **The oasis is the hub.** Water, palms and shade are the only "safe" visual in a desert; use it for the spawn, shop or quest giver.
4. **Roads or tracks** (darker packed sand, tire ruts) connect POIs for vehicles. Without them, players drive in circles.

## Terrain recipe
- `Sand` for dunes, `Sandstone` for exposed rock and plateaus, `Ground` or `Mud` for the packed road, `Grass` + `LeafyGrass` only at the oasis.
- Use the Terrain editor's Grow/Smooth on large brushes for dunes; keep slopes under roughly 40 degrees on paths so characters don't slide or stall.
- `Terrain:SetMaterialColor(Enum.Material.Sand, ...)` lets you warm the sand toward orange instead of the default pale yellow.
- ambientCG has CC0 sand and sandstone sets if you go with MaterialVariants.

## Lighting tips
- Midday desert: high `Brightness`, `ExposureCompensation` slightly negative (around -0.3 to -0.5) so sand doesn't clip to white.
- Golden hour (`ClockTime` 17-18.5) is the best-looking time; long dune shadows give form to flat sand. Consider locking the clock there.
- `Atmosphere`: warm `Color`/`Decay` (tan to orange), `Haze` 1-2, Density 0.3-0.4 for heat haze and to hide the far edge.
- Night deserts work well with a strong moon and cool blue `OutdoorAmbient`; stars sell the emptiness.

## Performance budget
- Deserts are cheap to render (few props), so spend the budget on hero POIs and a few large meshes rather than scatter.
- Large flat terrain is fine; avoid hidden terrain under dunes. Fill only what is visible.
- Use `StreamingEnabled` if the map is wider than ~2,000 studs; keep POIs as Atomic models so a town pops in whole.

## Common mistakes
- Uniform sand everywhere: break it with rock outcrops, darker gravel patches and wind ripples.
- No shade or shelter, so players never stop anywhere.
- Too much empty driving: at vehicle speed 80-100 studs/s, put something interesting every 15-20 seconds.
- Copying sunlit midday settings into night - the sand turns grey. Tint ambient instead.

## Related
[[Maps - Hub]] - [[Stylized Canyon and Cliff Production]] - [[Open World Layout - POIs, Triangle Rule and Travel Time]] - [[Wayfinding with Landmarks and Weenies]]
