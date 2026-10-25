---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Day and Night Readability per Setting"
tags: [roblox, community-knowledge, maps, lighting, day-night, readability]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/environment/lighting
  - https://create.roblox.com/docs/environment/atmosphere
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://book.leveldesignbook.com/process/lighting
---
# World - Day and Night Readability per Setting

A day/night cycle makes a world feel alive, but most maps are only tuned for noon. At night, paths vanish, enemies hide and phones show a black screen. The fix is a small table of lighting "keyframes" per setting, tested at both ends of the cycle, plus a few lights placed for **navigation**, not decoration.

## The Lighting properties that matter
- `ClockTime` (0-24) drives the sun and moon.
- `Brightness` (sun strength), `ExposureCompensation` (overall exposure).
- `Ambient` (indoor/shadowed fill) and `OutdoorAmbient` (sky fill in open areas).
- `EnvironmentDiffuseScale` / `EnvironmentSpecularScale` (how much the sky lights and reflects).
- `Atmosphere`: `Density`, `Offset`, `Color`, `Decay`, `Glare`, `Haze` (fog properties are hidden when an Atmosphere exists).

Never let night go fully black: keep `OutdoorAmbient` above roughly RGB 40-60 in a dark blue tint so silhouettes stay visible.

## Per-setting keyframes (starting points, tune by eye)
| Setting | Day | Night | Night navigation lights |
|---|---|---|---|
| City | Neutral sun, light haze | Blue ambient, warm street lamps | Street lights, neon signs, lit windows |
| Suburb | Warm sun | Deep blue, warm porches | Porch lights, street lamps at corners |
| Forest | Dappled, green-tinted ambient | Very dark, campfires | Lanterns along trails |
| Desert | High exposure, warm haze | Strong moon, cool blue | Fires at POIs, glowing signs |
| Snow | Lower exposure (snow clips white) | Moonlit blue snow looks bright already | Warm windows contrast best |
| Island | Saturated sky | Moon on water | Lighthouse beam, tiki torches |
| Space / indoor | Not tied to the clock | Not tied to the clock | Panel lights only |

## Building the cycle
```lua
-- Server: smooth cycle, 1 in-game day = 20 real minutes
local Lighting = game:GetService("Lighting")
local DAY_SECONDS = 20 * 60
game:GetService("RunService").Heartbeat:Connect(function(dt)
	Lighting.ClockTime = (Lighting.ClockTime + dt * 24 / DAY_SECONDS) % 24
end)
```
Blend `OutdoorAmbient`, `Atmosphere.Color` and exposure between keyframes (for example with TweenService at dusk and dawn) instead of snapping at 18:00.

## Navigation lights rule
- Every main path needs a light visible from the previous one at night.
- Interactables (doors, shops, quest givers) get a small light or glow so they read at night.
- Lights that only exist at night: enable them with a `ClockTime` check, and fade in over a few seconds.

## Performance budget
- Night maps tempt you to add hundreds of lights. Most should have `Shadows = false`; use `Neon` or emissive textures for distant glow.
- Test with Studio's graphics quality set low: lights fade with distance and fewer render on weak devices.

## Common mistakes
- Tuning only at noon; testing night once at the end.
- Pitch-black nights that make phone players quit.
- Snow and sand blown out at midday - lower exposure for bright settings.
- Lighting changes on the server every frame for tweened values players can't see; set keyframes on the server, smooth blends on the client if needed.

## Related
[[Maps - Hub]] - [[Guiding Players with Light, Color and Affordance]] - [[Biome Zone Detection for Lighting and Ambience Swaps]] - [[Horror Map Design - Pacing, Loops and Readable Darkness]]
