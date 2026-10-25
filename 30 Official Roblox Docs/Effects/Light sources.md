---
title: "Light sources"
description: "Light sources simulate realistic lighting from objects such as torches, spotlights, and screens."
area: "30 Official Roblox Docs"
cluster: "Effects"
source: "https://create.roblox.com/docs/effects/light-sources"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Light sources simulate realistic lighting from objects such as torches, spotlights, and screens.*

Local light sources simulate realistic lighting from objects such as
lamps, torches, spotlights, and TV screens. By using the different types of
light sources instead of just general global lighting through the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]]
service, you can create immersive environments such as cyberpunk cities,
traditional light festivals, and moody detective scenes.

*(image in the full Top G Vault)*

> [!info]
> The [[30 Official Roblox Docs/API Reference/Classes/Lighting#LightingStyle|LightingStyle]] property, modifiable only in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window for the global [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] object, sets your game's lighting style. For more information, see [[30 Official Roblox Docs/Environment/Global lighting#Appearance|Appearance]].

> [!success]
> To view **light guides** that indicate the color and field of effect from light sources, such as the angle of light emission from the cone's apex of a [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]], open [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]] and toggle on **Show Light Guides**.

## Light types

Local light sources include [[30 Official Roblox Docs/Effects/Light sources#PointLight|PointLight]], [[30 Official Roblox Docs/Effects/Light sources#SpotLight|SpotLight]], and [[30 Official Roblox Docs/Effects/Light sources#SurfaceLight|SurfaceLight]]. Each [[30 Official Roblox Docs/Effects/Light sources#Shared properties|shares various properties]] from the [[30 Official Roblox Docs/API Reference/Classes/Light|Light]] class, including [[30 Official Roblox Docs/API Reference/Classes/Light#Color|Color]], [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Brightness]], and [[30 Official Roblox Docs/API Reference/Classes/Light#Shadows|Shadows]].

### PointLight

A [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]] emits light spherically from a single point. This object is ideal for **non-directional** lights like bulbs, torches, and fireballs.

To create a point light in Studio, insert a [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]] into an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] ([[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] is recommended for point‑specific light emission). Then adjust the object's [[30 Official Roblox Docs/API Reference/Classes/PointLight#Range|Range]] as well as [[30 Official Roblox Docs/Effects/Light sources#Shared properties|shared properties]] like [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Brightness]] and [[30 Official Roblox Docs/API Reference/Classes/Light#Color|Color]].

#### Range

A point light's [[30 Official Roblox Docs/API Reference/Classes/PointLight#Range|Range]] property defines the radial distance of illumination from the light's position, measured in studs.

##### 8

*(image in the full Top G Vault)*

##### 12

*(image in the full Top G Vault)*

### SpotLight

A [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]] emits light in the shape of a cone with a spherical base. This object is ideal for directional lights like street lamps, flashlights, and headlights.

To create a spotlight in Studio, insert a [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]] into an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] and set its [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Face|Face]] property to specify which direction light emits from. Then adjust the [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Angle|Angle]] and [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Range|Range]], as well as [[30 Official Roblox Docs/Effects/Light sources#Shared properties|shared properties]] like [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Brightness]] and [[30 Official Roblox Docs/API Reference/Classes/Light#Color|Color]].

#### Face

A spotlight's [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Face|Face]] property determines which face/axis light emits from, as shown from the following streetlamp's glowing light part:

##### Bottom

*(image in the full Top G Vault)*

##### Left

*(image in the full Top G Vault)*

#### Angle

A spotlight's [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Angle|Angle]] property defines the angle of light emission from the cone's apex. The maximum value is `180` which illuminates a full half sphere from the apex.

##### 30

*(image in the full Top G Vault)*

##### 75

*(image in the full Top G Vault)*

### SurfaceLight

A [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight|SurfaceLight]] emits light from the face of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. This object is ideal for lighting from computer screens, billboards, signs, and fluorescent panels.

To create a surface light in Studio, insert a [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight|SurfaceLight]] into a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] and set its [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight#Face|Face]] property to specify which surface light emits from. Then adjust the [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight#Angle|Angle]] and [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight#Range|Range]], as well as [[30 Official Roblox Docs/Effects/Light sources#Shared properties|shared properties]] like [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Brightness]] and [[30 Official Roblox Docs/API Reference/Classes/Light#Color|Color]].

#### Face

A surface light's [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight#Face|Face]] property determines the face of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] from which light emanates. Notice that light emits from the entire surface, not just a point on the surface.

##### Bottom

*(image in the full Top G Vault)*

##### Right

*(image in the full Top G Vault)*

#### Angle

A surface light's [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight#Angle|Angle]] property defines the angle of light emission from the part's surface. An angle of `0` means that light travels directly outward from the surface while an angle of `180` means light travels outward perpendicular to the surface.

##### 0

*(image in the full Top G Vault)*

##### 60

*(image in the full Top G Vault)*

## Shared properties

All light sources share various properties from the [[30 Official Roblox Docs/API Reference/Classes/Light|Light]] class, including [[30 Official Roblox Docs/Effects/Light sources#Color|color]], [[30 Official Roblox Docs/Effects/Light sources#Brightness|brightness]], and [[30 Official Roblox Docs/Effects/Light sources#Shadows|shadows]].

### Color

The [[30 Official Roblox Docs/API Reference/Classes/Light#Color|Color]] property sets the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value of the emitted light.

#### [255, 100, 50]

*(image in the full Top G Vault)*

#### [0, 255, 125]

*(image in the full Top G Vault)*

#### [75, 150, 255]

*(image in the full Top G Vault)*

### Brightness

The [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Brightness]] property sets the light's brightness with maximum effect at the center of the light. Note that [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Brightness]] is still limited to the light's defined range, so a higher [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Brightness]] value doesn't light up a larger region around the light.

#### 2

*(image in the full Top G Vault)*

#### 10

*(image in the full Top G Vault)*

#### 50

*(image in the full Top G Vault)*

### Shadows

The [[30 Official Roblox Docs/API Reference/Classes/Light#Shadows|Shadows]] property projects shadows where light is blocked by an obstacle.

#### Enabled

*(image in the full Top G Vault)*

#### Disabled

*(image in the full Top G Vault)*

---
*Source: [Light sources](https://create.roblox.com/docs/effects/light-sources) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
