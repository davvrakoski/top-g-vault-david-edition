---
title: "PyramidHandleAdornment"
description: "A pyramid-shaped handle that can be adorned to a `BasePart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PyramidHandleAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A pyramid-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`PyramidHandleAdornment` is a pyramid-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. If parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], handles can listen to input events for purposes such as making dragger tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PyramidHandleAdornment#Height\|Height]] | float | Height of the pyramid adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/PyramidHandleAdornment#Shading\|Shading]] | [[30 Official Roblox Docs/API Reference/Enums/AdornShading\|AdornShading]] | The [[30 Official Roblox Docs/API Reference/Enums/AdornShading\|Enum.AdornShading]] mode that controls shading and whether the pyramid draws through occluding geometry. |
| [[30 Official Roblox Docs/API Reference/Classes/PyramidHandleAdornment#Sides\|Sides]] | int | Number of sides for the pyramid adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/PyramidHandleAdornment#Size\|Size]] | float | Size of the pyramid adornment's base. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Height

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The height of the pyramid adornment in studs.

### Shading

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AdornShading|AdornShading]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

An [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading]] value that selects the material and render pass used to draw the pyramid. Defaults to [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Default]], which draws the pyramid unlit and occluded by scene geometry like an ordinary world object.

[[30 Official Roblox Docs/API Reference/Enums/AdornShading|Shaded]] and [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRayShaded]] light the pyramid with the scene's lighting instead of drawing it unlit, while [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRay]] and [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRayShaded]] draw the pyramid through geometry that would otherwise occlude it. [[30 Official Roblox Docs/API Reference/Enums/AdornShading|AlwaysOnTop]] draws the pyramid on top of everything else with no depth testing.

The legacy [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AlwaysOnTop|HandleAdornment.AlwaysOnTop]] property only takes effect while `Shading` is [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Default]]; any other `Shading` value determines the render pass on its own.

### Sides

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The number of sides for the pyramid adornment. Default is `4`, minimum is `3`, and maximum is `32`.

### Size

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The size of the pyramid adornment's base in studs.

---
*Source: [PyramidHandleAdornment](https://create.roblox.com/docs/reference/engine/classes/PyramidHandleAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
