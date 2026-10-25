---
title: "Lighting and effects"
description: "Create more immersive environments through lighting, atmospheres, and special effects."
area: "30 Official Roblox Docs"
cluster: "Environment"
source: "https://create.roblox.com/docs/environment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Create more immersive environments through lighting, atmospheres, and special effects.*

The [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] container services let you control and customize a game's environment such as [[30 Official Roblox Docs/Environment/Lighting and effects#Global lighting|lighting]], [[30 Official Roblox Docs/Environment/Lighting and effects#Atmospheric effects|atmosphere]], and [[30 Official Roblox Docs/Environment/Lighting and effects#Clouds and skies|clouds]]. You can also apply [[30 Official Roblox Docs/Environment/Lighting and effects#Post-processing effects|post-processing effects]] to adjust how the game appears on the screen.

## Global lighting

The [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service contains properties that you can adjust to update the global lighting in a game, such as the [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#Brightness|Brightness]].

### ClockTime = 0

*(image in the full Top G Vault)*

### ClockTime = 6.3

*(image in the full Top G Vault)*

### Brightness = 0.5

*(image in the full Top G Vault)*

### Brightness = 3.75

*(image in the full Top G Vault)*

> [!info]
> In addition to global lighting, you can create and attach [[30 Official Roblox Docs/Effects/Light sources|light sources]] to parts or attachments to simulate objects like lamps, torches, spotlights, or TV screens.

## Atmospheric effects

[[30 Official Roblox Docs/Environment/Atmospheric effects|Atmospheric effects]] simulate realistic environments by scattering sunlight in unique ways. Using the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] object in the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service, you can control air particle [[30 Official Roblox Docs/Environment/Atmospheric effects#Density|density]], simulate [[30 Official Roblox Docs/Environment/Atmospheric effects#Haze|haze]] or [[30 Official Roblox Docs/Environment/Atmospheric effects#Glare|glare]], set an atmosphere's [[30 Official Roblox Docs/Environment/Atmospheric effects#Color|color]], and more.

*(image in the full Top G Vault)*

*Atmospheric effects used to render a brilliant sunset scene*

## Clouds and skies

By default, the [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object forms a [[30 Official Roblox Docs/Environment/Skyboxes|skybox]] with celestial bodies such as a sun, moon, and stars. In addition, you can adjust the cloud cover, density, and color properties of the [[30 Official Roblox Docs/API Reference/Classes/Clouds|Clouds]] object to render realistic, [[30 Official Roblox Docs/Environment/Dynamic clouds|dynamic clouds]] that drift slowly across the sky through [[30 Official Roblox Docs/Environment/Global wind|global wind]].

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/clouds/Showcase.mp4)

*Wind blowing dynamic clouds across the sky*

## Post-processing effects

**Post-processing effects** are customizable filters that allow you to quickly
enrich the visuals of your game. Using the post-processing effect objects
in the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service or [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]], you can:

- Simulate a camera viewing a bright light and exaggerate its glow.
- Apply a Gaussian blur to the entirety of your game or add a blur to parts of your game that aren't in focus.
- Enhance an environment's appearance to create a specific mood through hue.
- Render a halo of light that moves with the sun.

*(image in the full Top G Vault)*

*Landscape with depth-of-field effect applied, simulating distance blur*

---
*Source: [Lighting and effects](https://create.roblox.com/docs/environment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
