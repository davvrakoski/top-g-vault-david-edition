---
title: "RayValue"
description: "A container object for a single Ray."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RayValue"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object for a single Ray.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A RayValue is an object whose purpose is to store a single Ray. Similar to CFrameValue, a RayValue's stored ray cannot be viewed or edited within the Properties window within studio. Instead, use the Command bar to get and set the value of these objects. For example, you can use a line like the one below to create a new RayValue named "Value" within the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. It creates a ray at (0, 50, 0) and it faces in the positive-X direction.

`Instance.new("RayValue").Value = Ray.new(Vector3.new(0, 50, 0), Vector3.new(10, 0, 0))`

Since there is no trivial way to edit rays within Studio, sometimes it is better to use a CFrameValue instead (which can be changed through a part or the camera). You can reconstruct a ray from a CFrame using `Ray.new(cf.p, cf.lookVector * dist)`, where `cf` is a given CFrame and `dist` is the length of the Ray you want to construct.

Like all "-Value" objects, this single value is stored in the Value property. The Changed event for this (and other objects like it) will fire with the new value being stored in the object, instead of a string representing the property being changed.

*Code samples for this API (`Rays-RayValue-and-Raycasting`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/RayValue); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RayValue#Value\|Value]] | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] | The stored Ray. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RayValue#Changed\|Changed]] | `value` | Fired when [[30 Official Roblox Docs/API Reference/Classes/RayValue#Value\|RayValue.Value]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/RayValue#Changed\|changed]] | `value` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The stored Ray.

## Events

### Changed

```lua
RayValue.Changed(value: Ray)
```

This event fires whenever the [[30 Official Roblox Docs/API Reference/Classes/RayValue#Value|RayValue.Value]] property is changed. It will run with the new value being stored in the argument object, instead of a string representing the property being changed.

This event, like other changed events, can be used to track when an RayValue changes and to track the different values that it may change to.

Equivalent changed events exist for similar objects, such as [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] and [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]], depending on what object type best suits the need.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] |  | The value after the change. |

*Code samples for this member (`how-to-use-rayvalue-changed`) are published on the source page; their code is not part of the open-source repo.*

### changed

> [!warning] Deprecated
> This event is a deprecated variant of `Class.RayValue.Changed` which
> should be used instead.

```lua
RayValue.changed(value: Ray)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] |  |  |

---
*Source: [RayValue](https://create.roblox.com/docs/reference/engine/classes/RayValue) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
