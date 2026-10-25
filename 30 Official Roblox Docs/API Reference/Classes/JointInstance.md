---
title: "JointInstance"
description: "The base class for joints."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/JointInstance"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The base class for joints.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/DynamicRotate|DynamicRotate]], [[30 Official Roblox Docs/API Reference/Classes/Glue|Glue]], [[30 Official Roblox Docs/API Reference/Classes/ManualSurfaceJointInstance|ManualSurfaceJointInstance]], [[30 Official Roblox Docs/API Reference/Classes/Motor|Motor]], [[30 Official Roblox Docs/API Reference/Classes/Rotate|Rotate]], [[30 Official Roblox Docs/API Reference/Classes/Snap|Snap]], [[30 Official Roblox Docs/API Reference/Classes/VelocityMotor|VelocityMotor]], [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]]
- **Memory category:** BaseParts
- **Tags:** `NotCreatable`

## Description

`JointInstance` is the base class for joints such as [[30 Official Roblox Docs/API Reference/Classes/Weld|Welds]] and [[30 Official Roblox Docs/API Reference/Classes/Motor|Motors]].

[[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]], [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]], [[30 Official Roblox Docs/API Reference/Classes/Motor|Motor]], and [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] all combine multiple parts into the same [[30 Official Roblox Docs/Physics/Assemblies|assembly]]. Every assembly has a root part ([[30 Official Roblox Docs/API Reference/Classes/BasePart#GetRootPart|BasePart:GetRootPart()]]) and when [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]]/[[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]] of a [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] is modified, the root part will stay where it was.

Welds do not have any directionality. You can imagine rigid joints forming a tree branching down from the root part. All the parts down the tree from root will move, and their welded "children" in this tree will move with them.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Active\|Active]] | boolean | Determines if the joint is currently active in the world. |
| [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0\|C0]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Determines how the offset point is attached to [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0\|JointInstance.Part0]]. |
| [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1\|C1]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Subtracted from the [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0\|C0]] property to create an offset point for [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1\|Part1]]. |
| [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Enabled\|Enabled]] | boolean | Sets whether the joint is active or not. |
| [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0\|Part0]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The first [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] that the joint connects. |
| [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1\|Part1]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The second [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] that the joint connects. |
| [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1\|part1]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Active

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

This property determines if the joint is currently active in the world.

If the [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] is not in [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or [[30 Official Roblox Docs/API Reference/Classes/JointsService|JointsService]], or one of its parts is not in [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], the joint will be inactive.

Rigid joints like [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]], [[30 Official Roblox Docs/API Reference/Classes/Snap|Snap]], [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]], [[30 Official Roblox Docs/API Reference/Classes/Motor|Motor]], or [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] may also be disabled due to conflicts with other rigid joints, such as joints between the same two parts or indirect cycles in the weld graph. Joints disabled this way may be re-enabled later when another joint or part is added or removed.

### C0

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics

`C0` is the position aspect of the orientation between two parts in a weld. [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|Part0]] and [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1|Part1]] move accordingly to this value, which denotes their respective positions.

When animating a [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], it's recommended to tween its [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Transform]] property instead of `C0`.

### C1

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property is subtracted from the [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]] property to create an offset point for [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1|Part1]].

When animating a [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], it's recommended to tween its [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Transform]] property instead of `C1`.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property sets whether the joint is active or not.

When this property is set to `true` and the joint's [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|Part0]] and [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1|Part1]] properties are set, the joint will ensure that its two parts will be connected and behave according to joint type.

See also [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Active|Active]] which determines if the joint is currently active in the world.

### Part0

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property indicates the first [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that the joint connects.

### Part1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property indicates the second [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that the joint connects.

### part1

> [!warning] Deprecated
> This deprecated property is a variant of `Class.JointInstance.Part1|Part1`
> which should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Physics · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

---
*Source: [JointInstance](https://create.roblox.com/docs/reference/engine/classes/JointInstance) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
