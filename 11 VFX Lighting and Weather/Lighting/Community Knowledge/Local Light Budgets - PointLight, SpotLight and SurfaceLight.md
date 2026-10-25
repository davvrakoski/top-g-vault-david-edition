---
area: "11 VFX Lighting and Weather"
cluster: "Lighting"
title: "Local Light Budgets - PointLight, SpotLight and SurfaceLight"
tags: [roblox, community-knowledge, lighting, performance, shadows, light-sources]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/light-sources
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://create.roblox.com/docs/reference/engine/classes/Light
---
# Local Light Budgets - PointLight, SpotLight and SurfaceLight

Local lights are what make a night street, a neon arcade or a torch-lit dungeon look rich, and they are also one of the easiest ways to tank frame rate, mostly because of **shadows**. Roblox's performance guide lists "excessive shadow casting" from many dense shadow-casting lights as a common render problem. This note is a practical budget: which light to use, how far it should reach, and which ones get shadows.

## Pick the right light

| Light | Emits | Use for | Key properties |
|---|---|---|---|
| `PointLight` | Sphere from a point | Bulbs, torches, fireballs, muzzle flashes | `Range` |
| `SpotLight` | Cone from a face | Street lamps, flashlights, headlights, stage lights | `Face`, `Angle` (max 180), `Range` |
| `SurfaceLight` | Whole face of a part | Screens, signs, fluorescent panels, light boxes | `Face`, `Angle` (0 = straight out), `Range` |

Shared (`Light` class): `Color`, `Brightness`, `Shadows`, `Enabled`. Parent point and spot lights to an **Attachment** for exact placement; the docs recommend attachments for point-specific emission.

Facts that change your design:

- **Range is clamped to 120 studs**, per the Lighting reference. A stadium can't be lit by one light; use the global `Lighting` setup for big spaces.
- **Brightness doesn't extend reach.** The docs note Brightness is limited to the light's range; turning it up only makes the centre hotter.
- Turn on **Show Light Guides** (Studio Settings) to see cones and ranges while placing.

## The budget (starting rules)

| Rule | Why |
|---|---|
| Shadows **off** by default on every new light | Shadows are the expensive part |
| Shadows on only for "hero" lights: the player's flashlight, a key interior lamp, a boss arena light | These are where shadows tell the player something |
| Keep `Range` as small as the look allows (8-20 for props, 30-60 for street lamps) | Range drives how many pixels and objects each light touches |
| Narrow SpotLight `Angle` (30-70) instead of wide cones | Less area, more drama |
| Prefer one bigger light to five overlapping small ones | Overlap costs and washes out contrast |
| Toggle lights per room or by distance indoors | The performance guide recommends disabling lights out of range or room by room |
| Disable shadows on moving lights where possible | Moving shadow casters update every frame |

Pair this with `BasePart.CastShadow = false` on small or distant clutter (the guide notes possible visual artifacts, so check). Also remember the engine reduces shadow quality as the graphics level drops and turns shadows off entirely below quality level 4. Your low-end look is "no shadows"; make sure the scene still reads.

## Fake it where you can

- **Glow without light:** Neon parts plus Bloom read as "lit" from a distance. Add a real light only near the player's path.
- **Window light:** a `SurfaceLight` on the inner face of a window with shadows off, instead of a sun shadow through a gap.
- **Light pools:** a soft radial decal on the floor under a lamp fakes the bounce cheaply.
- **Flicker:** animate `Brightness` with noise on the client, not on the server (no replication cost, and every client can run its own).

```lua
local RunService = game:GetService("RunService")
local light: PointLight = workspace.Lamp.Attachment.PointLight
local base = light.Brightness
local seed = math.random() * 100
RunService.Heartbeat:Connect(function()
	local n = math.noise(seed, os.clock() * 6) -- about -0.5..0.5 in practice
	light.Brightness = base * (0.85 + n * 0.3)
end)
```

## Distance culling for big maps

For street lamps across a city, a client script can enable only the nearest N lights (for example 24) every half second, sorted by distance to the camera, and switch the rest off along with their glow parts. Streaming (`StreamingEnabled`) also removes far lights automatically when their parts stream out.

## Measuring

Open the MicroProfiler and watch `Perform/Scene/computeLightingPerform` (light grid and shadow updates), `LightGridCPU` and `ShadowMapSystem`. Toggle shadows on a group of lights and compare. Test on a low-end phone at automatic graphics quality.

## Related
[[Lighting - Hub]] · [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] · [[Interior - Exterior Lighting Transitions]] · [[VFX looks good but kills FPS]]
