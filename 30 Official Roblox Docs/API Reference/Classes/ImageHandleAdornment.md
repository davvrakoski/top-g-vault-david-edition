---
title: "ImageHandleAdornment"
description: "An image handle that can be adorned to a `BasePart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ImageHandleAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An image handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`ImageHandleAdornment` is an image handle that can be adorned to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. If parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], handles can listen to input events for purposes such as making dragger tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ImageHandleAdornment#Image\|Image]] | ContentId | Image to draw for the adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageHandleAdornment#ImageContent\|ImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image content displayed by this adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageHandleAdornment#Size\|Size]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Size of the image in studs. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Image

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The image to draw for the adornment.

### ImageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

Sets the image displayed by this adornment as a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] value. It is the backing content for [[30 Official Roblox Docs/API Reference/Classes/ImageHandleAdornment#Image|ImageHandleAdornment.Image]] and defaults to `rbxasset://textures/SurfacesDefault.png`. The rendered image is tinted by the inherited [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Color3|HandleAdornment.Color3]] property and affected by [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Transparency|HandleAdornment.Transparency]].

### Size

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

The size of the image in studs.

---
*Source: [ImageHandleAdornment](https://create.roblox.com/docs/reference/engine/classes/ImageHandleAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
