---
title: "WorldModel"
description: "Extends limited physics to its children."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/WorldModel"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Extends limited physics to its children.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/WorldRoot|WorldRoot]] → [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

When parented to a [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]], `WorldModel` extends limited physics for its children on to that [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]]. For example, [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] that are parented to the `WorldModel` can be animated and spatially queried (for example by raycasts) but those parts are **not** simulated. Furthermore, you can put [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] characters in the `WorldModel` and their joints will be set up correctly for animation.

`WorldModel` also exposes the [[30 Official Roblox Docs/API Reference/Classes/WorldModel#UseWorkspaceCollisionGroups|UseWorkspaceCollisionGroups]] property to determine whether it uses [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] collision groups or its own independent collision groups for queries.

To avoid possible performance issues, make sure to only create `WorldModels` when you want to show them and to delete `WorldModels` that are currently not in use.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WorldModel#UseWorkspaceCollisionGroups\|UseWorkspaceCollisionGroups]] | boolean | Determines whether this `WorldModel` uses [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]] collision groups or its own independent collision groups for queries. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/WorldRoot|WorldRoot]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### UseWorkspaceCollisionGroups

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Basic

When `false` (default), this `WorldModel` uses its own collision groups for all collision-related behavior.

When `true`, this `WorldModel` uses [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] collision groups. Additionally, the collision group state of this `WorldModel` can continue to be modified.

---
*Source: [WorldModel](https://create.roblox.com/docs/reference/engine/classes/WorldModel) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
