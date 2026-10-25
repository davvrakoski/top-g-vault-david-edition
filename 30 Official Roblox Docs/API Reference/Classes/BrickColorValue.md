---
title: "BrickColorValue"
description: "A container object for a single BrickColor value."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BrickColorValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object for a single BrickColor value.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An instance which is used to store a BrickColor value.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BrickColorValue#Value\|Value]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | Used to hold a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] value. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BrickColorValue#Changed\|Changed]] | `value` | Fired whenever the [[30 Official Roblox Docs/API Reference/Classes/BrickColorValue#Value\|BrickColorValue.Value]] of the BrickColorValue is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/BrickColorValue#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Used to hold a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] value.

## Events

### Changed

```lua
BrickColorValue.Changed(value: BrickColor)
```

Fired whenever the [[30 Official Roblox Docs/API Reference/Classes/BrickColorValue#Value|BrickColorValue.Value]] of the [[30 Official Roblox Docs/API Reference/Classes/BrickColorValue|BrickColorValue]] is changed. It will run with the new value being stored in the argument object, instead of a string representing the property being changed.

This event, like other changed events, can be used to track when an BrickColorValue changes and to track the different values that it may change to.

Equivalent changed events exist for similar objects, such as [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] and [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]], depending on what object type best suits the need.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] |  | The new value after the change. |

*Code samples for this member (`BrickColorValue-Changed1`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This event is a deprecated variant of `Class.BrickColorValue.Changed`
> which should be used instead.

```lua
BrickColorValue.changed(value: BrickColor)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] |  |  |

---
*Source: [BrickColorValue](https://create.roblox.com/docs/reference/engine/classes/BrickColorValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
