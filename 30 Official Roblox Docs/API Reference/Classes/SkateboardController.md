---
title: "SkateboardController"
description: "Translates player input into throttle and steer axis values for a `SkateboardPlatform`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SkateboardController"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Translates player input into throttle and steer axis values for a [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform|SkateboardPlatform]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Controller|Controller]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A SkateboardController is an object responsible for translating PlayerActions to movements with a [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform|SkateboardPlatform]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardController#Steer\|Steer]] | float | The direction of movement, tied to the keys A and D. Must be 1 (right), 0 (straight), or -1 (left). Will refresh back to 0 unless constantly set. |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardController#Throttle\|Throttle]] | float | The direction of movement, tied to the keys W and S. Must be an integer 1 (forward), 0 (null), or -1 (reverse). Will refresh back to 0 unless constantly set. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardController#AxisChanged\|AxisChanged]] | `axis` | Fired when any input state of the skateboard controller is updated. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Controller|Controller]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Steer

**Type:** float

**Thread safety:** ReadSafe · **Category:** Axes · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The direction of movement, tied to the keys A and D. Must be 1 (right), 0 (straight), or -1 (left). Will refresh back to 0 unless constantly set.

### Throttle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Axes · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The direction of movement, tied to the keys W and S. Must be an integer 1 (forward), 0 (null), or -1 (reverse). Will refresh back to 0 unless constantly set.

## Events

### AxisChanged

```lua
SkateboardController.AxisChanged(axis: string)
```

**Capabilities:** Basic

Fired when any input state of the skateboard controller is updated. The `axis` is fired with either `"Throttle"` if the throttle state of the skateboard was updated or `"Steer"` if the steering state of the skateboard was updated.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | string |  | A string, either `"Throttle"` or `"Steer"`, indicating which input state of the skateboard controller changed. |

---
*Source: [SkateboardController](https://create.roblox.com/docs/reference/engine/classes/SkateboardController) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
