---
title: "Apply deformation"
description: "Deform a caged mesh onto a target shape with a WrapLayer, the basis of layered accessories."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/cage-meshes/apply-deformation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Deform a caged mesh onto a target shape with a WrapLayer, the basis of layered accessories.*

Once a target caged mesh and a layered caged mesh are imported into your experience, you can apply a deformation by parenting both [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] within a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] and adding a [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]].

*(image in the full Top G Vault)*

## Deform a mesh

Download the reference files to follow along. The Blender project contains every shape, and each `.fbx` imports as a ready-made target or layered mesh with its cages.

| **File** | **Description** |
| --- | --- |
| [Cage-Mesh-Examples.blend](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/Cage-Mesh-Examples.blend) | A Blender project containing every target and layered mesh in this guide, with their cages. |
| [Cube_Target.fbx](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/Cube_Target.fbx) | A cube target, ready to import as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]]. |
| [Sphere_Target.fbx](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/Sphere_Target.fbx) | A sphere target, ready to import as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]]. |
| [Cube-Flattened_Target.fbx](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/Cube-Flattened_Target.fbx) | A flattened cube target, ready to import as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]]. |
| [Layered-Mesh1.fbx](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/Layered-Mesh1.fbx) | A layered mesh with inner and outer cages, ready to import as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer\|WrapLayer]]. |
| [Layered-Mesh2.fbx](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/Layered-Mesh2.fbx) | A second layered mesh, ready to import as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer\|WrapLayer]]. |

1. Ensure that your workspace includes two 3D objects: a target [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and a layered [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].
   1. Confirm the target has a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] and the deforming mesh has a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]].

      *(image in the full Top G Vault)*

      *Target: a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]]*

      *(image in the full Top G Vault)*

      *Deforming mesh: a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]]*

   2. (Optional) If testing or applying multiple deformations, make a copy of your layered mesh to ensure you have an original copy later.

2. In the Explorer, parent both target and layered [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] in one [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

   *(image in the full Top G Vault)*

3. Add a [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] to the layered [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], then:
   1. Set `Part0` to the layered mesh.
   2. Set `Part1` to the target mesh.

   *(image in the full Top G Vault)*

4. In the Properties window, change [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Order|WrapLayer.Order]] from the default value to another number, such as `2` or `5`.
   1. Changing this property triggers the deformation in the 3D workspace so the layered mesh reshapes to match the shape of the target.
   2. If the order is incorrect with other layers, such as a T-shirt wrapping over a sweater, you can change this property at any time.

   *(image in the full Top G Vault)*

5. (Optional) The deformation is retained after it computes, so you can delete the duplicated layered mesh and the [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] and reset [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Order|WrapLayer.Order]], leaving a single deformed mesh. This is useful to simplify your workspace when applying multiple deformations.

   *(image in the full Top G Vault)*

6. Experiment further. Try deforming the reference layered meshes onto the other target shapes, or [[30 Official Roblox Docs/Art/Modeling/Cage Meshes/Apply deformation#Deform multiple meshes to a single target|deform multiple meshes onto a single target]].

## Deform multiple meshes to a single target

You can continue to add layered meshes to a target by repeating the process of adding a layered mesh and a weld. Every time a layered mesh is added to a target, Roblox recalculates the surface of the mesh, allowing you to continually add to your target mesh.

> [!warning]
> Every mesh you layer onto a target must share the same UV layout as the target. Roblox pairs each layer to the target by UV, so mismatched UVs won't deform correctly.

1. With your existing deformed mesh in the workspace, add a new layered [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] into your [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

   *(image in the full Top G Vault)*

2. Add a [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] to the new layered [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], then:
   1. Set `Part0` to the original layered mesh.
   2. Set `Part1` to the new layered mesh.

   *(image in the full Top G Vault)*

3. Change [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Order|WrapLayer.Order]] in the Properties window. Changing this property triggers the deformation, and the mesh reshapes to match the target. Each layer's [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Order|WrapLayer.Order]] determines which one renders on top.

   *(image in the full Top G Vault)*

   *The first layer's [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Order|WrapLayer.Order]] is `1` and the second layer's is `2`, so the second layer renders on top.*

   *(image in the full Top G Vault)*

   *Updating the first layer's [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Order|WrapLayer.Order]] to `2`, and setting the second layer to `1`, brings the first layer on top.*

## Deform an accessory on an avatar

All Roblox avatars share the same standard body cage. Because cages pair by UV, an accessory caged to that shared layout fits every avatar body. Note that the example meshes in this guide use their own cages, so they aren't compatible with Roblox's standard body cage.

*(image in the full Top G Vault)*

*Head and Upper Torso cage mesh objects (wireframe)*

*(image in the full Top G Vault)*

*Cage objects must exist for each of the 15 body parts*

When creating avatar characters and avatar accessories, a similar process of layering applies to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] character's body cages, and the layered accessory pipeline composes the layered mesh automatically. This allows fitting across body types and transferring skinning data through [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#AutoSkin|WrapLayer.AutoSkin]].

> [!warning]
> If you are creating your own custom non-Marketplace characters that utilize a unique cage / UV solution, see [[30 Official Roblox Docs/Characters/Character appearance#Layered accessories on non-R15|Layered accessories on non-R15]].

For an overview of creating your first layered accessory, see the following video:

![](https://www.youtube.com/watch?v=C-DwGRBHvmE)

For the full avatar workflow, see [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories|Layered accessories]], the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]], and [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer|Automatic Skinning Transfer]].

---
*Source: [Apply deformation](https://create.roblox.com/docs/art/modeling/cage-meshes/apply-deformation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
