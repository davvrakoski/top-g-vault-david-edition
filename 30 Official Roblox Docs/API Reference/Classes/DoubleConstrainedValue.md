---
title: "DoubleConstrainedValue"
description: "An instance which is used to create a number value which can never be less than the MinValue or more than the MaxValue."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DoubleConstrainedValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An instance which is used to create a number value which can never be less than the MinValue or more than the MaxValue.*

> [!warning] Deprecated
> The DoubleConstrainedValue object has been deprecated as developers can now
> use the `Library.math.clamp()` function to constrain values.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

An instance which is used to create a number value which can never be less than the MinValue or more than the MaxValue.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#ConstrainedValue\|ConstrainedValue]] | double | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#MaxValue\|MaxValue]] | double | **Deprecated.** The highest number that the [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#Value\|DoubleConstrainedValue.Value]] property can be. |
| [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#MinValue\|MinValue]] | double | **Deprecated.** The lowest number that the [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#Value\|DoubleConstrainedValue.Value]] property can be. |
| [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#Value\|Value]] | double | **Deprecated.** Used to hold a number value between [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#MinValue\|DoubleConstrainedValue.MinValue]] and [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#MaxValue\|DoubleConstrainedValue.MaxValue]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#Changed\|Changed]] | `value` | **Deprecated.** Fired whenever the [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#Value\|DoubleConstrainedValue.Value]] of the [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue\|DoubleConstrainedValue]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ConstrainedValue

> [!warning] Deprecated
> The `Class.DoubleConstrainedValue` object has been deprecated as
> developers can now use the `Library.math.clamp()` function to constrain
> values.

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Tags:** `Hidden`, `NotReplicated`

### MaxValue

> [!warning] Deprecated
> The `Class.DoubleConstrainedValue` object has been deprecated as
> developers can now use the `Library.math.clamp()` function to constrain
> values.

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The highest number that the [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#Value|DoubleConstrainedValue.Value]] property can be.

### MinValue

> [!warning] Deprecated
> The `Class.DoubleConstrainedValue` object has been deprecated as
> developers can now use the `Library.math.clamp()` function to constrain
> values.

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The lowest number that the [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#Value|DoubleConstrainedValue.Value]] property can be.

### Value

> [!warning] Deprecated
> The `Class.DoubleConstrainedValue` object has been deprecated as
> developers can now use the `Library.math.clamp()` function to constrain
> values.

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

Used to hold a number value between [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#MinValue|DoubleConstrainedValue.MinValue]] and [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#MaxValue|DoubleConstrainedValue.MaxValue]].

## Events

### Changed

> [!warning] Deprecated
> The `Class.DoubleConstrainedValue` object has been deprecated as
> developers can now use the `Library.math.clamp()` function to constrain
> values.

```lua
DoubleConstrainedValue.Changed(value: double)
```

Fired whenever the [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue#Value|DoubleConstrainedValue.Value]] of the [[30 Official Roblox Docs/API Reference/Classes/DoubleConstrainedValue|DoubleConstrainedValue]] is changed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | double |  |  |

*Code samples for this member (`DoubleConstrainedValue-Changed1`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This event is a deprecated variant of
> `Class.DoubleConstrainedValue.Changed` which has also been deprecated.
> Neither event should be used in new work.

```lua
DoubleConstrainedValue.changed(value: double)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | double |  |  |

---
*Source: [DoubleConstrainedValue](https://create.roblox.com/docs/reference/engine/classes/DoubleConstrainedValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
