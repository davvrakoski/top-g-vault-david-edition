---
title: "PVInstance"
description: "Abstract class for all objects that have a physical location in the world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PVInstance"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Abstract class for all objects that have a physical location in the world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

A [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] is an abstract class that cannot be created. It is the base for all objects that have a physical location in the world.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PVInstance#Origin\|Origin]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Editor-only property that reads and sets the world [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the [[30 Official Roblox Docs/API Reference/Classes/PVInstance\|PVInstance]]'s pivot, moving the entire instance when changed from the Studio Properties window. |
| [[30 Official Roblox Docs/API Reference/Classes/PVInstance#Pivot Offset\|Pivot Offset]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Editor-only property that displays and edits the pivot's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] relative to the instance, moving only the pivot and leaving the instance in place. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PVInstance#GetPivot\|GetPivot()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Gets the pivot of a [[30 Official Roblox Docs/API Reference/Classes/PVInstance\|PVInstance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo\|PivotTo()]] | () | Transforms the [[30 Official Roblox Docs/API Reference/Classes/PVInstance\|PVInstance]] along with all of its descendant [[30 Official Roblox Docs/API Reference/Classes/PVInstance\|PVInstances]] such that the pivot is now located at the specified [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Origin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`, `NotScriptable`

Editor-only property, shown in the Studio Properties window as **Origin Position** and **Origin Orientation** under **Transform**. Its value is the world-space [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the instance's pivot; reading it returns the same [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] as [[30 Official Roblox Docs/API Reference/Classes/PVInstance#GetPivot|PVInstance:GetPivot()]]. It has no stored value of its own and always reflects the current pivot.

Setting it from the Properties window moves the whole instance so its pivot lands at the new [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], much like [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]]. Editing through the Properties window temporarily disables [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] to other objects for the move; `PivotTo` does not modify joints.

Not available to scripts; use [[30 Official Roblox Docs/API Reference/Classes/PVInstance#GetPivot|PVInstance:GetPivot()]] and [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]] at runtime instead.

### Pivot Offset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Pivot · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`, `NotScriptable`

Editor-only property, shown in the Studio Properties window as **Pivot Position** and **Pivot Orientation** under **Pivot**. It is the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the pivot relative to the instance's own frame.

Changing it from the Properties window moves the pivot relative to the instance while leaving the instance in place, unlike `Origin`, which moves the whole instance. For a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], the offset defaults to the identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], so the pivot coincides with the part's center. For a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], this property appears only when the model has a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]]; it then reflects and edits that part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#PivotOffset|PivotOffset]], and [[30 Official Roblox Docs/API Reference/Classes/PVInstance#GetPivot|Model:GetPivot()]] aliases the primary part's pivot.

Not available to scripts; scripts read and write the equivalent through the concrete class, such as [[30 Official Roblox Docs/API Reference/Classes/BasePart#PivotOffset|BasePart.PivotOffset]].

## Methods

### GetPivot

```lua
PVInstance:GetPivot(): CFrame
```

**Thread safety:** Safe

This function gets the pivot of a [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]]. This is often used with [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]] to move a model.

[[30 Official Roblox Docs/API Reference/Classes/Model|Models]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are both [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstances]] ("Position Velocity Instances") and so both have this function.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The world-space [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the instance's pivot. |

*Code samples for this member (`simple-character-teleportation`) are published on the source page; their code is not part of the open-source repo.*

### PivotTo

```lua
PVInstance:PivotTo(targetCFrame: CFrame): ()
```

**Thread safety:** Unsafe

Transforms the [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] along with all of its descendant [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstances]] such that the pivot is now located at the specified [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. This is the primary function that should be used to move [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] via scripting.

[[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are moved in this way by having their [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] transformed by the necessary offset. [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] are moved in this way by having their [[30 Official Roblox Docs/API Reference/Classes/Model#WorldPivot|Model.WorldPivot]] transformed by the necessary offset.

Note that for efficiency purposes, [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Object.Changed]] events are not fired for [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Orientation|Orientation]] of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] moved in this way; they are only fired for [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].

When calling [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PivotTo]] on [[30 Official Roblox Docs/API Reference/Classes/Model|Models]], the offsets of the descendant parts and models are cached, such that subsequent calls to [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PivotTo]] on the same model do not accumulate floating point drift between the parts making up the model.

[[30 Official Roblox Docs/API Reference/Classes/Model|Models]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are both [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstances]] ("Position Velocity Instances") and so both have this function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `targetCFrame` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] that the [[30 Official Roblox Docs/API Reference/Classes/PVInstance\|PVInstance]] pivot should equal after moving it. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`simple-character-teleportation`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [PVInstance](https://create.roblox.com/docs/reference/engine/classes/PVInstance) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
