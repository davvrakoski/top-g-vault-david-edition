---
title: "SphereHandleAdornment"
description: "A sphere-shaped handle that can be adorned to a `BasePart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SphereHandleAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A sphere-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`SphereHandleAdornment` is a sphere-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. If parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], handles can listen to input events for purposes such as making dragger tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SphereHandleAdornment#Radius\|Radius]] | float | Radius of the sphere adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/SphereHandleAdornment#Shading\|Shading]] | [[30 Official Roblox Docs/API Reference/Enums/AdornShading\|AdornShading]] | Determines how the sphere adornment is shaded and whether it draws through geometry that would otherwise occlude it. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Radius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The radius of the sphere adornment in studs.

### Shading

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AdornShading|AdornShading]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

`Shading` selects the material and render pass used to draw the sphere, via [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading]]. It defaults to [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading.Default]], which draws the sphere unlit and occluded by scene geometry like an ordinary world object.

[[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading.Shaded]] and [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading.XRayShaded]] light the sphere with the scene's lighting instead of drawing it unlit, while [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading.XRay]] and [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading.XRayShaded]] draw the sphere through geometry that would otherwise occlude it. [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading.AlwaysOnTop]] draws the sphere on top of everything else with no depth testing.

The legacy [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AlwaysOnTop|HandleAdornment.AlwaysOnTop]] property only takes effect while `Shading` is [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading.Default]]; any other `Shading` value determines the render pass on its own.

---
*Source: [SphereHandleAdornment](https://create.roblox.com/docs/reference/engine/classes/SphereHandleAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
