---
title: "Vector3Value"
description: "A container object for a single Vector3 value."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Vector3Value"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object for a single Vector3 value.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A Vector3Value simply holds a Vector3 as a value. This value can be used for scripts to communicate, for objects to move to a preset location, etc.

*Code samples for this API (`Teleporter-Part`, `Storing-Vector2-inside-Vector3Value`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Vector3Value); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Vector3Value#Value\|Value]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The stored [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Vector3Value#Changed\|Changed]] | `value` | Fired whenever [[30 Official Roblox Docs/API Reference/Classes/Vector3Value#Value\|Vector3Value.Value]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/Vector3Value#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The stored [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]].

## Events

### Changed

```lua
Vector3Value.Changed(value: Vector3)
```

Fired whenever the [[30 Official Roblox Docs/API Reference/Classes/Vector3Value#Value|Vector3Value.Value]] of the [[30 Official Roblox Docs/API Reference/Classes/Vector3Value|Vector3Value]] is changed. It will run with the new value being stored in the argument object, instead of a string representing the property being changed.

This event, like other changed events, can be used to track when an Vector3Value changes and to track the different values that it may change to.

For instance, this may be useful in games that rely on Vector3Values to track positions in the game world.

Equivalent changed events exist for similar objects, such as [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] and [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]], depending on what object type best suits the need.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The new value after the change. |

*Code samples for this member (`how-to-use-vector3value-changed`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This deprecated event is a variant of `Class.Vector3Value.Changed` which
> should be used instead.

```lua
Vector3Value.changed(value: Vector3)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |  |

---
*Source: [Vector3Value](https://create.roblox.com/docs/reference/engine/classes/Vector3Value) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
