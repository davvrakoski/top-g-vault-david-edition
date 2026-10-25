---
title: "MaterialVariant"
description: "Represent a variant of a Material."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MaterialVariant"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represent a variant of a Material.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Using MaterialVariant objects can expand the variety of materials in an experience. MaterialVariant has properties that can define the appearance of a material. Its name can be set in MaterialService to globally override a built-in material, or set in the [[30 Official Roblox Docs/API Reference/Classes/BasePart#MaterialVariant|BasePart.MaterialVariant]] property to change certain Parts. MaterialVariant objects only work as descendants of MaterialService.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#AlphaMode\|AlphaMode]] | [[30 Official Roblox Docs/API Reference/Enums/AlphaMode\|AlphaMode]] | Determines how the alpha channel of the [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#ColorMap\|MaterialVariant.ColorMap]] is used. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial\|BaseMaterial]] | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] | Category Material this variant belongs to. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#ColorMap\|ColorMap]] | ContentId | Determines the color of the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#ColorMapContent\|ColorMapContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Determines the color of the surface. Only supports asset URIs as textures. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#CustomPhysicalProperties\|CustomPhysicalProperties]] | [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties\|PhysicalProperties]] | Determines the physical properties of parts whose material resolves to this variant. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#EmissiveMaskContent\|EmissiveMaskContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Determines the emissivity across the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#EmissiveStrength\|EmissiveStrength]] | float | Determines the strength of emissive contribution. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#EmissiveTint\|EmissiveTint]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the tinting color for emissive contribution. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#MaterialPattern\|MaterialPattern]] | [[30 Official Roblox Docs/API Reference/Enums/MaterialPattern\|MaterialPattern]] | Determines texture tiling method. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#MetalnessMap\|MetalnessMap]] | ContentId | Determines which parts of the surface are metal and are non-metal. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#MetalnessMapContent\|MetalnessMapContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Determines which parts of the surface are metal and are non-metal. Only supports asset URIs as textures. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#NormalMap\|NormalMap]] | ContentId | Modifies the lighting of the surface by adding bumps, dents, cracks, and curves without adding more polygons. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#NormalMapContent\|NormalMapContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Modifies the lighting of the surface by adding bumps, dents, cracks, and curves without adding more polygons. Only supports asset URIs as textures. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#RoughnessMap\|RoughnessMap]] | ContentId | Determines the apparent roughness across the surface. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#RoughnessMapContent\|RoughnessMapContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Determines the apparent roughness across the surface. Only supports asset URIs as textures. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#StudsPerTile\|StudsPerTile]] | float | Determines the scale of textures. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AlphaMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|AlphaMode]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotBrowsable`

This property determines how the alpha channel of the [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#ColorMap|MaterialVariant.ColorMap]] is used.

When set to [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Transparency]] and the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|MeshPart.Transparency]] is set to `0`, opaque pixels in the [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#ColorMap|ColorMap]] renders as completely opaque in the 3D scene. This combination works better with depth-based effects and occlusion.

When set to [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Transparency]] and the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|MeshPart.Transparency]] is set to at least `0.02`, a different blending method is used that can better represent smooth transparency gradients and soft edges. This combination does not support all effects and occlusion may not be perfect.

For more information, see [[30 Official Roblox Docs/Art/Modeling/PBR textures#Alpha modes|Alpha modes]].

### BaseMaterial

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Material|Material]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

Category Material this variant belongs to.

### ColorMap

**Type:** ContentId

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This property determines the color of the surface. This texture is sometimes called the albedo texture. The alpha channel is not used.

### ColorMapContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This property determines the color of the surface. This texture is sometimes called the albedo texture. The alpha channel is not used.

### CustomPhysicalProperties

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]]

**Thread safety:** ReadSafe · **Category:** Material · **Loaded/Saved:** true/true · **Capabilities:** Material

Determines the physical properties, such as density, friction, and elasticity, of parts whose material resolves to this variant.

The assigned [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] apply only when that value was constructed with explicit values. Otherwise the physical properties are inherited, falling back first to the base-material override configured on the parent [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]], and if none is set, to the default physical properties of the variant's [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|BaseMaterial]] category.

The default value is a [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] constructed without explicit values, so an unmodified variant inherits its base material's physical properties.

### EmissiveMaskContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This property determines the apparent emissivity across the surface. An emissive mask is a grayscale image where black pixels correspond to no emissivity, and white pixels correspond to full emissivity.

The emissive contribution gets added to total lighting contribution across the surface, and the sum gets multiplied by the albedo texture, which would be sampled from [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#ColorMap|ColorMap]] if provided.

### EmissiveStrength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This value is a multiplier to control how strong the emissive contribution is across the surface. If the final contribution of emissives goes beyond supported dynamic range, it will get clamped; this could result in emissive contribution appearing all white when using large emissive strength values. Since this value is a multiplier, the maximum value to prevent clamping depends on all of the other contributing values, including [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#EmissiveTint|EmissiveTint]], [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#ColorMap|ColorMap]] and combined lighting contribution.

### EmissiveTint

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This value is an RGB color for tinting emissive contribution.

### MaterialPattern

**Type:** [[30 Official Roblox Docs/API Reference/Enums/MaterialPattern|MaterialPattern]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

Determines texture tiling method.

### MetalnessMap

**Type:** ContentId

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This property determines which parts of the surface are metal and are non-metal. A metalness map is a grayscale image where black pixels correspond to non-metals and white pixels correspond to metals.

Metals only reflect light the same color as the metal, and they reflect much more light than non-metals. Most materials in the real world can be categorized either metals or non-metals. For this reason, most pixels in a metalness map will be either pure black or pure white. Values in between are typically used to simulate dirt or grunge on top of an underlying metal area.

When [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentSpecularScale|Lighting.EnvironmentSpecularScale]] is 0, metalness has no effect. For the most realistic reflections, setting EnvironmentSpecularScale and [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentDiffuseScale|Lighting.EnvironmentDiffuseScale]] to 1, and [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Lighting.Ambient]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|Lighting.OutdoorAmbient]] to (0,0,0) is recommended.

### MetalnessMapContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This property determines which parts of the surface are metal and are non-metal. A metalness map is a grayscale image where black pixels correspond to non-metals and white pixels correspond to metals.

Metals only reflect light the same color as the metal, and they reflect much more light than non-metals. Most materials in the real world can be categorized either metals or non-metals. For this reason, most pixels in a metalness map will be either pure black or pure white. Values in between are typically used to simulate dirt or grunge on top of an underlying metal area.

When [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentSpecularScale|Lighting.EnvironmentSpecularScale]] is 0, metalness has no effect. For the most realistic reflections, setting EnvironmentSpecularScale and [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentDiffuseScale|Lighting.EnvironmentDiffuseScale]] to 1, and [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Lighting.Ambient]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|Lighting.OutdoorAmbient]] to (0,0,0) is recommended.

### NormalMap

**Type:** ContentId

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This property modifies the lighting of the surface by adding bumps, dents, cracks, and curves without adding more polygons.

Normal maps are RGB images that modify the surface's normal vector used for lighting calculations. The R, G, and B channels of the NormalMap correspond to the X, Y, and Z components of the local surface vector respectively, and byte values of 0 and 255 for each channel correspond linearly to normal vector components of -1 and 1.016 respectively. This range is stretched slightly from -1 to 1 so that a byte value of 127 maps to exactly 0. The normal vector's Z axis is always defined as the direction of the underlying mesh's normal. A uniform (127,127,255) image translates to a completely flat normal map where the normal is everywhere perpendicular to the mesh surface. This format is called "tangent space" normal maps. Roblox does not support world space or object space normal maps.

Incorrectly flipped normal components can make bumps appear like indents. If you import a normal map and notice the lighting looks off, you may need to invert the G channel of the image. The X and Y axes of the tangent space frame correspond to the X and Y directions in the image after it's transformed by the mesh UVs. If you view your normal map in an image editor as if it were displayed on a surface, normals pointing towards the right side of the screen should appear more red, and normals pointing towards the top side of your screen should appear more green.

The terms "DirectX format" and "OpenGL format" are sometimes used to describe whether the G channel of the normal map is inverted or not. Roblox expects the OpenGL format.

Roblox expects imported meshes to include tangents. Modeling software may also refer to this as "tangent space" information. If you apply a normal map and it does not seem to make any visual difference, you may need to re-export your mesh along with its tangent information from modeling software.

### NormalMapContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This property modifies the lighting of the surface by adding bumps, dents, cracks, and curves without adding more polygons.

Normal maps are RGB images that modify the surface's normal vector used for lighting calculations. The R, G, and B channels of the NormalMap correspond to the X, Y, and Z components of the local surface vector respectively, and byte values of 0 and 255 for each channel correspond linearly to normal vector components of -1 and 1.016 respectively. This range is stretched slightly from -1 to 1 so that a byte value of 127 maps to exactly 0. The normal vector's Z axis is always defined as the direction of the underlying mesh's normal. A uniform (127,127,255) image translates to a completely flat normal map where the normal is everywhere perpendicular to the mesh surface. This format is called "tangent space" normal maps. Roblox does not support world space or object space normal maps.

Incorrectly flipped normal components can make bumps appear like indents. If you import a normal map and notice the lighting looks off, you may need to invert the G channel of the image. The X and Y axes of the tangent space frame correspond to the X and Y directions in the image after it's transformed by the mesh UVs. If you view your normal map in an image editor as if it were displayed on a surface, normals pointing towards the right side of the screen should appear more red, and normals pointing towards the top side of your screen should appear more green.

The terms "DirectX format" and "OpenGL format" are sometimes used to describe whether the G channel of the normal map is inverted or not. Roblox expects the OpenGL format.

Roblox expects imported meshes to include tangents. Modeling software may also refer to this as "tangent space" information. If you apply a normal map and it does not seem to make any visual difference, you may need to re-export your mesh along with its tangent information from modeling software.

### RoughnessMap

**Type:** ContentId

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This property determines the apparent roughness across the surface. A roughness map is a grayscale image where black pixels correspond to a maximally smooth surface, and white pixels correspond to a maximally rough surface.

Roughness refers to how much variation the surface has on a very small scale. Reflections on smooth surfaces are sharp and concentrated. Reflections on rough surfaces are more blurry and dispersed.

### RoughnessMapContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

This property determines the apparent roughness across the surface. A roughness map is a grayscale image where black pixels correspond to a maximally smooth surface, and white pixels correspond to a maximally rough surface.

Roughness refers to how much variation the surface has on a very small scale. Reflections on smooth surfaces are sharp and concentrated. Reflections on rough surfaces are more blurry and dispersed.

### StudsPerTile

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Material

Determines the scale of textures. Larger values for this property will lead to the textures appearing larger, and repeating less frequently.

---
*Source: [MaterialVariant](https://create.roblox.com/docs/reference/engine/classes/MaterialVariant) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
