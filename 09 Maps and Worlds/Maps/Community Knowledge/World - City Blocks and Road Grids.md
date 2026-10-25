---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - City Blocks and Road Grids"
tags: [roblox, community-knowledge, maps, city, roads, modular]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://kenney.nl/assets/city-kit-roads
  - https://kenney.nl/assets/city-kit-commercial
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/performance-optimization/design
  - https://book.leveldesignbook.com/process/layout
---
# World - City Blocks and Road Grids

A city map lives or dies on its grid. If the road module, sidewalk and block size are not fixed before you place a single building, every later piece (traffic, NPC paths, streaming, vehicle handling) fights misaligned seams. Decide the numbers first, then build fast.

## Layout plan
1. **Pick one road module.** A two-lane road is about 25 studs wide (2 x 12.5-stud lanes, see the scale note). Add 8-stud sidewalks each side: one road "cell" = ~41 studs.
2. **Pick a block size that is a multiple of that module.** 160 x 160 studs (10 s of walking at 16 studs/s) feels like a real block; 240+ feels like a chore on foot but fine in cars.
3. **Break the grid.** A perfect grid reads as "test map". Add one diagonal avenue, one plaza that removes a block, one dead end, and one raised highway or rail line. These become landmarks for free.
4. **Hierarchy of streets.** Main avenue (4 lanes, wide sidewalks, shops) - side streets (2 lanes) - alleys (12-16 studs, no sidewalk). Players read importance from width.
5. **Districts by height and color.** Downtown towers in the centre, low shops on the ring, warehouses at the edge near water. Heights make the skyline a compass.

## Key kits
- Kenney **City Kit (Roads)**, **City Kit (Commercial)**, **City Kit (Industrial)** - CC0, bundle-safe, already in `20 FBX Asset Library/Kenney/`.
- KayKit **City Builder** (CC0) for a chunkier look; see [[More Free Sources - KayKit]].
- ambientCG asphalt / concrete / paving texture sets (CC0) for SurfaceAppearance or MaterialVariant.

## Building it in Studio
- Set Studio's move snap to your module (e.g. 1 or 4 studs) and rotate snap to 90 for road pieces.
- Keep each block as one **Model** with a PrimaryPart at ground centre. Streaming then works per block; set `ModelStreamingMode` to `Atomic` only for things that must appear whole (a shop with a door script).
- Put roads, sidewalks and curbs in a separate folder from buildings so you can select-all and audit collision in one go.
- Interiors you can't enter: no interior at all. Use a dark window material or a parallax-looking decal.

## Lighting tips
- Street lights every 40-60 studs. Only every 2nd-3rd light needs `Shadows = true`; the rest can be cheap non-shadow `PointLight`s.
- `Atmosphere.Density` around 0.3-0.4 with a slight blue `Color` hides the map edge and gives depth between blocks.
- Neon signs on shopfronts carry night readability far better than more lamps.

## Performance budget
- Reuse the same mesh IDs across blocks; Roblox batches identical meshes much better than many unique ones.
- Turn `CastShadow` off on curbs, road markings, window frames and rooftop clutter.
- `CanTouch` and `CanQuery` off on decorative rooftop props; `CollisionFidelity = Box` on any building shell players never hug.
- Enable `StreamingEnabled` for anything above roughly 4-6 blocks per side, and test on a low-end phone.

## Common mistakes
- Roads 1 stud off the grid -> vehicles bump at every seam. Align, then weld or anchor.
- Real-scale cities: at 16 studs/s players cross a "realistic" block in seconds and the city feels empty. Scale by travel time, not metres.
- Every building different: the eye needs repetition plus a few unique landmarks, not 200 unique shells.
- Z-fighting road markings: raise decals/parts 0.01-0.05 studs, or use a Decal on the road face.

## Related
[[Maps - Hub]] - [[Scale in Studs - Real-World Sizes Converted]] - [[Zone Visibility Culling for Indoor and City Maps]] - [[Modular Kits from the Kenney FBX Library]]
