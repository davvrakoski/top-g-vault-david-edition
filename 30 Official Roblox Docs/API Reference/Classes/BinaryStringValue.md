---
title: "BinaryStringValue"
description: "An internal type of `StringValue` object, that stores a `BinaryString` value."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BinaryStringValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An internal type of [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]] object, that stores a `BinaryString` value.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An internal type of [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]] object, that stores a `BinaryString` value.

## Summary

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BinaryStringValue#Changed\|Changed]] | `value` | Fires if the BinaryStringValue's value is changed. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Events

### Changed

```lua
BinaryStringValue.Changed(value: BinaryString)
```

Fires if the [[30 Official Roblox Docs/API Reference/Classes/BinaryStringValue|BinaryStringValue.Value]] of the [[30 Official Roblox Docs/API Reference/Classes/BinaryStringValue|BinaryStringValue]] is changed by the engine.

In practice, this object is stored out of reach from normal scripts, so this event cannot be connected to. If a BinaryStringValue is created by a script, the engine will not do anything with it, so the event will never fire.

Equivalent changed events exist for similar objects, such as [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] and [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]], depending on what object type best suits the need.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | BinaryString |  | The new value after the change. |

---
*Source: [BinaryStringValue](https://create.roblox.com/docs/reference/engine/classes/BinaryStringValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
