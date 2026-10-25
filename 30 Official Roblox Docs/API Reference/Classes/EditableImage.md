---
title: "EditableImage"
description: "Object which allows for the runtime creation and manipulation of images."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/EditableImage"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Object which allows for the runtime creation and manipulation of images.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

`EditableImage` allows for the runtime creation and manipulation of images.

To create a blank `EditableImage`, use [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableImage|AssetService:CreateEditableImage()]]. To create an `EditableImage` from an existing image, use [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableImageAsync|AssetService:CreateEditableImageAsync()]].

`EditableImage` can be used in any [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] property which takes an image, such as [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageContent|ImageLabel.ImageContent]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|MeshPart.TextureContent]]. This is done by setting the content property to `Datatype.Content.fromObject(editableImage)`.

The `EditableImage` coordinate system is relative to the top left of the image:

- Top-left: `(0, 0)`
- Bottom-right: `(Size.X - 1, Size.Y - 1)`

When you use [[30 Official Roblox Docs/API Reference/Classes/AssetService#PromptCreatePlatformContentAsync|AssetService:PromptCreatePlatformContentAsync()]] to publish an object that has a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] property which references an `EditableImage`, the editable image is published as an image and the property is set to a new asset ID.

#### Update Limitations

Only a single `EditableImage` can be updated per frame on the display side. For example, if you update three `EditableImage` objects which are currently being displayed, it will take three frames for all of them to be updated.

#### Enabling for Published Experiences

For security purposes, using `EditableImage` fails by default in published games. To enable it, open the [Creator Dashboard](https://create.roblox.com/dashboard/creations), go to the game's **Configure** ⟩ **Settings**, and toggle on **Enable Mesh / Image APIs**. Alternatively, in Studio, open **Experience Settings** and toggle on **Allow Mesh / Image APIs** under **Security**. Remember to review the [Terms of Use](https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use) before enabling the toggle.

#### Permissions

To prevent misuse, [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableImageAsync|AssetService:CreateEditableImageAsync()]] only allows you to load and edit image assets if any of the following is true:

- Owned by or explicitly shared with the experience owner.
- Owned by or explicitly shared with the logged in Studio user.
- Owned by or explicitly shared with the logged in player if the `EditableImage` is on the client side.
- Owned by a group where the experience owner, Studio user, or player has a role with permission to edit the group's assets. See [[30 Official Roblox Docs/Projects/Groups (teams)#Roles and permissions|Roles and permissions]] for more information.

See [Grant permissions](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/privacy.md) to learn how to share assets with users or groups.

The APIs throw an error if they are used to load an asset that does not meet the criteria above.

#### Memory Limits

Editable assets are currently expensive for memory usage. To minimize its impact on client performance, `EditableImage` has strict client-side memory budgets, although the server, Studio, and plugins operate with unlimited memory. Linking one [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] to multiple image-related [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] data types (multi-referencing) can help with memory optimization.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#Size\|Size]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Size of the `EditableImage` in pixels. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#Destroy\|Destroy()]] | () | Destroys the image contents and immediately reclaims the memory they use. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawCircle\|DrawCircle()]] | () | Draws a circle at the specified point. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImage\|DrawImage()]] | () | Draws another `EditableImage` into this `EditableImage` at the given position. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImageProjected\|DrawImageProjected()]] | () | Projects another `EditableImage` onto a surface using an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] or prepared [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer\|WrapTextureTransfer]] and stores the result on this `EditableImage`. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#SampleImageProjected\|SampleImageProjected()]] | () | Projects pixels from a texture into this `EditableImage` using an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] or prepared [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer\|WrapTextureTransfer]]. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImageTransformed\|DrawImageTransformed()]] | () | Draws an image into this `EditableImage` with transformations including scaling and rotation, placing it at the specified position. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawLine\|DrawLine()]] | () | Draws a line between two provided points. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawRectangle\|DrawRectangle()]] | () | Draws a rectangle of the given size at the given top-left position. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#ReadPixelsBuffer\|ReadPixelsBuffer()]] | buffer | Reads a rectangular region of pixels into a buffer. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage#WritePixelsBuffer\|WritePixelsBuffer()]] | () | Writes a rectangular region of pixels into the image. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Size

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DynamicGeneration · **Tags:** `ReadOnly`, `NotReplicated`

Size of the `EditableImage` in pixels. The maximum size is 1024×1024. An `EditableImage` cannot be resized; this property is read-only. In order to resize or crop an image, create a new `EditableImage` and use [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImageTransformed|DrawImageTransformed()]] to transfer the contents; then call [[30 Official Roblox Docs/API Reference/Classes/EditableImage#Destroy|Destroy()]].

## Methods

### Destroy

```lua
EditableImage:Destroy(): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Destroys the contents of the image, immediately reclaiming used memory.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### DrawCircle

```lua
EditableImage:DrawCircle(center: Vector2, radius: int, color: Color3, transparency: float, combineType: ImageCombineType, antiAliasing: AntiAliasing = Enabled): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Draws a circle at the specified point on the `EditableImage`. If the circle is semi-transparent, it will be blended with the pixels behind it using source over blending.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Center of the circle, relative to the top-left corner of the `EditableImage`. Positions outside the canvas bounds are allowed. |
| `radius` | int |  | Radius of the circle in pixels. |
| `color` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | Color of the circle. |
| `transparency` | float |  | Transparency of the circle with 0 being fully opaque and 1 being fully transparent. |
| `combineType` | [[30 Official Roblox Docs/API Reference/Enums/ImageCombineType\|ImageCombineType]] |  | How the drawn pixels (source) are combined with the existing pixels of this image (destination). |
| `antiAliasing` | [[30 Official Roblox Docs/API Reference/Enums/AntiAliasing\|AntiAliasing]] | `Enabled` | Determines whether anti-aliasing is applied to the circle. When set to [[30 Official Roblox Docs/API Reference/Enums/AntiAliasing\|Enum.AntiAliasing.Enabled]], circle edges are soft. When set to [[30 Official Roblox Docs/API Reference/Enums/AntiAliasing\|Enum.AntiAliasing.Disabled]], circle edges are hard. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### DrawImage

```lua
EditableImage:DrawImage(position: Vector2, image: EditableImage, combineType: ImageCombineType): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Draws another `EditableImage` into this `EditableImage` at the given position. Positions outside the canvas bounds are allowed such that only part of the new image is drawn.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Position at which the top-left corner of the source image will be drawn. |
| `image` | [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] |  | The source `EditableImage` to draw into this `EditableImage`. |
| `combineType` | [[30 Official Roblox Docs/API Reference/Enums/ImageCombineType\|ImageCombineType]] |  | How the pixels of the source image are combined with the existing pixels of this image (destination). |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### DrawImageProjected

```lua
EditableImage:DrawImageProjected(projectionSource: Object, projection: Dictionary, brushConfig: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Projects another `EditableImage` onto the surface defined by `projectionSource` and stores the result on this `EditableImage` using the source's UV mapping and the specified projection and brush configuration. `projectionSource` accepts an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] or a [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]].

When passing a [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]], first call [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#PrepareProjectionMeshDataAsync|WrapTextureTransfer:PrepareProjectionMeshDataAsync()]] and wait for it to complete successfully.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `projectionSource` | [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] |  | The [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] or prepared [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer\|WrapTextureTransfer]] that provides the geometry and UV mapping for projection. |
| `projection` | Dictionary |  | Projection configuration dictionary including the following key-value pairs:<br><br>- `Direction` ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]) where the projector is facing. - `Position` ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]) as the position in local space with respect to the mesh. - `Size` ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]) as the size of the projector. - `Up` ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]) as the up vector of the projector in local space with respect to the mesh. |
| `brushConfig` | Dictionary |  | Brush configuration dictionary including the following key-value pairs:<br><br>- `AlphaBlendType` ([[30 Official Roblox Docs/API Reference/Enums/ImageAlphaType\|Enum.ImageAlphaType]]) which determines how this projection will blend alpha values. - `ColorBlendType` ([[30 Official Roblox Docs/API Reference/Enums/ImageCombineType\|Enum.ImageCombineType]]) which determines how this projection will blend color values. - `Decal` (`EditableImage`) as the image used for projection. - `FadeAngle` (number) as the angle in degrees for the projection edges to start to fall off. The projection will be fully faded out at 90 degrees. An angle of 0 means fading starts immediately at 0 degrees and an angle of 90 means no fading but instead a hard edge at 90 degrees. An angle of 70 degrees would mean the projection starts to fade at 70 degrees and is fully faded out at 90 degrees. - `BlendIntensity` (number) as the value between `0` and `1` which controls how much of the projection is blended into the resulting image. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SampleImageProjected

```lua
EditableImage:SampleImageProjected(projectionSource: Object, sourceTexture: EditableImage, projectionConfig: Dictionary, brushConfig: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Projects the pixels in `sourceTexture`, using the geometry and UV mapping of `projectionSource`, onto this `EditableImage`. `projectionSource` accepts an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] or a [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]]. This is the inverse of [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImageProjected|DrawImageProjected()]]: it reads from the mesh texture and writes the sampled pixels into this image in place.

Only mesh surfaces facing the projector and within the projection volume are sampled. When multiple mesh surfaces project to the same destination pixel, the closest surface is used. This makes the method suitable for sampling a brush-sized region, modifying it in place, and then using [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImageProjected|DrawImageProjected()]] to write it back onto a texture.

When passing a [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]], first call [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#PrepareProjectionMeshDataAsync|WrapTextureTransfer:PrepareProjectionMeshDataAsync()]] and wait for it to complete successfully.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `projectionSource` | [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] |  | The [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] or prepared [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer\|WrapTextureTransfer]] that maps `sourceTexture` onto the surface being sampled. |
| `sourceTexture` | [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] |  | The `EditableImage` from which pixels are sampled. |
| `projectionConfig` | Dictionary |  | Projection configuration dictionary containing the following key-value pairs:<br><br>- `Direction` ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]) where the projector is facing. - `Position` ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]) as the projector position in local space with respect to the mesh. - `Size` ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]) as the size of the projector. The **X** and **Y** components specify its dimensions, while the **Z** component specifies the projection depth. - `Up` ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]) as the up vector of the projector in local space with respect to the mesh. |
| `brushConfig` | Dictionary |  | Brush configuration dictionary containing the following key-value pairs:<br><br>- `AlphaBlendType` ([[30 Official Roblox Docs/API Reference/Enums/ImageAlphaType\|Enum.ImageAlphaType]]) which determines how the sampled alpha values are blended. - `ColorBlendType` ([[30 Official Roblox Docs/API Reference/Enums/ImageCombineType\|Enum.ImageCombineType]]) which determines how the sampled color values are blended. - `FadeAngle` (number) as the angle in degrees at which the projection begins to fade based on the surface normal. A value of `180` applies no normal-angle fade. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### DrawImageTransformed

```lua
EditableImage:DrawImageTransformed(position: Vector2, scale: Vector2, rotation: float, image: EditableImage, options: Dictionary?): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

This method lets you draw an `EditableImage` into this `EditableImage` with transformations applied, such as scaling and rotation. The position parameter specifies where the pivot point of the source image will be placed on this image after transformations. Positions outside the canvas bounds are allowed such that only part of the new image is drawn.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Position in pixels where the pivot point of the source image will be placed on this image. |
| `scale` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Scaling factors for the source image along the X and Y axes. |
| `rotation` | float |  | The rotation angle in degrees, applied around the pivot point of the source image. |
| `image` | [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] |  | The source `EditableImage` to be drawn into this image. |
| `options` | Dictionary? |  | Optional dictionary for additional configuration:<br><br>- `CombineType`: Specifies how the pixels of the source image blend with those of the destination. Default is [[30 Official Roblox Docs/API Reference/Enums/ImageCombineType\|Enum.ImageCombineType.AlphaBlend]]. - `SamplingMode`: Specifies the sampling method (e.g. `Default` for bilinear or `Pixelated` for nearest neighbor). Default is [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode\|Enum.ResamplerMode.Default]]. - `PivotPoint`: Specifies the pivot point within the source image for scaling and rotation. Default is the center of the source image (i.e. `Image.Size / 2`). |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`EditableImage-DrawImageTransformed`, `EditableImage-DrawImageTransformed-Crop`) are published on the source page; their code is not part of the open-source repo.*

### DrawLine

```lua
EditableImage:DrawLine(p1: Vector2, p2: Vector2, color: Color3, transparency: float, combineType: ImageCombineType, antiAliasing: AntiAliasing = Enabled): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Draws a line on the `EditableImage` one pixel thick between the two provided points.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `p1` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Start point of the line. |
| `p2` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | End point of the line. |
| `color` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | Color of the line. |
| `transparency` | float |  | Transparency of the line. |
| `combineType` | [[30 Official Roblox Docs/API Reference/Enums/ImageCombineType\|ImageCombineType]] |  | How the drawn pixels (source) are combined with the existing pixels of this image (destination). |
| `antiAliasing` | [[30 Official Roblox Docs/API Reference/Enums/AntiAliasing\|AntiAliasing]] | `Enabled` | Determines whether anti-aliasing is applied to the line. When set to [[30 Official Roblox Docs/API Reference/Enums/AntiAliasing\|Enum.AntiAliasing.Enabled]], line edges are soft. When set to [[30 Official Roblox Docs/API Reference/Enums/AntiAliasing\|Enum.AntiAliasing.Disabled]], line edges are hard. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### DrawRectangle

```lua
EditableImage:DrawRectangle(position: Vector2, size: Vector2, color: Color3, transparency: float, combineType: ImageCombineType): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Draws a rectangle on the `EditableImage` of the given size at the given top-left position.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Position of the top-left of the rectangle. Unlike other drawing methods, this cannot be outside the canvas bounds of the `EditableImage`. |
| `size` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Size of the rectangle to draw, in pixels. |
| `color` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | Color of the rectangle. |
| `transparency` | float |  | Transparency of the rectangle. |
| `combineType` | [[30 Official Roblox Docs/API Reference/Enums/ImageCombineType\|ImageCombineType]] |  | How the drawn pixels (source) are combined with the existing pixels of this image (destination). |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ReadPixelsBuffer

```lua
EditableImage:ReadPixelsBuffer(position: Vector2, size: Vector2): buffer
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Reads a rectangular region of pixels from an `EditableImage` and returns it as a buffer. Each number in the buffer is a single byte, with pixels stored in a sequence of four bytes (red, green, blue, and alpha).

Note that this method uses alpha instead of transparency, unlike the `EditableImage` drawing methods.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Top-left corner of the rectangular region of pixels to read. |
| `size` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Size of the rectangular region of pixels to read. |

**Returns**

| Type | Description |
| --- | --- |
| buffer | Buffer where each pixel is represented by four bytes (red, green, blue and alpha respectively). The length of the buffer can be calculated as `Size.X * Size.Y * 4` bytes. |

*Code samples for this member (`EditableImage-ReadPixels1`) are published on the source page; their code is not part of the open-source repo.*

### WritePixelsBuffer

```lua
EditableImage:WritePixelsBuffer(position: Vector2, size: Vector2, buffer: buffer): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Writes a rectangular region of pixels to an `EditableImage` from a buffer. Each number in the buffer is a single byte, with pixels stored in a sequence of four bytes (red, green, blue, and alpha).

Note that this method uses alpha instead of transparency, unlike the `EditableImage` drawing methods.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Top-left corner of the rectangular region to draw the pixels into. |
| `size` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Size of the rectangular region of pixels to write. |
| `buffer` | buffer |  | A buffer where each pixel is represented by four bytes (red, green, blue, and alpha respectively). The length of the buffer should be `Size.X * Size.Y * 4` bytes. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`EditableImage-ReadPixelsWritePixels1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [EditableImage](https://create.roblox.com/docs/reference/engine/classes/EditableImage) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
