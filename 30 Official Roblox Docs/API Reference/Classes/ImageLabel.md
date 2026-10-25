---
title: "ImageLabel"
description: "A 2D user interface element that displays a single non-interactive image."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ImageLabel"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A 2D user interface element that displays a single non-interactive image.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiLabel|GuiLabel]] → [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

An [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] renders a rectangle, like a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] does, with an image asset. The display of the image can be manipulated through the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageColor3|ImageColor3]] and [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageTransparency|ImageTransparency]] properties. To display only the image and hide the rectangle, set [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|GuiObject.BackgroundTransparency]] to `1`.

Advanced [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] usage includes:

- Tiled images can be created by setting [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType|ScaleType]] to [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Tile]], then [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#TileSize|TileSize]] to the size of rendered tiles.

- 9-slice images can be created by setting [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType|ScaleType]] to [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Slice]], then [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceCenter|SliceCenter]] to the center area of the 9‑slice image.

- Sprite sheets can be implemented through the use of [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageRectOffset|ImageRectOffset]] and [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageRectSize|ImageRectSize]]. Packing multiple images into one and using this property can make your experience's image assets load much quicker, especially if you use many small icons in your GUIs.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image\|Image]] | ContentId | The image content displayed by the UI element. Reads and writes to [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageContent\|ImageContent]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageColor3\|ImageColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines how a rendered image will be colorized. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageContent\|ImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image content displayed by the UI element. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) and [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageRectOffset\|ImageRectOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The offset in pixels of the sub-area of an image to be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageRectSize\|ImageRectSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Determines the size in pixels of the sub-area of an image to be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageTransparency\|ImageTransparency]] | float | Determines the transparency of the rendered image. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#IsLoaded\|IsLoaded]] | boolean | Indicates whether the image has finished loading from Roblox. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ResampleMode\|ResampleMode]] | [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode\|ResamplerMode]] | Selects the image resampling mode for the label. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType\|ScaleType]] | [[30 Official Roblox Docs/API Reference/Enums/ScaleType\|ScaleType]] | Determines how an image will scale if displayed in a UI element whose size differs from the source image. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceCenter\|SliceCenter]] | [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] | Sets the slice boundaries of a 9-sliced image. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceScale\|SliceScale]] | float | Scales the 9-slice edges by the specified ratio. |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#TileSize\|TileSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Sets the tiling size of the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel\|ImageLabel]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiLabel|GuiLabel]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Image

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is a content-type property that should hold the asset ID of a decal or image uploaded to Roblox. It functions identically to [[30 Official Roblox Docs/API Reference/Classes/Decal#Texture|Decal.Texture]] with regards to loading the image from Roblox. The rendered image can be modified using [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageColor3|ImageColor3]] and [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageTransparency|ImageTransparency]].

### ImageColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how an image is colorized. When set to white, no colorization occurs. This property is very useful for reusing image assets; if the source image is completely white with transparency, you can set the entire color of the image at once with this property.

### ImageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property should hold an [asset URI](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) or a reference to an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] object.

The asset URI can reference a decal or image uploaded to Roblox. It functions identically to [[30 Official Roblox Docs/API Reference/Classes/Decal#Texture|Decal.Texture]] with regards to loading the image.

The rendered image will be colorized using [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageColor3|ImageButton.ImageColor3]]. It is possible to make the image render as tiled, scaled to fit, or 9-sliced, by adjusting the [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ScaleType|ImageButton.ScaleType]] property.

### ImageRectOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Allows the partial display of an image in conjunction with [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageRectSize|ImageRectSize]]. This property determines the pixel offset (from the top-left) of the image area to be displayed.

### ImageRectSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Allows the partial display of an image in conjunction with [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageRectOffset|ImageRectOffset]]. This property determines the pixel size of the image area to be displayed. If either dimension is set to `0`, the entire image is displayed instead.

### ImageTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the alpha of a UI element's rendered image. A value of `0` is completely opaque and a value of `1` is completely transparent (invisible).

*Code samples for this member (`Oscillate-ImageTransparency`) are published on the source page; their code is not part of the open-source repo.*

### IsLoaded

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates if the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image|ImageLabel.Image]] property has finished loading from Roblox. Images declined by moderation will never load.

*Code samples for this member (`Image-Load-Time`) are published on the source page; their code is not part of the open-source repo.*

### ResampleMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode|ResamplerMode]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines how the image looks when it is scaled. By default, the image smooths out texturing when displayed on the screen larger or smaller than its size in texture memory. When set to [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode|Enum.ResamplerMode.Pixelated]], the image preserves the sharp edges of pixels.

### ScaleType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ScaleType|ScaleType]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines in what way an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image|ImageLabel.Image]] is rendered when the UI element's absolute size differs from the source image's size.

By default, this property is [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Stretch]] which will simply stretch/compact the image dimensions so it fits the UI element's space exactly. Since transparent pixels are set to black when uploading to Roblox, transparent images should apply alpha blending to avoid a blackish outline around scaled images.

For [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Slice]], the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceCenter|SliceCenter]] property will be revealed in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window. This is for nine-slice UI: when scaling up, the corners will remain the source image size. The edges of the image will stretch to the width/height of the image. Finally, the center of the image will stretch to fill the center area of the image.

Finally, for [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Tile]], the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#TileSize|TileSize]] property will be revealed in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window. This is for tiled images, where the size of each image tile is determined by the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#TileSize|TileSize]] property.

### SliceCenter

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the slice boundaries of a 9-sliced image when [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType|ScaleType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Slice]]. Please note that this property is only visible in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window under this condition.

To learn more about 9-slice images, see [[30 Official Roblox Docs/UI/UI 9-slice design|UI 9 Slice Design]].

### SliceScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Scales the 9-slice edges by the specified ratio. This means that the edges around the 9-slice will grow as if you'd uploaded a new version of the texture upscaled. Defaults to `1.0`.

See also [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType|ScaleType]], [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceCenter|SliceCenter]], and [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceScale|SliceScale]].

### TileSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the tiling size of the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] with a default of

`Datatype.UDim2.new(1, 0, 1, 0)`

. Tiling
starts at the top-left corner of the image. This property is only active if the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType|ScaleType]] for the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] is set to [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Tile]].

*Code samples for this member (`Image-ScaleType-Demo`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [ImageLabel](https://create.roblox.com/docs/reference/engine/classes/ImageLabel) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
