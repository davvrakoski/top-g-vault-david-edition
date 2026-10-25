---
title: "ViewportFrame"
description: "`GuiObject` that renders 3D objects inside its bounds."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ViewportFrame"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*[[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that renders 3D objects inside its bounds.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

`ViewportFrame` is a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that renders 3D objects inside its bounds, offering a way to display 3D objects in a 2D space like a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]]. This object has the following caveats:

- No shadows or [[30 Official Roblox Docs/Environment/Post-processing effects|post-processing]] effects are rendered.

- [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material.Neon]] and [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material.Glass]] materials render at the lowest quality.

- Nested [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] aren't supported.

- By default, lighting inside a `ViewportFrame` acts as if [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentSpecularScale|Lighting.EnvironmentSpecularScale]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentDiffuseScale|Lighting.EnvironmentDiffuseScale]] are both set to `0`, so properties that rely on these fields, such as [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#MetalnessMap|SurfaceAppearance.MetalnessMap]], may look different.

- This object can use a [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] child as a cubemap for reflections, in which case only the [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object's six `Skybox[…]` properties are used. Assuming these properties are valid, lighting inside the `ViewportFrame` acts similarly to if [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentSpecularScale|Lighting.EnvironmentSpecularScale]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentDiffuseScale|Lighting.EnvironmentDiffuseScale]] are both set to `1`. For details, see [[30 Official Roblox Docs/UI/Viewport frames|here]].

*Code samples for this API (`viewportframe---create-gui`, `viewportframe---control-camera`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ViewportFrame); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#Ambient\|Ambient]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The lighting hue applied to the area within the `ViewportFrame`. |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#CurrentCamera\|CurrentCamera]] | [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] | [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] that is used to render children objects. |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#ImageColor3\|ImageColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines how the rendered viewport image will be colorized. |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#ImageTransparency\|ImageTransparency]] | float | Determines the transparency of the rendered viewport image. |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#LightColor\|LightColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The color of the emitted light. |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#LightDirection\|LightDirection]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the direction of the light source. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Ambient

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the lighting hue applied to the area within the `ViewportFrame`. Defaults to

[[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.fromRGB(200, 200, 200)]]

(ghost grey).

### CurrentCamera

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `NotReplicated`

[[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] instance that is used to render children objects. Defaults to `nil`.

The [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object does not replicate so the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#CurrentCamera|ViewportFrame.CurrentCamera]] won't replicate either. When you set this property, [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|Camera.CFrame]] and [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfView|Camera.FieldOfView]] will be saved and replicate with the `ViewportFrame` internally so the client can render the frame without a [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object.

### ImageColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how the rendered viewport image will be colorized, allowing you to change the color without directly modifying the rendered object. The default colorization value is

[[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(1, 1, 1)]]

 (white) at which no color modification occurs.

See also [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#ImageTransparency|ImageTransparency]] which determines the transparency of the rendered image.

### ImageTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the transparency of the rendered viewport image, allowing you to change the transparency without directly modifying the rendered object. A value of `0` (default) is completely opaque and a value of `1` is completely transparent (invisible).

See also [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#ImageColor3|ImageColor3]] which determines how the rendered image will be colorized.

### LightColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

The color of the emitted light. Defaults to

[[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.fromRGB(140, 140, 140)]]

(silver).

### LightDirection

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] representing the direction of the light source from position

`(0, 0, 0)`

. Defaults to

[[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3.new(-1, -1, -1)]]

.

---
*Source: [ViewportFrame](https://create.roblox.com/docs/reference/engine/classes/ViewportFrame) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
