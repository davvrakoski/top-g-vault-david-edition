---
title: "Sky"
description: "Changes the default appearance of the experience's sky."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Sky"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Changes the default appearance of the experience's sky.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The `Sky` object, when placed inside [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]], changes the default appearance of the experience's sky. This object's [[30 Official Roblox Docs/Environment/Skyboxes|skybox]] is composed of six sides, like a cube. Rotation of the skybox can be changed through [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxOrientation|SkyboxOrientation]].

The skybox sun, moon, and other celestial objects remain visible unless you turn off the [[30 Official Roblox Docs/API Reference/Classes/Sky#CelestialBodiesShown|CelestialBodiesShown]] property. By adjusting the [[30 Official Roblox Docs/API Reference/Classes/Sky#StarCount|StarCount]] property, you can change how many stars appear in the sky at night.

This object can also be used as a cubemap for reflections in [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrames]], in which case only the [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object's six‑side `Skybox[…]` properties are used. For details, see [[30 Official Roblox Docs/UI/Viewport frames|viewport frames]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#CelestialBodiesShown\|CelestialBodiesShown]] | boolean | Sets whether the sun, moon, and stars will render in the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#MoonAngularSize\|MoonAngularSize]] | float | The perceived angular size of the moon while using this skybox, in degrees. Defaults to `11` and is clamped to the range `[0, 60]`. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#MoonTextureContent\|MoonTextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image displayed for the moon while using this skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#MoonTextureId\|MoonTextureId]] | ContentId | The texture of the moon while using this skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxBackContent\|SkyboxBackContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image displayed on the back surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxBk\|SkyboxBk]] | ContentId | The URL link to a picture for the back surface of the sky. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxDn\|SkyboxDn]] | ContentId | Asset ID for the bottom surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxDownContent\|SkyboxDownContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image displayed on the bottom surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxFrontContent\|SkyboxFrontContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image displayed on the front surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxFt\|SkyboxFt]] | ContentId | Asset ID for the front surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxLeftContent\|SkyboxLeftContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image displayed on the left surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxLf\|SkyboxLf]] | ContentId | Asset ID for the left surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxOrientation\|SkyboxOrientation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Angle of the skybox, in degrees, with rotation order of **Y**, **X**, **Z**. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxRightContent\|SkyboxRightContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image displayed on the right surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxRt\|SkyboxRt]] | ContentId | Asset ID for the right surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxUp\|SkyboxUp]] | ContentId | Asset ID for the top surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxUpContent\|SkyboxUpContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image displayed on the top surface of the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#StarCount\|StarCount]] | int | How many stars are shown in the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SunAngularSize\|SunAngularSize]] | float | The perceived angular size of the sun while using this skybox, in degrees. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SunTextureContent\|SunTextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image displayed for the sun while using this skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/Sky#SunTextureId\|SunTextureId]] | ContentId | The texture of the sun while using this skybox. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CelestialBodiesShown

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Determines whether the sun, moon, and stars are rendered in the skybox. Defaults to `true`. When set to `false`, the sun, moon, and stars are hidden, regardless of the values of other properties.

### MoonAngularSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The perceived angular size of the moon while using this skybox, measured in degrees.

### MoonTextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] image displayed for the moon while using this skybox. Defaults to `rbxasset://sky/moon.jpg`.

### MoonTextureId

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The texture asset ID for the moon while using this skybox. Defaults to `rbxasset://sky/moon.jpg`.

### SkyboxBackContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] image displayed on the back surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_bk.tex`.

### SkyboxBk

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The texture asset ID for the back surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_bk.tex`.

### SkyboxDn

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The texture asset ID for the bottom surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_dn.tex`.

### SkyboxDownContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] image displayed on the bottom surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_dn.tex`.

### SkyboxFrontContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] image displayed on the front surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_ft.tex`.

### SkyboxFt

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The texture asset ID for the front surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_ft.tex`.

### SkyboxLeftContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] image displayed on the left surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_lf.tex`.

### SkyboxLf

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The texture asset ID for the left surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_lf.tex`.

### SkyboxOrientation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Changes the orientation of the skybox surfaces. This property takes a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] of degree values in the typical **XYZ** order, but applies rotation **first** around the **Y** axis. After applying the Y axis rotation, the orientation is applied to the **X** and **Z** axes to allow for predictable control over complex movements. Your camera and object orientation can affect how this rotation appears to be applied.

An easy way to script an orientation animation is to spin around the **Y** axis (keeping the horizon level), then tilt this axis by setting **X** and **Z** to a fixed value:

```lua
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local sky = Lighting:FindFirstChild("Sky")

local ROTATION_SPEED = 5  -- In degrees per second

RunService.Heartbeat:Connect(function(deltaTime)
	sky.SkyboxOrientation = Vector3.new(
		30,
		(sky.SkyboxOrientation.Y + ROTATION_SPEED * deltaTime) % 360,
		0
	)
end)
```

See [[30 Official Roblox Docs/Environment/Skyboxes#Orientation|here]] for further info and limitations.

*Code samples for this member (`Skybox-Orientation`) are published on the source page; their code is not part of the open-source repo.*

### SkyboxRightContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] image displayed on the right surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_rt.tex`.

### SkyboxRt

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The texture asset ID for the right surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_rt.tex`.

### SkyboxUp

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The texture asset ID for the top surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_up.tex`.

### SkyboxUpContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] image displayed on the top surface of the skybox. Defaults to `rbxasset://textures/sky/sky512_up.tex`.

### StarCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

How many stars are shown in the skybox. Only works if [[30 Official Roblox Docs/API Reference/Classes/Sky#CelestialBodiesShown|CelestialBodiesShown]] is `true`.

### SunAngularSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The perceived angular size of the sun while using this skybox, in degrees. Defaults to `21` and is clamped to the range `[0, 60]`.

### SunTextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] image displayed for the sun while using this skybox. Defaults to `rbxasset://sky/sun.jpg`.

### SunTextureId

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The texture asset ID for the sun while using this skybox. Defaults to `rbxasset://sky/sun.jpg`.

---
*Source: [Sky](https://create.roblox.com/docs/reference/engine/classes/Sky) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
