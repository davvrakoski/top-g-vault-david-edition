---
title: "Atmosphere"
description: "The `Atmosphere` object pushes Roblox closer toward realistic environments where sunlight scatters in different ways depending on density and other air particle properties."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Atmosphere"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] object pushes Roblox closer toward realistic environments where sunlight scatters in different ways depending on density and other air particle properties.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Fog properties are hidden when Lighting contains an Atmosphere object.

The **Atmosphere** object pushes Roblox closer toward realistic environments where sunlight scatters in different ways depending on density and other air particle properties. It simulates real-world "aerial perspective" and lets you control light transmission from the background sky through distant objects. Furthermore, it controls haze and glare conditions, letting you tune a perfect sunset, foggy afternoon, and more.

See also:

- [[30 Official Roblox Docs/Environment/Atmospheric effects|Atmospheric Effects]] for property comparisons and example environments.
- [[30 Official Roblox Docs/Environment/Skyboxes|Skybox]] for how to change the default skybox for games and customize the lighting.
- [[30 Official Roblox Docs/Environment/Post-processing effects|Post-Processing Effects]] for how post-processing effects can quickly improve a game's visuals with a variety of customizable filters.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Changes the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere\|Atmosphere]] hue for subtle environmental moods. |
| [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Decay\|Decay]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | When used with increased [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Haze\|Atmosphere.Haze]] and [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Glare\|Atmosphere.Glare]], defines the hue of the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere\|Atmosphere]] away from the sun, gradually falling off from [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Color\|Atmosphere.Color]] towards this value. |
| [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Density\|Density]] | float | Defines the amount of particles in the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere\|Atmosphere]] and essentially controls how much in-game objects/terrain will be obscured by them. |
| [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Glare\|Glare]] | float | When used with increased [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Haze\|Atmosphere.Haze]], specifies the glow/glare of the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere\|Atmosphere]] around the sun. More glare results in an increased effect of sunlight cast onto the sky and world. |
| [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Haze\|Haze]] | float | Defines the haziness of the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere\|Atmosphere]] with a visible effect both above the horizon and into the distance. |
| [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Offset\|Offset]] | float | Controls how light transmits between the camera and the sky background. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

A [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value which changes the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] hue for subtle environmental moods. This is best combined with increased [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Haze|Atmosphere.Haze]] to expand the visible effect.

### Decay

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Defines the hue of the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] away from the sun, gradually falling off from [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Color|Atmosphere.Color]] towards this value. Must be used with [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Haze|Atmosphere.Haze]] and [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Glare|Atmosphere.Glare]] levels higher than 0 to see any effect.

### Density

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Defines the amount of particles in the air. The higher the density, the more particles and the more in-game objects/terrain will be obscured by them. Note that density does not **directly** affect the skybox — it merely affects in-game objects/terrain and visibility of the skybox through them.

### Glare

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Specifies the glow/glare of the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] around the sun. More glare results in an increased effect of sunlight cast onto the sky and world. Must be used with a [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Haze|Atmosphere.Haze]] level higher than 0 to see any effect.

### Haze

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Defines the haziness of the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] with a visible effect both above the horizon and into the distance. This can be combined with [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Color|Atmosphere.Color]] to create environmental moods, like a grey tint for a polluted alien planet.

### Offset

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Controls how light transmits between the camera and the sky background. Increase this value to create a horizon silhouette against the sky or reduce it to blend distant objects into the sky for an endless and seamless open world.

Offset should be balanced against [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Density|Atmosphere.Density]] and carefully tested in your place. A low offset may cause "ghosting" where the skybox can be seen through objects/terrain. This can be corrected by increasing the offset, which more clearly silhouettes distant objects/terrain against the sky, but too much offset may reveal level-of-detail "popping" for far distant terrain and meshes.

---
*Source: [Atmosphere](https://create.roblox.com/docs/reference/engine/classes/Atmosphere) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
