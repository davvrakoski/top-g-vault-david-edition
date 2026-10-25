---
title: "Meshes"
description: "Meshes are a collection of vertices, edges, and faces that make up 3D objects."
area: "30 Official Roblox Docs"
cluster: "Parts"
source: "https://create.roblox.com/docs/parts/meshes"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Meshes are a collection of vertices, edges, and faces that make up 3D objects.*

[[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects are descendants of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] class. They represent **meshes**, which are collections of vertices, edges, and faces that make up a 3D object. Unlike parts, which you can directly create in Studio, you need to use a third-party modeling application like Blender or Maya to create meshes, then import them into Studio as [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects.

After importing a mesh into Studio, you can customize its rendering properties, such as textures, level of detail, and collision fidelity. In addition to importing your own meshes, you can also browse and select from user-uploaded meshes using the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]].

Roblox supports many types of meshes, as long as they adhere to the [[30 Official Roblox Docs/Art/Modeling/General specifications|general mesh specifications]]. A basic mesh consists of at least one mesh object and one texture:

*(image in the full Top G Vault)*

*A mesh object sets the shape and geometry of the 3D object*

*(image in the full Top G Vault)*

*A texture image map applies a surface appearance and color*

*(image in the full Top G Vault)*

*The mesh and texture combine to make a unique custom 3D object*

Studio also supports meshes with components for creating avatar character models or accessories, such as [[30 Official Roblox Docs/Parts/Meshes#Rigging and skinning|rigging and skinning]] data.

> [!info]
> You can sell [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] assets as avatar bodies, accessories, and clothing on the Marketplace. See [[30 Official Roblox Docs/Avatar/Avatar, a system of expression|Avatar]] for more information.

## Import meshes

You can import meshes into Studio using the [[30 Official Roblox Docs/Studio/Importer|Importer]]. With this tool, you can preview and examine meshes before importing them into your workspace or **Toolbox**, such as verifying texture, rigging, skinning, and animation data. It also flags issues and rejects meshes with error.

If the mesh file you are importing contains objects using specific naming conventions or contains facial animation data, the Importer automatically detects and converts them into the following objects instead of [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]:

- [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] — Objects with `_Att` at the end of their names.
- [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] — Objects with `_OuterCage` at the end of their names.
- [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] — Objects with both `_InnerCage` `_OuterCage` at the end of their names.
- [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] — Objects containing avatar character heads and the appropriate facial animation data.

If you want to bulk-import meshes along with non-3D assets, such as images and audio, you can use the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md); note, however, that it doesn't support importing meshes with rigging, skinning, and animation data, accessories, or characters with facial animations.

## Customize meshes

Unlike basic parts, meshes have more customization options that you can adjust for advanced rendering fidelity.

### Texture

**Textures** contribute to the visual appearance of meshes by adding 2D details such as color and patterns. Studio allows you to either apply one texture using the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|MeshPart.TextureID]] property, or apply up to four physically-based rendering (PBR) textures within a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] child object of the mesh or made with a [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] and set in the mesh's [[30 Official Roblox Docs/API Reference/Classes/BasePart#MaterialVariant|MeshPart.MaterialVariant]] property. PBR textures allow you to represent realistic shading and lighting by using multiple types of texture images, or maps, on a single object.

#### PBR Textures

Studio supports four PBR texture maps, each corresponding to a visual characteristic of an object's surface appearance. Combining multiple texture maps can more accurately simulate color, roughness, and reflectivity in any lighting environment, and enhance the visual elements of your assets and environment. For more information on PBR textures and the texture maps, see [[30 Official Roblox Docs/Art/Modeling/PBR textures|PBR Textures]].

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

You can apply PBR textures using one of the following objects:

- [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] — Applies PBR textures to the mesh surface and doesn't affect its geometry.
- [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] — Represents a custom material that not only applies PBR textures to the mesh surface but also adds physical properties.

To add PBR textures to a mesh:

#### SurfaceAppearance

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, hover over the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object. Click the **⊕** button and select [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]].
2. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, edit the properties corresponding to the PBR texture maps.

#### MaterialVariant

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, hover over the [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]]. Click the **⊕** button and select [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]].
2. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, edit the properties corresponding to the PBR texture maps.
3. Name the new [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] to a name of your choice.
4. Select the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and, in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, set the [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] to the one you just created.

> [!info]
> If you both add [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] as a child object and set the [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] in the mesh's properties, Studio only applies the texture map settings of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] object to the mesh. The mesh still has all other settings of the [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] object, such as custom physical properties.

#### Single Texture

If the mesh you import to Studio doesn't come with texture data, or you want to change the existing texture, use the following steps to add a single texture:

1. [Import the texture file](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md). The file must follow the [[30 Official Roblox Docs/Art/Modeling/Texture specifications|texture specifications]]. Upon completion, Studio automatically assigns and prompts an asset ID.
2. Copy the asset ID.
3. In the **Explorer** window, select the **MeshPart** object.
4. In the **Properties** window, select the **TextureID** field and paste the asset ID of the texture.

> [!warning]
> If your mesh has existing PBR textures, setting a Texture ID can't override the PBR textures.

### Level of detail

You can dynamically control a mesh's level of detail using its [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|Enum.RenderFidelity]] property. The default value is [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|Automatic]], meaning the mesh's detail is based on its distance from the camera as outlined in the following table.

| Distance from camera | Render fidelity | Example |
| --- | --- | --- |
| Less than 250 studs | Highest | *(image in the full Top G Vault)* |
| 250-500 studs | Medium | *(image in the full Top G Vault)* |
| 500 or more studs | Lowest | *(image in the full Top G Vault)* |

### Collision fidelity

**Collision fidelity** determines how closely the visual representation of a mesh matches its physical bounds. The [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|MeshPart.CollisionFidelity]] property has the following options:

- **Box** — Creates a bounding collision box, ideal for small or non‑interactive objects.
- **Hull** — Generates a convex hull, suitable for objects with less pronounced indentations or cavities.
- **Default** — Produces an approximate collision shape that supports concavity, suitable for complex objects with semi-detailed interaction needs.
- **PreciseConvexDecomposition** — Offers the most precise fidelity but still not a 1:1 representation of the visual. This option has the most expensive performance cost and takes longer for the engine to compute.
- **Tunable** — Setting [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|MeshPart.CollisionFidelity]] to [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity|Tunable]] reveals a [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionPrecision|CollisionPrecision]] slider in the **Properties** window. Sliding up produces more precise, more expensive collision geometry, while sliding down produces coarser, cheaper geometry, all without switching to a different fidelity option. The default [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionPrecision|CollisionPrecision]] value isn't fixed; the engine intelligently picks the appropriate precision, and therefore cost, based on the size of the mesh.

#### Original Mesh

*(image in the full Top G Vault)*

#### Default

*(image in the full Top G Vault)*

#### Box

*(image in the full Top G Vault)*

#### Hull

*(image in the full Top G Vault)*

#### Precise

*(image in the full Top G Vault)*

#### Tunable

[Video: Collision-Fidelity-Tunable.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/collisions/Collision-Fidelity-Tunable.mp4)

> [!success]
> To view collision fidelity in Studio, toggle on **Collision fidelity** from the [[30 Official Roblox Docs/Studio/Studio interface#Visualization options|Visualization Options]] widget in the upper‑right corner of the 3D viewport.

For more information on the performance impact of collision fidelity options and how to mitigate them, see [[30 Official Roblox Docs/Performance Optimization/Improve performance#Physics computation|Improve performance]]. For an in-depth walkthrough on how to choose a collision fidelity option that balances your precision and performance requirements, see [[30 Official Roblox Docs/Tutorials/Curriculums/Environmental Art/Optimize your game|Set physics and rendering parameters]].

## Rigging and skinning

**Rigging** is the process of connecting a mesh with an internal poseable skeleton rig. Rigged meshes allow mesh surfaces to rotate and move using internal bones within a model, such as a character's knee or elbow. **Skinning** a rigged mesh allows the rigged mesh object to deform, stretch, and bend in a more realistic manner.

[Video: Head-Rigid-Example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/Head-Rigid-Example.mp4)

*Without skinning, the entire head mesh rotates on a single axis*

[Video: Head-Skinned-Example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/Head-Skinned-Example.mp4)

*With skinning, the head mesh bends naturally at the neck, and the bottom of the neck stays connected to the torso*

For more information on rigging and skinning, see [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning|Rigging and skinning]]. After rigging a mesh, you can add animation and poses to it using the **Animation Editor**. See [[30 Official Roblox Docs/Animation/Animation Editor#Create an animation|Create an animation]] for more information. Marketplace 3D assets, such as avatar clothing and bodies, also require rigging and skinning. See [[30 Official Roblox Docs/Avatar/Avatar, a system of expression|Avatar]] for more information on requirements for Marketplace assets.

---
*Source: [Meshes](https://create.roblox.com/docs/parts/meshes) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
