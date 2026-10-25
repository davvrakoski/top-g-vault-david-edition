---
title: "IntConstrainedValue"
description: "An IntConstrainedValue is used to store a value which can never be less than MinValue and can never be more than MaxValue."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/IntConstrainedValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An IntConstrainedValue is used to store a value which can never be less than MinValue and can never be more than MaxValue.*

> [!warning] Deprecated
> The IntConstrainedValue object has been deprecated as developers can now use
> the `Library.math.clamp()` function to constrain values.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

An IntConstrainedValue is used to store a value which can never be less than MinValue and can never be more than MaxValue.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#ConstrainedValue\|ConstrainedValue]] | int64 | **Deprecated.** Hold an `Integer` value between [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#MinValue\|IntConstrainedValue.MinValue]] and [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#MaxValue\|IntConstrainedValue.MaxValue]]. Replaced by [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#Value\|IntConstrainedValue.Value]], but still functional. |
| [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#MaxValue\|MaxValue]] | int64 | **Deprecated.** The highest number that the [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#Value\|IntConstrainedValue.Value]] property can be. |
| [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#MinValue\|MinValue]] | int64 | **Deprecated.** The lowest number that the [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#Value\|IntConstrainedValue.Value]] property can be. |
| [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#Value\|Value]] | int64 | **Deprecated.** Used to hold an integer value between [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#MinValue\|IntConstrainedValue.MinValue]] and [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#MaxValue\|IntConstrainedValue.MaxValue]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#Changed\|Changed]] | `value` | **Deprecated.** Fired whenever the Value of the IntConstrainedValue is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ConstrainedValue

> [!warning] Deprecated
> The IntConstrainedValue object has been deprecated as developers can now
> use the `Library.math.clamp()` function to constrain values.

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Tags:** `Hidden`, `NotReplicated`

Hold an `Integer` value between [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#MinValue|IntConstrainedValue.MinValue]] and [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#MaxValue|IntConstrainedValue.MaxValue]]. Replaced by [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#Value|IntConstrainedValue.Value]], but still functional.

### MaxValue

> [!warning] Deprecated
> The IntConstrainedValue object has been deprecated as developers can now
> use the `Library.math.clamp()` function to constrain values.

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The highest number that the [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#Value|IntConstrainedValue.Value]] property can be.

### MinValue

> [!warning] Deprecated
> The IntConstrainedValue object has been deprecated as developers can now
> use the `Library.math.clamp()` function to constrain values.

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The lowest number that the [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#Value|IntConstrainedValue.Value]] property can be.

### Value

> [!warning] Deprecated
> The IntConstrainedValue object has been deprecated as developers can now
> use the `Library.math.clamp()` function to constrain values.

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

Used to hold an integer value between [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#MinValue|IntConstrainedValue.MinValue]] and [[30 Official Roblox Docs/API Reference/Classes/IntConstrainedValue#MaxValue|IntConstrainedValue.MaxValue]].

## Events

### Changed

> [!warning] Deprecated
> The IntConstrainedValue object has been deprecated as developers can now
> use the `Library.math.clamp()` function to constrain values.

```lua
IntConstrainedValue.Changed(value: int64)
```

Fired whenever the Value of the IntConstrainedValue is changed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | int64 |  |  |

*Code samples for this member (`IntConstrainedValue-Changed1`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This deprecated event is a variant of `Class.IntConstrainedValue.Changed`
> which has also been deprecated. Neither event should be used in new work.

```lua
IntConstrainedValue.changed(value: int64)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | int64 |  |  |

---
*Source: [IntConstrainedValue](https://create.roblox.com/docs/reference/engine/classes/IntConstrainedValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
