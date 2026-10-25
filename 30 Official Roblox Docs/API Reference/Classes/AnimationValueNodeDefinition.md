---
title: "AnimationValueNodeDefinition"
description: "A node within an animation graph that outputs one or more values instead of an animation pose."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AnimationValueNodeDefinition"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A node within an animation graph that outputs one or more values instead of an animation pose.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Represents a node in an animation graph that outputs one or more values instead of an animation pose, unlike [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition|AnimationNodeDefinition]]. Each output is exposed as a child [[30 Official Roblox Docs/API Reference/Classes/AnimationValueOutputDefinition|AnimationValueOutputDefinition]] instance; other nodes consume it by pointing an [[30 Official Roblox Docs/API Reference/Classes/ObjectValue|ObjectValue]] wire at that instance.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationValueNodeDefinition#NodeId\|NodeId]] | string | A string that uniquely identifies this node within its animation graph. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationValueNodeDefinition#NodeType\|NodeType]] | [[30 Official Roblox Docs/API Reference/Enums/AnimationValueNodeType\|AnimationValueNodeType]] | The kind of node this definition represents within its animation graph. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### NodeId

**Type:** string

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

A unique identifier used to reference this node among the other nodes in its graph. Defaults to an empty string.

### NodeType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AnimationValueNodeType|AnimationValueNodeType]]

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** Animation

Determines how the node computes the value it publishes (see [[30 Official Roblox Docs/API Reference/Enums/AnimationValueNodeType|Enum.AnimationValueNodeType]]). Defaults to [[30 Official Roblox Docs/API Reference/Enums/AnimationValueNodeType|Invalid]].

---
*Source: [AnimationValueNodeDefinition](https://create.roblox.com/docs/reference/engine/classes/AnimationValueNodeDefinition) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
