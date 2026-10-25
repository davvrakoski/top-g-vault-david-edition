---
title: "Weld"
description: "Holds two `BaseParts` together in a fixed relative position, regardless of whether they're touching."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Weld"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Holds two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] together in a fixed relative position, regardless of whether they're touching.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

An object used to hold two objects together in a relative position, regardless of whether they're touching. This object is placed inside of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] and the [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1|Part1]] property determines which other part should be welded to the original part. Two [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]], [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]] and [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]], then determine how the parts should be placed.

See also [[30 Official Roblox Docs/API Reference/Classes/RigidConstraint|RigidConstraint]] for a newer alternative using the constraints system that does not require [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]] or [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]], but instead uses [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] to control offsets through [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Constraint.Attachment0]] and [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Constraint.Attachment1]].

While the weld is [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Active|Active]], it maintains the part positions such that:

`part1.CFrame * C1 == Part0.CFrame * C0`

#### Root Part

Every assembly has a root part (see [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetRootPart|BasePart:GetRootPart()]]). When a weld's [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]]/[[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]] is modified, the root part will stay where it was.

#### Directionality

Welds do not have any directionality. Imagine rigid joints forming a tree, branching up from the root part such that all the parts up the tree from the root will move and their welded "children" will move with them.

---
*Source: [Weld](https://create.roblox.com/docs/reference/engine/classes/Weld) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
