---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Magic Circles - Rotating Rune Decals, Rising Beams and Cast Telegraphs"
tags: [roblox, community-knowledge, vfx, magic, decals, beams, telegraph]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Decal
  - https://create.roblox.com/docs/effects/beams
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Magic Circles - Rotating Rune Decals, Rising Beams and Cast Telegraphs

A glowing circle of runes on the ground is the clearest way to say "a spell is being cast here", and it doubles as a gameplay telegraph: the circle shows exactly where an attack will land and how long until it does. Paid aura packs sell spinning sigils, but the effect is simple to build yourself from flat parts, decals and beams. This note covers the build, the animation and how to make the circle an honest warning.

## Build: layered flat rings

Make a model `MagicCircle` with 2-4 thin parts (`Size = (D, 0.05, D)`, `Transparency = 1`, `Anchored`, `CanCollide/CanQuery/CanTouch = false`), each with a `Decal` on the `Top` face:

| Layer | Texture | Spin | Colour |
|---|---|---|---|
| Outer ring | Thin ring with small runes | Slow, clockwise | Main colour |
| Inner sigil | Star, hexagram or glyph | Medium, counter-clockwise | Main colour |
| Core glow | Soft radial gradient | None | Lighter, more transparent |
| Optional rim | Ring of dots | Fast | White |

Draw textures white on transparent and tint with `Decal.Color3`, so one set of textures serves every element. Counter-rotating layers at different speeds are what make it look "arcane".

Glow: decals do not light the scene. Use bright tints and `Bloom` in post-processing for the glow, and add a `SurfaceLight` (or `PointLight`) under or above the circle to tint the ground around it. Some creators push decal `Color3` above 1 from a script for extra brightness; treat that as (unverified) and test it on your graphics levels. In very dark scenes, a light at the circle keeps it readable.

## Animation (one client loop)

```lua
local RunService = game:GetService("RunService")
local circles = {} -- [Model] = { layers = { {part, speed}, ... }, center = CFrame }

RunService.RenderStepped:Connect(function(dt)
	for model, data in circles do
		for _, layer in data.layers do
			layer.angle += layer.speed * dt
			layer.part.CFrame = data.center * CFrame.Angles(0, layer.angle, 0)
		end
	end
end)
```

Spawn: scale the circle from 0 to full size in 0.15 s (`EasingStyle.Back`) and fade decals from 1 to 0.2 transparency. Despawn: fade out and scale up 10% over 0.2 s.

## Rising beams and pillars

- **Rune pillars:** 4-6 attachments around the edge plus matching attachments 6-10 studs above; vertical `Beam`s with a scrolling upward texture (`TextureSpeed = 1`), `Width0 = 0.6`, `Width1 = 0`. They taper into the air.
- **Central column:** one wide beam at the centre when the spell fires.
- **Rising motes:** ParticleEmitter on the outer ring part (`Shape = Cylinder` flattened, `ShapeStyle = Surface`), `EmissionDirection = Top`, slow `Speed = 2`, small bright motes.

## Ground conforming

A flat circle floats over slopes and clips into steps. Options:

- Raycast at the centre and align to the hit `Normal` for gentle slopes.
- For uneven ground, prefer a few smaller circles or accept clipping; Roblox has no projected decals.
- Lift the circle 0.05-0.1 studs above the hit point to avoid z-fighting.

## As a telegraph (enemy spells)

The circle is a promise: "damage lands here, in this much time." Keep it honest:

1. Size the circle exactly to the server hitbox radius.
2. Show charge progress: an inner disc that grows from the centre to the edge over the wind-up, or the ring filling clockwise. Players learn "when it's full, it hits".
3. Fire the hit on the server at the same time the fill completes. Send the start time (`workspace:GetServerTimeNow()`) so every client shows the same progress regardless of ping.
4. Enemy telegraphs use a warning colour (red/orange); player spells use the player's element colour. Do not mix these.

## Budget

A circle is 3-4 parts and a few beams, cheap even in numbers. The cost is in overdraw when many large transparent decals overlap, so cap simultaneous large circles (for example 6 on screen) and shrink far ones out of the update loop.

## Related
[[VFX - Hub]] · [[Scrolling Textures, UV Animation and Emissive Decals]] · [[Beams, Trails and Attachments - Production Setups]] · [[VFX Color Language and Readability]] · [[Post-Processing - Bloom, Color and DOF]]
