---
title: "Atmospheric effects"
description: "Atmospheric effects simulate realistic environments by scattering sunlight in unique ways."
area: "30 Official Roblox Docs"
cluster: "Environment"
source: "https://create.roblox.com/docs/environment/atmosphere"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Atmospheric effects simulate realistic environments by scattering sunlight in unique ways.*

**Atmospheric effects** simulate realistic environments by scattering sunlight
in unique ways based on properties that control air particles. Using the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] object, you can:

- Control particle density.
- Create a silhouette or blend distant objects with an offset.
- Simulate a haze or glare.
- Set an atmosphere's color or decay.

*(image in the full Top G Vault)*

## Atmosphere properties

Every property of the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] object inside the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service works together to support the overall vision, themes, and mood of your game.

*(image in the full Top G Vault)*

### Density

The [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Density|Density]] property controls how many particles exist in the air of your game; the higher the density, the more particles, which obstruct a player's view of objects and terrain.

#### 0

*(image in the full Top G Vault)*

#### 0.35

*(image in the full Top G Vault)*

> [!info]
> Density only **directly** affects objects and terrain; however, since you view a [[30 Official Roblox Docs/Environment/Skyboxes|skybox]] through those objects and terrain, the visibility of a skybox is also affected.

### Offset

The [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Offset|Offset]] property controls how light transmits between the camera and the sky background. When you increase this value, it creates a horizon silhouette; when you decrease this value, it blends distant objects into the sky for a seemingly endless and seamless open world.

#### 0

*(image in the full Top G Vault)*

#### 1

*(image in the full Top G Vault)*

> [!warning]
> Carefully balance the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Offset|Offset]] property with the [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Density|Density]] property. A low offset value may cause the [[30 Official Roblox Docs/Environment/Skyboxes|skybox]] to be seen through objects and terrain, and a high offset value may cause distant objects and terrain to have too much detail for your desired lighting effect.

### Haze

The [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Haze|Haze]] property controls the haziness of the atmosphere to create a visible effect both above the horizon and far into the distance from the camera. To create environmental moods, like a smoky tint for a polluted alien planet or a foggy blue tint for a somber game, combine this property with the [[30 Official Roblox Docs/Environment/Atmospheric effects#Color|Color]] property.

#### 1

*(image in the full Top G Vault)*

#### 2.8

*(image in the full Top G Vault)*

### Color

The [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Color|Color]]
property sets the hue of the atmosphere for subtle environmental moods
and themes. To expand this property's visible effect, combine it with a high
[[30 Official Roblox Docs/Environment/Atmospheric effects#Haze|Haze]] property value.

#### [255, 255, 255]

*(image in the full Top G Vault)*

#### [255, 200, 255]

*(image in the full Top G Vault)*

### Glare

The [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Glare|Glare]]
property sets an atmospheric glare around the sun. A high value results in an
increased effect of sunlight cast onto the sky and game. To see this property's visible effect, you **must** combine a glare with a
[[30 Official Roblox Docs/Environment/Atmospheric effects#Haze|Haze]] value higher than 0.

#### 0

*(image in the full Top G Vault)*

#### 1

*(image in the full Top G Vault)*

### Decay

The [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Decay|Decay]]
property sets the hue of the atmosphere away from the sun, gradually falling off
from [[30 Official Roblox Docs/Environment/Atmospheric effects#Color|Color]] toward this value. To see this property's visible effect, you **must** combine a glare with [[30 Official Roblox Docs/Environment/Atmospheric effects#Haze|Haze]] and [[30 Official Roblox Docs/Environment/Atmospheric effects#Glare|Glare]] values higher than 0.

#### [255, 255, 255]

*(image in the full Top G Vault)*

#### [255, 90, 80]

*(image in the full Top G Vault)*

---
*Source: [Atmospheric effects](https://create.roblox.com/docs/environment/atmosphere) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
