---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
title: "Sandstorm, Blizzard and Ash Fall - Weather Recipes"
tags: [roblox, community-knowledge, weather, recipes, atmosphere, particles]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/environment/atmosphere
  - https://create.roblox.com/docs/environment/global-wind
  - https://create.roblox.com/docs/effects/particle-emitters
  - https://create.roblox.com/docs/environment/post-processing-effects
  - https://create.roblox.com/docs/environment/clouds
---
# Sandstorm, Blizzard and Ash Fall - Weather Recipes

Rain and clear skies are covered elsewhere in this vault. Desert, arctic and volcanic or post-apocalyptic maps need their own weather, and each one is the same five layers tuned differently: **Atmosphere** (how far you see and the air colour), **GlobalWind** (direction and gusts), **near-camera particles** (what flies past you), **colour correction** (overall tint), and **audio**. These recipes give starting values for each layer so you can block in a convincing event in minutes, then tune by eye.

## Shared setup

- Particles in a box around the camera: an invisible, non-colliding part (for example 80 x 40 x 80 studs) that a client script keeps centred on the camera each frame; the emitter spawns throughout the part.
- All particles: `WindAffectsDrag = true`, `Drag` > 0 so they follow `GlobalWind` (the docs' requirement).
- Run the transition on the client with tweens over 5-15 s; the server only sets the weather state.
- Quality tiers: scale `Rate` by device and a settings slider; low tier keeps Atmosphere and colour, drops most particles.

## Sandstorm

| Layer | Values |
|---|---|
| Atmosphere | `Density 0.55-0.7`, `Haze 2.5-3`, `Color` (205, 160, 110), `Offset 0.1` |
| GlobalWind | 40-60 magnitude, mostly horizontal, strong gusts |
| Particles A (sand streaks) | Small (0.05-0.15), `Rate` 200-400, `Lifetime` 1-2, `Drag` 3, `Squash` stretched, tan colour, `LightEmission` 0 |
| Particles B (dust clouds) | Size 10-20, `Rate` 3-6, `Lifetime` 4-6, `Transparency` 0.8 -> 1, same tan |
| ColorCorrection | `TintColor` (255, 230, 200), `Saturation` -0.15, `Contrast` -0.05 |
| Sun | Lower sun brightness or `ExposureCompensation` -0.3; the sun is a pale disc |
| Audio | Loud wind bed + high-pass hiss layer; muffle other SFX slightly |

Gameplay: shorten enemy detection range and show a "sandstorm incoming" warning 20-30 s ahead.

## Blizzard

| Layer | Values |
|---|---|
| Atmosphere | `Density 0.5-0.65`, `Haze 2-3`, `Color` (220, 230, 245) |
| GlobalWind | 30-50, gusty |
| Particles A (snow) | Size 0.15-0.35, `Rate` 300-600, `Lifetime` 3-5, `Drag` 2, `RotSpeed` random, white, `LightInfluence` 1 |
| Particles B (spindrift near ground) | Flat emitter at foot height, size 2-4, low transparency 0.85 -> 1 |
| ColorCorrection | `TintColor` (225, 235, 255), `Saturation` -0.3, `Brightness` 0.05 |
| Clouds | `Cover` 0.9-1, grey `Color` |
| Audio | Howling wind, muffled footsteps, creaking structures |

Gameplay ideas: a cold meter that fills outdoors (pair with the indoor detection used for rain), frost vignette UI that grows with the meter.

## Ash fall (volcanic or post-apocalypse)

| Layer | Values |
|---|---|
| Atmosphere | `Density 0.45`, `Haze 2`, `Color` (120, 110, 105); `Decay` warm orange near a volcano |
| GlobalWind | 3-8, slow and steady (ash drifts, it doesn't blast) |
| Particles A (ash flakes) | Size 0.1-0.3, `Rate` 80-150, `Lifetime` 6-10, `Speed` 0.5, `Drag` 1, grey-black, slow `RotSpeed` |
| Particles B (embers, near the source only) | Small, `LightEmission` 1, orange, `Rate` 10-20, rising with negative gravity (`Acceleration` up) |
| ColorCorrection | `Saturation` -0.4, `TintColor` (255, 235, 220), `Contrast` 0.1 |
| Lighting | Lower `Brightness`, warm `OutdoorAmbient`, red-orange sun colour via ColorCorrection or ClockTime near dusk |
| Audio | Low rumble, distant booms, crackle near embers |

## Transitions that feel natural

1. Wind picks up first (2-4 s ahead).
2. Particles ramp `Rate` from 0 over 5-10 s, with distant dust clouds before near-camera streaks.
3. Atmosphere density and colour tween over 10-15 s.
4. Ending: particles drop first, atmosphere clears last.

Never pop weather on instantly; it reads as a bug.

## Accessibility and fairness

- Keep UI readable on top of heavy weather: a darker backing on HUD text during storms.
- Offer a "reduce weather particles" setting; some players get motion sickness from dense flying particles.
- In PvP, announce storms and make them affect both teams the same way.

## Related
[[Weather - Hub]] · [[Production Weather State Machine]] · [[Fog Options - Lighting Fog vs Atmosphere vs Local Fog Volumes]] · [[GlobalWind - Grass, Clouds, Particles and Gusts]] · [[Weather Quality Tiers Lab]]
