---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/guiding-light-color-affordance"
title: "Guiding Players with Light, Color and Affordance"
tags: [roblox, community, level-design, lighting, guidance, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://book.leveldesignbook.com/process/lighting
  - https://devforum.roblox.com/t/ruskis-tutorial-5-how-to-design-an-open-world-map/3554962
  - https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146
  - https://create.roblox.com/docs/reference/engine/classes/PointLight
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/lighting/create-flickering-lights
---
# Guiding Players with Light, Color and Affordance

You can't put an arrow on everything. Good maps steer players with light, colour and shapes that say "go here" or "use me" (affordance). This note collects the techniques and shows how to do them cheaply on Roblox.

## The four lighting passes (The Level Design Book)
The Level Design Book (book.leveldesignbook.com, CC BY-NC-SA 4.0, read and linked, not copied) splits level lighting into passes. In Roblox terms:

| Pass | Goal | Roblox tools |
|---|---|---|
| 1. Global | Overall mood and readability | `Lighting` properties, `Atmosphere`, sky. Presets: [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] |
| 2. Wayfinding | Light the critical path's entrances and exits from the direction players arrive | A `PointLight`/`SpotLight` beside each important doorway, emissive `Neon` trims |
| 3. Gameplay | Show enemy approach routes, puzzle parts and pickups | Spotlights on key objects, coloured light for hazards |
| 4. Detail and mood | Polish | Keep this pass short: late tweaks often break passes 2-3 |

Other ideas from the same chapter:
- **Hierarchy:** main exits get the brightest, most focused light; side rooms are dimmer.
- **Motivated light:** every light should have a visible source (lamp, window, fire). Unmotivated glow looks wrong.
- **Don't make albedo too dark.** Very dark textures soak up light, so the scene stays murky however bright the lights are.

## Colour language
- **Pick a short colour code and keep it all game long.** For example: yellow = interactable, red = damage, green = safe/checkpoint, blue = water or cold. Players learn it in minutes.
- **Use value (light vs dark), not only hue.** Colour-blind players and phone screens in sunlight depend on contrast.
- **Give each district its own palette** (Ruski's open-world tutorial recommends distinct palettes per location). See [[Wayfinding with Landmarks and Weenies]].

## Affordance: shapes that explain themselves
- Open doors and lit doorways read as "go"; closed, dark, plain doors read as "not now" (the anti-weenie).
- Wide entrances suggest the main path; narrow, curved or half-hidden entrances suggest optional content (Ruski, open-world tutorial).
- Ledges players should grab or jump to get a consistent material or trim colour across the whole game.
- Breadcrumbs (coins, footprints, scorch marks) pull players along a route and reward them for following it.

## Doing it cheaply on Roblox
- Local lights are not free. MrChickenRocket's guest article on the DevForum (2024) recommends a few small lights without shadows over large or shadow-casting ones. Set `Shadows = false` on fill and wayfinding lights; keep shadows for one or two hero lights per area.
- Local light `Range` is capped (see the `PointLight` reference), so a big room needs a few lights or a brighter ambient, not one huge light.
- A `Neon` strip or a `SurfaceAppearance` emissive trim often guides as well as a real light, at a fraction of the cost.
- Flicker sparingly. Roblox's [[Create flickering lights]] tutorial shows how; reserve flicker for "danger here" so it keeps its meaning.

## Check it
1. Turn graphics quality down to the lowest level in Studio and walk the critical path.
2. Take a greyscale screenshot (desaturate it in any image editor). If the path and doors don't stand out in greyscale, add value contrast.
3. Watch a first-time tester: if they ignore a lit door, it is either not bright enough compared with its surroundings, or something brighter is competing with it.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] · [[Interior - Exterior Lighting Transitions]] · [[Wayfinding with Landmarks and Weenies]] · [[Horror Map Design - Pacing, Loops and Readable Darkness]]

<!-- TDOD_GRAPH_END -->
