---
title: "NumberValue"
description: "A container object for a single double-precision floating point number."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/NumberValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object for a single double-precision floating point number.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Store a single [Luau number](https://luau.org/syntax#number-literals), defined to be [double-precision floating point number](https://en.wikipedia.org/wiki/Double-precision_floating-point_format), or more commonly known as a **double**. This stores a number in 64 bits (8 bytes) using the IEEE 754 representation (1 sign bit, 11 exponent bits and 52 fractional bits). Maximum and minimum values are ±1.7976931348623157e+308, with a range of ±2^53 for exact integer representations.

Like all [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] objects, this single value is stored in the [[30 Official Roblox Docs/API Reference/Classes/NumberValue#Value|Value]] property. The `Changed` event fires with the new value being stored in the object, instead of a string representing the property being changed.

*Code samples for this API (`Changed-Event`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/NumberValue); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/NumberValue#Value\|Value]] | double | Used to hold a double value. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/NumberValue#Changed\|Changed]] | `value` | Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/NumberValue#Value\|NumberValue.Value]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/NumberValue#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Used to hold a double value.

## Events

### Changed

```lua
NumberValue.Changed(value: double)
```

Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/NumberValue#Value|NumberValue.Value]] changes. It runs with the new value being stored in the argument object, instead of a string representing the property being changed.

Listening for the `Changed` signal can be useful in games that use `NumberValues` to track values like leaderboard statistics or item prices.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | double |  | The new value after the change. |

*Code samples for this member (`NumberValue-Changed1`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This event is a deprecated variant of `Class.NumberValue.Changed` which
> should be used instead.

```lua
NumberValue.changed(value: double)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | double |  |  |

---
*Source: [NumberValue](https://create.roblox.com/docs/reference/engine/classes/NumberValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
