---
title: "StringValue"
description: "A container object for a single string."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StringValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object for a single string.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Stores a single [Luau string](https://luau.org/syntax#string-literals). The length of the string can't be more than 200,000 characters; anything longer causes a `String too long` error.

If the string is too long to be displayed in the **Value** field within the **Properties** window, it shows partial string contents and an ellipsis (...).

Like all [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] objects, this single value is stored in the [[30 Official Roblox Docs/API Reference/Classes/StringValue#Value|Value]] property. The `Changed` event fires with the new value being stored in the object, instead of a string representing the property being changed.

*Code samples for this API (`Changed-Event`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/StringValue); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StringValue#Value\|Value]] | string | The stored string. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StringValue#Changed\|Changed]] | `value` | Fires whenever [[30 Official Roblox Docs/API Reference/Classes/StringValue#Value\|StringValue.Value]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/StringValue#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The stored [[30 Official Roblox Docs/Luau/Strings|string]].

## Events

### Changed

```lua
StringValue.Changed(value: string)
```

Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/IntValue#Value|IntValue.Value]] changes. It runs with the new value being stored in the argument object, instead of a string representing the property being changed.

Listening for the `Changed` signal can be useful in games that use `StringValues` to track values like NPC names or item descriptions.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | string |  | The new value after the change. |

*Code samples for this member (`how-to-use-stringvalue-changed`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This deprecated event is a variant of `Class.StringValue.Changed` which
> should be used instead.

```lua
StringValue.changed(value: string)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | string |  |  |

---
*Source: [StringValue](https://create.roblox.com/docs/reference/engine/classes/StringValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
