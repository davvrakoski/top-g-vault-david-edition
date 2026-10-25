---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Ambient Fire Stacks - Campfires, Torches, Burning Barrels and Chimney Smoke"
tags: [roblox, community-knowledge, vfx, fire, smoke, ambient, environment]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/particle-emitters
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://create.roblox.com/docs/effects/light-sources
  - https://create.roblox.com/docs/reference/engine/libraries/math
---
# Ambient Fire Stacks - Campfires, Torches, Burning Barrels and Chimney Smoke

Environment fire is different from ability fire: it loops forever, there may be fifty of it on a map, and it is part of the lighting. The legacy `Fire` and `Smoke` objects are easy but hard to art-direct; a small "stack" of three emitters plus one flickering light looks far better and stays cheap if you share the flicker logic and cull by distance. This note gives four presets built on the same stack.

## The stack

From bottom to top, all on one part or attachment at the fuel:

1. **Flame core:** `Rate = 12-25`, `Lifetime = 0.4-0.7`, `Speed = 1-3`, `EmissionDirection = Top`, `Acceleration = (0, 4, 0)`, `Size` 1.2 -> 0.3, `Transparency` 0.2 -> 1, `LightEmission = 1`, `LightInfluence = 0`, flame flipbook, `Orientation = FacingCameraWorldUp` (flames stay upright when you look down at them).
2. **Embers:** `Rate = 3-6`, tiny bright dots, `Speed = 3-6`, `SpreadAngle = (20, 20)`, `Lifetime = 1.5-2.5`, `Drag = 0.5`, `WindAffectsDrag = true` so they drift with `workspace.GlobalWind`.
3. **Smoke:** `Rate = 3-6`, `Lifetime = 3-6`, `Speed = 1-2`, `Size` 1 -> 5, `Transparency` 0.6 -> 1, dark grey, `LightEmission = 0`, `LightInfluence = 1` (smoke must be lit by the scene, or it glows at night), `WindAffectsDrag = true`, `Drag = 0.5`, `RotSpeed = (-20, 20)`.
4. **Light:** one `PointLight`, warm (255, 160, 80), `Range = 12-20`, `Shadows` only on hero fires.

Smoke is the layer most often wrong. Bright, additive smoke reads as steam or magic; real smoke is darker than the sky and lit by the fire from below (a warm tint in the first 20% of its `Color` sequence helps).

## Presets

| Preset | Flame | Embers | Smoke | Light |
|---|---|---|---|---|
| Torch | `Rate 15`, size 0.8 | 2 | Very light, short (`Lifetime 2`) | Range 10, Brightness 1.5 |
| Campfire | `Rate 25`, size 1.5, two flame emitters offset | 5 | Medium | Range 18, Brightness 2 |
| Burning barrel | `Rate 20`, size 1.2, flames constrained by `Shape = Cylinder` to the rim | 4 | Thick, dark | Range 14, orange-red |
| Chimney | none | none | Tall, slow (`Lifetime 8`, `Speed 2`), light grey | none |

## Flicker: one loop for all fires

Do not put a script in every torch. Tag fire lights with CollectionService and drive them from one client loop using noise:

```lua
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function()
	local t = os.clock()
	local camPos = workspace.CurrentCamera.CFrame.Position
	for i, light in CollectionService:GetTagged("FireLight") do
		local near = (light.Parent.Position - camPos).Magnitude < 150
		light.Enabled = near
		if near then
			local base = light:GetAttribute("Base") or 2
			light.Brightness = base * (0.85 + 0.15 * math.noise(t * 3, i * 1.7))
		end
	end
end)
```

`math.noise` returns smooth values roughly in -1..1, so the light breathes rather than blinks. Keep the variation small (10-20%); strong flicker is tiring and can be a photosensitivity issue. (`light.Parent` is assumed to be a part here; for an attachment use `WorldPosition`.)

## Culling and budget

- Disable emitters (`Enabled = false`) on fires more than 150-200 studs away; existing particles finish naturally.
- Turn off flame and ember layers beyond 80 studs but keep the light: from far away, the glow is what you see.
- A map with 40 torches at full stack is roughly 40 x 25 = 1,000 live particles. Culling to the nearest 10-15 makes it trivial.
- Count real light sources too: many overlapping `PointLight`s in one area cost more than the particles. See the light budget note.

## Placement tips

- A fire should light something: place it near a wall or ground with texture so the light has a surface to show on.
- Pair chimney smoke with houses that are meant to be lived in; dead towns have none.
- At night, a campfire with a soft fog (`Atmosphere.Density` up a little) gives the classic "pool of light" composition.

## Related
[[VFX - Hub]] · [[Local Light Budgets - PointLight, SpotLight and SurfaceLight]] · [[Fire, Smoke, Lightning and Destruction]] · [[GlobalWind - Grass, Clouds, Particles and Gusts]] · [[Unity Labs CC0 Flipbooks - Smoke, Fire and Explosions]]
