---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
title: "Fog Options - Lighting Fog vs Atmosphere vs Local Fog Volumes"
tags: [roblox, community-knowledge, weather, fog, atmosphere, horror]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/environment/atmosphere
  - https://create.roblox.com/docs/reference/engine/classes/Atmosphere
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
---
# Fog Options - Lighting Fog vs Atmosphere vs Local Fog Volumes

Fog is the most useful weather tool there is: it sets mood, hides the map edge, limits view distance for horror, and can save rendering work by making far detail pointless. Roblox has two global fog systems that **don't mix** (classic `Lighting` fog and the `Atmosphere` object) plus the option of local fog made from particles. Many "my fog doesn't work" questions come from not knowing which one is active.

## The rule that trips everyone

From the Lighting and Atmosphere references: **fog properties (`FogStart`, `FogEnd`, `FogColor`) are hidden when `Lighting` contains an `Atmosphere` object.** If an Atmosphere exists, setting `FogEnd` from a script appears to do nothing. Pick one system per place (or swap between them deliberately).

## Option 1: classic Lighting fog

| Property | Meaning |
|---|---|
| `FogStart` | Distance from the camera (studs) where fog begins |
| `FogEnd` | Distance where fog is fully opaque |
| `FogColor` | Fog colour |

Strengths: exact, predictable distances; a hard "you can see 80 studs" wall for horror, survival or a retro look. Weaknesses: flat, no sun scattering, and the sky is not fogged the same way, so the horizon can look cut off. Match `FogColor` to the sky's horizon colour to hide that.

Typical values: horror `FogStart 0`, `FogEnd 60-120`; misty forest `FogStart 40`, `FogEnd 300`.

## Option 2: Atmosphere (aerial perspective)

| Property | Effect |
|---|---|
| `Density` | How much the air obscures objects and terrain (and the sky behind them) |
| `Offset` | Higher = horizon silhouette; lower = distant objects blend into the sky |
| `Haze` | Visible haze above the horizon and far away; combine with `Color` for tinted fog |
| `Color` | Hue of the atmosphere |
| `Glare` | Sun glow; needs `Haze > 0` |
| `Decay` | Colour away from the sun; needs Haze and Glare |

Strengths: realistic, scatters light around the sun, blends with the sky. Weakness: no exact "fully opaque at N studs" control; very high density can make the sky show oddly through terrain (the docs warn to balance `Offset` with `Density`).

Typical: clear day `Density 0.3`, `Haze 0-1`; foggy morning `Density 0.45-0.55`, `Haze 2-3`, pale `Color`; toxic wasteland `Haze 2.8` with green-brown `Color`.

## Switching between them

For a weather system that needs a hard wall of fog during a "fog event" in an Atmosphere-based place:

1. Tween Atmosphere `Density` and `Haze` up first (smoothly hides the change).
2. Optionally reparent the Atmosphere out of `Lighting` (for example to ReplicatedStorage) so classic fog properties take effect, then set `FogEnd` low.
3. Reverse to clear.

Do this on the client inside your weather director to avoid replication pops. Test the moment of swapping; if it shows a visible jump, rely on Atmosphere alone and accept softer fog.

## Option 3: local fog volumes with particles

For low fog in a swamp, mist rolling through a graveyard, or a smoke-filled room, use a part-shaped `ParticleEmitter` volume:

- Emitter in a large, flat invisible part covering the area (particles spawn throughout the part's volume).
- Big soft particles: `Size` 8-20, `Lifetime` 8-15, `Rate` low (2-6), `Speed` 0.2-1, `Transparency` 0.85 -> 1 at both ends of life (fade in and out), `LightInfluence` 1 so they darken at night.
- `WindAffectsDrag = true`, `Drag` 1 for slow drift with GlobalWind.
- `Orientation = VelocityPerpendicular` or facing camera; test which hides sorting artifacts best in your scene.

Huge transparent particles overlap a lot, which is expensive (overdraw). Keep counts low, and disable volumes the player can't see.

## Fog as a gameplay and performance tool

- In horror, fog defines encounter distance; enemies should become visible just inside `FogEnd`, not pop in.
- Fog lets you lower streaming and LOD distances on big maps. Players can't see past it anyway.
- In PvP, fog changes balance (snipers suffer). Make fog events announced and fair, or map-specific.
- Pair fog with audio: muffled distant sounds and a slightly louder ambience bed sell thickness.

## Related
[[Weather - Hub]] · [[Fog, Snow, Wind and Layered Weather]] · [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] · [[Horror Map Design - Pacing, Loops and Readable Darkness]]
