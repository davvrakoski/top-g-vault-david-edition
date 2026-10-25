---
title: "Global lighting"
description: "Explains how to customize the global lighting with the Lighting service."
area: "30 Official Roblox Docs"
cluster: "Environment"
source: "https://create.roblox.com/docs/environment/lighting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to customize the global lighting with the Lighting service.*

The [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service contains properties that you can adjust to update
and customize the global lighting in a game. There are five categories of
lighting properties:

- [[30 Official Roblox Docs/Environment/Global lighting#Color|Color]] — Configures hue within the game.
- [[30 Official Roblox Docs/Environment/Global lighting#Intensity|Intensity]] — Configures the intensity or amount of light hitting the camera.
- [[30 Official Roblox Docs/Environment/Global lighting#Shadows|Shadows]] — Configures how a user experiences shadows within the game.
- [[30 Official Roblox Docs/Environment/Global lighting#Appearance|Appearance]] — Properties that determine the lighting style and lighting/shading quality or view distance prioritization.
- [[30 Official Roblox Docs/Environment/Global lighting#Environment|Environment]] — Configures the conditions of the game's world, such as the time of day and geographic latitude.

## Color

### Ambient

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] property sets a hue for the **entirety** of a game. This property affects the lighting for both outdoor and indoor environments.

#### [0, 0, 0]

*(image in the full Top G Vault)*

#### [160, 80, 0]

*(image in the full Top G Vault)*

#### [25, 0, 125]

*(image in the full Top G Vault)*

### OutdoorAmbient

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]]
property sets a hue for **outdoor areas** of a game. This can
help simulate how the ambient color of real-life lighting changes
throughout the day. For example, sunlight in the early morning or late
afternoon is usually warmer and more pink and orange in tone, while late
evening is usually cooler and more blue and purple in tone.

In the following images, note that the lighting inside the garage and cafe doesn't change like it would if you were changing the [[30 Official Roblox Docs/Environment/Global lighting#Ambient|Ambient]] property.

#### [255, 150, 50]

*(image in the full Top G Vault)*

#### [200, 150, 240]

*(image in the full Top G Vault)*

#### [0, 175, 255]

*(image in the full Top G Vault)*

### ColorShift_Top

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#ColorShift_Top|ColorShift_Top]] property sets a hue that reflects from surfaces facing the sun or moon.

#### [0, 100, 255]

*(image in the full Top G Vault)*

#### [255, 60, 0]

*(image in the full Top G Vault)*

### ColorShift_Bottom

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#ColorShift_Bottom|ColorShift_Bottom]] property sets a hue that reflects from surfaces that are facing away from the sun or moon.

In the following images, note the hue change on the sandstone wall facing away from the sun.

#### [255, 0, 220]

*(image in the full Top G Vault)*

#### [0, 255, 190]

*(image in the full Top G Vault)*

## Intensity

### Brightness

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#Brightness|Brightness]] property sets the intensity of illumination. This can help increase the contrast between brightly illuminated areas and shadows, simulating bright sunshine and warmer weather.

#### 0.5

*(image in the full Top G Vault)*

#### 1.5

*(image in the full Top G Vault)*

#### 3.75

*(image in the full Top G Vault)*

### ExposureCompensation

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#ExposureCompensation|ExposureCompensation]] property applies exposure to a game. Exposure is the amount of light that reaches the camera.

A lower value is similar to under-exposure in photography, while a higher value is similar to over-exposure.

#### 0

*(image in the full Top G Vault)*

#### -1

*(image in the full Top G Vault)*

#### 1.25

*(image in the full Top G Vault)*

## Shadows

### GlobalShadows

When enabled, the [[30 Official Roblox Docs/API Reference/Classes/Lighting#GlobalShadows|GlobalShadows]] property renders shadows.

#### Enabled

*(image in the full Top G Vault)*

#### Disabled

*(image in the full Top G Vault)*

### ShadowSoftness

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#ShadowSoftness|ShadowSoftness]] property adjusts how blurry shadows are from a value of `0` (hard edges) to `1` (soft edges). This property is only valid when [[30 Official Roblox Docs/API Reference/Classes/Lighting#LightingStyle|LightingStyle]] is set to [[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Realistic]].

#### 0

*(image in the full Top G Vault)*

#### 1

*(image in the full Top G Vault)*

## Appearance

### LightingStyle

[[30 Official Roblox Docs/API Reference/Classes/Lighting#LightingStyle|LightingStyle]] indicates the artistic intent behind lighting in the game, as an [[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Enum.LightingStyle]] option. [[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Realistic]] provides the most advanced and realistic lighting and shadows Roblox can deliver, while [[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Soft]] produces a flat, retro‑Roblox look with softer lights and shadows.

#### Realistic

*(image in the full Top G Vault)*

#### Soft

*(image in the full Top G Vault)*

### PrioritizeLightingQuality

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#PrioritizeLightingQuality|PrioritizeLightingQuality]] property indicates whether you prefer lighting/shading quality or view distance to scale down first. As the rendering quality level reduces, a setting of `true` prioritizes features such as advanced shadows and high‑quality shaders at closer distances, while a setting of `false` prioritizes view distance. If lighting and shadows are very important to the artistic feel of your game, set this to `true`.

## Environment

### ClockTime and TimeOfDay

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]] property both represent the current time of day in hours, and they are directly related; if you change one property, the other also changes.

The only difference between these properties is their numeric value; [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]] represents time from hour `0` through `24` while
[[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]] represents time through a 24 hour string.

#### 0 = 00:00:00

*(image in the full Top G Vault)*

#### 6.3 = 06:18:00

*(image in the full Top G Vault)*

#### 17 = 17:00:00

*(image in the full Top G Vault)*

> [!info]
> Note that each property doesn't follow the actual time of day, and they will not change during a game unless changed through a script.

### GeographicLatitude

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#GeographicLatitude|GeographicLatitude]] property represents the geographic latitude in degrees. Note that while this property changes the position of the sun and moon, it does not change the [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]] properties.

[Video: Geographic-Latitude.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/lighting-properties/Geographic-Latitude.mp4)

### EnvironmentDiffuseScale

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentDiffuseScale|EnvironmentDiffuseScale]] property determines how much ambient light is derived from the environment.

In the following images, note how the ambient light changes, particularly inside the kitchen of the ramen shop.

#### 0

*(image in the full Top G Vault)*

#### 1

*(image in the full Top G Vault)*

### EnvironmentSpecularScale

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentSpecularScale|EnvironmentSpecularScale]]
property determines how much specular light is derived from the
environment. When set near a value of 1, smooth objects better reflect
the environment and metal appears more realistic.

#### 0

*(image in the full Top G Vault)*

#### 1

*(image in the full Top G Vault)*

---
*Source: [Global lighting](https://create.roblox.com/docs/environment/lighting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
