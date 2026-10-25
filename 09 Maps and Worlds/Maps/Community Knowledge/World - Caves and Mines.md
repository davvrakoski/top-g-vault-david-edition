---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Caves and Mines"
tags: [roblox, community-knowledge, maps, caves, mines, interiors]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://kenney.nl/assets/modular-cave-kit
  - https://create.roblox.com/docs/parts/terrain
  - https://create.roblox.com/docs/reference/engine/classes/SoundService
  - https://create.roblox.com/docs/environment/lighting
---
# World - Caves and Mines

Caves give players the feeling of exploration that open maps struggle to deliver: limited sight, branching tunnels and a reward around the corner. Mines add structure (tracks, supports, shafts) that make caves readable. The challenge is darkness that is moody but never confusing.

## Layout plan
1. **Chambers + tunnels.** Treat a cave as a graph: 4-8 chambers (40-100 studs wide) joined by tunnels (12-20 studs wide, never under ~10 for a third-person camera).
2. **One main loop plus dead-end side pockets.** The loop brings players back to the entrance; pockets hold loot, ore or secrets.
3. **Verticality.** At least one big shaft or chasm you see early and reach later. It shows the cave's scale.
4. **Mine logic:** rails lead from the entrance into the depths, wooden supports every 16-24 studs, lanterns on the supports. Players follow rails without being told.
5. **Exits glow.** Daylight at the entrance (bright, cool) contrasts with warm lantern light inside.

## Build methods
| Method | Pros | Cons |
|---|---|---|
| Terrain (carve with `Air`, `Rock`, `Slate`, `Basalt`) | Organic, cheap to iterate, diggable | Hard to get crisp ceilings; hidden voxels cost memory |
| Mesh kit (Kenney **Modular Cave Kit**, CC0) | Exact, snaps to grid, easy streaming | Repetition shows; needs good seams |
| Hybrid | Mesh tunnels + terrain chambers | Most work, best result |

Fill only a shell of rock around the cave; never leave a solid mountain of hidden terrain behind every wall.

## Lighting tips
- Interior caves receive no sky light, so set `OutdoorAmbient` darker inside via a zone swap, or rely on the cave blocking light with `Technology = Future`.
- Lanterns: warm `PointLight`s, Range 16-24, shadows only on every second or third one.
- Crystal or mushroom glow (neon parts + small non-shadowed lights) as navigation dots in natural caves.
- Give the player a light (a flashlight `SpotLight` on the character) if the cave is meant to be pitch dark, so dark means mood, not blindness.
- `SoundService.AmbientReverb = Enum.ReverbType.Cave` inside, reset at the exit; add drips as quiet looped sounds.

## Performance budget
- Caves are naturally occluded, so they can afford more detail per room than outdoor maps - but light count is the limit. Keep shadowed lights low.
- Use streaming or zone culling so the cave interior isn't rendered while players are outside.
- Ore and crystals: few meshes, many copies.

## Common mistakes
- Tunnels too narrow for the camera; it clips into rock constantly.
- Uniform darkness: players can't tell walls from openings. Light the openings.
- Every tunnel looks the same - give each chamber a color or feature (blue crystals, red rails, a waterfall).
- Mine carts and rails at the wrong gauge for your vehicle; test with the actual cart model.

## Related
[[Maps - Hub]] - [[Terrain Cost Audit - Hidden Voxels, Sculpt Where Seen and Terrain vs Mesh Ground]] - [[Runtime Terrain Destruction and Digging - Craters, FillBall and Replication]] - [[Horror Map Design - Pacing, Loops and Readable Darkness]]
