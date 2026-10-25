---
title: "IntValue"
description: "A container object for a single integer."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/IntValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object for a single integer.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Stores a single signed [[30 Official Roblox Docs/Luau/Numbers#int64|64-bit integer]]. The highest allowed value is 2^63-1 or around 9.2 quintillion (9.2^18). Attempting to store larger numbers causes an [integer overflow](https://en.wikipedia.org/wiki/Integer_overflow). The lowest allowed value is -2^63. Practically, however, working with integers larger than 2^53 (9^15) causes loss of precision since Luau uses double-precision floating-point to store numbers.

It's possible to store values between 2^53 and 2^63-1 using the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window since it uses strings to pass data to the engine, but manipulating large values via Luau scripts results in loss of precision and rounding as mentioned above.

The main advantage of using **IntValue** lies in its rounding of values to the nearest integer, with halfway cases rounded away from 0. For values outside of this range, use [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] instead.

Like all [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] objects, this single value is stored in the [[30 Official Roblox Docs/API Reference/Classes/IntValue#Value|Value]] property. The `Changed` event fires with the new value being stored in the object, instead of a string representing the property being changed.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/IntValue#Value\|Value]] | int64 | Used to hold an integer. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/IntValue#Changed\|Changed]] | `value` | Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/IntValue#Value\|IntValue.Value]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/IntValue#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Used to hold an integer.

## Events

### Changed

```lua
IntValue.Changed(value: int64)
```

Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/IntValue#Value|IntValue.Value]] changes. It runs with the new value being stored in the argument object, instead of a string representing the property being changed.

Listening for the `Changed` signal can be useful in games that use `IntValues` to track values like leaderboard statistics or item prices.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | int64 |  | The new value after the change. |

*Code samples for this member (`IntValue-Changed1`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This deprecated event is a variant of `Class.IntValue.Changed` which
> should be used instead.

```lua
IntValue.changed(value: int64)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | int64 |  |  |

---
*Source: [IntValue](https://create.roblox.com/docs/reference/engine/classes/IntValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
