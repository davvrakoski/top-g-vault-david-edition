---
title: "DataModelMesh"
description: "The DataModelMesh is an abstract class from which mesh classes descend."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataModelMesh"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The DataModelMesh is an abstract class from which mesh classes descend.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/BevelMesh|BevelMesh]], [[30 Official Roblox Docs/API Reference/Classes/FileMesh|FileMesh]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

The DataModelMesh is an abstract class from which mesh classes descend.

Mesh classes are objects that, when parented to [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] alter the appearance of the part to that of a predefined mesh. Note, they only alter the appearance of the part and not the physics/collision boundaries of the part. Developers looking to apply a mesh to a part that alters the part's collision should use [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]].

Note the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh|CharacterMesh]] classes do not descend from DataModelMesh.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Offset\|Offset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The Offset of a mesh determines the relative position from the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position\|BasePart.Position]] of a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] that the mesh will be displayed at. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Scale\|Scale]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The Scale of a mesh determines the size of the mesh relative to its original dimensions. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#VertexColor\|VertexColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Changes the hue of a mesh's texture, used with [[30 Official Roblox Docs/API Reference/Classes/FileMesh#TextureId\|FileMesh.TextureId]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Offset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The Offset of a mesh determines the distance from the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]] of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that the mesh will be displayed.

#### How to use mesh offset

The Offset property changes the relative position the mesh will be rendered at. For example, an offset of 0, 5, 0 will cause the mesh to be displayed 5 studs above the position of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

The position of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] remains unchanged, meaning the physics collision box of the part will remain in the same location. This is demonstrated in the image below where the green outline (a [[30 Official Roblox Docs/API Reference/Classes/SelectionBox|SelectionBox]]) shows the extents of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

#### Other uses for mesh offset

There are a number of interesting uses for the mesh offset property.

- Offset and [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Scale|DataModelMesh.Scale]] can be animated using [[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService]] relatively inexpensively as the engine does not need to make any physics/collision calculations as the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is not moved.
- Changing the relationship between the mesh and its collision extents (determined by the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]])

*Code samples for this member (`Mesh-Offset-and-Scale`) are published on the source page; their code is not part of the open-source repo.*

### Scale

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The Scale of a mesh determines the size of the mesh relative to its original dimensions.

#### How to use mesh scale

The scale property works slightly differently depending on the type of mesh being used. Note the size of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] remains unchanged, meaning the physics collision box of the part will remain the same.

- [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] objects with [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh.FileType]] set to 'FileMesh' scale relative to the original dimensions of the mesh when it was uploaded to Roblox
- [[30 Official Roblox Docs/API Reference/Classes/BlockMesh|BlockMesh]] objects or [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] objects with [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh.FileType]] set to 'Brick', 'Wedge' or 'Sphere' scale uniformly relative to the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]] of their parent
- [[30 Official Roblox Docs/API Reference/Classes/CylinderMesh|CylinderMesh]] objects or [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] objects with [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh.FileType]] set to 'Cylinder' scale relative to the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]] of their parent. Uniformly for the cylinders height axis and maintaining a 1:1 ratio for the length and width of the cylinder, using the lowest value.
- [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] objects with [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh.FileType]] set to 'Head' currently scale in a non standard manner. Developers should not rely on this as there are plans to change this behavior.
- [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] objects with [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh.FileType]] set to 'Torso' scale in a non standard manner. Developers should not rely on this as there are plans to deprecate this mesh type.

#### Mesh scale demonstration

The above behavior can be seen in the following demonstration images.

Linear scaling relative to part size for 'Brick', 'Wedge' and 'Sphere' meshes.

Linear scaling relative to original uploaded mesh for 'FileMesh' meshes

Non-uniform constrained scaling for 'Cylinder' meshes

#### Other uses for mesh scale

There are a number of interesting uses for the mesh offset property.

- [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Offset|DataModelMesh.Offset]] and Scale can be animated using [[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService]] relatively inexpensively as the engine does not need to make any physics/collision calculations as the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is not changed.
- Changing the relationship between the mesh and its collision extents (determined by the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]])

*Code samples for this member (`Mesh-Offset-and-Scale`) are published on the source page; their code is not part of the open-source repo.*

### VertexColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

**VertexColor** determines the hue change of the [[30 Official Roblox Docs/API Reference/Classes/FileMesh#TextureId|Texture]] of a [[30 Official Roblox Docs/API Reference/Classes/FileMesh|FileMesh]]. Note that this property is a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] rather than a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]; to convert, use the [[30 Official Roblox Docs/API Reference/Datatypes/Color3#R|Color3.R]], [[30 Official Roblox Docs/API Reference/Datatypes/Color3#G|Color3.G]], and [[30 Official Roblox Docs/API Reference/Datatypes/Color3#B|Color3.B]] properties.

Although this property allows basic modification of a texture, changing a texture entirely provides more control. See [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] for more details.

---
*Source: [DataModelMesh](https://create.roblox.com/docs/reference/engine/classes/DataModelMesh) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
