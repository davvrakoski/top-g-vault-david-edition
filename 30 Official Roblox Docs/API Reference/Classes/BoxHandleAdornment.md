---
title: "BoxHandleAdornment"
description: "A box-shaped handle that can be adorned to a `BasePart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BoxHandleAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A box-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`BoxHandleAdornment` is a box-shaped handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. If parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], handles can listen to input events for purposes such as making dragger tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BoxHandleAdornment#Shading\|Shading]] | [[30 Official Roblox Docs/API Reference/Enums/AdornShading\|AdornShading]] | Determines how the box adornment is shaded and whether it draws through geometry that would otherwise occlude it. |
| [[30 Official Roblox Docs/API Reference/Classes/BoxHandleAdornment#Size\|Size]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Size of the adornment. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Shading

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AdornShading|AdornShading]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

`Shading` selects the material and render pass used to draw the box, using a value of the [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Enum.AdornShading]] enum. It defaults to [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Default]], which draws the box unlit and occluded by scene geometry like an ordinary world object.

[[30 Official Roblox Docs/API Reference/Enums/AdornShading|Shaded]] and [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRayShaded]] light the box with the scene's lighting instead of drawing it unlit, while [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRay]] and [[30 Official Roblox Docs/API Reference/Enums/AdornShading|XRayShaded]] draw the box through geometry that would otherwise occlude it. [[30 Official Roblox Docs/API Reference/Enums/AdornShading|AlwaysOnTop]] draws the box on top of everything else with no depth testing.

The legacy [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AlwaysOnTop|HandleAdornment.AlwaysOnTop]] property only takes effect while `Shading` is [[30 Official Roblox Docs/API Reference/Enums/AdornShading|Default]]; any other `Shading` value determines the render pass on its own.

### Size

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The size of the adornment in studs.

---
*Source: [BoxHandleAdornment](https://create.roblox.com/docs/reference/engine/classes/BoxHandleAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
