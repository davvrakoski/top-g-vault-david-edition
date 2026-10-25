---
title: "ConeHandleAdornment"
description: "A cone-shaped handle that can be adorned to a `BasePart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ConeHandleAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A cone-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`ConeHandleAdornment` is a cone-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. If parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], handles can listen to input events for purposes such as making dragger tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ConeHandleAdornment#Height\|Height]] | float | Height of the cone adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/ConeHandleAdornment#Hollow\|Hollow]] | boolean | Determines whether the cone is drawn as a hollow shell rather than a solid, capped cone. |
| [[30 Official Roblox Docs/API Reference/Classes/ConeHandleAdornment#Radius\|Radius]] | float | Radius of the cone adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/ConeHandleAdornment#Shading\|Shading]] | [[30 Official Roblox Docs/API Reference/Enums/AdornShading\|AdornShading]] | Determines how the cone adornment is shaded and whether it draws through geometry that would otherwise occlude it. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Height

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The height of the cone adornment in studs.

### Hollow

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

When `Hollow` is `true`, the cone is drawn as an open shell without its base cap; when `false`, the default, it is drawn as a solid, capped cone.

### Radius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The radius of the cone adornment in studs.

### Shading

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AdornShading|AdornShading]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

Selects the material and render pass used to draw the cone via [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading]]. Defaults to [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Default]], which draws the cone unlit and occluded by scene geometry.

[[30 Official Roblox Docs/API Reference/Enums/AdornShading|Shaded]] and [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRayShaded]] light the cone with the scene's lighting. [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRay]] and [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRayShaded]] draw through occluding geometry. [[30 Official Roblox Docs/API Reference/Enums/AdornShading|AlwaysOnTop]] draws on top of everything with no depth testing.

The legacy [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AlwaysOnTop|HandleAdornment.AlwaysOnTop]] property only applies while `Shading` is [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Default]]; any other value controls the render pass on its own.

---
*Source: [ConeHandleAdornment](https://create.roblox.com/docs/reference/engine/classes/ConeHandleAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
