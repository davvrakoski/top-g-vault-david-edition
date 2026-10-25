---
title: "AnimationValueNodeType"
description: "Specifies the type of an animation graph value node, determining how it computes the value it publishes."
api_type: enum
aliases: ["Enum.AnimationValueNodeType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AnimationValueNodeType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the type of an animation graph value node, determining how it computes the value it publishes.*

## Description

Used by [[30 Official Roblox Docs/API Reference/Classes/AnimationValueNodeDefinition#NodeType|AnimationValueNodeDefinition.NodeType]] to define how a node in an animation graph computes a value. Unlike an [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType]] node, a value node has no pose output: it publishes a single value that other nodes read by wiring one of their properties to it.

#### ExpressionNode

*(image in the full Top G Vault)*

Evaluates a single authored Luau expression and publishes its result as the node's output.

##### Inputs

- None. An expression reads graph parameters by name instead of through fixed input pins.

##### Properties

| Property       | Type   | Description                                                          |
| -------------- | ------ | -------------------------------------------------------------------- |
| **Expression** | String | The Luau expression source to evaluate. Defaults to an empty string. |

See [[30 Official Roblox Docs/Animation/Graph Editor expressions|Graph Editor expressions]] for expression syntax and authoring.

#### InvalidNode

The default unassigned type indicating a value node has not been configured.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Invalid` | 0 | The default unassigned type indicating a value node has not been configured. |
| `Expression` | 1 | A value node that evaluates a [[30 Official Roblox Docs/Animation/Graph Editor expressions\|Luau expression]] and publishes its result. |

---
*Source: [AnimationValueNodeType](https://create.roblox.com/docs/reference/engine/enums/AnimationValueNodeType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
