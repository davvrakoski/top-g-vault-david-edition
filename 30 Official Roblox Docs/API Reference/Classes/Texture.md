---
title: "Texture"
description: "Applies a repeating image texture to the face of a parent `BasePart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Texture"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a repeating image texture to the face of a parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] → [[30 Official Roblox Docs/API Reference/Classes/FaceInstance|FaceInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** GraphicsTexture

## Description

A [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] object applies a repeating image texture to the face of a parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. The affected face is dependent on the [[30 Official Roblox Docs/API Reference/Classes/FaceInstance#Face|Face]] property. Unlike [[30 Official Roblox Docs/API Reference/Classes/Decal|Decals]], the texture applied by a [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] will repeat when the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is resized, with the size of the repeating textures determined by the [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileU|StudsPerTileU]] and [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileV|StudsPerTileV]] properties.

The applied image texture is determined by its [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMapContent|ColorMapContent]] property. For details on how to upload images, see [asset management](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md).

For more information, review [[30 Official Roblox Docs/Parts/Textures and decals|textures and decals]]. See also:

- [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] for non-repeating surface images.
- [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|MeshPart.TextureContent]] to apply an image texture to a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].
- [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] to apply an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] or [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] to an in-experience 3D object.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Texture#OffsetStudsU\|OffsetStudsU]] | float | Determines the offset in studs of the rendered texture's horizontal coordinate. |
| [[30 Official Roblox Docs/API Reference/Classes/Texture#OffsetStudsV\|OffsetStudsV]] | float | Determines the offset in studs of the rendered texture's vertical coordinate. |
| [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileU\|StudsPerTileU]] | float | Sets the horizontal size, in studs, of the tiled image applied by the [[30 Official Roblox Docs/API Reference/Classes/Texture\|Texture]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileV\|StudsPerTileV]] | float | Sets the vertical size, in studs, of the tiled image applied by the [[30 Official Roblox Docs/API Reference/Classes/Texture\|Texture]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]], [[30 Official Roblox Docs/API Reference/Classes/FaceInstance|FaceInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### OffsetStudsU

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property determines how far the rendered texture is offset on the horizontal axis, in studs, as visualized [[30 Official Roblox Docs/Parts/Textures and decals#Offset textures|here]].

See also [[30 Official Roblox Docs/API Reference/Classes/Texture#OffsetStudsV|OffsetStudsV]].

### OffsetStudsV

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property determines how far the rendered texture is offset on the vertical axis, in studs, as visualized [[30 Official Roblox Docs/Parts/Textures and decals#Offset textures|here]].

See also [[30 Official Roblox Docs/API Reference/Classes/Texture#OffsetStudsU|OffsetStudsU]].

### StudsPerTileU

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the horizontal size, in studs, of the tiled image applied by the [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]].

Larger values for this property will lead to the [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] appearing larger, and repeating less frequently. Unlike with [[30 Official Roblox Docs/API Reference/Classes/Decal|Decals]], the size of the repeated image is unaffected by the dimensions of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. Instead, resizing the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] only increases the number of times the texture repeats.

Note that this property can be set to very low values, but not zero. Also note that the horizontal/vertical distinction is relative to the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] axis; therefore the [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] will rotate along with the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

See also [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileV|StudsPerTileV]].

### StudsPerTileV

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the vertical size, in studs, of the tiled image applied by the [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]].

Larger values for this property will lead to the [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] appearing larger, and repeating less frequently. Unlike with [[30 Official Roblox Docs/API Reference/Classes/Decal|Decals]], the size of the repeated image is unaffected by the dimensions of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. Instead, resizing the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] only increases the number of times the texture repeats.

Note that this property can be set to very low values, but not zero. Also note that the horizontal/vertical distinction is relative to the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] axis; therefore the [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] will rotate along with the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

See also [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileU|StudsPerTileU]].

---
*Source: [Texture](https://create.roblox.com/docs/reference/engine/classes/Texture) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
