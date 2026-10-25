---
title: "SpecialMesh"
description: "The `SpecialMesh` object applies a mesh to a `BasePart` depending on the `MeshType` property."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SpecialMesh"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] object applies a mesh to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] depending on the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh#MeshType|MeshType]] property.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/FileMesh|FileMesh]] → [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh|DataModelMesh]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

The [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] object applies a mesh to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] depending on the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh#MeshType|MeshType]] property. A number of options are available.

- **Brick** - A block shape, equivalent to a [[30 Official Roblox Docs/API Reference/Classes/BlockMesh|BlockMesh]]
- **Cylinder** - A cylinder, identical to a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] with a [[30 Official Roblox Docs/API Reference/Classes/Part#Shape|Part.Shape]] of 'Cylinder'
- **FileMesh** - A user uploaded Mesh, equivalent to [[30 Official Roblox Docs/API Reference/Classes/FileMesh|FileMesh]] that a texture can be applied to using the [[30 Official Roblox Docs/API Reference/Classes/FileMesh#TextureId|FileMesh.TextureId]] property
- **Head** - A character head shape
- **Sphere** - A sphere shape, similar to a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] with a [[30 Official Roblox Docs/API Reference/Classes/Part#Shape|Part.Shape]] of 'Ball' but can be freely resized on all axis
- **Wedge** - A wedge shape, identical to a [[30 Official Roblox Docs/API Reference/Classes/WedgePart|WedgePart]]
- **Torso** - A block with sloped sides, due to be deprecated

Note, each [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh#MeshType|SpecialMesh.MeshType]] will scale differently when using [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Scale|DataModelMesh.Scale]], for more information on this please see the page on [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Scale|DataModelMesh.Scale]]. The SpecialMesh object also exposes the [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Offset|DataModelMesh.Offset]] property.

It is important to remember that when using a SpecialMesh, only the appearance of a part changes. The collision model of the part remains the same. For example, a character will not be able to walk correctly over a mesh as the mesh geometry is not taken into account.

#### SpecialMesh vs MeshPart

There are currently two ways of using a developer created mesh. They are using a SpecialMesh with the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh.FileType]] set to 'FileMesh', or by using a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. Although, on the whole, the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object has superseded the SpecialMesh there are some differences developers should be aware of.

- [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|BasePart.Material]] displays correctly on the mesh when using a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and not when using a SpecialMesh
- [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] include the [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|MeshPart.CollisionFidelity]] property, meaning the collision model of a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] can be set to resemble the geometry of the mesh. The SpecialMesh object by contrast, uses the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] collision model
- The mesh of a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] scales on all axis depending on the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|Size]] property of the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], the mesh of a SpecialMesh does not
- The SpecialMesh object includes the [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Offset|Offset]] and [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Scale|Scale]] properties whereas [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] do not
- The [[30 Official Roblox Docs/API Reference/Classes/FileMesh#MeshId|MeshId]] property of a [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] can be changed by a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] during runtime. The [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshId|MeshId]] property of a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] can not.

*Code samples for this API (`Mesh-Offset-and-Scale`, `Mesh-VertexColor`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/SpecialMesh); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh#MeshType\|MeshType]] | [[30 Official Roblox Docs/API Reference/Enums/MeshType\|MeshType]] | Determines the type of mesh that will be applied to the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh\|SpecialMesh]] is parented to. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/FileMesh|FileMesh]], [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh|DataModelMesh]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### MeshType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/MeshType|MeshType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The mesh that the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]]object applies to the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] depends on the MeshType property. A number of options are available.

- **Brick** - A block shape, equivalent to a [[30 Official Roblox Docs/API Reference/Classes/BlockMesh|BlockMesh]]
- **Cylinder** - A cylinder, identical to a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] with a [[30 Official Roblox Docs/API Reference/Classes/Part#Shape|Part.Shape]] of 'Cylinder'
- **FileMesh** - A user uploaded Mesh, equivalent to [[30 Official Roblox Docs/API Reference/Classes/FileMesh|FileMesh]] that a texture can be applied to using the [[30 Official Roblox Docs/API Reference/Classes/FileMesh#TextureId|FileMesh.TextureId]] property
- **Head** - A character head shape
- **Sphere** - A sphere shape, similar to a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] with a [[30 Official Roblox Docs/API Reference/Classes/Part#Shape|Part.Shape]] of 'Ball' but can be freely resized on all axis
- **Wedge** - A wedge shape, identical to a [[30 Official Roblox Docs/API Reference/Classes/WedgePart|WedgePart]]
- **Torso** - A block with sloped sides, due to be deprecated

Note, each MeshType will scale differently when using [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Scale|DataModelMesh.Scale]], for more information on this please see the page on [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Scale|DataModelMesh.Scale]].

*Code samples for this member (`Mesh-VertexColor`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [SpecialMesh](https://create.roblox.com/docs/reference/engine/classes/SpecialMesh) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
