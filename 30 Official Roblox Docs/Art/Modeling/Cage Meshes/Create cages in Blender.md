---
title: "Create cages in Blender"
description: "Author outer and inner cage meshes for a model in Blender so Studio can reshape and layer it with cage meshes."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/cage-meshes/create-cages"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Author outer and inner cage meshes for a model in Blender so Studio can reshape and layer it with cage meshes.*

A **cage mesh** allows you to define an invisible surface for a visible render mesh. In Studio, you can combine cage meshes to wrap, stretch, shrink, or otherwise deform a mesh over a target mesh.

You must create these types of deformable meshes using a third-party modeling tool, such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview), and import them into Studio. This tutorial uses Blender and provides a [[30 Official Roblox Docs/Art/Modeling/Cage Meshes/Create cages in Blender#Create a cage|Blender project file]] as reference.

*(image in the full Top G Vault)*

At a minimum, cage meshes require a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] and a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] to interact. For a breakdown on the two types of cage meshes, see [[30 Official Roblox Docs/Art/Modeling/Cage Meshes/Create cages in Blender#Cage types|Cage types]].

## Cage types

When working with caged meshes, there are two types of meshes: a **target mesh** and a **layered mesh**.

*(image in the full Top G Vault)*

*Target mesh*

*(image in the full Top G Vault)*

*Layered mesh*

*(image in the full Top G Vault)*

*Composed result*

| Caged mesh type | Configuration in Blender | Naming requirement |
| --- | --- | --- |
| **Target mesh**<br><br>The base mesh that a layered mesh deforms to. | *(image in the full Top G Vault)* • A rendered mesh object.<br>• An outer cage mesh object.<br>• A UV map that matches any layered meshes that will wrap and deform over the target. | Name the cage after the render mesh with the `_OuterCage` suffix, such as `Cube_OuterCage`.<br><br>An `_OuterCage` on its own imports as a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]]. |
| **Layered mesh**<br><br>Wraps and fits around a target mesh. | *(image in the full Top G Vault)* • A rendered mesh object.<br>• An inner cage mesh object.<br>• An outer cage mesh object. | Name each cage after the render mesh with the `_InnerCage` and `_OuterCage` suffixes, such as `Shirt_InnerCage` and `Shirt_OuterCage`. <br><br>The two cage meshes together import as a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer\|WrapLayer]]. |

## Create a cage

Create your cage meshes after you finalize your render mesh. If you later change the render mesh topology or its UVs, you might need to readjust the cage.

As a reference, download the [.blend](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/Cage-Mesh-Examples.blend) project to see these exact models and other examples. This project contains three target cage mesh configurations and two layered cage mesh configurations.

*(image in the full Top G Vault)*

### Cage a target mesh

The following example creates an outer cage on the standard Blender cube. The cube has 10 loop cuts on each axis, adding extra vertices for sculpting later.

To create the outer cage:

1. Duplicate your render mesh to use as the starting point for the cage. In this example, the cube is duplicated.
2. Rename the duplicate with the `_OuterCage` suffix, such as `Cube_OuterCage`.

   *(image in the full Top G Vault)*

3. (Optional) Depending on the complexity of your rendered model, simplify the duplicate mesh to a low vertex count, since a cage should be a coarse shell rather than a detailed copy. For example, a detailed avatar head is caged with a far simpler mesh:

   *(image in the full Top G Vault)*

   *An avatar character head mesh can include up to 12,000 vertices.*

   *(image in the full Top G Vault)*

   *An avatar character head cage only contains 335 vertices.*

4. Adjust the cage so it sits just outside the render surface and fully encloses it, staying as close to the surface as possible for accurate layering. Switching to **Wireframe** viewport shading helps you see the render mesh underneath.

   *(image in the full Top G Vault)*

5. In the UV Editing tab, confirm the cage mesh has UV coordinates — you will need to ensure that any future layered mesh cages share the same UV mapping.

   *(image in the full Top G Vault)*

   *Outer cage UVs must match the UVs of any layered mesh cages that will deform onto it.*

6. Confirm your Outliner shows the render mesh with a single `_OuterCage` beneath it, matching the following configuration.

   *(image in the full Top G Vault)*

You can also cage a target with completely different geometry. As long as the cage mesh shares the same UV map, a layered mesh can deform onto it — this is what lets a single layered mesh fit many differently-shaped targets. The following twisted mesh, for example, uses the same UV layout as the cube, so the same layered mesh can deform onto both targets.

*(image in the full Top G Vault)*

*A differently-shaped target whose cage shares the same UV layout.*

> [!danger]
> Don't add or delete cage vertices after setting up a cage, and don't change its UVs. Destructive edits break vertex pairing and cause import errors or incorrect deformation.

### Cage a layered mesh

The layered mesh is the mesh you expect to deform to the shape of the target. A layered mesh requires both an inner and an outer cage: the **inner cage** defines the surface that conforms to the target, and the **outer cage** defines the surface that additional layers wrap over.

> [!info]
> It may be easiest to duplicate the cage mesh you created for the target mesh to ensure all your cage meshes have identical UVs. Remember you can change the geometry of your cage meshes, but not the UV mapping.

To create the inner and outer cages:

1. Duplicate your render mesh to use as the starting point for the inner cage.
   1. If you've already created your target cage mesh, make sure your layered cage's UVs match it.
2. Rename the duplicate with the `_InnerCage` suffix, such as `Layered-Mesh_InnerCage`.
3. Adjust the inner cage so it sits just inside the render surface.

   *(image in the full Top G Vault)*

4. Duplicate the `_InnerCage` and rename the copy with the `_OuterCage` suffix, such as `Layered-Mesh_OuterCage`.
5. Adjust the outer cage so it sits just outside the render surface and fully encloses it. The outer cage is the surface that additional layers wrap over.

   *(image in the full Top G Vault)*

6. Confirm both cages share the same UV layout as the target mesh, since Roblox pairs the layered mesh with the target by UV.
7. Confirm your Outliner shows the render mesh with both an `_InnerCage` and an `_OuterCage` beneath it, matching the following configuration.

   *(image in the full Top G Vault)*

### Layered accessories for avatars

Roblox avatar items, such as character bodies (target meshes) and Marketplace clothing (layered meshes), must all share a common cage to ensure universal compatibility with accessories and clothing. If you are creating avatars or layered accessories, **do not create your own cage meshes** — Roblox provides [[30 Official Roblox Docs/Avatar/Resources#Project files|downloadable cage templates]] you can modify. Alternatively, you can use Roblox's [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Setup tool]] to automatically generate a Roblox-supported cage for your accessories.

For more information on creating layered accessories, see the following resources:

- [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories|Layered accessories overview]]
- [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices|Layered accessory caging best practices]]

## Export and import

Before you export, apply the [[30 Official Roblox Docs/Art/Modeling/Export settings#Blender|correct export settings]] for Studio. When exporting `.fbx`, set **Apply Scalings** to **FBX Unit Scale** so your model keeps the same scale in Studio. For more information, see [[30 Official Roblox Docs/Art/Blender#Adjust scale (FBX)|Adjust scale (FBX)]].

1. Export the render mesh and its cages together as a single `.fbx` or `.gltf` file. Studio imports cages from both formats equally, so use whichever your modeling application exports most reliably.
2. Import the file with the [[30 Official Roblox Docs/Studio/Importer|3D Importer]] and make sure **Uses Cages** is enabled.
   1. If **Uses Cages** is not enabled by default, the 3D Importer may not be detecting your cage meshes. Double check the [[30 Official Roblox Docs/Art/Modeling/Cage Meshes/Create cages in Blender#Cage types|naming requirements]] and re-export.

   *(image in the full Top G Vault)*

3. After importing, confirm that Studio created the expected objects: a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] for an outer-cage-only mesh, or a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] for a mesh with both cages.

   *(image in the full Top G Vault)*

   *An outer-cage-only mesh imports with a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]].*

   *(image in the full Top G Vault)*

   *A mesh with both cages imports with a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]].*

4. Once you have both a target ([[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]]) and a deforming mesh ([[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]]), see [[30 Official Roblox Docs/Art/Modeling/Cage Meshes/Apply deformation|Apply deformation]] to reshape the mesh onto the target.

---
*Source: [Create cages in Blender](https://create.roblox.com/docs/art/modeling/cage-meshes/create-cages) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
