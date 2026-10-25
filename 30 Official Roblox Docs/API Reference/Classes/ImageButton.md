---
title: "ImageButton"
description: "A 2D user interface element that displays an interactive image."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ImageButton"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A 2D user interface element that displays an interactive image.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] → [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

An [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] behaves similarly to an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] in regards to rendering, with the additional behaviors of a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#HoverImage\|HoverImage]] | ContentId | A texture ID that will be used when the [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]] is being hovered. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#HoverImageContent\|HoverImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image content that will be used when the [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]] is being hovered. Only supports asset URIs. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#Image\|Image]] | ContentId | The image content displayed by the [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]] element. Reads and writes to [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageContent\|ImageContent]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageColor3\|ImageColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines how a rendered image will be colorized. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageContent\|ImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image content displayed by the UI element. Supports asset URIs and [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageRectOffset\|ImageRectOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The offset in pixels of the sub-area of an image to be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageRectSize\|ImageRectSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Determines the size in pixels of the sub-area of an image to be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageTransparency\|ImageTransparency]] | float | Determines the transparency of the rendered image. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#IsLoaded\|IsLoaded]] | boolean | Indicates whether the Image has finished loading from the Roblox website. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#PressedImage\|PressedImage]] | ContentId | A texture ID that will be used when an [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]] is being pressed. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#PressedImageContent\|PressedImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image content that will be used when an [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]] is being pressed. Only supports asset URIs. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ResampleMode\|ResampleMode]] | [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode\|ResamplerMode]] | Selects the image resampling mode for the button. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ScaleType\|ScaleType]] | [[30 Official Roblox Docs/API Reference/Enums/ScaleType\|ScaleType]] | Determines how an image will scale if displayed in a UI element whose size differs from the source image. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#SliceCenter\|SliceCenter]] | [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] | Sets the slice boundaries of a 9-sliced image. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#SliceScale\|SliceScale]] | float | Scales the 9-slice edges by the specified ratio. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#TileSize\|TileSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Sets the tiling scale of the ImageButton. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### HoverImage

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

A texture ID that will be used when the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] is being hovered.

### HoverImageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

An image-type Content that can be set as an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] property. When the button is hovered, it will render this image. Only asset URIs are supported for this property.

### Image

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is a content-type property that should hold the asset ID of a decal or image uploaded to Roblox. It functions identically to [[30 Official Roblox Docs/API Reference/Classes/Decal#Texture|Decal.Texture]] with regards to loading the image from Roblox. The rendered image will be colorized using [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageColor3|ImageColor3]].

Note that it is possible to make the image render as tiled, scaled to fit, or 9-sliced by adjusting the [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ScaleType|ScaleType]] property.

*Code samples for this member (`Image-Hover-Lock`) are published on the source page; their code is not part of the open-source repo.*

### ImageColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how an image is colorized. When set to white, no colorization occurs. This property is very useful for reusing image assets: If the source image is completely white with transparency, you can set the entire color of the image at once with this property.

*Code samples for this member (`Image-Hover-Lock`) are published on the source page; their code is not part of the open-source repo.*

### ImageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property should hold an [asset URI](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) or a reference to an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] object. The asset URI can reference a decal or image uploaded to Roblox. It functions identically to [[30 Official Roblox Docs/API Reference/Classes/Decal#Texture|Decal.Texture]] with regards to loading the image.

The rendered image will be colorized using [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageColor3|ImageColor3]]. It is possible to make the image render as tiled, scaled to fit, or 9‑sliced by adjusting the [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ScaleType|ScaleType]] property.

### ImageRectOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the pixel offset (from the top-left) of the image area to be displayed, allowing for the partial display of an image in conjunction with [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageRectSize|ImageRectSize]].

*Code samples for this member (`Image-Animation-using-Spritesheet`) are published on the source page; their code is not part of the open-source repo.*

### ImageRectSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the pixel size of the image area to be displayed, allowing for the partial display of an image in conjunction with [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageRectOffset|ImageRectOffset]]. If either dimension is set to `0`, the entire image is displayed instead.

*Code samples for this member (`Image-Animation-using-Spritesheet`) are published on the source page; their code is not part of the open-source repo.*

### ImageTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the alpha of the element's rendered image. A value of `0` is completely opaque and a value of `1` is completely transparent (invisible). This property behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|GuiObject.BackgroundTransparency]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|BasePart.Transparency]].

If you disable image rendering by setting [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageTransparency|ImageTransparency]] to `1`, it will result in a plain rectangle that can be used as a button. However, it may be better to use a blank [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] instead.

### IsLoaded

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates if the [[30 Official Roblox Docs/API Reference/Classes/ImageButton#Image|Image]] property has finished loading from Roblox. Images declined by moderation will never load.

*Code samples for this member (`Image-Load-Time`) are published on the source page; their code is not part of the open-source repo.*

### PressedImage

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

A texture ID that can be set as an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] property. When the button is pressed, it will render this image.

### PressedImageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

An image-type Content that can be set as an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] property. When the button is pressed, it will render this image. Only asset URIs are supported for this property.

### ResampleMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode|ResamplerMode]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines how the image looks when it is scaled. By default, the image smooths out the texture when displayed either larger or smaller than its size in texture memory. In contrast, [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode|Enum.ResamplerMode.Pixelated]] preserves the sharp edges of the image pixels.

### ScaleType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ScaleType|ScaleType]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines in what way the [[30 Official Roblox Docs/API Reference/Classes/ImageButton#Image|Image]] property is rendered when the UI element's absolute size differs from the source image's size.

By default, this property is [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Stretch]] which will simply stretch/compact the image dimensions so it fits the UI element's space exactly. Since transparent pixels are set to black when uploading to Roblox, transparent images should apply alpha blending to avoid a blackish outline around scaled images.

For [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Slice]], when scaling up, the corners will remain the source image size. The edges of the image will stretch to the width/height of the image. Finally, the center of the image will stretch to fill the center area of the image. To learn more about 9‑sliced images, see [[30 Official Roblox Docs/UI/UI 9-slice design|UI 9‑Slice Design]].

For [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Tile]], the size of each image tile is determined by the [[30 Official Roblox Docs/API Reference/Classes/ImageButton#TileSize|TileSize]] property.

### SliceCenter

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the slice boundaries of a 9-sliced image when [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ScaleType|ScaleType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Slice]].

To learn more about 9‑sliced images, see [[30 Official Roblox Docs/UI/UI 9-slice design|UI 9‑Slice Design]].

### SliceScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Scales the 9-slice edges by the specified ratio. This means that the edges around the 9‑slice will grow as if you'd uploaded a new version of the texture upscaled. Defaults to `1.0`.

As a multiplier for the borders of a 9-slice, it is useful for reusing one rounded corner image for multiple radii.

See also [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ScaleType|ScaleType]] which determines how an image will scale if displayed in a UI element whose size differs from the source image.

### TileSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the tiling size of the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] starting at the upper-left corner of the image. The default [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] values are

`1, 0, 1, 0`

; the scale components of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] will scale the tile based on the size of the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] while the offset components are in raw pixels. For example, a scale of `0.5` means the tile will be half the size of the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] in the corresponding axis.

This property is only active if the [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ScaleType|ScaleType]] property is set to [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Tile]].

---
*Source: [ImageButton](https://create.roblox.com/docs/reference/engine/classes/ImageButton) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
