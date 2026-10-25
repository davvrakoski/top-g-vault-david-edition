---
title: "WrapTextureTransfer"
description: "`WrapTextureTransfer` allows a parent `Decal` to be wrapped around its parent `MeshPart` based on the cage of its `WrapTarget`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/WrapTextureTransfer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*[[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]] allows a parent [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] to be wrapped around its parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] based on the cage of its [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

WrapTextureTransfer provides an alternative projection mode for [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] where this [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] is fit to the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] based on it's CageMesh provided in [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]].

This is useful as it allows fitting of Decals to a wide variety of differently shaped MeshParts that share a similar WrapTarget CageMesh topology. By authoring textures that are in the WrapTarget UV space, these textures can be reused across many different MeshParts with different texture layouts.

- DataModel Structure
  - [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]
    - [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]]
    - [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]]
      - [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]]

A way to visualize how this works is to imagine the Decals textures on the WrapTarget CageMesh, which is wrapped around the MeshPart. These textures are then projected from the CageMesh onto the MeshPart surface. Geometry that is internal to the MeshPart, or that is not covered by the CageMesh, will not receive any projected decal textures. Segmented regions of the target [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] are used to improve projection quality near holes or boundaries in the CageMesh.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#ReferenceCageMeshContent\|ReferenceCageMeshContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | An optional reference mesh used for pruning and validating the target cage. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#UVMaxBound\|UVMaxBound]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Determines the maximum bound of the UV space to include in the transfer. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#UVMinBound\|UVMinBound]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Determines the minimum bound of the UV space to include in the transfer. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#PrepareProjectionMeshDataAsync\|PrepareProjectionMeshDataAsync()]] | () | Prepares and caches projection data for using this [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer\|WrapTextureTransfer]] with projected [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] operations. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ReferenceCageMeshContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The reference cage mesh is the cage mesh that the texture was authored for. This target cage mesh defined in [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] is pruned against this `ReferenceCageMeshContent`. If the target cage mesh contains vertices or faces that are not present in the reference cage mesh, these vertices and faces are removed from the target cage mesh before performing the texture transfer. If there are no shared UVs between `ReferenceCageMeshContent` and cage mesh defined in [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]], the texture transfer fails.

When not defined, the cage in [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] in ancestor [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] is used for transfer without any pruning or validation.

### UVMaxBound

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Determines the maximum bound of the UV space to include in the transfer. Areas of the cage mesh with UV values greater than the maximum bound aren't included when applying the texture.

The Decal textures apply to the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] with the textures scaling linearly between UVMinBound and UVMaxBound.

When set to default -inf, the maximum UV value is used from WrapTarget's cage.

### UVMinBound

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Determines the minimum bound of the UV space to include in the transfer. Areas of the cage mesh with UV values smaller than the minimum bound aren't included when applying the texture.

The Decal textures apply to the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] with the textures scaling linearly between UVMinBound and UVMaxBound.

When set to default inf, uses the minimum UV value from WrapTarget's cage.

## Methods

### PrepareProjectionMeshDataAsync

```lua
WrapTextureTransfer:PrepareProjectionMeshDataAsync(): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, DynamicGeneration · **Tags:** `Yields`

Prepares this [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]] for use as the `projectionSource` in [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImageProjected|EditableImage:DrawImageProjected()]] and [[30 Official Roblox Docs/API Reference/Classes/EditableImage#SampleImageProjected|EditableImage:SampleImageProjected()]]. This method takes no parameters, yields until preparation completes, and returns no value.

This allows projected texture editing, such as painting makeup on a player's current head, without creating an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] from the target asset or requiring permission to create one. The prepared data is cached internally; it is not returned to scripts and cannot be inspected, converted to [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]], or published.

The [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]] must be parented to a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] whose parent is a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] with mesh content and a valid [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] child. This hierarchy must be in the data model. Configure [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#ReferenceCageMeshContent|WrapTextureTransfer.ReferenceCageMeshContent]], [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#UVMinBound|WrapTextureTransfer.UVMinBound]], and [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#UVMaxBound|WrapTextureTransfer.UVMaxBound]] as needed before calling this method.

The prepared data combines the target mesh's positions, normals, and triangle connectivity within the region covered by the transfer with the transferred UVs computed from the current cage configuration and UV bounds. The geometry is scaled to match the target [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]'s current [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]]. Projection positions and directions use the target MeshPart's local space.

Preparation is reused across projected image operations while the data remains valid. Changes to the target mesh or its size, cage configuration, UV bounds, or hierarchy invalidate the cached data. Call this method again after such a change. Both projection methods raise an error if preparation has not completed successfully or the cached data has been invalidated. Passing an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] to those methods does not require this preparation.

Use `pcall()` to handle preparation errors, including invalid hierarchy, unavailable mesh or cage data, failed UV transfer, or inputs changing during preparation. Only perform projected image operations after the call succeeds.

For example, with the head, decal, images, reference cage content, UV bounds, and brush configurations already defined:

```lua
local projectionTransfer = Instance.new("WrapTextureTransfer")
projectionTransfer.ReferenceCageMeshContent = referenceCageContent
projectionTransfer.UVMinBound = makeupUVMin
projectionTransfer.UVMaxBound = makeupUVMax
projectionTransfer.Parent = makeupDecal
makeupDecal.Parent = playerHead

local success, errorMessage = pcall(function()
    projectionTransfer:PrepareProjectionMeshDataAsync()
end)

if not success then
    warn("Failed to prepare makeup projection: " .. tostring(errorMessage))
    return
end

makeupTexture:DrawImageProjected(projectionTransfer, projection, brushConfig)
sampledBrush:SampleImageProjected(
    projectionTransfer,
    makeupTexture,
    projection,
    sampleBrushConfig
)
```

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [WrapTextureTransfer](https://create.roblox.com/docs/reference/engine/classes/WrapTextureTransfer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
