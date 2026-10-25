---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Mall and Shop Interiors"
tags: [roblox, community-knowledge, maps, mall, interiors, shops]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://kenney.nl/assets/mini-market
  - https://kenney.nl/assets/furniture-kit
  - https://create.roblox.com/docs/environment/lighting
  - https://create.roblox.com/docs/reference/engine/classes/SoundService
  - https://book.leveldesignbook.com/process/layout
---
# World - Mall and Shop Interiors

Malls are a favourite Roblox setting (roleplay, horror, survival, tycoon shops) because they combine a big readable atrium with dozens of small rooms. They are also one of the easiest maps to make expensive: many shops, many lights, glass everywhere. Plan the spine, then repeat a cheap shop module.

## Layout plan
1. **Spine + anchors.** One long concourse (24-40 studs wide) with an anchor store at each end. This "dumbbell" plan gives players two obvious goals.
2. **Atrium in the middle.** Two or three floors open to each other, an escalator pair, a fountain or food court. This is your landmark and your vertical sightline.
3. **Shop module.** Fix one shopfront width (for example 32 studs) and a depth (40-60 studs). Double-width units for bigger shops. Every shop slots into the same grid.
4. **Back corridors.** A service corridor behind the shops links stockrooms and gives loops for chases and flanking.
5. **Two exits from every space** (floor ends, parking lot, roof). Dead-end shops are fine; dead-end wings are not.

## Ceiling and scale
- Concourse ceiling 20-30 studs, atrium full height; shop interiors 14-18 studs (see the scale note).
- Shopfront opening at least 16 studs wide so groups and the camera pass through.

## Key kits
- Kenney **Mini Market** (shelves, fridges, checkout) and **Furniture Kit**: CC0, bundle-safe, in `20 FBX Asset Library/Kenney/`.
- ambientCG tiles, terrazzo and polished concrete (CC0) for floors via MaterialVariant or SurfaceAppearance.

## Lighting tips
- Malls are lit evenly from above. Use a grid of `SurfaceLight`s on ceiling panels with `Shadows = false`, plus a few shadowed spot lights over the atrium for depth.
- Give each shop one signature color in its sign and lighting; that color identifies it from across the concourse.
- `SoundService.AmbientReverb` (ReverbType values such as `Hallway`, `Auditorium`, `Room`) sells the big hollow space; switch per zone from a local script.
- For a "dead mall": kill most lights, add `Atmosphere` haze, leave a few flickering units.

## Performance budget
- Glass: a plain part with `Transparency` 0.6-0.8 and `CastShadow = false` is cheap and reads well; don't glaze every shopfront with many small panes.
- Shelving is the prop explosion. Merge a stocked shelf into one mesh per unit instead of 40 product parts.
- Treat each shop as a Model and stream or cull interiors players can't see from the concourse.
- Keep shadowed lights in the single digits per visible area on low-end targets.

## Common mistakes
- One giant box with no sightline breaks: add pillars, kiosks and planters.
- Every shop furnished at full density: pick 5-6 hero shops, shutter the rest.
- Escalators players can't climb smoothly: put an angled invisible ramp part under the visual steps.
- Real brand names or logos: invent your own shop names.

## Related
[[Maps - Hub]] - [[Camera-Friendly Interiors - Occlusion Mode, Ceiling Height and Zoom Limits]] - [[Zone Visibility Culling for Indoor and City Maps]] - [[Industrial Warehouse Interior — Modular Roblox Build]]
