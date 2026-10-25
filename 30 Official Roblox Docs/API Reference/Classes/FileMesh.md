---
title: "FileMesh"
description: "The FileMesh object applies a mesh to a `BasePart` when parented to it. Its properties are inherited by the `SpecialMesh` object."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/FileMesh"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The FileMesh object applies a mesh to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] when parented to it. Its properties are inherited by the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] object.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh|DataModelMesh]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]]
- **Memory category:** BaseParts

## Description

The FileMesh object applies a textured mesh to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] when parented to it. Its properties are inherited by the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] object.

## What is a FileMesh?

FileMeshes allow user uploaded meshes to be applied to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. The mesh that is applied is dependent on the [[30 Official Roblox Docs/API Reference/Classes/FileMesh#MeshId|FileMesh.MeshId]] property. A texture can also be applied to this mesh using [[30 Official Roblox Docs/API Reference/Classes/FileMesh#TextureId|FileMesh.TextureId]].

Although it is not an abstract class, and can be used by developers, all [[30 Official Roblox Docs/API Reference/Classes/FileMesh|FileMesh]] properties are inherited by the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] object. A [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] behaves identically to the FileMesh object when its [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh#MeshType|SpecialMesh.MeshType]] is set to 'FileMesh'. Although both objects are functional, the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] object is the official supported class.

For more information on using meshes, please see the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] page.

*Code samples for this API (`FileMesh-Offset-and-Scale`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/FileMesh); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FileMesh#MeshContent\|MeshContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The mesh content applied to the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]], supporting asset URIs and [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/FileMesh#MeshId\|MeshId]] | ContentId | The MeshId is the content ID of the mesh that is to be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/FileMesh#TextureContent\|TextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The texture content applied to the mesh, supporting asset URIs and [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/FileMesh#TextureId\|TextureId]] | ContentId | The TextureId is the content ID of the texture that is to be applied to the mesh. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh|DataModelMesh]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### MeshContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The mesh content applied to the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. This property accepts [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] values including [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) and [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] objects.

MeshContent is the underlying storage for [[30 Official Roblox Docs/API Reference/Classes/FileMesh#MeshId|FileMesh.MeshId]]. Setting [[30 Official Roblox Docs/API Reference/Classes/FileMesh#MeshId|FileMesh.MeshId]] writes through to this property, and reading [[30 Official Roblox Docs/API Reference/Classes/FileMesh#MeshId|FileMesh.MeshId]] derives its value from this property. When MeshContent is set to [[30 Official Roblox Docs/API Reference/Datatypes/Content#none|Content.none]], no mesh is displayed.

This property is inherited by [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]].

### MeshId

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The MeshId is the content ID of the mesh that is to be displayed.

The content ID for a mesh is generated when a developer uploads a mesh to Roblox.

*Code samples for this member (`Mesh-VertexColor`) are published on the source page; their code is not part of the open-source repo.*

### TextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The texture content applied to the mesh. This property accepts [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] values including [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) and [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] objects.

TextureContent is the underlying storage for [[30 Official Roblox Docs/API Reference/Classes/FileMesh#TextureId|FileMesh.TextureId]]. Setting [[30 Official Roblox Docs/API Reference/Classes/FileMesh#TextureId|FileMesh.TextureId]] writes through to this property, and reading [[30 Official Roblox Docs/API Reference/Classes/FileMesh#TextureId|FileMesh.TextureId]] derives its value from this property. When TextureContent is set to [[30 Official Roblox Docs/API Reference/Datatypes/Content#none|Content.none]], no texture is applied to the mesh.

When TextureContent references an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]], the texture live-updates with any edits to that object.

This property is inherited by [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]].

### TextureId

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The TextureId is the content ID of the image that is to be applied to used for the meshes texture. When the TextureId property is set to an empty string, no texture will be applied to the mesh.

#### How can I change the texture of a mesh?

Using the TextureId property, the texture of a mesh can be changed without having to reupload the mesh. To do this, a new image will need to be uploaded to Roblox with the desired texture. The original texture image file can be obtained by exporting the mesh using the 'Export Selection' option in Roblox Studio. The image file will be saved alongside the exported .obj file.

The new texture can then be re-uploaded to Roblox as a Decal and its content ID can be applied to the mesh using the TextureId property.

#### How can I make a textured mesh?

A mesh can only be textured if the mesh has been UV mapped. UV mapping refers to the practice of projecting a texture map onto a mesh. This cannot be done using Roblox Studio and has to be done using an external 3D modelling application such as [Blender](https://www.blender.org/).

*Code samples for this member (`Mesh-VertexColor`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [FileMesh](https://create.roblox.com/docs/reference/engine/classes/FileMesh) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
