---
title: "ObjectValue"
description: "A container object for a reference to another instance."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ObjectValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object for a reference to another instance.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Stores a single reference to another object. If this object is duplicated within Studio and the value refers to an object also being copied, then the new `ObjectValue` points to the copied object instead of the original. Otherwise, the same value is kept. Copying and pasting this object clears the value field.

Like all [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] objects, this single value is stored in the [[30 Official Roblox Docs/API Reference/Classes/ObjectValue#Value|Value]] property. The `Changed` event fires with the new value being stored in the object, instead of a string representing the property being changed.

If [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|streaming]] is enabled, the `Value` property is nil until the referenced object streams in, at which point the `Changed` event fires.

*Code samples for this API (`ObjectValue-Example`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ObjectValue); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ObjectValue#Value\|Value]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Holds a reference to an instance. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ObjectValue#Changed\|Changed]] | `value` | Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/ObjectValue#Value\|ObjectValue.Value]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/ObjectValue#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Holds a reference to an instance.

## Events

### Changed

```lua
ObjectValue.Changed(value: Instance)
```

Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/ObjectValue#Value|ObjectValue.Value]] changes. It runs with the new value being stored in the argument object, instead of a string representing the property being changed.

Listening for the `Changed` signal can be useful in games that use `ObjectValues` to track game state, such as an RPG targeting system.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The new value after the change. |

*Code samples for this member (`ObjectValue-Changed1`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This event is a deprecated variant of `Class.ObjectValue.Changed` which
> should be used instead.

```lua
ObjectValue.changed(value: Instance)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

---
*Source: [ObjectValue](https://create.roblox.com/docs/reference/engine/classes/ObjectValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
