---
title: "CFrameValue"
description: "A container object for a single CFrame value."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CFrameValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object for a single CFrame value.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A container object for a single [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] value.

*Code samples for this API (`Store-the-Camera-s-CFrame`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/CFrameValue); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CFrameValue#Value\|Value]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Used to hold a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] value. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CFrameValue#Changed\|Changed]] | `value` | Fired whenever the [[30 Official Roblox Docs/API Reference/Classes/CFrameValue#Value\|CFrameValue.Value]] of the CFrameValue is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/CFrameValue#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Used to hold a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] value.

## Events

### Changed

```lua
CFrameValue.Changed(value: CFrame)
```

Fired whenever the [[30 Official Roblox Docs/API Reference/Classes/CFrameValue#Value|CFrameValue.Value]] of the [[30 Official Roblox Docs/API Reference/Classes/CFrameValue|CFrameValue]] is changed. It will run with the new value being stored in the argument object, instead of a string representing the property being changed.

This event, like other changed events, can be used to track when an CFrameValue changes and to track the different values that it may change to.

For instance, this even may be useful in games that rely on CFrameValues to track game object [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] positions and movements.

Equivalent changed events exist for similar objects, such as [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] and [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]], depending on what object type best suits the need.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The new value after the change. |

*Code samples for this member (`CFrameValue-Changed1`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This event is a deprecated variant of `Class.CFrameValue.Changed` which
> should be used instead.

```lua
CFrameValue.changed(value: CFrame)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  |  |

---
*Source: [CFrameValue](https://create.roblox.com/docs/reference/engine/classes/CFrameValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
