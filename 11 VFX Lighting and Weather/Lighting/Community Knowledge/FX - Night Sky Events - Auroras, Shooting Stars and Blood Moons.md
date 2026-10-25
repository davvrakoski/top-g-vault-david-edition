---
area: "11 VFX Lighting and Weather"
cluster: "Lighting"
title: "Night Sky Events - Auroras, Shooting Stars and Blood Moons"
tags: [roblox, community-knowledge, lighting, sky, night, events, beams]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Sky
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://create.roblox.com/docs/effects/beams
  - https://create.roblox.com/docs/reference/engine/classes/Trail
  - https://create.roblox.com/docs/reference/engine/classes/ColorCorrectionEffect
---
# Night Sky Events - Auroras, Shooting Stars and Blood Moons

Night is when many Roblox maps go dull: a dark skybox, some stars, done. Rare sky events (an aurora over the snowfields, a meteor shower, a red "blood moon" that buffs monsters) give players a reason to stay online after dark and to screenshot. They are mostly built from Beams and Trails placed far away and kept relative to the camera, plus small `Sky` and post-processing changes.

## Rule 1: sky effects follow the camera

Anything meant to be "in the sky" must not show parallax as the player walks, or it looks like a nearby prop. Put sky effects in a model and, every frame on the client, move it to the camera's XZ position (keep its height and rotation fixed). Distance: 300-800 studs away, high enough to sit above the skyline.

## Aurora curtains (Beams)

- 3-5 Beams, each between two attachments 150-300 studs apart, placed high in the northern sky.
- `FaceCamera = false`, oriented so the ribbon faces the player area (rotate the attachments so the beam's plane is vertical).
- `Width0 = Width1 = 60-120` (the curtain height).
- `CurveSize0/CurveSize1` 40-120 for a gentle S-curve; animate them with a slow sine (period 10-20 s) so the curtain waves.
- Texture: a vertical gradient, bright at the bottom edge and fading upward, plus soft vertical streaks. `TextureSpeed = 0.05-0.15` and `TextureLength` large, so the streaks drift slowly sideways.
- `Color` sequence from green (100, 255, 160) to teal, with a touch of magenta at one end; `LightEmission = 1`; `Transparency` 0.4-0.7 in the middle and 1 at both ends so there are no hard caps.
- Fade the whole aurora in and out over 20-30 s; auroras should never pop.

Pair with a tiny scene response: `Lighting.OutdoorAmbient` nudged slightly green and snow reflecting it.

## Shooting stars and meteor showers

- A pooled attachment with a `Trail` (`Lifetime = 0.4-0.8`, `WidthScale` 1 -> 0, white-blue, `LightEmission = 1`) moved fast across the sky (500-1500 studs/s) for 0.3-0.6 s, then disabled and `Clear()`ed.
- Spawn one every 15-60 s normally, every 1-3 s during a "meteor shower" event.
- Always travel downward at a slant; random directions look wrong.
- Optional gameplay: a meteor that lands spawns a collectible; telegraph the landing spot with a beam from the sky.

## Blood moon (or any themed night)

| Layer | Change |
|---|---|
| `Sky` | Swap `MoonTextureId` to a red moon texture; raise `MoonAngularSize` (the moon's apparent size in degrees) so it dominates the sky |
| `Sky.StarCount` | Lower, so the moon stands out |
| `ColorCorrectionEffect` | `TintColor` around (255, 200, 200), `Saturation` slightly down |
| `Atmosphere` | `Color` and `Decay` toward dark red, small `Haze` |
| `OutdoorAmbient` | Slight red tint |
| Gameplay | Server-side buffs, announced with a sound sting and chat line |

Tween all of these over 30-60 s at the start and end of the event. The server owns whether the event is active (attributes or a scheduled time), and each client applies the visuals.

## Moon phases: make your own

Do not use `Lighting:GetMoonPhase()`: the API docs mark it deprecated and say there is no way to change the moon's phase. If you want phases (for a "full moon" fishing bonus or a werewolf night), keep your own phase counter (for example one phase per in-game night, computed from server time) and swap `Sky.MoonTextureId` between a few phase textures. Computing it from the clock gives the same phase on every server.

## Budget

- An aurora is 3-5 beams: trivial. Shooting stars are one trail each from a small pool.
- Keep sky effects off in interiors (they would show through windows oddly if the camera is indoors and the effect is low).
- Respect a reduced-effects setting; turn off animated aurora waving first.

## Related
[[Lighting - Hub]] · [[Sky Instance - Custom Skyboxes, Sun, Moon and Stars]] · [[Beams, Trails and Attachments - Production Setups]] · [[Day - Night and Lighting Blueprint]] · [[FX - Seeded Weather Schedules - Same Weather and Forecast on Every Server]]
