---
area: "11 VFX Lighting and Weather"
cluster: "Lighting"
title: "Neon City at Night - Signs, Light Pools and Fake Wet Reflections"
tags: [roblox, community-knowledge, lighting, night, neon, city, cyberpunk]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://create.roblox.com/docs/reference/engine/classes/BloomEffect
  - https://create.roblox.com/docs/reference/engine/classes/Atmosphere
  - https://create.roblox.com/docs/parts/materials
  - https://create.roblox.com/docs/effects/light-sources
---
# Neon City at Night - Signs, Light Pools and Fake Wet Reflections

The neon-soaked night street (dark buildings, glowing signs, coloured pools of light on wet asphalt, haze in the air) is one of the most screenshotted looks in Roblox roleplay, crime and cyberpunk games. Roblox can do most of it well, with one big limitation to design around: `Neon` parts glow and bloom but **do not light their surroundings**, and reflections come from the environment and sky rather than from nearby signs. Everything that looks like "the sign lights the street" is a placed light or a fake.

## Global night settings (starting point)

| Setting | Value | Why |
|---|---|---|
| `ClockTime` | 0-1 or 21-23 | Deep night, no sun |
| `Brightness` | 0.5-1 | Moonlight should not compete with signs |
| `OutdoorAmbient` | (40, 40, 65) | Dark blue-purple base, still readable |
| `Ambient` | (20, 20, 30) | Alleys and interiors darker |
| `EnvironmentSpecularScale` | 0.8-1 | Smooth materials pick up reflections |
| `ExposureCompensation` | 0 to +0.3 | Small lift for phones; avoid crushing blacks |
| `Atmosphere.Density` | 0.3-0.4 | Haze that catches light |
| `Atmosphere.Color` | (90, 70, 120) | Purple city haze |
| `Atmosphere.Haze` | 1.5-3 | Distant buildings fade into colour |
| `BloomEffect` | `Intensity 0.8-1.2`, `Size 24-40`, `Threshold 0.9-1.5` | Neon blooms, normal surfaces do not |

Tune bloom with `Threshold` first: too low and all bright surfaces glow, washing out the scene.

## Signs

- Letters and tubes: `Neon` material parts or meshes, saturated colours (hot pink, cyan, amber). Neon reads brighter with saturated colour than with white.
- Back plates: dark matte material so the neon pops.
- Under each big sign, add one `SpotLight` or `SurfaceLight` pointing at the street and wall in the sign's colour, `Shadows = false`, `Range = 12-25`. This is the "light pool" the sign seems to cast.
- Keep each block to a palette of 2-3 sign colours; a rainbow street looks like noise.

## Light pools and street lamps

- Street lamps: a `SpotLight` pointing down (`Angle = 70-100`), warm sodium orange (255, 170, 90) or cold LED white, alternating zones of light and darkness every 20-30 studs. The dark gaps are what make the lit areas feel bright.
- Only a few lights should cast shadows (one per intersection); the rest are fill.

## Fake wet reflections

Real screen-space reflections are not available, so fake them:

1. **Glossy road:** asphalt or a `MaterialVariant` with low roughness and slightly darker colour; with `EnvironmentSpecularScale` up, it catches sky and ambient reflections, which already reads as wet.
2. **Reflection streaks:** under each bright sign, a long vertical streak decal on the road (a blurred, stretched blob of the sign's colour, semi-transparent) pointing toward the camera's typical view. Wet asphalt reflections are long vertical smears, so the fake matches what the eye expects.
3. **Puddles:** flat darker patches with higher reflectance and a faint ripple decal during rain. Tag them for splash effects.
4. **Coloured light pools** from step above land on the glossy road and do much of the work.

The streak trick is view-dependent: it looks best on streets where the camera mostly looks along the road (racing, third-person walking). Check it from above too.

## Animation that sells "alive"

- One client loop flickers a few broken signs (toggle `Material` between `Neon` and `SmoothPlastic` with irregular timing) and pulses others slowly. Keep flicker on a small minority of signs, and avoid fast strobing (photosensitivity).
- Drifting steam from vents (light-influenced grey particles) catches the coloured lights beautifully.
- Light rain plus haze multiplies the effect; see the rain notes.

## Budget

- Cities stream in and out; put sign lights in the same model as the sign so they stream with it.
- Many overlapping local lights are the main cost. Use one light per sign cluster, not per letter.
- Mobile: bloom and haze cost little; shadows and many lights cost more. Keep shadowed lights rare.

## Related
[[Lighting - Hub]] · [[Glowing Surfaces - Neon Material, Emissive Masks and Bloom]] · [[Local Light Budgets - PointLight, SpotLight and SurfaceLight]] · [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] · [[Rain Production System]]
