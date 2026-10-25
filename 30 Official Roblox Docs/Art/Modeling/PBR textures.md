---
title: "PBR textures"
description: "PBR textures are advanced textures using multiple texture maps."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/surface-appearance"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*PBR textures are advanced textures using multiple texture maps.*

**Physically-Based Rendering** (PBR) textures allow you to represent realistic shading and lighting by using multiple types of texture images, or **maps**, on a single object. Combining multiple texture maps can more accurately simulate color, roughness, and reflectivity in any lighting environment and can enhance the visual elements of your assets and environment.

### Clothing

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

### Environment

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

Various applications and workflows are available for creating PBR textures. You can use these during the modeling and texturing phases of custom 3D object creation, provided that Roblox Studio [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Textures|supports]] the specific texture maps you're using.

> [!info]
> For information on how to properly connect PBR textures to your model in Blender and Maya for import into Studio, see [[30 Official Roblox Docs/Art/Modeling/Blender and Maya texture settings|Blender / Maya texture settings]].

This guide provides instructions on [[30 Official Roblox Docs/Art/Modeling/PBR textures#Enable surface appearance|setting up]] your mesh objects to use PBR texture maps, and describes common use-cases and best practices for Roblox's supported PBR [[30 Official Roblox Docs/Art/Modeling/PBR textures#Texture maps|texture maps]]. When creating your own surfaces, see [[30 Official Roblox Docs/Art/Modeling/Material references|material references]] for common material values, image comparisons and clothing examples.

## Enable surface appearance

You can add PBR textures to any [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] by adding a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] object which overwrites the original assigned texture. In general, you can't modify [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] properties by scripts during a game because the engine requires some pre-processing to display these graphics. Similar to adding a basic texture, each texture image map must point to the appropriate uploaded image asset ID.

To enable surface appearance for a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]:

1. In the **Explorer** window, hover over the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and click the ⊕ button.
2. Insert a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] from the contextual menu.

   *(image in the full Top G Vault)*

   When you're ready to add texture maps to the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] object, you can click each map property in the **Properties** window and enter an asset ID.

## Texture maps

Studio currently supports 5 types of PBR texture maps: [[30 Official Roblox Docs/Art/Modeling/PBR textures#Color (albedo)|color]], [[30 Official Roblox Docs/Art/Modeling/PBR textures#Normal|normal]], [[30 Official Roblox Docs/Art/Modeling/PBR textures#Roughness|roughness]], [[30 Official Roblox Docs/Art/Modeling/PBR textures#Metalness|metalness]], and [[30 Official Roblox Docs/Art/Modeling/PBR textures#Emissive Mask|emissive]]. Each of these maps corresponds to an important aspect of the object's surface appearance. Texture maps only change visual appearance and don't affect the geometry of the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object.

> [!warning]
> Avoid adjusting material values to look better in one specific lighting situation. You should base your material values on the physical characteristics and test and iterate to achieve a result that remains visually accurate in various lighting environments.

See the following examples for an overview of Roblox's supported texture maps and additional resources:

### Color

The [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|ColorMap]] property sets the color data of the surface, including any transparency present in the map. See [[30 Official Roblox Docs/Art/Modeling/PBR textures#Color (albedo)|color (albedo)]] for additional information.

*(image in the full Top G Vault)*

*Example map*

*(image in the full Top G Vault)*

*Example mesh*

*(image in the full Top G Vault)*

*Mesh and texture*

### Normal

The [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#NormalMap|NormalMap]] texture property defines the topography of the surface allowing you to add visual textures such as bumps, dents, or cracks to your surface. See [[30 Official Roblox Docs/Art/Modeling/PBR textures#Normal|normal]] for additional information.

*(image in the full Top G Vault)*

*Example map*

*(image in the full Top G Vault)*

*Example mesh*

*(image in the full Top G Vault)*

*Mesh and texture*

### Roughness

The grayscale [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#RoughnessMap|RoughnessMap]] texture property defines the smoothness of the surface, allowing for a glossy or matte visual appearance. See [[30 Official Roblox Docs/Art/Modeling/PBR textures#Roughness|roughness]] for additional information.

*(image in the full Top G Vault)*

*Example map*

*(image in the full Top G Vault)*

*Example mesh*

*(image in the full Top G Vault)*

*Mesh and texture*

### Metalness

The grayscale [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#MetalnessMap|MetalnessMap]] texture property defines the metallic visual properties of the surface. See [[30 Official Roblox Docs/Art/Modeling/PBR textures#Metalness|metalness]] for additional information.

*(image in the full Top G Vault)*

*Example map*

*(image in the full Top G Vault)*

*Example mesh*

*(image in the full Top G Vault)*

*Mesh and texture*

### Emissive Mask

The grayscale [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#EmissiveMaskContent|EmissiveMaskContent]] content property determines emissivity across the surface, alongside [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#EmissiveStrength|EmissiveStrength]] and [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#EmissiveTint|EmissiveTint]]. See [[30 Official Roblox Docs/Art/Modeling/PBR textures#Emissive Mask|emissive]] for additional information.

*(image in the full Top G Vault)*

*Example mask*

*(image in the full Top G Vault)*

*Example mesh*

*(image in the full Top G Vault)*

*Mesh and emissive mask*

> [!info]
> For technical details on texture file requirements, see [[30 Official Roblox Docs/Art/Modeling/Texture specifications|texture requirements]].

### Color (albedo)

The **color**, or **albedo**, map determines the color of your texture and consists of mostly color information with little to no lighting or textural information. For additional customization, you can also add [[30 Official Roblox Docs/Art/Modeling/PBR textures#Alpha modes|transparency]] in your albedo texture by adding opacity to your image map.

> [!info]
> While albedo maps and generic [[30 Official Roblox Docs/Parts/Textures and decals|non-PBR texture maps]], commonly known as **diffuse maps**, contain very similar base color data for a surface, diffuse maps often include shading and lighting values to imitate a specific visual element that are more effectively handled by PBR's [[30 Official Roblox Docs/Art/Modeling/PBR textures#Normal|normal]], [[30 Official Roblox Docs/Art/Modeling/PBR textures#Roughness|roughness]], and [[30 Official Roblox Docs/Art/Modeling/PBR textures#Metalness|metalness]] maps. Using a typical diffuse map instead of an albedo map may often look incorrect when the lighting doesn't match with these added baked-in texture elements.

#### Alpha modes

For objects that require partial or complete sections of transparency, such as grass, leaves, lace, or decals like dirt or grunge, you can use various **alpha modes** to apply transparency to your color map. If your color map image format supports alpha channels, you can apply a grayscale alpha map where `0.0` is transparent and `1.0` is opaque. Similarly, when using an image format such as a `.png`, any opacity on the color map applies as transparency on the asset.

You can apply transparency in two different behaviors by setting the following [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#AlphaMode|AlphaMode]] values:

- [[30 Official Roblox Docs/Art/Modeling/PBR textures#Opaque|Opaque]] — Ignores the alpha channel of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|ColorMap]] and uses the color value directly from the color map.
- [[30 Official Roblox Docs/Art/Modeling/PBR textures#Overlay|Overlay]] — Overlays the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|ColorMap]] over the underlying mesh's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|MeshPart.Color]]. Color maps using overlay mode reveal the base color of the mesh anywhere transparency is present. This is the default setting.
- [[30 Official Roblox Docs/Art/Modeling/PBR textures#Alpha modes|Transparency]] — Removes the visible mesh based on transparency in the `ColorMap`. This renders the mesh see-through and does not reveal the original mesh color whenever transparency is present.
- [[30 Official Roblox Docs/Art/Modeling/PBR textures#Tint mask|Tint mask]] — Blends the tinted [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|ColorMap]] over the un-tinted [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|ColorMap]].

##### Opaque

> [!success]
> **File** ⟩ **Beta Features** ⟩ ****

You can use [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Enum.AlphaMode.Opaque]] mode to ignore the alpha channel of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|ColorMap]] altogether. In this case the alpha value is assumed to be 1 (fully opaque).

The following example demonstrates how the [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Opaque]] mode works using a blue object as reference:

*(image in the full Top G Vault)*

*Color/albedo map with transparency*

*(image in the full Top G Vault)*

*Example mesh object*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#AlphaMode|AlphaMode]] set to [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Opaque]]*

##### Overlay

You can use [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Enum.AlphaMode.Overlay]] to reveal sections of the mesh's original color. Since the transparent areas of the color map expose the underlying color, you can design a unique texture map that partially or fully reveals the mesh's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]] property for custom skin tones or other situations with unique colors.

The following example demonstrates how the [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Overlay]] mode works using a light blue sphere reference:

*(image in the full Top G Vault)*

*Color/albedo map with transparency*

*(image in the full Top G Vault)*

*Example mesh object*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#AlphaMode|AlphaMode]] set to [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Overlay]]*

The following example uses the [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Overlay]] mode for custom characters, revealing the character's original skin-tone:

*(image in the full Top G Vault)*

*Color map containing transparency in sections to expose the original mesh color*

*(image in the full Top G Vault)*

*Several variations of characters with a single color map using [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Overlay]] mode*

See [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Custom skin tone|custom skin tone]] for additional details on optimizing an overlay for skin and similar applications.

##### Transparency

You can use the [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Enum.AlphaMode.Transparency]] mode to create complex or extremely fine objects, such as lace or netting, by removing visible parts of the mesh as an alternative to sculpting the mesh geometry. Since this does not affect the geometry of the mesh object, this can allow you to create detailed objects without the performance impact of an intricate mesh model.

The following example demonstrates how a partial and full transparency in this mode visually removes sections of the mesh:

###### Sample Meshes

*(image in the full Top G Vault)*

*No transparency*

*(image in the full Top G Vault)*

*Half transparency in sections*

*(image in the full Top G Vault)*

*Full transparency in sections*

###### Image Maps

*(image in the full Top G Vault)*

*No transparency*

*(image in the full Top G Vault)*

*Half transparency in sections*

*(image in the full Top G Vault)*

*Full transparency in sections*

There are two outcomes of [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Transparency]] mode, depending on whether the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|MeshPart.Transparency]] is set to `0` or **at least** `0.02`, although numerical precision may result in small values such as `0.01` triggering the opaque transparency.

- When alpha is used to cut out the shape of mostly opaque objects with hard edges such as foliage, lace fabric, and netting, set the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|MeshPart.Transparency]] to `0`. When parts of the surface are fully opaque, the Roblox engine can render them with proper depth‑based occlusion. Opaque surfaces also generally work better with depth‑based effects like [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect|DepthOfFieldEffect]], glass and water refraction, and water reflection.
- When alpha is used to add detail to semi‑transparent objects or objects with smooth gradients of transparency, set the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|MeshPart.Transparency]] to **at least** `0.02`. This improves the quality of blending for objects such as dirty windows and soft‑edged feathers, but it will not work with all effects.

##### Tint mask

You can use the [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Enum.AlphaMode.TintMask]] mode to apply [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|SurfaceAppearance.Color]] tinting to selective areas of a surface. The tinting is strongest where the alpha channel is fully visible and not applied where the alpha channel is transparent.

###### ColorMap RGB

*(image in the full Top G Vault)*

*Example brick texture, showing the color detail on brick faces as well as in the grout between the bricks.*

###### ColorMap Alpha

*(image in the full Top G Vault)*

*Example brick texture alpha, with areas of the brick faces opaque (white) and the grout areas in between bricks transparent (black).*

###### Example Results

*(image in the full Top G Vault)*

*Example brick texture with four different tint colors applied. The tint is affecting only the raised brick faces and not the grout between them.*

> [!info]
> When creating [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|SurfaceAppearance.ColorMap]] textures for use with a tint mask, preserve color in the transparent regions and turn off options such as pre-multiplied alpha that darken the color in transparent areas. The alpha values can also be semi-transparent to apply a partial tint to areas of the texture.

#### Color tinting

You can apply a tint to your color map by modifying the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|SurfaceAppearance.Color]] property. Tinting does not affect performance and you can save on memory by reusing a single color map with different tints. Use color tinting to create additional low-cost variation between your [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] PBR textures or to programmatically modify your PBR surface colors in real-time.

*(image in the full Top G Vault)*

*Statue mesh from [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/The Mystery of Duvall Drive|The Mystery of Duvall Drive]] with no tinting.*

*(image in the full Top G Vault)*

*Statue mesh with [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|Color]] set to red.*

*(image in the full Top G Vault)*

*Statue mesh with [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|Color]] set to green.*

[[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|SurfaceAppearance.Color]] tinting applies as a multiplier, so the final appearance is a function of [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] (texel color) times [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|SurfaceAppearance.Color]]. This means that authoring your original [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|SurfaceAppearance.ColorMap]] in near-white grayscale colors creates the strongest tinting effect when this property is applied.

Tinting only applies to the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|SurfaceAppearance.ColorMap]] and not the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|MeshPart.Color]]. You can continue to use alpha channels when applying [[30 Official Roblox Docs/Art/Modeling/PBR textures#Transparency|transparency]].

When [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#AlphaMode|SurfaceAppearance.AlphaMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Overlay]] and an alpha channel is present, the underlying [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|MeshPart.Color]] is revealed and [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|SurfaceAppearance.Color]] tinting only applies to the visible [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] color map.

When [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#AlphaMode|SurfaceAppearance.AlphaMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|TintMask]] and an alpha channel is present, the alpha channel controls the amount of [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|SurfaceAppearance.Color]] tinting. The tinting is strongest where the alpha channel is fully visible and not applied where the alpha channel is transparent.

##### Transparency AlphaMode

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#AlphaMode|AlphaMode]] set to [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Transparency]]. The greyscale gradient bar at the bottom indicates the alpha value. [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|MeshPart.Color]] is set to red and [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|SurfaceAppearance.Color]] is set to cyan.*

##### Overlay AlphaMode

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#AlphaMode|AlphaMode]] set to [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|Overlay]]. The greyscale gradient bar at the bottom indicates the alpha value. [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|MeshPart.Color]] is set to red and [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|SurfaceAppearance.Color]] is set to cyan.*

##### TintMask AlphaMode

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#AlphaMode|AlphaMode]] set to [[30 Official Roblox Docs/API Reference/Enums/AlphaMode|TintMask]]. The greyscale gradient bar at the bottom indicates the alpha value. [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|MeshPart.Color]] is set to red and [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#Color|SurfaceAppearance.Color]] is set to cyan. Tint masking is not affected by [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|MeshPart.Color]].*

### Normal

The **normal**, or **surface**, map adds texture depth to your surface and behaves similarly to a [[30 Official Roblox Docs/Parts/Environmental terrain#Heightmaps and colormaps|height map]]. As a result, the effect may fade or intensify depending on the viewing angle and lighting environment.

In the following figure, you can switch between the mesh reference and the map reference for comparisons of normal map values:

#### Sample Meshes

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

#### Image Maps

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

The **R**, **G**, and **B** channels of the image correspond respectively to the **X**, **Y**, and **Z** components of the local surface vector. A uniform image of color

`[127, 127, 255]`

 translates to a completely flat normal map. Roblox only supports **OpenGL format - Tangent Space** normal maps.

Normal maps prominently affect the visual surface of a mesh and can accentuate awkward seams in your texture. Whenever possible, keep your texture seams hidden to avoid visual issues with your mesh.

### Roughness

**Roughness**, or **microsurface**, maps determine how light is spread across your model's surface. When roughness is at 0%, the surface doesn't scatter light at all, resulting in a much sharper and brighter reflection and glossiness on your material. At 100%, light and reflections evenly scatter over the model resulting in a less reflective matte-like surface.

The following figure shows comparisons of various roughness map values:

*(image in the full Top G Vault)*

*0%*

*(image in the full Top G Vault)*

*50%*

*(image in the full Top G Vault)*

*100%*

Roughness may impact how reflective an object is at different angles, referred to as the **Fresnel** effect. Studio's fresnel processing aims for physical real-world accuracy, although you may get unexpected specular contribution at certain angles even with rough surfaces. In some cases, you can compensate by increasing your roughness map value by around `0.1` more rough to achieve a consistent lighting response with your materials.

Even though Roblox renders this lighting effect accurately, the brightness and reflectivity of a surface may not respond consistently between your texture content creating software, such as Substance Painter, and Studio. See [[30 Official Roblox Docs/Art/Modeling/Material references#Clothing examples|clothing examples]] for differences in rendering between applications.

> [!info]
> Various combinations of the roughness and metalness can represent almost every possible real-world material surface. See [[30 Official Roblox Docs/Art/Modeling/Material references|material references]] for examples and references of how combinations of material values can create various surface appearances.

### Metalness

**Metalness** determines the reflectivity of a surface. In most cases, you should set this value to either 0% (non-metal) or 100% (metal), although you can use partial metalness values when creating surfaces with moderate reflective properties like satin or silk. This practice can subtly fake the reflections in the material to highlight the color from the [[30 Official Roblox Docs/Art/Modeling/PBR textures#Color (albedo)|color/albedo map]] over colors reflected in the environment.

See the following figure for comparisons of various metalness map values:

*(image in the full Top G Vault)*

*0%*

*(image in the full Top G Vault)*

*50%*

*(image in the full Top G Vault)*

*100%*

Different PBR renderers use various workflows for processing reflectiveness. Studio only uses the **metalness workflow** which determines whether a material is a **nonmetal** or a **metal**, sometimes referred to as an **insulator** or **conductor**.

> [!info]
> Various combinations of the roughness and metalness can represent almost every possible real-world material surface. See [[30 Official Roblox Docs/Art/Modeling/Material references|material references]] for examples and references of how combinations of material values can create various surface appearances.

### Emissive mask

A grayscale [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#EmissiveMaskContent|EmissiveMaskContent]] content texture applies an **emissive mask** across the surface. This lets you use a texture to control emissiveness for more artistic control than the all‑or‑nothing [[30 Official Roblox Docs/API Reference/Enums/Material|Neon]] material and allows you to create detailed glowing effects like illuminated text, futuristic armor, or bioluminescent creatures.

The associated [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#EmissiveTint|EmissiveTint]] property determines the tinting color for emissive contribution, and [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#EmissiveStrength|EmissiveStrength]] determines the strength of emissive contribution.

> [!info]
> You can use emissive masks on avatar items published to the Marketplace, not just objects inside experiences. This applies to 3D accessories and layered clothing, and to avatar bodies, where any single emissive body part classifies the whole body as an emissive item. 2D clothing doesn't support emissive qualities. Emissive support doesn't yet extend to makeup, though Face Makeup, Lip Makeup, and Eye Makeup will gain support for emissive qualities in a future update. Creating emissive items through In-Experience Creation (IEC) also isn't supported at launch and is planned as a follow-up release. Items published to the Marketplace must keep [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#EmissiveStrength|EmissiveStrength]] between 0 and 40 to pass validation.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#EmissiveStrength|EmissiveStrength]] at 50%*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#EmissiveStrength|EmissiveStrength]] at 100%*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#EmissiveTint|EmissiveTint]] = [255, 0, 255]*

---
*Source: [PBR textures](https://create.roblox.com/docs/art/modeling/surface-appearance) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
