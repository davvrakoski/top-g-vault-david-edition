---
title: "General specifications"
description: "Lists the specific technical requirements for custom models created outside of Studio."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/specifications"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Lists the specific technical requirements for custom models created outside of Studio.*

Roblox supports a wide variety of mesh configurations created from third-party software such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview).

Check that your model meets the following modeling specifications and guidelines before exporting to ensure Studio compatibility. Specific types of assets, like characters and accessories, have additional specifications:

> [!warning] If creating other types of 3D models:
> - For rigid accessories, see [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications|accessory specifications]] and [[30 Official Roblox Docs/Avatar/Rigid Accessories/Export rigid accessories|accessory export settings]].
> - For layered accessories, see [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory specifications]] and [[30 Official Roblox Docs/Avatar/Layered Accessories/Export layered accessories|layered export settings]].
> - For avatar characters, see [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|avatar specifications]] and [[30 Official Roblox Docs/Avatar/Character Bodies/Export character bodies|avatar export settings]].

When ready to export, see the [[30 Official Roblox Docs/Art/Modeling/Export settings|export settings]] for mesh export settings for Blender and Maya.

> [!info]
> If you meet certain account requirements, you can sell your custom meshes as accessories on the Marketplace. See [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories|Rigid accessories]] for an overview on the creation process for these types of accessories.

## Geometry

See the following specifications for general geometry:

- **Budgets** - Individual meshes can not exceed 20,000 triangles. Avatar items have their own individual budget requirements for [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character bodies]], [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications|rigid accessories]], and [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessories]].
- **Watertight** - All geometry must be watertight without exposed holes or backfaces.
- **No N-gons** - Meshes must be in quads where possible.
- **Volume** - Meshes cannot be 0 thickness and must have some volume.

## Rigging and skinning

Roblox supports third-party meshes with an internal rig, or skeleton structure that can be used as additional articulation points in your model. For more information on the specific standards for R15 rigs, see [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|Character body specifications - Rigging]].

*(image in the full Top G Vault)*

*Generic rig model.*

*(image in the full Top G Vault)*

*Generic rig bone structure (Blender).*

See the following requirements for general rigging and skinning:

- **Transformations** - All bones (Blender) or joints (Maya) must be frozen and have scale values set to `1`, `1`, `1` and rotation values set to `0`, `0`, `0`.
- **Symmetry** - When possible, maintain symmetry when applying influences to a rig
- **Root joint** - The root bone or joint should always be set to `0`, `0`, `0`.
- **Max influences** - A vertex can not be influenced by more than 4 bones or joints.
- **No Root influences** - Do not apply influences to the Root bone or joint.

## Textures

- Roblox supports basic color textures and modern [[30 Official Roblox Docs/Art/Modeling/PBR textures|PBR textures]].
- For instructions on assigning texture images to natively import with your mesh, see [[30 Official Roblox Docs/Art/Modeling/Blender and Maya texture settings|Assign textures in modeling tools]].
- For technical requirements and best practices when generating individual texture images, see [[30 Official Roblox Docs/Art/Modeling/Texture specifications|Texture specifications]].

## Animations

An animation can be included on any `.fbx` mesh export. For information on prepping a character animation from a modeling software for export, see [[30 Official Roblox Docs/Art/Characters/Export avatar animations from Maya|Export animations from Maya]].

See the following requirements for assets with animation:

- **Single track animation** - Only a single animation track can be exported with a mesh or model. If you want to export multiple animations, you need to create separate exports for each animation you want to import.

## Inner and outer cages

Inner and Outer cages are non-rendered meshes that Roblox uses to define the inner and outer surfaces of a mesh using a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] or [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] instance. These cages are most often used with characters and accessories, though you can use cage meshes for any mesh object.

> [!warning]
> Character models must include an outer cage in order to properly equip layered accessories. For more information, see [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|Character body specifications]].

For general use, see the following requirements for adding inner and outer cage meshes to your model:

- **Naming conventions** - The inner and outer cage must be named after the primary mesh object with **\_InnerCage** and **\_OuterCage** affixed.

   *(image in the full Top G Vault)*

- **Outer cage** - Models, such as a playable character, that aren't expected to deform but are the target of meshes that will stretch over it, only require an outer cage.
  - For more information on applying and implementing cages on non-Humanoid targets, see [[30 Official Roblox Docs/Characters/Character appearance#Layered accessories on non-R15|layered accessories on non-R15]].
- **Vertices and UV map** - Don't delete vertices or alter the UVs on the Inner or Outer Cages as this can cause errors when importing in Studio or when equipping onto a character.
- **Symmetry and consistency** - Keep each face (the space between vertices) consistently sized and retain symmetry wherever possible. Use symmetry tools in your modeling software whenever possible.

---
*Source: [General specifications](https://create.roblox.com/docs/art/modeling/specifications) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
