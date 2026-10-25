---
title: "AnimationNodeDefinition"
description: "A single node within an animation graph that outputs an animation pose, connected to other nodes through named input pins."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AnimationNodeDefinition"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A single node within an animation graph that outputs an animation pose, connected to other nodes through named input pins.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Represents one node in an animation graph, the node-based system that combines animation clips and poses at runtime. Its [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition#NodeType|NodeType]] determines how the node processes animation, such as playing a clip, blending or overlaying two inputs, masking, or adjusting playback speed, while its [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition#NodeId|NodeId]] uniquely identifies it within the graph. Nodes connect to one another through named input pins; changing a node's type resets its input pins to the default set for that type. For a node that outputs one or more values instead of a pose, see [[30 Official Roblox Docs/API Reference/Classes/AnimationValueNodeDefinition|AnimationValueNodeDefinition]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition#NodeId\|NodeId]] | string | A string that uniquely identifies this node within its animation graph. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition#NodeType\|NodeType]] | [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType\|AnimationNodeType]] | The kind of node this definition represents within its animation graph. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition#AddInputPin\|AddInputPin()]] | () | Appends a named input pin to the end of the ordered input pin list. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition#GetOrderedInputPinNames\|GetOrderedInputPinNames()]] | Array | Returns the current ordered list of input pin names. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition#RemoveInputPin\|RemoveInputPin()]] | () | Removes the first input pin matching the given name from the ordered pin list. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition#SetOrderedInputPinNames\|SetOrderedInputPinNames()]] | () | Bulk-replaces the entire ordered input pin list. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition#InputPinsChanged\|InputPinsChanged]] |  | Fires whenever the ordered input pin list is modified. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### NodeId

**Type:** string

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

A unique identifier used to reference this node among the other nodes in its graph. Defaults to an empty string.

### NodeType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|AnimationNodeType]]

**Thread safety:** ReadSafe · **Category:** Animation · **Loaded/Saved:** true/true · **Capabilities:** Animation

Determines how the node processes animation within the graph, for example a clip source, an additive or overlay blend, a mask, or a speed adjustment (see [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType]]). Defaults to [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|InvalidNode]]. Changing this value resets the node's input pins to the default set defined for the new type.

## Methods

### AddInputPin

```lua
AnimationNodeDefinition:AddInputPin(pin: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Appends a named input pin to the end of the ordered input pin list. The order in which pins are added is significant for nodes such as [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType.SequenceNode]], [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType.RandomSequenceNode]], and [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType.PrioritySelectNode]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pin` | string |  | Name of the input pin to append. Should match the [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Name]] of the corresponding [[30 Official Roblox Docs/API Reference/Classes/ObjectValue\|ObjectValue]] wiring child. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetOrderedInputPinNames

```lua
AnimationNodeDefinition:GetOrderedInputPinNames(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the current ordered list of input pin names.

**Returns**

| Type | Description |
| --- | --- |
| Array | The ordered list of input pin names. |

### RemoveInputPin

```lua
AnimationNodeDefinition:RemoveInputPin(pin: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Removes the first input pin matching the given name from the ordered pin list.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pin` | string |  | Name of the input pin to remove. Only the first pin matching this name is removed. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetOrderedInputPinNames

```lua
AnimationNodeDefinition:SetOrderedInputPinNames(pins: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Bulk-replaces the entire ordered input pin list. Use this to reorder pins or apply batch updates in a single call.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pins` | Array |  | The new ordered list of input pin names, replacing the existing list. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### InputPinsChanged

```lua
AnimationNodeDefinition.InputPinsChanged()
```

**Capabilities:** Animation

Fires whenever the ordered input pin list is modified.

---
*Source: [AnimationNodeDefinition](https://create.roblox.com/docs/reference/engine/classes/AnimationNodeDefinition) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
