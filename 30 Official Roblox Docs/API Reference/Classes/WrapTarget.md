---
title: "WrapTarget"
description: "The WrapTarget object defines a target. A target is the 3D body with only an outer surface, or an Outer Cage."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/WrapTarget"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The WrapTarget object defines a target. A target is the 3D body with only an outer surface, or an Outer Cage.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The WrapTarget object defines a target. A target is the 3D body with only an outer surface, or an Outer Cage.

This target, often an Avatar, is what 3D accessories (using WrapLayer) will be applied to, allowing multiple accessories items to naturally layer over the source target.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets color used for the debug rendering. See [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#DebugMode\|WrapTarget.DebugMode]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#DebugMode\|DebugMode]] | [[30 Official Roblox Docs/API Reference/Enums/WrapTargetDebugMode\|WrapTargetDebugMode]] | Allows switching between different debugging visualization modes for cage meshes. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#Stiffness\|Stiffness]] | float | **Deprecated.** Defines how much the body mesh can be compressed by clothing. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#CreateTextureInCageSpaceAsync\|CreateTextureInCageSpaceAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] in cage UV space from a texture in the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]'s UV space. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#CreateTextureInTargetSpaceAsync\|CreateTextureInTargetSpaceAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] in the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]'s UV space from a texture in cage UV space. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`, `NotScriptable`

Sets color used for the debug rendering. See [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#DebugMode|WrapTarget.DebugMode]]

### DebugMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/WrapTargetDebugMode|WrapTargetDebugMode]]

**Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`, `NotScriptable`

Allows switching between different debugging visualization modes for cage meshes.

### Stiffness

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance · **Tags:** `Deprecated`

Defines how much the body mesh can be compressed by clothing. Super tight clothing may lead to an intersection between the clothing mesh and body mesh. To solve this visual artifact, the deformer can compress the body mesh slightly to solve possible intersections.

Valid range is 0 to 1. A value of 0 will compress the body mesh as much as necessary to ensure that the intersections are eliminated (visible body parts might look a little bit deformed). A value of 1 will prevent the body mesh from being compressed (may lead to visible intersections or Z-fighting). A value of 0.9 (default) is a reasonable default that solves most of the intersections without introducing any significant body deformation.

## Methods

### CreateTextureInCageSpaceAsync

```lua
WrapTarget:CreateTextureInCageSpaceAsync(texture: EditableImage, options: Dictionary?): EditableImage
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, DynamicGeneration · **Tags:** `Yields`

Creates a new [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] by transferring `texture` from the UV space of this [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]]'s parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] into the UV space of the WrapTarget's cage. This method yields until the transfer is complete and does not modify the input image.

For example, after a player paints makeup onto a head mesh in an in-experience creation tool, use this method to transfer the texture into cage UV space before uploading it for use with [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]]. This method also supports cage-space texture transfers unrelated to makeup. To transfer a texture in the opposite direction, use [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#CreateTextureInTargetSpaceAsync|WrapTarget:CreateTextureInTargetSpaceAsync()]].

Use `options` to specify a region of cage UV space. Each supplied bound must be a finite [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]. If both bounds are supplied, `MaxUVBounds` must be greater than `MinUVBounds` on both axes. Unrecognized option keys raise an error.

This method requires the WrapTarget to be parented to a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] with valid mesh and cage data. It raises an error if the input or options are invalid, required mesh data cannot be loaded, or the transfer fails. If the device-specific editable memory budget is exhausted, it returns `nil`. See [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] for additional usage requirements.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `texture` | [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] |  | The [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] in the UV space of this [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]]'s parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]. |
| `options` | Dictionary? |  | Optional dictionary containing controls for the transfer:<br><br>- `MinUVBounds` – A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] specifying the minimum cage UV bound. - `MaxUVBounds` – A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] specifying the maximum cage UV bound.<br><br>Each omitted bound is calculated from the cage mesh. If neither is specified, the bounds include the entire cage. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] | A new [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] in cage UV space, or `nil` if the device-specific editable memory budget is exhausted. |

### CreateTextureInTargetSpaceAsync

```lua
WrapTarget:CreateTextureInTargetSpaceAsync(texture: EditableImage, wrapTextureTransfer: WrapTextureTransfer): EditableImage
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, DynamicGeneration · **Tags:** `Yields`

Creates a new [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] by transferring `texture` from cage UV space into the UV space of this [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]]'s parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. This method yields until the transfer is complete and does not modify the input image.

The `wrapTextureTransfer` supplies the optional reference cage through [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#ReferenceCageMeshContent|WrapTextureTransfer.ReferenceCageMeshContent]] and the cage UV bounds through [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#UVMinBound|WrapTextureTransfer.UVMinBound]] and [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer#UVMaxBound|WrapTextureTransfer.UVMaxBound]]. Use a WrapTextureTransfer under a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] on the same MeshPart as the WrapTarget.

For example, use this method to transfer a makeup texture you own into a head mesh's UV space so players can edit it directly on the head in an in-experience creation tool. This method also supports target-space texture transfers unrelated to makeup. To transfer the edited texture back into cage UV space, use [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#CreateTextureInCageSpaceAsync|WrapTarget:CreateTextureInCageSpaceAsync()]].

This method requires the WrapTarget to be parented to a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] with valid mesh and cage data. It raises an error if either input is invalid, required mesh data cannot be loaded, or the transfer fails. If the device-specific editable memory budget is exhausted, it returns `nil`. See [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] for additional usage requirements.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `texture` | [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] |  | The [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] in cage UV space. |
| `wrapTextureTransfer` | [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer\|WrapTextureTransfer]] |  | The [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer\|WrapTextureTransfer]] associated with the same parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] as this [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] | A new [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] in the parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]'s UV space, or `nil` if the device-specific editable memory budget is exhausted. |

---
*Source: [WrapTarget](https://create.roblox.com/docs/reference/engine/classes/WrapTarget) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
