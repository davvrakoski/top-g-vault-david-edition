---
title: "Lighting"
description: "The `Lighting` service controls global lighting in an experience. It includes a range of adjustable properties that you can use to change how lighting appears and interacts with other objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Lighting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The `Lighting` service controls global lighting in an experience. It includes a range of adjustable properties that you can use to change how lighting appears and interacts with other objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

The `Lighting` service controls global lighting in an experience. It includes a range of adjustable properties that you can use to change how lighting appears and interacts with other objects, as summarized in [[30 Official Roblox Docs/Environment/Global lighting|Lighting Properties]].

*(image in the full Top G Vault)*

`Lighting` may also contain an [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] object to render realistic atmospheric effects, including particle density, haze, glare, and color. See [[30 Official Roblox Docs/Environment/Atmospheric effects|Atmospheric Effects]] for details.

*(image in the full Top G Vault)*

In addition, `Lighting` (along with [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]]) may contain [[30 Official Roblox Docs/Environment/Post-processing effects|post‑processing effects]] such as [[30 Official Roblox Docs/API Reference/Classes/SunRaysEffect|SunRaysEffect]] and [[30 Official Roblox Docs/API Reference/Classes/BlurEffect|BlurEffect]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient\|Ambient]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The lighting hue applied to areas that are occluded from the sky, such as indoor areas. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#Brightness\|Brightness]] | float | The intensity of illumination in the place. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime\|ClockTime]] | float | A numerical representation (in hours) of the current time of day used by `Lighting`. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#ColorShift_Bottom\|ColorShift_Bottom]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The hue represented in light reflected in the opposite surfaces to those facing the sun or moon. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#ColorShift_Top\|ColorShift_Top]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The hue represented in light reflected from surfaces facing the sun or moon. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentDiffuseScale\|EnvironmentDiffuseScale]] | float | Ambient light that is derived from the environment. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentSpecularScale\|EnvironmentSpecularScale]] | float | Specular light derived from environment. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#ExposureCompensation\|ExposureCompensation]] | float | The exposure compensation value. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#ExtendLightRangeTo120\|ExtendLightRangeTo120]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Unused. Light [[30 Official Roblox Docs/API Reference/Classes/PointLight#Range\|Range]] is always clamped to 120 studs. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#FogColor\|FogColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] value giving the hue of `Lighting` fog. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#FogEnd\|FogEnd]] | float | The depth from the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|Workspace.CurrentCamera]], in studs, at which fog will be completely opaque. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#FogStart\|FogStart]] | float | The depth from the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|Workspace.CurrentCamera]], in studs, at which fog begins to show. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#GeographicLatitude\|GeographicLatitude]] | float | The geographic latitude, in degrees, of the scene, influencing the result of `Lighting` time on the position of the sun and moon. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#GlobalShadows\|GlobalShadows]] | boolean | Toggles voxel-based dynamic lighting for the place. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#LightingStyle\|LightingStyle]] | [[30 Official Roblox Docs/API Reference/Enums/LightingStyle\|LightingStyle]] | The artistic intent behind lighting in the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient\|OutdoorAmbient]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The lighting hue applied to outdoor areas. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#Outlines\|Outlines]] | boolean | **Deprecated.** Determines whether outlines are enabled or disabled in a place. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#PrioritizeLightingQuality\|PrioritizeLightingQuality]] | boolean | Indicates whether you prefer lighting/shading quality or view distance to scale down first. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#ShadowColor\|ShadowColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | **Deprecated.** This is supposed to change the color of player shadows, but currently doesn't do anything. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#ShadowSoftness\|ShadowSoftness]] | float | Controls how blurry the shadows are. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#Technology\|Technology]] | [[30 Official Roblox Docs/API Reference/Enums/Technology\|Technology]] | **Deprecated.** Determines the lighting system for rendering the 3D world. Non-scriptable. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay\|TimeOfDay]] | string | A 24-hour string representation of the current time of day used by `Lighting`. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#GetMinutesAfterMidnight\|GetMinutesAfterMidnight()]] | double | Returns the number of minutes that have passed after midnight for the purposes of lighting. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#getMinutesAfterMidnight\|getMinutesAfterMidnight()]] | double | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#GetMoonDirection\|GetMoonDirection()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the direction of the moon. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#GetMoonPhase\|GetMoonPhase()]] | float | **Deprecated.** Returns the moon's current phase. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#GetSunDirection\|GetSunDirection()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the direction of the sun. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#SetMinutesAfterMidnight\|SetMinutesAfterMidnight()]] | () | Sets [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay\|TimeOfDay]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime\|ClockTime]] to the given number of minutes after midnight. |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#setMinutesAfterMidnight\|setMinutesAfterMidnight()]] | () | **Deprecated.**  |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Lighting#LightingChanged\|LightingChanged]] | `skyChanged` | This event fires when a `Lighting` property is changed or a [[30 Official Roblox Docs/API Reference/Classes/Sky\|Sky]] is added or removed from `Lighting`. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Ambient

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

`Ambient` is the lighting hue applied to areas that are occluded from the sky, such as indoor areas.

`Ambient` defaults to `[0, 0, 0]` (black). As long as the red, green, and blue channels of this property do not exceed the corresponding channels in [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]], the change in hue will be reserved for areas occluded from the sun/moon.

Note that when [[30 Official Roblox Docs/API Reference/Classes/Lighting#GlobalShadows|GlobalShadows]] is disabled, there is no distinction between areas occluded from the sky and non‑occluded areas. In this case, [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]] will be ignored and the hue from the `Ambient` property will be applied everywhere.

### Brightness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The intensity of illumination in the place.

Changing this value will influence the impact of the light source (sun or moon) on the place's lighting. Note that [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]] can also be used to influence how bright a place appears. For example, setting [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]] to

`[255, 255, 255]`

 will make the place appear brighter than its default value of

`127, 127, 127`

(as it is more white).

### ClockTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Environment · **Tags:** `NotReplicated`

A numerical representation (in hours) of the current time of day used by `Lighting`. Note that this property does not correspond with the actual time of day and will not change during gameplay unless it has been changed by a script.

For a measure of `Lighting` time formatted as a 24-hour string, use [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]]. Changing [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]] or using [[30 Official Roblox Docs/API Reference/Classes/Lighting#SetMinutesAfterMidnight|SetMinutesAfterMidnight()]] will also change this property.

### ColorShift_Bottom

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The hue represented in light reflected in the opposite surfaces to those facing the sun or moon.

The surfaces of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] influenced by `ColorShift_Bottom` depends on the position and orientation of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] relative to the sun or moon's position. Where the sun is directly overhead a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], the shift in color will only apply to the bottom surface.

This effect can be increased or reduced by altering [[30 Official Roblox Docs/API Reference/Classes/Lighting#Brightness|Brightness]].

Note that [[30 Official Roblox Docs/API Reference/Classes/Lighting#ColorShift_Top|ColorShift_Top]] and `ColorShift_Bottom` will interact with the [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]] properties if they are greater than

`[0, 0, 0]`

. Also note that the influence of `ColorShift_Bottom` can be very hard to identify when [[30 Official Roblox Docs/API Reference/Classes/Lighting#GlobalShadows|GlobalShadows]] is enabled (default).

### ColorShift_Top

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The hue represented in light reflected from surfaces facing the sun or moon.

The surfaces of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] influenced by `ColorShift_Top` depends on the position and orientation of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] relative to the sun or moon's position. Where the sun is directly overhead a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], the shift in color will only apply to the top surface.

This effect can be increased or reduced by altering [[30 Official Roblox Docs/API Reference/Classes/Lighting#Brightness|Brightness]].

Note that `ColorShift_Top` and [[30 Official Roblox Docs/API Reference/Classes/Lighting#ColorShift_Bottom|ColorShift_Bottom]] will interact with the [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]] properties if they are greater than

`[0, 0, 0]`

.

### EnvironmentDiffuseScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Ambient light that is derived from the environment with a default of `0`. This property is similar to [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]] but it's dynamic and can change according to the sky and time of day. When this property is increased, it's recommended to decrease [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]] accordingly.

### EnvironmentSpecularScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Specular light derived from environment with a default of `0`. This property will make smooth objects reflect the environment and it is especially important to make metal look more realistic.

### ExposureCompensation

**Type:** float

**Thread safety:** ReadSafe · **Category:** Exposure · **Loaded/Saved:** true/true · **Capabilities:** Environment

This property determines the exposure compensation amount which applies a bias to the exposure level of the scene prior to the tonemap step. Defaults to `0` (no exposure compensation) and has a range from `-5` to `5`. A value of `1` indicates twice as much exposure and `-1` means half as much exposure.

### ExtendLightRangeTo120

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment · **Tags:** `NotScriptable`

Unused. The maximum [[30 Official Roblox Docs/API Reference/Classes/PointLight#Range|Range]] of [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]], [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]], and [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight|SurfaceLight]] objects is always 120 studs; this property does not change that clamp.

This property is typed as [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState]]. It is non-scriptable and hidden in the Studio Properties window.

### FogColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Fog · **Loaded/Saved:** true/true · **Capabilities:** Environment

A [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value giving the hue of `Lighting` fog. Note that fog properties are hidden when `Lighting` contains an [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] object.

### FogEnd

**Type:** float

**Thread safety:** ReadSafe · **Category:** Fog · **Loaded/Saved:** true/true · **Capabilities:** Environment

The depth from the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]], in studs, at which fog will be completely opaque. Note that fog properties are hidden when `Lighting` contains an [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] object.

### FogStart

**Type:** float

**Thread safety:** ReadSafe · **Category:** Fog · **Loaded/Saved:** true/true · **Capabilities:** Environment

The depth from the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]], in studs, at which fog begins to show. Note that fog properties are hidden when `Lighting` contains an [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] object.

### GeographicLatitude

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Environment

The geographic latitude, in degrees, of the scene, influencing the result of `Lighting` time on the position of the sun and moon. When calculating the position of the sun, the earth's tilt is also taken into account.

Changing `GeographicLatitude` will alter the position of the sun at every [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]]. If you're looking to obtain the sun or moon's position, use [[30 Official Roblox Docs/API Reference/Classes/Lighting#GetSunDirection|GetSunDirection()]] or [[30 Official Roblox Docs/API Reference/Classes/Lighting#GetMoonDirection|GetMoonDirection()]].

### GlobalShadows

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Toggles voxel-based dynamic lighting in the place. When set to `true`, shadows are rendered in sheltered areas depending on the position of the sun and moon. The lighting hue applied to these sheltered areas is determined by the [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] property while the lighting hue in all other areas is determined by the [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]] property.

When `false`, shadows are not drawn and no distinction is made between indoor and outdoor areas. As a result, the [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] property determines the lighting hue and [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|OutdoorAmbient]] will do nothing.

Shadows are calculated using a voxel system and each lighting voxel is 4×4×4 studs. This means objects need to be larger than 4×4×4 studs to display a realistic shadow. Shadows are also recalculated when [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are moving.

### LightingStyle

**Type:** [[30 Official Roblox Docs/API Reference/Enums/LightingStyle|LightingStyle]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

`LightingStyle` indicates the artistic intent behind lighting in the experience, as an [[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Enum.LightingStyle]] option. [[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Enum.LightingStyle.Soft]] is the stylized look; [[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Enum.LightingStyle.Realistic]] is the naturalistic look. The actual shadowing path also depends on [[30 Official Roblox Docs/API Reference/Classes/Lighting#PrioritizeLightingQuality|PrioritizeLightingQuality]] (for example, Soft with that property enabled uses shadow maps rather than voxel lighting).

### OutdoorAmbient

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

`OutdoorAmbient` is the lighting hue applied to outdoor areas.

`OutdoorAmbient` defaults to `[127, 127, 127]`. As long as the red, green, and blue channels of [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] do not exceed the corresponding channels in `OutdoorAmbient`, the hue of the lighting in outdoor areas will be determined by this property.

The effective `OutdoorAmbient` value is clamped to be greater than or equal to [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] in all channels, meaning that if a channel of [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] exceeds its corresponding `OutdoorAmbient` channel, the hue of [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] will begin to apply to outdoor areas.

Note that when [[30 Official Roblox Docs/API Reference/Classes/Lighting#GlobalShadows|GlobalShadows]] is disabled, there is no distinction between areas occluded from the sky and non‑occluded areas. In this case, `OutdoorAmbient` will be ignored and the hue from the [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Ambient]] property will be applied everywhere.

### Outlines

> [!warning] Deprecated
> This item is no longer supported as the outlines feature was removed from
> the Roblox platform.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment · **Tags:** `Deprecated`

This property determines whether outlines are enabled or disabled in a place.

Outlines can be disabled on a global basis, using this `Lighting` property, or alternatively on a surface-by-surface basis for [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] using [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|Enum.SurfaceType]].

Although this property can be set by scripts, it recommended this property is set in Roblox Studio prior to publishing the place.

### PrioritizeLightingQuality

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

This property indicates whether you prefer lighting/shading quality or view distance to scale down first. As the rendering quality level reduces, a setting of `true` prioritizes features such as advanced shadows and high‑quality shaders at closer distances, while a setting of `false` prioritizes view distance.

### ShadowColor

> [!warning] Deprecated
> This item is deprecated and has no current functionality. Do not use it
> for new work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** Environment · **Tags:** `NotReplicated`, `Deprecated`

This is supposed to change the color of player shadows, but currently doesn't do anything.

### ShadowSoftness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Controls how blurry the shadows are with a default of `0.2`. This property only works when [[30 Official Roblox Docs/API Reference/Classes/Lighting#Technology|Technology]] mode is [[30 Official Roblox Docs/API Reference/Enums/Technology|ShadowMap]] or [[30 Official Roblox Docs/API Reference/Enums/Technology|Future]] and the device is capable of rendering shadow maps.

### Technology

> [!warning] Deprecated
> This property has been superseded by
> `Class.Lighting.LightingStyle|LightingStyle` which determines the artistic
> intent behind lighting, and
> `Class.Lighting.PrioritizeLightingQuality|PrioritizeLightingQuality` which
> indicates whether you prefer lighting/shading quality or view distance to
> scale down first.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Technology|Technology]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment · **Tags:** `Deprecated`

Determines the lighting system for rendering the 3D world. This property is non‑scriptable and only modifiable in Studio.

### TimeOfDay

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Environment

A 24-hour string representation of the current time of day used by `Lighting`. For example:

```lua
local Lighting = game:GetService("Lighting")

Lighting.TimeOfDay = "11:00" -- Set time of day to 11:00 AM
Lighting.TimeOfDay = "21:30" -- Set time of day to 9:30 PM
```

Note that this property does not correspond with the real-world time of day and will not change during gameplay unless it has been changed by a script.

For a numeric measure of `Lighting` time, use [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]]. Changing [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]] or using [[30 Official Roblox Docs/API Reference/Classes/Lighting#SetMinutesAfterMidnight|SetMinutesAfterMidnight()]] will also change this property.

## Methods

### GetMinutesAfterMidnight

```lua
Lighting:GetMinutesAfterMidnight(): double
```

**Thread safety:** Safe · **Capabilities:** Environment

Returns the number of minutes that have passed after midnight for the purposes of lighting. This number will be nearly identical to [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]] multiplied by `60`.

Note that this number will not always be equal to the value given in [[30 Official Roblox Docs/API Reference/Classes/Lighting#SetMinutesAfterMidnight|SetMinutesAfterMidnight()]] as it returns minutes after midnight in the current day.

**Returns**

| Type | Description |
| --- | --- |
| double | The number of minutes after midnight. |

### getMinutesAfterMidnight

> [!warning] Deprecated
> This method is a deprecated variant of
> `Class.Lighting:GetMinutesAfterMidnight()` which should be used instead.

```lua
Lighting:getMinutesAfterMidnight(): double
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| double |  |

### GetMoonDirection

```lua
Lighting:GetMoonDirection(): Vector3
```

**Thread safety:** Safe · **Capabilities:** Environment

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] representing the direction of the moon from the position

`(0, 0, 0)`

. Note that when the moon has "set" and is no longer visible, the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] returned by this method will continue to point towards the moon below the horizon.

[[30 Official Roblox Docs/API Reference/Classes/Lighting#GetSunDirection|GetSunDirection()]] is a variant of this method for obtaining the direction of the sun.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the direction of the moon. |

### GetMoonPhase

> [!warning] Deprecated
> There is currently no way to change the moon's phase, and thus this method
> should not be used.

```lua
Lighting:GetMoonPhase(): float
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Returns the moon's current phase. There is no way to change the moon's phase so this will always return `0.75`.

**Returns**

| Type | Description |
| --- | --- |
| float |  |

### GetSunDirection

```lua
Lighting:GetSunDirection(): Vector3
```

**Thread safety:** Safe · **Capabilities:** Environment

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] representing the direction of the sun from the position

`(0, 0, 0)`

. Note that when the sun has "set" and is no longer visible, the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] returned by this method will continue to point towards the sun below the horizon.

[[30 Official Roblox Docs/API Reference/Classes/Lighting#GetMoonDirection|GetMoonDirection()]] is a variant of this method for obtaining the direction of the moon.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the direction of the sun. |

### SetMinutesAfterMidnight

```lua
Lighting:SetMinutesAfterMidnight(minutes: double): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Sets [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]] to the given number of minutes after midnight.

This method allows a numerical value to be used, for example in a day/night cycle [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], without the need to convert to a string in the format required by [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]]. It also allows values greater than 24 hours to be given that correspond to times in the next day.

The following code sample includes a simple day/night cycle script. The speed of time and the initial time can be changed using the `TIME_SPEED` and `START_TIME` parameters.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `minutes` | double |  | The number of minutes after midnight. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Lighting-SetMinutesAfterMidnight`) are published on the source page; their code is not part of the open-source repo.*

### setMinutesAfterMidnight

> [!warning] Deprecated
> This method is a deprecated variant of
> `Class.Lighting:SetMinutesAfterMidnight()` which should be used instead.

```lua
Lighting:setMinutesAfterMidnight(minutes: double): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `minutes` | double |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### LightingChanged

```lua
Lighting.LightingChanged(skyChanged: boolean)
```

**Capabilities:** Environment

This event fires when a `Lighting` property is changed or a [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] is added or removed from `Lighting`. See the `skyChanged` parameter for when that flag is `true` versus `false`. Some Lighting property changes never fire this event:

- Changing [[30 Official Roblox Docs/API Reference/Classes/Lighting#GlobalShadows|GlobalShadows]] will not fire this event.
- Changing fog properties [[30 Official Roblox Docs/API Reference/Classes/Lighting#FogColor|FogColor]], [[30 Official Roblox Docs/API Reference/Classes/Lighting#FogStart|FogStart]], or [[30 Official Roblox Docs/API Reference/Classes/Lighting#FogEnd|FogEnd]] will not fire this event.

In cases where this behavior is not desired, the [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Object.Changed]] event or [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Object:GetPropertyChangedSignal()]] method can be used.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `skyChanged` | boolean |  | `true` when a [[30 Official Roblox Docs/API Reference/Classes/Sky\|Sky]] is added or removed, or when a Sky property other than [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxOrientation\|Sky.SkyboxOrientation]] changes. `false` for Lighting property changes, Atmosphere property changes, and SkyboxOrientation changes. |

---
*Source: [Lighting](https://create.roblox.com/docs/reference/engine/classes/Lighting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
