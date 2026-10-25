---
title: "Decal"
description: "Applies an image texture to a face of a parent `BasePart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Decal"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies an image texture to a face of a parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/FaceInstance|FaceInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]]
- **Memory category:** GraphicsTexture

## Description

The [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] object applies an image texture to a face of a parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. The affected face is dependent on the [[30 Official Roblox Docs/API Reference/Classes/FaceInstance#Face|Face]] property, and the size of the decal is dependent on the size of the face.

The applied image texture is determined by its [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMapContent|ColorMapContent]] property. For details on how to upload images, see [asset management](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md).

For more information, review [[30 Official Roblox Docs/Parts/Textures and decals|textures and decals]]. See also:

- [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] for repeating surface images.
- [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|MeshPart.TextureContent]] to apply an image texture to a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].
- [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] to apply an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] or [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] to an in-experience 3D object.

*Code samples for this API (`Changing-Decal-Texture`, `Fading-Decal`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Decal); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#AutoLocalize\|AutoLocalize]] | boolean | When set to `true`, the decal's image asset is eligible for automatic localization capture. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#Color3\|Color3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] tint of the [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMap\|ColorMap]] | ContentId | Content ID that determines the color and opacity of the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMapContent\|ColorMapContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object that determines the color and opacity of the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#EmissiveMaskContent\|EmissiveMaskContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object that determines the emissivity across the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#EmissiveStrength\|EmissiveStrength]] | float | Determines the strength of the emissive contribution. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#EmissiveTint\|EmissiveTint]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the tinting color for the emissive contribution. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#LocalTransparencyModifier\|LocalTransparencyModifier]] | float | Acts as a multiplier for the decal's [[30 Official Roblox Docs/API Reference/Classes/Decal#Transparency\|Transparency]] property. The effects are only visible to the local player. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#MetalnessMap\|MetalnessMap]] | ContentId | Content ID that determines the metalness map of the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#MetalnessMapContent\|MetalnessMapContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object that determines the metalness map of the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#NormalMap\|NormalMap]] | ContentId | Content ID that determines the normal map of the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#NormalMapContent\|NormalMapContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object that determines the normal map of the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#Rotation\|Rotation]] | float | Rotates the decal texture. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#RoughnessMap\|RoughnessMap]] | ContentId | Content ID that determines the roughness map of the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#RoughnessMapContent\|RoughnessMapContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] object that determines the roughness map of the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#Shiny\|Shiny]] | float | **Deprecated.** Deprecated property that previously set the shininess of the decal. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#Specular\|Specular]] | float | **Deprecated.** Deprecated property that previously set the specularity of the decal. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#Texture\|Texture]] | ContentId | **Deprecated.** The content ID of the image to be applied by the [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#TextureContent\|TextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | **Deprecated.** The texture content displayed by the [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#TexturePackContent\|TexturePackContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Engine-managed [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] that stores the compressed runtime texture-pack data for PBR decals. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#Transparency\|Transparency]] | float | Determines the transparency of the [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#UVOffset\|UVOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Shifts the UV coordinates by adding an offset before texture mapping. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#UVScale\|UVScale]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Stretches or compresses the UV coordinates by multiplying a scale factor. |
| [[30 Official Roblox Docs/API Reference/Classes/Decal#ZIndex\|ZIndex]] | int | Determines the rendering order when multiple decals are assigned the same face. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/FaceInstance|FaceInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoLocalize

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Localization · **Loaded/Saved:** true/true · **Capabilities:** Basic

When set to `true`, the decal's image asset is eligible for automatic localization through the Automatic Asset Capture system. The [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]] uses this property to determine whether the decal's [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMapContent|ColorMapContent]] should be captured and potentially replaced with a localized version.

This property only applies to non-PBR decals. If any PBR maps ([[30 Official Roblox Docs/API Reference/Classes/Decal#NormalMapContent|NormalMapContent]], [[30 Official Roblox Docs/API Reference/Classes/Decal#RoughnessMapContent|RoughnessMapContent]], [[30 Official Roblox Docs/API Reference/Classes/Decal#MetalnessMapContent|MetalnessMapContent]], or [[30 Official Roblox Docs/API Reference/Classes/Decal#EmissiveMaskContent|EmissiveMaskContent]]) are set, automatic localization capture is suppressed to avoid inconsistent rendering.

### Color3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] tint of the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]]. Note that this property only sets the **tint** of the decal rather than the color; unless the image associated with the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] was originally pure white, then the color cannot be freely changed using this property.

*Code samples for this member (`Decal-Color3`) are published on the source page; their code is not part of the open-source repo.*

### ColorMap

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

This property takes a content ID to determine the color and opacity of the surface. This texture is sometimes called the **albedo** texture.

### ColorMapContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

This property takes a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] object to determine the color and opacity of the surface. This texture is sometimes called the **albedo** texture.

### EmissiveMaskContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property takes a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] object that determines the apparent emissivity across the surface. An emissive mask is a grayscale image where black pixels correspond to no emissivity and white pixels correspond to full emissivity. It defaults to an empty content, in which case the decal doesn't glow.

The emissive contribution is added to the total lighting contribution across the surface, and the sum is multiplied by the albedo texture from [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMapContent|ColorMapContent]], if provided. Use [[30 Official Roblox Docs/API Reference/Classes/Decal#EmissiveStrength|EmissiveStrength]] and [[30 Official Roblox Docs/API Reference/Classes/Decal#EmissiveTint|EmissiveTint]] to control how bright the glow is and what color it has.

Assigning an emissive mask makes the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] a physically based rendering (PBR) surface.

### EmissiveStrength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This value is a multiplier that controls how strong the emissive contribution from [[30 Official Roblox Docs/API Reference/Classes/Decal#EmissiveMaskContent|EmissiveMaskContent]] is across the surface. Defaults to `1`. Negative values are treated as `0`, and a value of `0` turns off the glow.

If the final emissive contribution goes beyond the supported dynamic range, it's clamped, which can make the emissive areas appear fully white at large strength values. Since this value is a multiplier, the maximum value that avoids clamping depends on the other contributing values, including [[30 Official Roblox Docs/API Reference/Classes/Decal#EmissiveTint|EmissiveTint]], [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMapContent|ColorMapContent]], and the combined lighting contribution.

### EmissiveTint

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This value is a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] that tints the emissive contribution from [[30 Official Roblox Docs/API Reference/Classes/Decal#EmissiveMaskContent|EmissiveMaskContent]]. Defaults to white, which leaves the emissive color unchanged. Each component is clamped between `0` and `1`, and black turns off the glow.

### LocalTransparencyModifier

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`

Acts as a multiplier for the decal's [[30 Official Roblox Docs/API Reference/Classes/Decal#Transparency|Transparency]] property. The effect is only visible to the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|LocalPlayer]] and will not replicate to the server.

When this property is set to `1`, the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] will be completely invisible regardless of its original transparency. When it is set to `0`, the decal's rendered transparency will match the [[30 Official Roblox Docs/API Reference/Classes/Decal#Transparency|Transparency]] value.

### MetalnessMap

**Type:** ContentId

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `Hidden`

This property takes a content ID that determines the metalness map applied to the surface. A metalness map controls how metallic the surface appears at each point, blending between a dielectric (non-metal) and a metallic response to light. It defaults to an empty content, in which case no metalness map is applied.

Assigning a normal, roughness, metalness, or emissive map makes the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] a physically based rendering (PBR) surface. To assign this map from a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] object, use [[30 Official Roblox Docs/API Reference/Classes/Decal#MetalnessMapContent|MetalnessMapContent]].

### MetalnessMapContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property takes a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] object that determines the metalness map applied to the surface. A metalness map controls how metallic the surface appears at each point, blending between a dielectric (non-metal) and a metallic response to light. It defaults to an empty content, in which case no metalness map is applied.

Assigning a normal, roughness, metalness, or emissive map makes the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] a physically based rendering (PBR) surface.

### NormalMap

**Type:** ContentId

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `Hidden`

This property takes a content ID that determines the normal map applied to the surface. A normal map perturbs the surface normals used in lighting calculations, adding the appearance of fine detail such as bumps and grooves without changing the underlying geometry. It defaults to an empty content, in which case no normal map is applied.

Assigning a normal, roughness, metalness, or emissive map makes the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] a physically based rendering (PBR) surface. To assign this map from a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] object, use [[30 Official Roblox Docs/API Reference/Classes/Decal#NormalMapContent|NormalMapContent]].

### NormalMapContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property takes a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] object that determines the normal map applied to the surface. A normal map perturbs the surface normals used in lighting calculations, adding the appearance of fine detail such as bumps and grooves without changing the underlying geometry. It defaults to an empty content, in which case no normal map is applied.

Assigning a normal, roughness, metalness, or emissive map makes the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] a physically based rendering (PBR) surface.

### Rotation

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property controls the rotation angle of the decal texture in degrees. Rotation is applied to the UV coordinates in the clockwise direction.

### RoughnessMap

**Type:** ContentId

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `Hidden`

This property takes a content ID that determines the roughness map applied to the surface. A roughness map controls how rough or smooth the surface appears at each point, which in turn determines how sharp or blurry its reflections are. It defaults to an empty content, in which case no roughness map is applied.

Assigning a normal, roughness, metalness, or emissive map makes the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] a physically based rendering (PBR) surface. To assign this map from a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] object, use [[30 Official Roblox Docs/API Reference/Classes/Decal#RoughnessMapContent|RoughnessMapContent]].

### RoughnessMapContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property takes a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] object that determines the roughness map applied to the surface. A roughness map controls how rough or smooth the surface appears at each point, which in turn determines how sharp or blurry its reflections are. It defaults to an empty content, in which case no roughness map is applied.

Assigning a normal, roughness, metalness, or emissive map makes the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] a physically based rendering (PBR) surface.

### Shiny

> [!warning] Deprecated
> This non-functional property is deprecated and should not be used in new
> work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`, `Deprecated`

This property dictates how shiny the decal is. It takes a value between `0` and `1`, where `1` is "fully shiny."

### Specular

> [!warning] Deprecated
> This property no longer functions correctly and is deprecated. It should
> not be used in new work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`, `Deprecated`

Sets the specularity, which is how the surface responds to light being shined on it.

### Texture

> [!warning] Deprecated
> This property has been deprecated. Use
> `Class.Decal.ColorMapContent|ColorMapContent` for future work.

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The content ID of the image to be applied by the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]].

### TextureContent

> [!warning] Deprecated
> This property has been deprecated. Use
> `Class.Decal.ColorMapContent|ColorMapContent` for future work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The texture content displayed by the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]]. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) and [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] objects.

### TexturePackContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Managed by the engine and not accessible from scripts. A [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] that holds the decal's compressed runtime texture data. When the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] is a physically based rendering (PBR) surface, the engine packs its color, normal, roughness, metalness, and emissive maps into a single texture-pack asset and references it here. Defaults to an empty content.

### Transparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines the transparency of the [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] with `0` being completely opaque and `1` completely transparent.

Note that [[30 Official Roblox Docs/API Reference/Classes/Decal#LocalTransparencyModifier|LocalTransparencyModifier]] acts as a **multiplier** for this transparency level and should be used when the transparency of the decal is likely to be changed by another script.

### UVOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property controls the UV coordinate translation. The [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#X|X]] value (**U** offset) and [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Y|Y]] value (**V** offset) are added to every corresponding UV coordinate during texture mapping.

### UVScale

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property controls the scale applied to the horizontal and vertical coordinates. The [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#X|X]] value (**U** scale) and [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Y|Y]] value (**V** scale) are multiplied by every corresponding UV coordinate during texture mapping.

### ZIndex

**Type:** int

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property determines the order in which decals on the same [[30 Official Roblox Docs/API Reference/Classes/FaceInstance#Face|Face]] of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] are rendered. Lower values are rendered first, so a decal with a higher `ZIndex` renders on top of those with a lower `ZIndex`.

If you're unsure whether you'll need to layer a decal between two already-existing decals in the future, use larger separations between `ZIndex` values such as `10` or `100` to ensure space for future decals between.

---
*Source: [Decal](https://create.roblox.com/docs/reference/engine/classes/Decal) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
