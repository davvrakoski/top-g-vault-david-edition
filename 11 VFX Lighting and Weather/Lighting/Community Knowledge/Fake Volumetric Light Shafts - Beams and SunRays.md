---
area: "11 VFX Lighting and Weather"
cluster: "Lighting"
title: "Fake Volumetric Light Shafts - Beams and SunRays"
tags: [roblox, community-knowledge, lighting, god-rays, beams, atmosphere]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/beams
  - https://create.roblox.com/docs/reference/engine/classes/Beam
  - https://create.roblox.com/docs/reference/engine/classes/SunRaysEffect
  - https://create.roblox.com/docs/environment/post-processing-effects
  - https://create.roblox.com/docs/effects/light-sources
---
# Fake Volumetric Light Shafts - Beams and SunRays

Dusty light pouring through a church window, flashlight cones in fog, stage spotlights at a concert: these "volumetric" looks sell atmosphere instantly. Roblox has no true volumetric lighting for local lights, but two tools fake it well. `SunRaysEffect` is a screen-space glow from the sun. For everything else, textured **Beams** shaped like cones or slabs, with soft edges, read as light in the air. Pair each with a real `SpotLight` or `SurfaceLight` for the light on the floor.

## SunRaysEffect (sun only)

Parent a `SunRaysEffect` to `Lighting`. Two properties:

| Property | Effect | Starting value |
|---|---|---|
| `Intensity` | Strength of the rays | 0.05-0.15 for subtle, 0.25 for dramatic |
| `Spread` | How far rays reach across the screen | 0.5-1 |

It only works for the sun and only when the sun is on or near the screen, so it suits outdoor forests and ruins with gaps in cover. Higher intensity can wash out the whole frame when the player looks at the sun; keep it low and let the art carry the effect.

## Beam shafts (any light)

A `Beam` draws a textured strip between two `Attachment`s. For a light shaft:

1. Put `Attachment0` at the window (top) and `Attachment1` on the floor where the light lands.
2. `Width0` = window width, `Width1` slightly wider (light spreads).
3. `FaceCamera = false`, and rotate the attachments so the strip faces into the room. Add a second beam rotated 90 degrees for a cross shape that reads from more angles.
4. `Texture`: a soft vertical gradient with feathered edges (white, greyscale; tint with `Color`).
5. `LightEmission = 1` (additive glow), `LightInfluence = 0` (doesn't darken at night).
6. `Transparency` sequence: about 0.7 at the window, 0.85 mid, 1 at the floor, so it fades into the ground.
7. `Brightness` 1-3 depending on the scene.

```lua
local function lightShaft(top: Attachment, bottom: Attachment, width: number, color: Color3): Beam
	local beam = Instance.new("Beam")
	beam.Attachment0, beam.Attachment1 = top, bottom
	beam.Width0, beam.Width1 = width, width * 1.4
	beam.FaceCamera = false
	beam.LightEmission = 1
	beam.LightInfluence = 0
	beam.Color = ColorSequence.new(color)
	beam.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.7),
		NumberSequenceKeypoint.new(0.6, 0.85),
		NumberSequenceKeypoint.new(1, 1),
	})
	beam.Texture = "rbxassetid://0000000000" -- your soft gradient texture
	beam.TextureMode = Enum.TextureMode.Stretch
	beam.Parent = top
	return beam
end
```

## Dust and motion

- **Floating dust:** a slow `ParticleEmitter` inside the shaft volume (Rate 3-8, tiny size 0.05-0.1, Lifetime 6-10, very low Speed, `LightEmission` 1). Only the particles inside the light read, which sells the volume.
- **Breathing light:** gently tween the beam's `Brightness` or scroll `TextureSpeed` very slowly for drifting haze.
- **Interrupted light:** for a rotating fan in front of a window, pulse the beam's transparency in sync with the blades for a strobing shaft.

## Flashlight and spotlight cones

For a flashlight in fog, use a cone made of 2-3 crossed beams from the lens attachment to a point ahead, plus the real `SpotLight` (`Angle` 30-45, `Range` 40-60). Attach both to the tool. The beam cone should be **very** transparent (0.85-0.95); a bright cone hides what the player is trying to see.

For stage lights, coloured beams plus a `SpotLight` with the same colour; animate rotation on the client to the music (see the AudioAnalyzer note).

## Reading in context

- Shafts read best against **darker** backgrounds and with some `Atmosphere` haze or fog. In a bright, clear scene they look like glass panels.
- Viewing beams edge-on makes them disappear. Crossed beams or a slight `FaceCamera` cheat helps for shafts the player walks around.
- Keep shafts out of gameplay sightlines in PvP; bright additive beams can hide players.

## Budget

Beams are cheap compared with real lights, but they are transparent and additive, so many overlapping beams cause overdraw. A room needs 2-6 shafts, not 30. Disable beams in rooms the player isn't in.

## Related
[[Lighting - Hub]] · [[Beams, Trails and Attachments - Production Setups]] · [[Local Light Budgets - PointLight, SpotLight and SurfaceLight]] · [[Interior - Exterior Lighting Transitions]]
