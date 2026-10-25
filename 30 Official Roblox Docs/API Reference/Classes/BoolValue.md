---
title: "BoolValue"
description: "A container object for a single boolean value."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BoolValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object for a single boolean value.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Stores a single boolean value. The value can be used for many things, including to communicate between scripts.

Like all [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] objects, this single value is stored in the [[30 Official Roblox Docs/API Reference/Classes/BoolValue#Value|Value]] property. The `Changed` event fires with the new value being stored in the object, instead of a string representing the property being changed.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BoolValue#Value\|Value]] | boolean | Used to hold a boolean value. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BoolValue#Changed\|Changed]] | `value` | Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/BoolValue#Value\|BoolValue.Value]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/BoolValue#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Used to hold a boolean value.

## Events

### Changed

```lua
BoolValue.Changed(value: boolean)
```

Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/BoolValue#Value|BoolValue.Value]] changes. It runs with the new value being stored in the argument object, instead of a string representing the property being changed.

Listening for the `Changed` signal can be useful in games that use `BoolValues` to track switch or enabled states.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | boolean |  | The new value after the change. |

*Code samples for this member (`BoolValue-Changed1`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This event is a deprecated variant of `Class.BoolValue.Changed` which
> should be used instead.

```lua
BoolValue.changed(value: boolean)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | boolean |  |  |

---
*Source: [BoolValue](https://create.roblox.com/docs/reference/engine/classes/BoolValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
