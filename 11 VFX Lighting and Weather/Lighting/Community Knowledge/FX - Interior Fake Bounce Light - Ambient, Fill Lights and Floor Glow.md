---
area: "11 VFX Lighting and Weather"
cluster: "Lighting"
title: "Interior Fake Bounce Light - Ambient, Fill Lights and Floor Glow"
tags: [roblox, community-knowledge, lighting, interiors, bounce-light]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://create.roblox.com/docs/effects/light-sources
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceLight
  - https://create.roblox.com/docs/environment/lighting
---
# Interior Fake Bounce Light - Ambient, Fill Lights and Floor Glow

In real rooms, sunlight hits the floor and bounces onto walls and the ceiling, so nothing indoors is truly black. Roblox's lighting gives you sky-occluded areas lit by `Lighting.Ambient` plus whatever local lights you place, but no full multi-bounce lighting you can art-direct per room. Rooms therefore often look either pitch black or flat grey. Lighting artists in every engine solve this the same way: **fake the bounce** with a few cheap, shadowless lights placed where the bounce would come from. This note gives the Roblox recipe.

## Step 1: get the global ambient right

From the Lighting docs:

- `Ambient` is the hue for areas occluded from the sky (indoors). Default black.
- `OutdoorAmbient` is the hue for outdoor areas. Default (127, 127, 127). Its effective value is never below `Ambient`.
- `EnvironmentDiffuseScale` adds ambient light derived from the sky; the docs recommend lowering `Ambient` and `OutdoorAmbient` when you raise it.

Starting point for a game with many interiors: `Ambient` around (35, 32, 30) (a slightly warm dark grey), `OutdoorAmbient` (110-130), `EnvironmentDiffuseScale` 0.3-0.6. Pure black `Ambient` makes every unlit corner a hole; too high and rooms look flat and outdoors-bright. If `GlobalShadows` is off, the docs note `OutdoorAmbient` is ignored and `Ambient` applies everywhere.

## Step 2: the three fake bounce lights

| Light | Where | Settings | Fakes |
|---|---|---|---|
| Floor bounce | `SurfaceLight` on a thin invisible part on the floor, `Face = Top` | `Angle = 120-180`, `Range = 8-14`, `Brightness = 0.3-0.8`, `Shadows = false`, colour = floor colour lightened | Light bouncing up from a sunlit floor onto walls and ceiling |
| Window fill | `SurfaceLight` on an invisible part just inside a window, facing into the room | `Angle = 90-120`, `Range` to the far wall, `Brightness = 0.5-1`, cool sky tint | Skylight pouring in |
| Corner fill | `PointLight`, no shadows, in the darkest corner, high up | `Range = 10-16`, `Brightness = 0.2-0.5` | General bounce so the corner is readable |

Rules:

- **No shadows on fake lights.** Shadows from a fill light reveal the trick and cost performance.
- **Colour from surfaces.** Bounce takes the colour of what it bounces off: a red carpet gives a faint red lift to the walls. This single detail is what makes the room feel real.
- **Low brightness.** A fill light you can clearly see as a light source is too bright. Toggle it on and off: the room should feel slightly less dead with it, not obviously lit by it.
- The SurfaceLight `Angle` of 180 spreads light parallel to the surface (per the docs, 0 is straight out), which is what you want for a soft floor wash.

## Step 3: key lights with shadows

Real lamps (ceiling lights, desk lamps, a TV) are your key lights: these may cast shadows. Keep shadowed lights few per room (1-2) and let the fakes do the rest. The vault's light budget note has the cost numbers.

## Step 4: baked help from textures

- Darken the bottom of walls and the corners in textures or with a dark gradient decal: this fakes ambient occlusion and grounds the room.
- Use a slightly lighter ceiling colour than walls; ceilings in games read too dark otherwise.

## Room-based mood

For a building with distinct rooms (a mall, a school, a horror house), store per-room tweaks and blend them when the player enters (zone check by region or tagged parts): a small `ColorCorrectionEffect` tint and `ExposureCompensation` (range -5 to 5; 1 doubles exposure) change. Keep changes small (exposure +-0.3) and tween over 0.5-1 s so they feel like the eye adjusting. The interior-exterior transitions note covers the door threshold itself.

## Quick test

1. Walk into the room at noon and at night.
2. Can you read every doorway and the floor edges without the flashlight? (Horror games may answer no on purpose.)
3. Do any fill lights draw a visible circle on the wall? Lower brightness or widen the range.
4. Check on the lowest graphics level: local lights still show, but shadows and some quality drop; the room should still be readable.

## Related
[[Lighting - Hub]] · [[Local Light Budgets - PointLight, SpotLight and SurfaceLight]] · [[Interior - Exterior Lighting Transitions]] · [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] · [[World - Mall and Shop Interiors]]
