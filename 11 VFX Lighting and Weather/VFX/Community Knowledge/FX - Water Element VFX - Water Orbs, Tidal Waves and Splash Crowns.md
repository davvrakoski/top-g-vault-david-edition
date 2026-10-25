---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Water Element VFX - Water Orbs, Tidal Waves and Splash Crowns"
tags: [roblox, community-knowledge, vfx, abilities, water, elements]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/particle-emitters
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://create.roblox.com/docs/parts/materials
  - https://create.roblox.com/docs/effects/beams
---
# Water Element VFX - Water Orbs, Tidal Waves and Splash Crowns

Water abilities fail when they look like blue fire. Water has weight: it arcs, falls, splashes and leaves things wet. The trick is to keep the bright additive glow for the foam and highlights only, and build the body of the water from transparent, light-influenced layers that react to the scene's lighting. This note gives three standard water ability shapes.

## Palette and shading

- Body: (40, 120, 200) to (80, 180, 230), `LightInfluence` 0.6-1, `LightEmission` 0-0.2. Water should get darker at night.
- Foam and spray: near-white (230, 245, 255), `LightEmission` 0.4-0.7.
- Material for solid shapes: `Glass` with `Transparency` 0.4-0.6 gives a refractive look on higher graphics levels; `SmoothPlastic` with `Reflectance` 0.2 is the safe fallback. `ForceField` gives an animated rim that can pass for a magic water shell.

## Shape 1: water orb (projectile)

Layers on one moving part:

1. Core sphere mesh, Glass, `Transparency = 0.5`, slightly squashed along travel (scale Z by 1.2).
2. Inner swirl: ParticleEmitter, `LockedToPart = true`, `Shape = Sphere`, `ShapeStyle = Surface`, `Speed = 0`, `RotSpeed = (-90, 90)`, soft ring texture, `Rate = 20`.
3. Drip trail: ParticleEmitter with `Acceleration = (0, -40, 0)`, `Speed = 1`, `Lifetime = 0.4`, small droplets, `Rate = 30`. Drops fall behind the orb, which sells weight.
4. A `Trail` between two attachments on the orb, `Lifetime = 0.15`, transparent blue, `WidthScale` 1 -> 0.

## Shape 2: tidal wave (line attack)

- A curved wall mesh (a quarter-pipe, or the vault's `VFX_Shockwave_Wall` cut in half) that moves forward and grows: tween `Size` from (8, 1, 2) to (12, 6, 4) over the first 0.2 s, then travel.
- Foam crest: ParticleEmitter on an attachment along the top edge, `Shape = Box` stretched along the crest, `EmissionDirection = Top`, `Speed = 6`, `Acceleration = (0, -30, 0)`, white, `Rate = 80` while moving.
- Ground spray: an emitter at the base, `Speed = 10`, `SpreadAngle = (30, 30)`, short life.
- Fade: when the wave ends, tween transparency to 1 while emitting one large splash crown.

## Shape 3: splash crown (impact)

The impact is the moment players remember. Three bursts, all in the same frame:

| Layer | Emit | Key settings |
|---|---|---|
| Crown | 12-20 | `Orientation = VelocityParallel`, `Speed = 18-25`, `SpreadAngle = (25, 25)` around up, `Acceleration = (0, -60, 0)`, `Lifetime = 0.5` |
| Mist | 4-6 | Large soft puffs, `Speed = 4`, `Drag = 4`, `Transparency` 0.6 -> 1, `Lifetime = 0.8` |
| Ring | 1 | Flat ring decal or mesh on the ground, scale 1 -> 6 studs in 0.3 s, fade out |

Add a wet decal (darker, glossy circle) that fades over 4-6 s. It tells players where the hit was.

## Gameplay hooks that look good

- **Wet status:** while a target is wet, add a drip emitter at the torso (`Rate = 6`) and a slight blue `Highlight` fill (`FillTransparency = 0.85`). This pairs well with a lightning combo ("wet targets take extra shock damage"), which players learn from the visuals alone.
- **Water on water:** if the impact raycast hits Terrain with `Material = Water`, double the crown and skip the decal.
- **Fire contact:** steam puff (white-grey, rising, `Acceleration = (0, 6, 0)`) when water meets a fire effect.

## Budget

Most cost is in the crown and crest emitters. Mobile tier: crown 8, crest `Rate = 40`, no Glass (use `SmoothPlastic`).

## Related
[[VFX - Hub]] · [[Waterfall and Stream VFX — Layered Roblox Recipe]] · [[Water and Surface Interaction]] · [[Energy Orb and Projectile VFX]] · [[Highlight Instance - Outlines, X-Ray and the 255 Limit]]
