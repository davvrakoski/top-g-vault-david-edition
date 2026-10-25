---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Forest Campsites"
tags: [roblox, community-knowledge, maps, forest, campsite, survival]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://kenney.nl/assets/survival-kit
  - https://kenney.nl/assets/nature-kit
  - https://polyhaven.com/license
  - https://create.roblox.com/docs/environment/atmosphere
  - https://create.roblox.com/docs/reference/engine/classes/Fire
---
# World - Forest Campsites

A campsite is the classic survival, horror and story hub: a safe lit clearing surrounded by dark trees. The contrast does the level design for you - light means safety, the treeline means risk. Build the clearing with care and keep the forest cheap.

## Layout plan
1. **Clearing:** 80-140 studs across. Campfire in the centre, tents or cabins on a ring around it facing inward.
2. **Three to five trails** leave the clearing like spokes, each to one destination (lake, ranger tower, cave, ruined cabin). Each ends in a landmark tall enough to see over the trees.
3. **Density bands:** sparse within ~30 studs of trails, dense between trails. Dense bands act as soft walls without invisible walls.
4. **Map edge:** a ridge, river or very dense band, plus fog.

## Key kits
- Kenney **Survival Kit** (tents, campfire, crates, tools) and **Nature Kit** / **Mini Forest** (trees, rocks, logs): CC0, bundle-safe, in the local FBX library.
- Poly Haven models (CC0) for a realistic style; check triangle counts before import.
- Terrain grass with decoration for the ground.

## Lighting tips
- Night is the money shot: `ClockTime` around 20-22, low `Brightness`, dark blue `OutdoorAmbient`, campfire as the main light.
- Campfire: a `Fire` effect plus a `PointLight` (orange, Range 20-30, `Shadows = true`). Nudge its brightness from a client script for flicker. This is the one shadowed light that matters.
- Trail lanterns: no shadows, small range, spaced so the next one is always visible from the last.
- `Atmosphere` with Density around 0.4-0.5 and a dark color hides how few trees exist past 200 studs.

```lua
-- client flicker for the campfire light
local light = workspace.Camp.Fire.PointLight
local base = light.Brightness
game:GetService("RunService").Heartbeat:Connect(function()
	light.Brightness = base * (0.85 + math.noise(os.clock() * 3) * 0.3)
end)
```

## Performance budget
- Trees are the cost. Use 3-6 tree meshes in many rotations and scales, not 30 unique ones.
- `CastShadow = false` on far trees and all undergrowth; keep shadows on the ring around the clearing.
- Scatter with a rule (Poisson disk) instead of hand-placing thousands.
- Transparent leaf cards are costly on mobile; prefer opaque low-poly foliage.

## Common mistakes
- Even spacing that looks like an orchard.
- Trails invisible at night: use a lighter path material or light posts.
- A campfire light so wide the dark never feels dark.
- Trees floating on slopes: drop each one with a downward raycast and sink it 0.5-1 stud.

## Related
[[Maps - Hub]] - [[Poisson Disk Scatter for Trees, Rocks and Props]] - [[Vegetation Layering and Composition]] - [[Map Boundaries, Kill Planes and Out-of-Bounds Handling]]
