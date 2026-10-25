---
title: "Model"
description: "Models are container objects, meaning they group objects together. They are best used to hold collections of `BaseParts` and have a number of functions that extend their functionality."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Model"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Models are container objects, meaning they group objects together. They are best used to hold collections of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and have a number of functions that extend their functionality.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]], [[30 Official Roblox Docs/API Reference/Classes/BackpackItem|BackpackItem]], [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel|ProceduralModel]], [[30 Official Roblox Docs/API Reference/Classes/Status|Status]], [[30 Official Roblox Docs/API Reference/Classes/WorldRoot|WorldRoot]]
- **Memory category:** BaseParts

## Description

Models are container objects, meaning they group objects together. They are best used to hold collections of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and have a number of functions that extend their functionality.

Models are intended to represent **geometric** groupings. If your grouping has no geometric interpretation, for instance a collection of [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]], use a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] instead.

Models whose constituent parts are joined together with joints (so that they can move around or be destroyed via physics simulation) usually have a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] set, as it specifies which part within the model the pivot and bounding box will "follow" as the model moves. Static models which stay in one place do not benefit from having a primary part set.

Models have a wide range of applications, including Roblox player characters. They also have a number of unique behaviors that are important to keep in mind:

- When a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] and a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] named **Head** are parented under a model, a name/health GUI will appear over the model; see [[30 Official Roblox Docs/Characters/Character name-health display|Character Name/Health Display]] for details.
- If a part's position on the **Y** axis hits the [[30 Official Roblox Docs/API Reference/Classes/Workspace#FallenPartsDestroyHeight|Workspace.FallenPartsDestroyHeight]] value, and it was the last object inside of a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], the model will be destroyed as well.
- When used in a place with [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]] set to true, the value of [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] controls various behaviors around how the model and any descendants are replicated and/or removed from clients. In addition, the value of [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail|LevelOfDetail]] impacts rendering of the model.

As with all [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] types, the fact that a parent [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] is replicated to a client does not guarantee that all its children are replicated. This is particularly important if these instances are being accessed by code running on the client, such as in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]. Using [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] with values such as [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Atomic]] can ensure that the entire model and all of its descendants are present if the parent model exists on the client, or you can use [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] when atomicity is not desired.

*Code samples for this API (`Model-Instantiation`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Model); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail\|LevelOfDetail]] | [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail\|ModelLevelOfDetail]] | Sets the level of detail on the model for experiences with instance streaming enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode\|ModelStreamingMode]] | [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode\|ModelStreamingMode]] | Controls the model streaming behavior on [[30 Official Roblox Docs/API Reference/Classes/Model\|Models]] when instance streaming is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The primary part of the [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]], or `nil` if not explicitly set. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#Scale\|Scale]] | float | Editor-only property used to scale the model around its pivot. Setting this property will move the scale as though [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo\|Model:ScaleTo()]] was called on it. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#WorldPivot\|WorldPivot]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Determines where the pivot of a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] which does **not** have a set [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|Model.PrimaryPart]] is located. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Model#AddPersistentPlayer\|AddPersistentPlayer()]] | () | Sets this model to be persistent for the specified player. [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode\|ModelStreamingMode]] must be set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode\|PersistentPerPlayer]] for behavior to be changed as a result of addition. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#BreakJoints\|BreakJoints()]] | () | **Deprecated.** Breaks connections between `BaseParts`, including surface connections with any adjacent parts, [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint\|WeldConstraints]] and all [[30 Official Roblox Docs/API Reference/Classes/Weld\|Welds]] and other [[30 Official Roblox Docs/API Reference/Classes/JointInstance\|JointInstances]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#breakJoints\|breakJoints()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Model#GetBoundingBox\|GetBoundingBox()]] | Tuple | Returns a description of a volume that contains all parts of a Model. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#GetExtentsSize\|GetExtentsSize()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the size of the smallest bounding box that contains all of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] in the [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]], aligned with the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|Model.PrimaryPart]] if it is set. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#GetModelCFrame\|GetModelCFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | **Deprecated.** This value historically returned the CFrame of a central position in the model. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#GetModelSize\|GetModelSize()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Returns the Vector3 size of the Model. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#GetPersistentPlayers\|GetPersistentPlayers()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> | Returns all the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] objects that this model object is persistent for. Behavior varies based on whether this method is called from a [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]] or a [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#GetPrimaryPartCFrame\|GetPrimaryPartCFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | **Deprecated.** Returns the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the model's [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|Model.PrimaryPart]]. This function will throw an error if no primary part exists for the [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#GetScale\|GetScale()]] | float | Returns the canonical scale of the model, which defaults to 1 for newly created models and will change as it is scaled via [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo\|Model:ScaleTo()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#MakeJoints\|MakeJoints()]] | () | **Deprecated.** Goes through all [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] in the [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. If any part's side has a SurfaceType that can make a joint it will create a joint with any adjacent parts. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#makeJoints\|makeJoints()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Model#move\|move()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Model#MoveTo\|MoveTo()]] | () | Moves the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]] to the given position. If a primary part has not been specified, the root part of the model will be used. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#moveTo\|moveTo()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Model#RemovePersistentPlayer\|RemovePersistentPlayer()]] | () | Makes this model no longer persistent for the specified player. [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode\|ModelStreamingMode]] must be set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode\|PersistentPerPlayer]] for behavior to be changed as a result of removal. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#ResetOrientationToIdentity\|ResetOrientationToIdentity()]] | () | **Deprecated.** Resets the rotation of the model's parts to the previously set identity rotation, which is done through the [[30 Official Roblox Docs/API Reference/Classes/Model#SetIdentityOrientation\|Model:SetIdentityOrientation()]] method. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo\|ScaleTo()]] | () | Sets the scale factor of the model, adjusting the sizing and location of all descendant Instances such that they have that scale factor relative to their initial sizes and locations when scale factor was 1. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#SetIdentityOrientation\|SetIdentityOrientation()]] | () | **Deprecated.** Sets the identity rotation of the given model, allowing you to reset the rotation of the entire model later, through the use of the `ResetOrientationToIdentity` method. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#SetPrimaryPartCFrame\|SetPrimaryPartCFrame()]] | () | **Deprecated.** Sets the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame\|BasePart.CFrame]] of the model's [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|Model.PrimaryPart]]. All other parts in the model will also be moved and will maintain their orientation and offset respective to the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|Model.PrimaryPart]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#TranslateBy\|TranslateBy()]] | () | Shifts a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] by the given [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] offset, preserving the model's orientation. If another [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] already exists at the new position then the [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] will overlap said object. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### LevelOfDetail

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|ModelLevelOfDetail]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** PluginOrOpenCloud

Sets the level of detail on the model for experiences with instance [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|streaming]] enabled. Composite or imposter meshes do not support physics, collision detection, or raycasting.

When set to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|StreamingMesh]], a lower resolution "imposter" mesh (colored, coarse mesh that wraps around all child parts of the model) renders outside the streaming radius. Does not support textures.

When set to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|SLIM]], a **SLIM** model (Scalable Lightweight Interactive Model) renders a composite of all child parts at progressively lower resolutions at distances based on the streaming radius. This greatly improves visual quality over [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|StreamingMesh]].

When set to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|Disabled]] or [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|Automatic]], lower resolution meshes will not be displayed.

### ModelStreamingMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|ModelStreamingMode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true

Controls how [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] are streamed in and out when instance [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|streaming]] is enabled. Behavior depends on the selected enum. Has no effect when streaming is not enabled.

This property should only be changed in Studio via the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window when streaming is enabled, or in [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]], but never in [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] (doing so can result in undefined behavior).

### PrimaryPart

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Pivot · **Loaded/Saved:** true/true

Points to the primary part of the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. The primary part is the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that acts as the physical reference for the pivot of the model. That is, when parts within the model are moved due to physical simulation or other means, the pivot will move in sync with the primary part.

Note that [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] do not have `PrimaryPart` set by default. If you are creating a model that needs to be acted upon by physics, you should manually set this property in Studio or within a script. If the primary part is **not** set, the pivot will remain at the same location in world space, even if parts within the model are moved.

Also note that when setting this property, it must be a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that is a descendant of the model. If you try to set [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]] to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that is **not** a descendant of the model, it will be set to that part but reset to `nil` during the next simulation step — this is legacy behavior to support scripts which assume they can temporarily set the primary part to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] which isn't a descendant of the model.

The general rule for models is that:

- Models whose parts are joined together via physical joints such as [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] or [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]] should have a primary part assigned. For example, Roblox character models have their [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]] set to the **HumanoidRootPart** by default.
- Static (usually [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]]) models which stay in one place unless a script explicitly moves them don't require a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]] and tend not to benefit from having one set.

*Code samples for this member (`throwing-dice`) are published on the source page; their code is not part of the open-source repo.*

### Scale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Pivot · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`, `NotScriptable`

Setting this property in the Properties window will scale the model as though [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo|Model:ScaleTo()]] was called on it, scaling all descendant Instances in the model, such as materials, images, and the 3D geometry of parts, so that the model has the specified scale factor relative to its original size.

This property is only available in Studio and will throw an error if used in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]. [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo|Model:ScaleTo()]] and [[30 Official Roblox Docs/API Reference/Classes/Model#GetScale|Model:GetScale()]] should be used from scripts.

### WorldPivot

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Pivot · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

This property determines where the pivot of a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] which does **not** have a set [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]] is located. If the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] **does** have a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]], the pivot of the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] is equal to the pivot of that primary part instead, and this [[30 Official Roblox Docs/API Reference/Classes/Model#WorldPivot|WorldPivot]] property is ignored.

For a newly created [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], its pivot will be treated as the center of the bounding box of its contents until the **first time** its [[30 Official Roblox Docs/API Reference/Classes/Model#WorldPivot|Model.WorldPivot]] property is set. Once the world pivot is set for the first time, it is impossible to restore this initial behavior.

Most commonly, moving the model with the Studio tools, or with model movement functions such as [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]] and [[30 Official Roblox Docs/API Reference/Classes/Model#MoveTo|Model:MoveTo()]], will set the world pivot and thus end this new model behavior.

The purpose of this behavior is to allow Luau code to get a sensible pivot simply by creating a new model and parenting objects to it, avoiding the need to explicitly set [[30 Official Roblox Docs/API Reference/Classes/Model#WorldPivot|Model.WorldPivot]] every time you create a model in code.

*Code samples for this member (`reset-pivot`, `Model-WorldPivot`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### AddPersistentPlayer

```lua
Model:AddPersistentPlayer(playerInstance: Player = nil): ()
```

**Thread safety:** Unsafe

Sets this model to be persistent for the specified player. Persistent models stay present for the player regardless of streaming settings or conditions.

[[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] must be set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|PersistentPerPlayer]] for behavior to be changed as a result of addition.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerInstance` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | `nil` | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to make this model persistent for. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### BreakJoints

> [!warning] Deprecated
> This member is deprecated.

```lua
Model:BreakJoints(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Breaks connections between `BaseParts`, including surface connections with any adjacent parts, [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]], and all [[30 Official Roblox Docs/API Reference/Classes/Weld|Welds]] and other [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstances]].

When BreakJoints is used on a Player character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], the character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will die as it relies on the Neck joint.

Note that although joints produced by surface connections with adjacent Parts can technically be recreated using [[30 Official Roblox Docs/API Reference/Classes/Model#MakeJoints|Model:MakeJoints()]], this will only recreate joints produced by surfaces. Developers should not rely on this as following the joints being broken parts may no longer be in contact with each other.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Model-BreakJoints`, `Manual-Joint-Creation`) are published on the source page; their code is not part of the open-source repo.*

### breakJoints

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Model:BreakJoints()` which
> should be used instead.

```lua
Model:breakJoints(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetBoundingBox

```lua
Model:GetBoundingBox(): Tuple
```

**Thread safety:** Unsafe

This function returns a description of a volume that contains all [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] children within a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. The volume's orientation is based on the orientation of the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]], and matches the selection box rendered in Studio when the model is selected. Mirroring the behavior of [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillBlock|Terrain:FillBlock()]], it returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] representing the center of that bounding box and a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] representing its size. The size may be inaccurate at runtime if physics constraints are acting upon the parts within the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

The orientation of the bounding box matches the orientation of the [[30 Official Roblox Docs/API Reference/Classes/PVInstance#GetPivot|Pivot]] - either the pivot of the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] (if present) or the [[30 Official Roblox Docs/API Reference/Classes/Model#WorldPivot|WorldPivot]] of the model.

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] representing the orientation of the volume followed by a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the size of the volume. |

*Code samples for this member (`Model-GetBoundingBox`) are published on the source page; their code is not part of the open-source repo.*

### GetExtentsSize

```lua
Model:GetExtentsSize(): Vector3
```

**Thread safety:** Unsafe

Returns the size of the smallest bounding box that contains all of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. The orientation matches the orientation of the [[30 Official Roblox Docs/API Reference/Classes/PVInstance#GetPivot|Pivot]] - either the pivot of the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] (if present) or the [[30 Official Roblox Docs/API Reference/Classes/Model#WorldPivot|WorldPivot]] of the model.

Note this function only returns the size of the smallest bounding box, and the developer must employ their own method to obtain the position of the bounding box.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] extents size of the [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. |

*Code samples for this member (`Model-GetExtentsSize2`) are published on the source page; their code is not part of the open-source repo.*

### GetModelCFrame

> [!warning] Deprecated
> This function has been deprecated as it did not provide reliable results.
> You can instead use `Class.Model:GetPrimaryPartCFrame()` to retrieve the
> `Datatype.CFrame` of the model's primary part.

```lua
Model:GetModelCFrame(): CFrame
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

This value historically returned the CFrame of a central position in the model.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | A [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] representing a central position in the model. |

### GetModelSize

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work. Developers can
> instead use `Class.Model.GetExtentsSize`.

```lua
Model:GetModelSize(): Vector3
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

The GetModelSize function returns the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] size of the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] size of the [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. |

*Code samples for this member (`Model-GetModelSize1`) are published on the source page; their code is not part of the open-source repo.*

### GetPersistentPlayers

```lua
Model:GetPersistentPlayers(): List<Player>
```

**Thread safety:** Unsafe

When this method is called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], it returns all the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects that this model is persistent for. When called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], this method only checks if this model is persistent for the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|LocalPlayer]].

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> | A table with all the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] objects that this model object is persistent for. |

### GetPrimaryPartCFrame

> [!warning] Deprecated
> This member is deprecated.

```lua
Model:GetPrimaryPartCFrame(): CFrame
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

This function has been superseded by [[30 Official Roblox Docs/API Reference/Classes/PVInstance#GetPivot|PVInstance:GetPivot()]] which acts as a replacement and does not change your code's behavior. Use [[30 Official Roblox Docs/API Reference/Classes/PVInstance#GetPivot|PVInstance:GetPivot()]] for new work and migrate your existing [[30 Official Roblox Docs/API Reference/Classes/Model#GetPrimaryPartCFrame|Model:GetPrimaryPartCFrame()]] calls when convenient.

Returns the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the model's [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]].

This function is equivalent to the following.

Model.PrimaryPart.CFrame

Note this function will throw an error if no primary part exists for the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. If this behavior is not desired developers can do the following, which will be equal to `nil` if there is no primary part.

local cFrame = Model.PrimaryPart and Model.PrimaryPart.CFrame

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the model's [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|Model.PrimaryPart]]. |

*Code samples for this member (`Model-GetPrimaryPartCFrame`) are published on the source page; their code is not part of the open-source repo.*

### GetScale

```lua
Model:GetScale(): float
```

**Thread safety:** Unsafe

Models contain a persistent canonical scale factor, which starts out at 1 for newly created models and changes as the model is scaled by calling [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo|Model:ScaleTo()]]. This function returns the current canonical scale factor of the model.

The current scale factor does not _directly_ impact the size of Instances under the model. It is used for content authoring and scripting purposes to remember how the model has been scaled relative to its original size.

Within a given session, the model will cache the precise original size information of the descendant Instances after the first [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo|Model:ScaleTo()]] call. This means that calling [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo|ScaleTo(x)]] followed by [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo|ScaleTo(1)]] will get you back _exactly_ the original configuration of the model with no floating point drift. Avoiding floating point drift is the motivation for having a Scale**To** function instead of a Scale**By** function.

The scale factor does impact engine behavior in one way: The scale factor of a model will be applied to joint offsets of [[30 Official Roblox Docs/API Reference/Classes/Animation|Animations]] played on an [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]] under that model, so that animated rigs will correctly play back animations even when scaled.

**Returns**

| Type | Description |
| --- | --- |
| float | The current canonical scale factor of the model. |

*Code samples for this member (`Model-Substitute-Using-GetScale`) are published on the source page; their code is not part of the open-source repo.*

### MakeJoints

> [!warning] Deprecated
> This joint type has been deprecated. Don't use it for new work. Use
> `Class.WeldConstraint|WeldConstraints` and
> `Class.HingeConstraint|HingeConstraints` instead.

```lua
Model:MakeJoints(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

SurfaceType based joining is deprecated. Don't use MakeJoints for new projects. Use [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraints]] instead.

Goes through all [[30 Official Roblox Docs/API Reference/Classes/BasePart|Parts]] in the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] and creates joints between the specified Parts and any planar touching surfaces, depending on the parts' surfaces.

- Smooth surfaces will not create joints
- Glue surfaces will create a [[30 Official Roblox Docs/API Reference/Classes/Glue|Glue]] joint
- Weld will create a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] joint with any surface except for Unjoinable
- Studs, Inlet, or Universal will each create a [[30 Official Roblox Docs/API Reference/Classes/Snap|Snap]] joint with either of other the other two surfaces (e.g. Studs with Inlet and Universal)
- Hinge and Motor surfaces create [[30 Official Roblox Docs/API Reference/Classes/Rotate|Rotate]] and [[30 Official Roblox Docs/API Reference/Classes/RotateV|RotateV]] joint instances

This function doesn't work if the Part is not a descendant of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. Therefore, you must first ensure the Model is parented to Workspace before using MakeJoints.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Model-MakeJoints`, `Simple-Joint-Creation`) are published on the source page; their code is not part of the open-source repo.*

### makeJoints

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Model:MakeJoints()` which
> should be used instead.

```lua
Model:makeJoints(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### move

> [!warning] Deprecated
> This item has been superseded by `Class.Model:MoveTo()` which should be
> used in all new work

```lua
Model:move(location: Vector3): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `location` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### MoveTo

```lua
Model:MoveTo(position: Vector3): ()
```

**Thread safety:** Unsafe

Moves the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] to the given position. If a primary part has not been specified, the root part of the model will be used, but the root part is not deterministic and it is recommended that you always set a primary part when using [[30 Official Roblox Docs/API Reference/Classes/Model#MoveTo|MoveTo()]].

If there are any obstructions where the model is to be moved, such as [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] or other [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]], the model will be moved vertically upward until there is nothing in the way. If this behavior is not desired, [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]] should be used instead.

Note that rotation is not preserved when moving a model with [[30 Official Roblox Docs/API Reference/Classes/Model#MoveTo|MoveTo()]]. It is recommended to use either [[30 Official Roblox Docs/API Reference/Classes/Model#TranslateBy|TranslateBy()]] or [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]] if the current rotation of the model needs to be preserved.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] the [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] is moved to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Model-MoveTo`) are published on the source page; their code is not part of the open-source repo.*

### moveTo

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Model:MoveTo()` which
> should be used instead.

```lua
Model:moveTo(location: Vector3): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `location` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RemovePersistentPlayer

```lua
Model:RemovePersistentPlayer(playerInstance: Player = nil): ()
```

**Thread safety:** Unsafe

Makes this model no longer persistent for the specified player. This does not guarantee the model will immediately be removed for the player; after calling this method, the model will be treated as [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Atomic]] for that player and will remain present as long as it is within the target streaming radius.

[[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] must be set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|PersistentPerPlayer]] for behavior to be changed as a result of removal.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerInstance` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | `nil` | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to make this model no longer persistent for. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ResetOrientationToIdentity

> [!warning] Deprecated
> This function has been deprecated; it remains to prevent legacy scripts
> from throwing errors, but it does nothing when called.

```lua
Model:ResetOrientationToIdentity(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Resets the rotation of the model's parts to the previously set identity rotation, which is done through the [[30 Official Roblox Docs/API Reference/Classes/Model#SetIdentityOrientation|Model:SetIdentityOrientation()]] method.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ScaleTo

```lua
Model:ScaleTo(newScaleFactor: float): ()
```

**Thread safety:** Unsafe

Models contain a persistent canonical scale factor, which starts out at 1 for newly created models. This function scales the model, around the pivot location, relative to how it would look at a scale factor of 1. To accomplish this it does two things:

- Sets the current scale factor of the model to the specified value
- Resizes and repositions all descendant Instances accordingly

The scaling of locations is done around the pivot location.

All "geometric" properties of descendant Instances will be scaled. That obviously includes the sizes of parts, but here are some other examples of properties which are scaled:

- The length of joints like [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]], and [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint|RopeConstraint]]
- Physical velocities and forces like [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]]
- Visual properties like sizes of particle emitters
- Other length properties like [[30 Official Roblox Docs/API Reference/Classes/Sound#RollOffMinDistance|Sound.RollOffMinDistance]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `newScaleFactor` | float |  | The new scale factor for the model, which must be a positive non-zero number. A value of 1 represents the model's original size. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetIdentityOrientation

> [!warning] Deprecated
> This function has been deprecated; it remains to prevent legacy scripts
> from throwing errors, but it does nothing when called.

```lua
Model:SetIdentityOrientation(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Sets the identity rotation of the given model, allowing you to reset the rotation of the entire model later, through the use of the `ResetOrientationToIdentity` method.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetPrimaryPartCFrame

> [!warning] Deprecated
> This member is deprecated.

```lua
Model:SetPrimaryPartCFrame(cframe: CFrame): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

This function has been superseded by [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]] which acts as a more performant replacement and does not change your code's behavior. Use [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]] for new work and migrate your existing [[30 Official Roblox Docs/API Reference/Classes/Model#SetPrimaryPartCFrame|Model:SetPrimaryPartCFrame()]] calls when convenient.

Sets the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|BasePart.CFrame]] of the model's [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]]. All other parts in the model will also be moved and will maintain their orientation and offset respective to the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]].

Note, this function will throw an error if no [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]] exists for the model. This can cause issues if, for example, the primary part was never set or has been destroyed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] to be set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### TranslateBy

```lua
Model:TranslateBy(delta: Vector3): ()
```

**Thread safety:** Unsafe

Shifts a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] by the given [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] offset, preserving the model's orientation. If another [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] already exists at the new position then the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] will overlap said object.

The translation is applied in world space rather than object space, meaning even if the model's parts are orientated differently it will still move along the standard axis.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `delta` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to translate the [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] by. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Model-TranslateBy`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Model](https://create.roblox.com/docs/reference/engine/classes/Model) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
