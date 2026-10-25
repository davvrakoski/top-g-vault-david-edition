---
title: "PathfindingModifier"
description: "Modifiers used to represent space that has a higher or lower cost to be traversed when creating paths using `PathfindingService`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PathfindingModifier"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Modifiers used to represent space that has a higher or lower cost to be traversed when creating paths using [[30 Official Roblox Docs/API Reference/Classes/PathfindingService|PathfindingService]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Pathfinding modifiers can be used to represent space that has a higher or lower cost to be traversed. You can include pathfinding modifiers in the [[30 Official Roblox Docs/API Reference/Classes/PathfindingService#CreatePath|PathfindingService:CreatePath()]] parameters and compute smarter paths across various materials or around defined regions. See [[30 Official Roblox Docs/Characters/Pathfinding#Pathfinding Modifiers|Pathfinding]] for details.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PathfindingModifier#Label\|Label]] | string | The name of the navigation area inside or on top of the parts enclosed by the modifier. |
| [[30 Official Roblox Docs/API Reference/Classes/PathfindingModifier#PassThrough\|PassThrough]] | boolean | Determines if the parts enclosed by the modifier are traversable, even if they would normally be collided with. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Label

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The name of the navigation area inside or on top of the parts enclosed by the modifier.

### PassThrough

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines if the parts enclosed by the modifier are traversable, even if they would normally be collided with.

---
*Source: [PathfindingModifier](https://create.roblox.com/docs/reference/engine/classes/PathfindingModifier) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
