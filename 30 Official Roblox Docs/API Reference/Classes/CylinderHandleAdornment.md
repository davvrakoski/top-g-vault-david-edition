---
title: "CylinderHandleAdornment"
description: "A cylinder-shaped handle that can be adorned to a `BasePart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CylinderHandleAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A cylinder-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`CylinderHandleAdornment` is a cylinder-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. If parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], handles can listen to input events for purposes such as making dragger tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CylinderHandleAdornment#Angle\|Angle]] | float | Angle of the cylinder handle as in a "pie slice" sector. |
| [[30 Official Roblox Docs/API Reference/Classes/CylinderHandleAdornment#Height\|Height]] | float | Height of the cylinder adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/CylinderHandleAdornment#InnerRadius\|InnerRadius]] | float | Inner radius with which to render a hollow cylinder. |
| [[30 Official Roblox Docs/API Reference/Classes/CylinderHandleAdornment#Radius\|Radius]] | float | Radius of the cylinder adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/CylinderHandleAdornment#Shading\|Shading]] | [[30 Official Roblox Docs/API Reference/Enums/AdornShading\|AdornShading]] | Determines how the cylinder adornment is shaded and whether it draws through geometry that would otherwise occlude it. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Angle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The angle of the cylinder handle as in a "pie slice" sector. For example, if set to `90`, a quarter cylinder will render instead of a full cylinder. This property can be combined with [[30 Official Roblox Docs/API Reference/Classes/CylinderHandleAdornment#InnerRadius|InnerRadius]] to render a sector of a hollow cylinder.

### Height

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The height of the cylinder adornment in studs.

### InnerRadius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The inner radius with which to render a hollow cylinder, in studs. For example, if [[30 Official Roblox Docs/API Reference/Classes/CylinderHandleAdornment#Radius|Radius]] is `2` and `InnerRadius` is `1`, the adornment will be a hollow cylinder with a "wall thickness" of 1 stud. This property can be combined with [[30 Official Roblox Docs/API Reference/Classes/CylinderHandleAdornment#Angle|Angle]] to render a sector of a hollow cylinder.

### Radius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The radius of the cylinder adornment in studs.

### Shading

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AdornShading|AdornShading]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

`Shading` selects the material and render pass used to draw the cylinder, using a value of the [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading]] enum. It defaults to [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Default]], which draws the cylinder unlit and occluded by scene geometry like an ordinary world object.

[[30 Official Roblox Docs/API Reference/Enums/AdornShading|Shaded]] and [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRayShaded]] light the cylinder with the scene's lighting instead of drawing it unlit, while [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRay]] and [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRayShaded]] draw the cylinder through geometry that would otherwise occlude it. [[30 Official Roblox Docs/API Reference/Enums/AdornShading|AlwaysOnTop]] draws the cylinder on top of everything else with no depth testing.

The legacy [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AlwaysOnTop|HandleAdornment.AlwaysOnTop]] property only takes effect while `Shading` is [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Default]]; any other `Shading` value determines the render pass on its own.

---
*Source: [CylinderHandleAdornment](https://create.roblox.com/docs/reference/engine/classes/CylinderHandleAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
