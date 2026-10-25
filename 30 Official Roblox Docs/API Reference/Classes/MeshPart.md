---
title: "MeshPart"
description: "A form of `BasePart` that includes a physically simulated custom mesh."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MeshPart"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A form of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that includes a physically simulated custom mesh.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart|TriangleMeshPart]] → [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

[[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] is a form of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that includes a physically simulated custom mesh. Unlike with other mesh classes, such as [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] and [[30 Official Roblox Docs/API Reference/Classes/BlockMesh|BlockMesh]], they are not parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] but rather behave as a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] in their own right.

The mesh and texture of a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] are determined by the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshId|MeshId]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]] properties. For more information, see [[30 Official Roblox Docs/Parts/Meshes|Meshes]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart#DoubleSided\|DoubleSided]] | boolean | Determines whether to render both faces of polygons in the mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart#HasJointOffset\|HasJointOffset]] | boolean | **Deprecated.** Deprecated legacy flag associated with the part's [[30 Official Roblox Docs/API Reference/Classes/MeshPart#JointOffset\|JointOffset]]. |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart#HasSkinnedMesh\|HasSkinnedMesh]] | boolean | Indicates whether the mesh currently applied to the [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] contains skinning (bone and joint) data. |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart#JointOffset\|JointOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Deprecated. An offset once used to position a skinned mesh's joints. |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent\|MeshContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The mesh that is displayed on the [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) and [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshId\|MeshId]] | ContentId | The [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) of the mesh that is displayed on the [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]. Reads and writes to [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent\|MeshContent]]. |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity\|RenderFidelity]] | [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity\|RenderFidelity]] | The level of detail used to render the [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]. |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent\|TextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The texture applied to the [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) and [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID\|TextureID]] | ContentId | The texture applied to the [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]. Reads and writes to [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent\|TextureContent]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart#ApplyMesh\|ApplyMesh()]] | () | Overwrites the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent\|MeshContent]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent\|TextureContent]], and collision geometry properties of this [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] from the given source `meshPart`. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart|TriangleMeshPart]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### DoubleSided

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property determines whether to render both faces of polygons in the mesh. This is useful for meshes that are typically modeled as "cards" such as a leaf, hair, or cloth.

### HasJointOffset

> [!warning] Deprecated
> This property is deprecated and should not be used in new work.

**Type:** boolean

**Security:** read None / write NotAccessibleSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `Hidden`, `Deprecated`

Deprecated legacy property associated with a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]'s internal [[30 Official Roblox Docs/API Reference/Classes/MeshPart#JointOffset|JointOffset]]. It is managed by the engine and cannot be set by scripts. Do not use it in new work.

### HasSkinnedMesh

**Type:** boolean

**Security:** read None / write NotAccessibleSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `Hidden`

Indicates whether the mesh currently applied to the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] contains skinning (bone and joint) data, such as a mesh authored with an armature for skeletal deformation.

Defaults to `false`. The engine sets this automatically when a mesh is loaded (`true` when the mesh data includes joints), so scripts cannot set it.

### JointOffset

> [!warning] Deprecated
> This property is deprecated and should not be used in new work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Security:** read None / write NotAccessibleSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `Hidden`, `Deprecated`

Deprecated. A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] offset once used to position a skinned mesh's joints. Defaults to `0, 0, 0` and is reset whenever a new mesh is applied to the part. Cannot be set by scripts; do not use it in new work.

### MeshContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read None / write NotAccessibleSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The mesh that is displayed on the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) and [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] objects.

Note that this property cannot be changed directly by scripts, as the collision geometry of the mesh cannot be recomputed in real time. See [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateMeshPartAsync|AssetService:CreateMeshPartAsync()]] as a method to create a new [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] from a given [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] with a specified [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|CollisionFidelity]]. [[30 Official Roblox Docs/API Reference/Classes/MeshPart#ApplyMesh|MeshPart:ApplyMesh()]] can be used to overwrite the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent|MeshContent]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|TextureContent]], and collision geometry of an existing [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].

### MeshId

**Type:** ContentId

**Security:** read None / write NotAccessibleSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) of the mesh that is displayed on the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. Reads and writes to [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent|MeshContent]].

Note that this property cannot be changed directly by scripts, as the collision geometry of the mesh cannot be recomputed in real time. See [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateMeshPartAsync|AssetService:CreateMeshPartAsync()]] as a method to create a new [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] from a given [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] with a specified [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|CollisionFidelity]]. [[30 Official Roblox Docs/API Reference/Classes/MeshPart#ApplyMesh|MeshPart:ApplyMesh()]] can be used to overwrite the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent|MeshContent]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|TextureContent]], and collision geometry of an existing [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].

### RenderFidelity

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|RenderFidelity]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `NotReplicated`

This property determines the level of detail that the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] will be shown in. It can be set to the possible values of the [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|Enum.RenderFidelity]] enum.

The default value is [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|Automatic]], meaning the mesh's detail is based on its distance from the camera as outlined in the following table.

| Distance From Camera | Render Fidelity | Example |
| --- | --- | --- |
| Less than 250 studs | Highest | *(image in the full Top G Vault)* |
| 250-500 studs | Medium | *(image in the full Top G Vault)* |
| 500 or more studs | Lowest | *(image in the full Top G Vault)* |

### TextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The texture applied to the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) and [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] objects.

When this property is set to [[30 Official Roblox Docs/API Reference/Datatypes/Content#none|Content.none]], no texture will be applied to the mesh.

```
local Workspace = game:GetService("Workspace")

local meshPart = Workspace.MeshPart
meshPart.TextureContent = Content.none  -- No texture
```

Note that the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent|MeshContent]] property cannot be directly changed during runtime but the texture can.

##### Changing a Mesh Texture

Using the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|TextureContent]] property, the texture of a mesh can be changed without having to re-upload the mesh. To do this, a new image can be uploaded to Roblox with the desired texture. The original texture image file can be obtained by exporting the mesh using the **Export Selection** option in Studio. The image file will be saved alongside the exported `.obj` file.

The new texture can then be uploaded to Roblox as a decal and its [asset URI](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) can be applied to the mesh using the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|TextureContent]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]] property.

[[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|TextureContent]] can also be set to reference an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] that has not been published yet.

```
local AssetService = game:GetService("AssetService")
local Workspace = game:GetService("Workspace")

local meshPart = Workspace.MeshPart

local editableImage = AssetService:CreateEditableImageAsync(meshPart.TextureContent)
meshPart.TextureContent = Content.fromObject(editableImage)  -- Live updates
```

When [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|TextureContent]] references an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]], the texture will live update with any edits to the [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] object.

##### Making a Textured Mesh

A mesh can only be textured if the mesh has been UV mapped, referring to the practice of projecting a texture map onto a mesh. This cannot be done using Roblox Studio and must be done using an external 3D modeling application such as [Blender](https://www.blender.org/).

### TextureID

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The texture applied to the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. Reads and writes to [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|TextureContent]].

When this property is set to an empty string, no texture will be applied to the mesh.

```
local Workspace = game:GetService("Workspace")

local meshPart = Workspace.MeshPart
meshPart.TextureID = ""  -- No texture
```

Note that the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshId|MeshPart.MeshId]] property cannot be changed during runtime but the texture can. See [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|TextureContent]] for details.

## Methods

### ApplyMesh

```lua
MeshPart:ApplyMesh(meshPart: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Overwrites the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent|MeshContent]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|TextureContent]], and collision geometry properties of this [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] from the given source `meshPart`.

Most of these properties are read-only and cannot be changed during runtime on their own directly. To keep [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent|MeshContent]] and physics data in sync, they must be updated together.

Copies the following properties:

- [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent|MeshPart.MeshContent]] (implicitly updates [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshId|MeshId]])
- [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent|MeshPart.TextureContent]] (implicitly updates [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]])
- [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity|MeshPart.RenderFidelity]]
- [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|MeshPart.CollisionFidelity]] (with any internal collision geometry)
- [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#FluidFidelity|MeshPart.FluidFidelity]] (with any internal aero geometry)
- [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#MeshSize|MeshPart.MeshSize]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `meshPart` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The source [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] whose [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshContent\|MeshContent]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureContent\|TextureContent]], and collision geometry (along with [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity\|RenderFidelity]], [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity\|CollisionFidelity]], [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#FluidFidelity\|FluidFidelity]], and [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#MeshSize\|MeshSize]]) are copied onto this part. The object must be a [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]], otherwise the call throws an error. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [MeshPart](https://create.roblox.com/docs/reference/engine/classes/MeshPart) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
