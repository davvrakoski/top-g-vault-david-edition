---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Footstep Dust, Splashes and Footprints by Floor Material"
tags: [roblox, community-knowledge, vfx, footsteps, materials, characters]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastParams
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://devforum.roblox.com/t/particle-on-a-humanoid/534515
  - https://devforum.roblox.com/t/2570529
  - https://devforum.roblox.com/t/footstep-module-does-not-work-for-r15/1897903
  - https://devforum.roblox.com/t/footprints-in-snow/917785
---
# Footstep Dust, Splashes and Footprints by Floor Material

Small puffs at the feet are what make a character feel grounded in the world: dust on dirt, spray in puddles, flakes in snow, nothing on carpet. The vault's audio note covers material-based footstep sounds; this is the visual half. It reuses the same trigger (a `Footstep` animation marker) and the same lookup (`Humanoid.FloorMaterial`), as DevForum threads in the sources suggest, and adds landing puffs and footprints.

## Trigger

- Fire on the `Footstep` marker of walk and run animations (param `"L"` or `"R"`), not on a timer. Steps then match the animation at any speed.
- Read `Humanoid.FloorMaterial` at that moment. If it is `Enum.Material.Air`, return early (a DevForum fix for dust appearing mid-jump).
- Position: the foot part (`LeftFoot` / `RightFoot` on R15) projected down to the floor with a short raycast, so puffs sit on slopes and stairs.

## Material table

| Floor material(s) | Visual | Emit | Notes |
|---|---|---|---|
| `Sand`, `Ground`, `Mud` | Brown dust puff | 3-4 | `LightInfluence = 1`, drifts low |
| `Grass`, `LeafyGrass` | Tiny grass bits | 2 | Only when running |
| `Snow` | White puff + footprint | 3 | Footprint decal, fades in 8 s |
| `Concrete`, `Asphalt`, `Pavement` | Faint grey dust | 1-2 | Run only; skip on walk |
| `Wood`, `WoodPlanks`, `Fabric`, `Plastic`, `SmoothPlastic` | None | 0 | Silence is fine |
| Shallow water / wet floor | Splash crown + ripple ring | 4 + 1 | See below |

Use **one** pooled emitter per effect type on the client, moved to the step position and `Emit()`ted, rather than emitters inside every character's feet. A single dust emitter can serve every character on screen.

Dust puff settings: `Lifetime = 0.5-0.8`, `Speed = 1-2`, `SpreadAngle = (60, 60)`, `Acceleration = (0, 0.5, 0)`, `Drag = 3`, `Size` 0.4 -> 1.2, `Transparency` 0.5 -> 1. Tint by the floor: copy the floor part's `Color` (or `Terrain:GetMaterialColor`) and lighten it.

## Water and puddles

`FloorMaterial` reports the material of what you stand on, and in ankle-deep terrain water it may report the bed material under the water rather than `Water` (unverified; test on your map). Detect water separately so you do not depend on it:

- Raycast down from the hip with `RaycastParams.IgnoreWater = false`. If the result `Material` is `Water` and the hit point is above the foot, the foot is in water.
- For puddle parts (flat transparent parts on wet streets), tag them with CollectionService and check the hit instance's tag.

Splash: 4 droplets (`Speed = 8`, `Acceleration = (0, -40, 0)`, `Lifetime = 0.35`) plus a flat ripple ring decal scaling 0.5 -> 2.5 studs over 0.4 s.

## Landings and slides

- Listen to `Humanoid.StateChanged`; on `Landed`, read the fall speed (the root part's last downward velocity). Above about 30 studs/s, emit a bigger ring of dust (`Emit(10)`, `Shape = Disc`).
- Sprint or slide: while the state is running and speed is high, emit one puff every 0.08 s from the trailing foot.

## Footprints (snow, sand, mud)

- A pooled set of small flat parts with a footprint `Decal`, placed at the step position, aligned to the floor normal and character facing, mirrored for left and right.
- Fade `Decal.Transparency` from 0.3 to 1 over 6-10 s, then return to the pool. Cap at 40-60 footprints per client.
- The DevForum "Footprints in snow" thread shows the same idea. Terrain cannot be deformed cheaply, so decals are the practical way.

## Budget and LOD

- Only run footstep VFX for characters within 60 studs; for NPC crowds, only the nearest 10.
- The local player's own steps are often hidden by the camera angle; keep them anyway for third-person, skip in first person.

## Related
[[VFX - Hub]] · [[Material-Based Footsteps - FloorMaterial and Animation Markers]] · [[Animation Markers for Hit Frames, Footsteps and Sync]] · [[Vehicle Dust, Mud and Tire Trail VFX]] · [[Rain Splashes and Ripples - Raycast Sampling Around the Camera]]
