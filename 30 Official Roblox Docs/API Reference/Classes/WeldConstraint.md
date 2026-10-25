---
title: "WeldConstraint"
description: "Connects two `BaseParts` together such that their relative position and orientation remain the same."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/WeldConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Connects two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] together such that their relative position and orientation remain the same.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

**WeldConstraint** connects two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and ensures they stay in the same relative position/orientation to each other, meaning that if one part moves, the other moves the same amount. Even if the two parts are not touching, they can be welded together.

The most common way to create a weld constraint is by selecting **Weld** through Studio's **Create** menu in the toolbar's **Model** tab.

Note that this tool behaves differently depending on how many [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are selected when the tool is activated:

- If no [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are selected, the next two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] clicked will be connected by a new [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]]. If the same [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is clicked twice, no constraint will be created.
- If one [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is already selected, the next [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] clicked will be connected to the selected one with a new [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]].
- If multiple [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are selected, those which are touching or overlapping will be automatically welded together by new [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]].

#### Repositioning Behavior

Moving a welded [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] behaves differently depending on whether the part was moved through its [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]] or through its [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].

- If a welded part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]] is updated, that part will move but none of the connected parts will move with it. The weld will recalculate the offset from the other parts based on the moved part's new position.

- If a welded part's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] is updated, that part will move **and** all of the connected parts will also move, ensuring they maintain the same offset as when the weld was created.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint#Active\|Active]] | boolean | Indicates if the WeldConstraint is currently active in the world. |
| [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint#Enabled\|Enabled]] | boolean | Toggles the constraint on and off. |
| [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint#Part0\|Part0]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The first part connected by the constraint. |
| [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint#Part1\|Part1]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The second part connected by the constraint. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Active

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/true · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

True if the WeldConstraint is currently active in the world.

If the WeldConstraint or one of its parts is not in [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] the weld will be inactive.

Rigid joints like [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]], [[30 Official Roblox Docs/API Reference/Classes/Snap|Snap]], [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]], [[30 Official Roblox Docs/API Reference/Classes/Motor|Motor]], or [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] may also be disabled due to conflicts with other rigid joints, such as joints between the same two parts or indirect cycles in the weld graph. Joints disabled this way may be re-enabled later when another joint or part is added or removed.

Duplicate WeldConstraints do not conflict because WeldConstraints derive their internal CFrames from the relative positions of their parts when they are enabled and all update when [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart#Orientation|BasePart.Orientation]] is set on a part. The spanning tree may still disable them if they are redundant or form a cycle.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`

The **Enabled** property of a [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] sets whether the constraint is active or not. When this property is set to true, if the constraint's [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint#Part0|WeldConstraint.Part0]] and [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint#Part1|WeldConstraint.Part1]] properties are set, then the constraint will ensure that its two connected parts will be locked together.

### Part0

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Parts · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`

The `Part0` and [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint#Part1|WeldConstraint.Part1]] properties of a [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] set which two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] the weld connects. As soon as both properties are set and the weld is [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint#Enabled|WeldConstraint.Enabled]], the weld will lock the two parts together.

If `Part0` or `Part1` are ever set to new parts, then the `WeldConstraint` will instantly link the new part. The old part will no longer be constrained.

*Code samples for this member (`WeldConstraint-Part0`) are published on the source page; their code is not part of the open-source repo.*

### Part1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Parts · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint#Part0|WeldConstraint.Part0]] and `Part1` properties of a [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] set which two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] the weld connects. As soon as both properties are set and the weld is [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint#Enabled|WeldConstraint.Enabled]], the weld will lock the two parts together.

If `Part0` or `Part1` are ever set to new parts, then the `WeldConstraint` will instantly link the new part. The old part will no longer be constrained.

*Code samples for this member (`WeldConstraint-Part1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [WeldConstraint](https://create.roblox.com/docs/reference/engine/classes/WeldConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
