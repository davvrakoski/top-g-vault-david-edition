---
title: "Constraint"
description: "The base class for constraint-based objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Constraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The base class for constraint-based objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]], [[30 Official Roblox Docs/API Reference/Classes/AlignPosition|AlignPosition]], [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity|AngularVelocity]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint|BallSocketConstraint]], [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]], [[30 Official Roblox Docs/API Reference/Classes/LineForce|LineForce]], [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity|LinearVelocity]], [[30 Official Roblox Docs/API Reference/Classes/PlaneConstraint|PlaneConstraint]], [[30 Official Roblox Docs/API Reference/Classes/RigidConstraint|RigidConstraint]], [[30 Official Roblox Docs/API Reference/Classes/RodConstraint|RodConstraint]], [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint|RopeConstraint]], [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|SlidingBallConstraint]], [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]], [[30 Official Roblox Docs/API Reference/Classes/Torque|Torque]], [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint|TorsionSpringConstraint]], [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint|UniversalConstraint]], [[30 Official Roblox Docs/API Reference/Classes/VectorForce|VectorForce]]
- **Memory category:** BaseParts
- **Tags:** `NotCreatable`

## Description

The base class for constraint-based objects. See [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]] and [[30 Official Roblox Docs/Physics/Mechanical constraints|mechanical constraints]] for more details.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Constraint#Active\|Active]] | boolean | Indicates if the constraint is currently active in the world. |
| [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]] | [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] | The [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] that is connected to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Constraint.Attachment1]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]] | [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] | The [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] that is connected to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Constraint.Attachment0]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Constraint#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | The color of the constraint. |
| [[30 Official Roblox Docs/API Reference/Classes/Constraint#Enabled\|Enabled]] | boolean | Toggles whether or not the constraint is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Constraint#Visible\|Visible]] | boolean | Toggles the constraint's visibility. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Constraint#GetDebugAppliedForce\|GetDebugAppliedForce()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Constraint#GetDebugAppliedTorque\|GetDebugAppliedTorque()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Active

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

This property is `true` if the constraint and both of its parts are in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and the constraint's [[30 Official Roblox Docs/API Reference/Classes/Constraint#Enabled|Constraint.Enabled]] property is `true`.

### Attachment0

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]

**Thread safety:** ReadSafe · **Category:** Attachments · **Loaded/Saved:** true/true · **Capabilities:** Physics

The [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] that is connected to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Constraint.Attachment1]]

### Attachment1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]

**Thread safety:** ReadSafe · **Category:** Attachments · **Loaded/Saved:** true/true · **Capabilities:** Physics

The [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] that is connected to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Constraint.Attachment0]]

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

The color of the constraint.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics

Toggles whether or not the constraint is enabled.

### Visible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Toggles the constraint's visibility.

## Methods

### GetDebugAppliedForce

> [!warning] Deprecated
> This method should not be used in new work.

```lua
Constraint:GetDebugAppliedForce(bodyId: int): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `bodyId` | int |  |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

### GetDebugAppliedTorque

> [!warning] Deprecated
> This method should not be used in new work.

```lua
Constraint:GetDebugAppliedTorque(bodyId: int): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `bodyId` | int |  |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

---
*Source: [Constraint](https://create.roblox.com/docs/reference/engine/classes/Constraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
