---
title: "ManualWeld"
description: "Holds two parts together and functions identically to `Weld`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ManualWeld"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Holds two parts together and functions identically to [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]].*

> [!warning] Deprecated
> This member is deprecated.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ManualSurfaceJointInstance|ManualSurfaceJointInstance]] → [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts
- **Tags:** `Deprecated`

## Description

An object that holds two parts together. It is commonly created when the _Join Always_ setting in Studio is turned on.

Functions identically to [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]].

See also [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] for a newer alternative using the [[30 Official Roblox Docs/Physics/Mechanical constraints|constraints]] system that does not require [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]] or [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]] properties to be manually set.

## Root part

Every Assembly has a root part, see [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetRootPart|BasePart:GetRootPart()]]. When a ManualWeld's [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]]/[[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]] is modified the root part will stay where it was.

## Directionality

ManualWelds do not have any directionality. [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|Part0]] or [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1|Part1]], doesn't matter. You can imagine rigid joints forming a tree branching down from the root part. All the parts down the tree from root will move, and their welded "children" in this tree will move with them.

---
*Source: [ManualWeld](https://create.roblox.com/docs/reference/engine/classes/ManualWeld) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
