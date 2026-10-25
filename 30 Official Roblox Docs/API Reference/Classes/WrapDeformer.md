---
title: "WrapDeformer"
description: "Allows for the real-time deformation of a `MeshPart`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/WrapDeformer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Allows for the real-time deformation of a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] object provides a low-resolution cage mesh that pairs with a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] sibling to deform a parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. The [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] geometry is deformed according to the displacement between pairs of [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] cage mesh vertices and [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] cage mesh vertices. Cage mesh vertices are paired based on UV equivalence.

[[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] may be used with avatars or on distinct [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]], as long as [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] children are present for the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]]. [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] is similar to [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] but doesn't require layered clothing and can directly deform [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] for publishing.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer#CreateEditableMeshAsync\|CreateEditableMeshAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] | Returns an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] (currently unskinned) equivalent to the deformed parent mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer#GetDeformedCFrameAsync\|GetDeformedCFrameAsync()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] deformed comparably to the [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer#SetCageMeshContent\|SetCageMeshContent()]] | () | Sets the cage mesh used to deform against a sibling [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]] cage mesh. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CreateEditableMeshAsync

```lua
WrapDeformer:CreateEditableMeshAsync(): EditableMesh
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`

Constructs and returns an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] corresponding to the deformed parent mesh geometry. This method respects all updates made to the deformation inputs prior to the request. It also sets the returned result's [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#FixedSize|FixedSize]] to `true`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] | An [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] matching the deformed parent mesh geometry, with its [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#FixedSize\|FixedSize]] set to `true`. |

### GetDeformedCFrameAsync

```lua
WrapDeformer:GetDeformedCFrameAsync(originalCFrame: CFrame): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] deformed by the same deformation field used for the geometry of the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. This method is useful for the placement of accessories.

The input and output [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] are both in the space of the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]; only position (not rotation) will be deformed. This method respects all updates made to the deformation inputs prior to the request.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `originalCFrame` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]], expressed in the local space of the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]], whose position is deformed. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | A [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] in the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] space with its position displaced by the same deformation field applied to the parent mesh; rotation is unchanged. |

### SetCageMeshContent

```lua
WrapDeformer:SetCageMeshContent(content: Content, cageOrigin: CFrame?): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

Sets the cage mesh used to deform the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] in conjunction with a sibling [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] cage mesh. The `content` parameter should represent a Roblox mesh asset ID or an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] reference in your [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `content` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |  | A Roblox mesh asset ID or an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] reference specifying the cage mesh to deform against the sibling [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]]. |
| `cageOrigin` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]? |  | An optional [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]], in the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] space, that sets the cage's [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#CageOrigin\|CageOrigin]]. When omitted, the existing [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#CageOrigin\|CageOrigin]] is left unchanged. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [WrapDeformer](https://create.roblox.com/docs/reference/engine/classes/WrapDeformer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
