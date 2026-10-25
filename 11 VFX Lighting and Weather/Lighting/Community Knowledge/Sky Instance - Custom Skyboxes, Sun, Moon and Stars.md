---
area: "11 VFX Lighting and Weather"
cluster: "Lighting"
title: "Sky Instance - Custom Skyboxes, Sun, Moon and Stars"
tags: [roblox, community-knowledge, lighting, skybox, sky, celestial]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/environment/skybox
  - https://create.roblox.com/docs/reference/engine/classes/Sky
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
---
# Sky Instance - Custom Skyboxes, Sun, Moon and Stars

The sky fills a third to half of the screen in most outdoor games, so it sets the mood more than any single model. The `Sky` object (parented to `Lighting`) holds six cube-face images plus a procedural sun, moon and stars that move with the time of day. Getting the faces right, matching the sun to the painted sky, and using orientation and celestial settings well is a large visual upgrade for very little cost.

## The six faces

Insert a `Sky` into `Lighting` and set `SkyboxBk`, `SkyboxDn`, `SkyboxFt`, `SkyboxLf`, `SkyboxRt`, `SkyboxUp`. The docs stress each image must be seamless along **all** edges with its neighbours when folded into a cube, otherwise seams show at the corners.

Practical tips:

- Most free skies come as an equirectangular HDRI; convert to six cube faces first (see the HDRI converter note in Community Resources).
- If one face shows a seam or is upside down, the converter used a different face convention; swap or rotate that one face, don't redo all six.
- The `Dn` face is rarely seen on land maps. Make it a plain dark colour to save a high-res upload, unless players fly or the map has big drops.
- Keep resolution consistent across faces; one blurry face stands out.

## Celestial bodies

| Property | Notes |
|---|---|
| `CelestialBodiesShown` | Master toggle for sun, moon and stars |
| `SunTextureId`, `SunAngularSize` | Sun look; size defaults to 21 degrees, clamped 0-60 |
| `MoonTextureId`, `MoonAngularSize` | Moon look and size |
| `StarCount` | Number of procedural stars (only when celestial bodies are shown) |

The docs suggest setting `SunAngularSize` or `MoonAngularSize` to 0 to hide one body while keeping the stars.

**Match the sun to the painting.** If your skybox has a painted sun, either hide the procedural sun (`SunAngularSize = 0`) and set `Lighting.ClockTime` and `Lighting.GeographicLatitude` so the real light direction comes from the painted sun's position, or remove the sun from the painting. Two suns, or shadows pointing the wrong way relative to the painted sun, look broken.

Use `Lighting:GetSunDirection()` to check where the sun is for a given time and latitude when lining things up.

## Orientation

`SkyboxOrientation` (Vector3 in degrees; applied Y, then X, then Z) rotates the skybox faces. The docs show slowly spinning Y for drifting clouds and fixing X/Z for a tilted sky. Caveats from the docs:

- Celestial bodies don't rotate with it.
- Indoor reflections of the sky are not rotated.
- Dynamic `Clouds` under Terrain are unaffected.
- A `Sky` inside a ViewportFrame uses the global orientation.

```lua
local RunService = game:GetService("RunService")
local sky = game:GetService("Lighting"):WaitForChild("Sky")
local SPEED = 0.6 -- degrees per second: slow enough to feel, not see
RunService.Heartbeat:Connect(function(dt)
	local o = sky.SkyboxOrientation
	sky.SkyboxOrientation = Vector3.new(o.X, (o.Y + SPEED * dt) % 360, o.Z)
end)
```

Run it on the client; it doesn't need to match between players.

## Day and night with one skybox or two

- **One painted sky + time of day:** Atmosphere and lighting colours do the day/night change; works well with neutral or cloud-only skyboxes.
- **Two skyboxes (day and night):** swap the six IDs at dusk while a dense `Atmosphere` or dark exposure hides the switch for a second. Preload both sets with `ContentProvider:PreloadAsync` so the swap doesn't show grey faces.
- Stars only look right on dark skyboxes; raise `StarCount` for remote or fantasy maps and lower it near city lights.

## Interaction with Atmosphere

A dense `Atmosphere` covers the lower sky with haze. `Atmosphere.Haze` and `Glare` change how much of the skybox horizon shows. If your painted horizon disappears, lower `Density` or `Haze`, or embrace it as fog. See the presets deep dive for full Atmosphere values.

## Checklist

- [ ] All six faces seamless, same resolution
- [ ] Painted sun position matches real light direction, or procedural sun hidden
- [ ] Orientation spin (if any) on the client, very slow
- [ ] Day/night skybox swap preloaded and hidden behind haze
- [ ] Sky licence checked (CC0 HDRIs are bundle-safe; others link only)

## Related
[[Lighting - Hub]] · [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] · [[HDRI to Roblox Skybox - Free Converter Workflow]] · [[Day-Night Cycle and Weather Transitions in Practice]]
