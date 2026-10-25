---
title: "Reimport"
description: "Reimport allows you to update an existing custom mesh and textures without generating a new instance."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/reimport"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Reimport allows you to update an existing custom mesh and textures without generating a new instance.*

**Reimport** allows you to update existing custom models and their textures from an external 3D file. Unlike regular [[30 Official Roblox Docs/Studio/Importer#Import files|import]], which creates brand new instances, the reimport function updates existing objects non-destructively to help support the iterative nature of 3D development.

![](https://www.youtube.com/watch?v=HVUO3Dl7qT0)

Along with asset updates, reimport remembers the file and settings used to import the original asset. This means you can easily update an imported asset with a single click or hotkey without going through all the initial import settings. This memory persists across Studio sessions.

## Supported instances

Reimport supports the following entry points in the Explorer. Reimport also supports [packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md), allowing you to reimport batches of asset instances at once.

- [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] - The reimport feature scans the container, updating any changed [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] instances and adding newly created ones, while leaving your existing properties unchanged. Reimport replaces meshes based off of mesh names saved in Studio and the external 3D file (see [[30 Official Roblox Docs/Art/Modeling/Reimport#MeshPart detection|MeshPart detection]]). It replaces images for PBR textures based off of filenames (see [[30 Official Roblox Docs/Art/Modeling/Reimport#SurfaceAppearance detection|SurfaceAppearance detection]]).
- [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] or [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] (selected directly) - Reimport uploads all texture maps found in the same folder as the selected file in one operation.

> [!info]
> Reimport memory is local to your device. A Reimport ID is stored on the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] instance and referenced locally. Keep in mind the following:
>
> - Filepaths are never saved in the place file.
> - Reimport supports different reimport paths on different devices for the same instance.
> - Reimport supports copy-pasting, saving and loading from `.rbxm`/`.rbxl`, and [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) workflows.

### MeshPart detection

Reimport updates meshes based off of the path and name of the 3D source file, and the path and name of the mesh object in Studio. Reimport only updates the mesh content and transform properties and preserves other Roblox-specific properties, including [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|CollisionFidelity]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity|RenderFidelity]]. If the incoming mesh has no texture assigned, reimport keeps the existing [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] texture rather than clearing it.

Reimport relies on matching mesh names between the Studio and the 3D source file:

- If a mesh's `path/name` in the 3D source file **matches** a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] `path/name` in Studio, reimport updates the matching [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].
- If a mesh's `path/name` in the 3D source file **doesn't exist** as [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] `path/name` in Studio, reimport creates a new [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] within the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].
- If a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] `path/name` in Studio **doesn't exist** in the 3D source file, reimport does not modify the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] in Studio.

#### Known asset cache

Studio uses a **known asset cache** which helps detect duplicate imports in the same Studio session. If an imported or reimported asset is detected, Roblox reuses the existing asset ID instead of creating and uploading a new asset.

If you attempt to reimport a single mesh object, but the 3D file contains a larger number of meshes or textures, Roblox only applies a single asset upload for that object.

#### Duplicates

Reimport detects duplicate meshes, and doesn't reupload matching meshes that are the same in both Studio and the 3D source file. In the scenario where a mesh in Blender is renamed from `Mesh1` to `Mesh2`, reimport creates a new [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] named `Mesh2` and doesn't apply changes to the original `Mesh1`.

#### Pivot points

In cases where you may want to use the pivot point of the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and not the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], right-click any [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] with reimport information and select **Reimport** ⟩ **Reimport relative to this**. Doing so triggers a reimport for the entire model using the pivot point of right-clicked [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] as an anchor instead of the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] pivot point. You can use this for models that have custom pivots by reimporting relative to a mesh that has not changed position in the 3D file.

### SurfaceAppearance detection

Reimport can quickly batch update the textures of a model with [[30 Official Roblox Docs/Art/Modeling/PBR textures|PBR textures]] based off of the naming convention of the image files.

Reimport detects a set of known suffixes for color, metalness, normal, roughness, and emissive maps. You can find the full list of supported suffixes in the following table:

| Map Type | Suffixes | Example |
| --- | --- | --- |
| [[30 Official Roblox Docs/Art/Modeling/PBR textures#Color (albedo)\|Color]] | `color`, `col`, `diffuse`, `diff`, `albedo`, `alb`, `base` | `Tree_Color.png` |
| [[30 Official Roblox Docs/Art/Modeling/PBR textures#Metalness\|Metalness]] | `metal`, `metallic`, `metalness`, `mtl`, `met` | `Tree_Metal.png` |
| [[30 Official Roblox Docs/Art/Modeling/PBR textures#Roughness\|Roughness]] | `rough`, `roughness`, `rgh` | `Tree_Rough.png` |
| [[30 Official Roblox Docs/Art/Modeling/PBR textures#Normal\|Normal]] | `normal`, `nor`, `nrm`, `nrml`, `norm` | `Tree_Normal.png` |
| [[30 Official Roblox Docs/Art/Modeling/PBR textures#Emissive Mask\|Emissive Mask]] | `emissive`, `emission`, `emiss`, `emit`, `glow`, `illum`, `selfillum`, `light`, `luminance`, `emissivemask` | `Tree_Emissive.png` |

When reimporting an asset with a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] selected, a file dialog displays allowing you to select a new image file to use as a PBR texture. Reimport automatically detects other PBR images in the directory based off of naming and maps them to the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] object.

Texture files without a recognized material map suffix are accepted as the color map for [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] reimport.

## Reimport models

When you bring an asset into Studio through the [[30 Official Roblox Docs/Studio/Importer#Import files|importer]], reimport automatically stores the filepath, import preset, and upload inventory, so subsequent reimports require no manual setup.

To reimport a configured [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]:

1. Right-click the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] and select **Reimport** ⟩ **Reimport** from the context menu.

   - Alternatively, when selecting the object, use the reimport hotkey <kbd>Alt</kbd><kbd>Shift</kbd><kbd>R</kbd>.
   - A loading indicator appears after selecting reimport. If there are any issues, an error dialog displays with a **Configure Reimport Settings** button that opens the **Configure** dialog.

If a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] has no saved reimport configuration (for example, a model imported on a different device or before reimport was available), triggering **Reimport** opens the **Configure** dialog instead of starting the reimport. You can also open it directly at any time through **Reimport** ⟩ **Configure**. In this dialog, you can set the file path, upload target, and import presets.

> [!warning]
> Since reimport relies on matching mesh paths/names to update a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] from a 3D file, it’s important to maintain unique naming of meshes and their paths in your external 3D tools. In Studio, you should also maintain the naming/tree structure of the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects within your model in order for reimport to update correctly.

---
*Source: [Reimport](https://create.roblox.com/docs/art/modeling/reimport) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
