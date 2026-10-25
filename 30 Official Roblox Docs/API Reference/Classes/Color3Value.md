---
title: "Color3Value"
description: "A container object for a single Color3 value."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Color3Value"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object for a single Color3 value.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A container object for a single [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value.

*Code samples for this API (`Set-Color3Value`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Color3Value); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Color3Value#Value\|Value]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The stored [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Color3Value#Changed\|Changed]] | `value` | Fired whenever the [[30 Official Roblox Docs/API Reference/Classes/Color3Value#Value\|Color3Value.Value]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/Color3Value#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The stored [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]].

## Events

### Changed

```lua
Color3Value.Changed(value: Color3)
```

Fired whenever the [[30 Official Roblox Docs/API Reference/Classes/Color3Value#Value|Color3Value.Value]] of the [[30 Official Roblox Docs/API Reference/Classes/Color3Value|Color3Value]] is changed. It will run with the new value being stored in the argument object, instead of a string representing the property being changed.

This event, like other changed events, can be used to track when an Color3Value changes and to track the different values that it may change to.

For instance, this may be useful in games that rely on Color3Values to track values such as colors for games using customizable outfits or items.

Equivalent changed events exist for similar objects, such as [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] and [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]], depending on what object type best suits the need.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | The new value after the change. |

*Code samples for this member (`how-to-use-color3value-changed`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This deprecated event is a variant of `Class.Color3Value.Changed` which
> should be used instead.

```lua
Color3Value.changed(value: Color3)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  |  |

---
*Source: [Color3Value](https://create.roblox.com/docs/reference/engine/classes/Color3Value) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
