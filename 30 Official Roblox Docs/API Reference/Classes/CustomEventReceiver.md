---
title: "CustomEventReceiver"
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CustomEventReceiver"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

> [!warning] Deprecated
> `Class.CustomEvent|CustomEvents` have been superseded by
> `Class.BindableEvent|BindableEvents` and should not be used in new work.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#Source\|Source]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Attaches the [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver\|CustomEventReceiver]] object to a [[30 Official Roblox Docs/API Reference/Classes/CustomEvent\|CustomEvent]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#GetCurrentValue\|GetCurrentValue()]] | float | **Deprecated.** Returns the current value of the receiver's [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#Source\|CustomEventReceiver.Source]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#EventConnected\|EventConnected]] | `event` | **Deprecated.** Fires when the receiver is attached to a different [[30 Official Roblox Docs/API Reference/Classes/CustomEvent\|CustomEvent]], when the [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#Source\|CustomEventReceiver.Source]] property is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#EventDisconnected\|EventDisconnected]] | `event` | **Deprecated.** Fires when the receiver is attached to a different [[30 Official Roblox Docs/API Reference/Classes/CustomEvent\|CustomEvent]] instance when the [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#Source\|CustomEventReceiver.Source]] property is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#SourceValueChanged\|SourceValueChanged]] | `newValue` | **Deprecated.** Fires when the value of the CustomEvent's source is changed, passing the CustomEvent's new value. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Source

> [!warning] Deprecated
> `Class.CustomEvent|CustomEvents` have been superseded by
> `Class.BindableEvent|BindableEvents` and should not be used in new work.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

This property attaches the [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver|CustomEventReceiver]] object to a [[30 Official Roblox Docs/API Reference/Classes/CustomEvent|CustomEvent]].

## Methods

### GetCurrentValue

> [!warning] Deprecated
> `Class.CustomEvent|CustomEvents` have been superseded by
> `Class.BindableEvent|BindableEvents` and should not be used in new work.

```lua
CustomEventReceiver:GetCurrentValue(): float
```

**Thread safety:** Unsafe

This function returns the current value of the receiver's [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#Source|CustomEventReceiver.Source]] property.

**Returns**

| Type | Description |
| --- | --- |
| float |  |

## Events

### EventConnected

> [!warning] Deprecated
> `Class.CustomEvent|CustomEvents` have been superseded by
> `Class.BindableEvent|BindableEvents` and should not be used in new work.

```lua
CustomEventReceiver.EventConnected(event: Instance)
```

This event fires when the receiver is attached to a different [[30 Official Roblox Docs/API Reference/Classes/CustomEvent|CustomEvent]], when the [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#Source|CustomEventReceiver.Source]] property is changed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `event` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

### EventDisconnected

> [!warning] Deprecated
> `Class.CustomEvent|CustomEvents` have been superseded by
> `Class.BindableEvent|BindableEvents` and should not be used in new work.

```lua
CustomEventReceiver.EventDisconnected(event: Instance)
```

This event fires when the receiver is attached to a different [[30 Official Roblox Docs/API Reference/Classes/CustomEvent|CustomEvent]], when the [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#Source|CustomEventReceiver.Source]] property is changed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `event` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

### SourceValueChanged

> [!warning] Deprecated
> `Class.CustomEvent|CustomEvents` have been superseded by
> `Class.BindableEvent|BindableEvents` and should not be used in new work.

```lua
CustomEventReceiver.SourceValueChanged(newValue: float)
```

Fires when the value of the CustomEvent's source is changed, passing the CustomEvent's new value.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `newValue` | float |  |  |

---
*Source: [CustomEventReceiver](https://create.roblox.com/docs/reference/engine/classes/CustomEventReceiver) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
