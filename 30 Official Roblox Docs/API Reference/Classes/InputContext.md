---
title: "InputContext"
description: "Collection of actions which holds related actions and defines how they interact with other contexts/actions."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/InputContext"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Collection of actions which holds related actions and defines how they interact with other contexts/actions.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An `InputContext` is a collection of actions which holds related [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputActions]] and defines how they interact with other contexts and actions. Nested `InputContext` instances will have no effect and ordering/priority is managed through [[30 Official Roblox Docs/API Reference/Classes/InputContext#Enabled|Enabled]], [[30 Official Roblox Docs/API Reference/Classes/InputContext#Priority|Priority]], and [[30 Official Roblox Docs/API Reference/Classes/InputContext#Sink|Sink]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputContext#Enabled\|Enabled]] | boolean | Determines if this `InputContext` is enabled or not. |
| [[30 Official Roblox Docs/API Reference/Classes/InputContext#Priority\|Priority]] | int | The priority level at which the context should be run. |
| [[30 Official Roblox Docs/API Reference/Classes/InputContext#Sink\|Sink]] | boolean | Determines whether input bindings of lower priority will be processed. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Determines if this `InputContext` is enabled or not. When `false`, all of the descendant actions of the context do not receive any signals except when `Enabled` is toggled from `true` to `false`, in which case a final "end" signal is triggered if a key is pressed or a two-directional input is not zero.

### Priority

**Type:** int

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

The priority level at which the context should be run (higher priority `InputContext` instances run before lower ones).

### Sink

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

When `Sink` is set to `true`, inputs will not be processed for connected [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] bindings within contexts of lower [[30 Official Roblox Docs/API Reference/Classes/InputContext#Priority|Priority]]. Contexts with the same priority will receive the input.

For example, if multiple contexts contain an [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] with a binding to [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.E]] and a higher priority context has `Sink` set to `true`, the lower priority contexts will not receive the input signal for [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.E]] and will fire no events for it.

---
*Source: [InputContext](https://create.roblox.com/docs/reference/engine/classes/InputContext) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
