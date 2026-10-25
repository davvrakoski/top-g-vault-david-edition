---
title: "CustomEvent"
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CustomEvent"
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

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CustomEvent#GetAttachedReceivers\|GetAttachedReceivers()]] | Instances | **Deprecated.** Returns the [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver\|CustomEventReceivers]] that are connected to the [[30 Official Roblox Docs/API Reference/Classes/CustomEvent\|CustomEvent]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CustomEvent#SetValue\|SetValue()]] | () | **Deprecated.** Sets the value of the [[30 Official Roblox Docs/API Reference/Classes/CustomEvent\|CustomEvent]] and fires the [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#SourceValueChanged\|CustomEventReceiver.SourceValueChanged]] event for all connected `CustomEventReceiver\|receivers`. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CustomEvent#ReceiverConnected\|ReceiverConnected]] | `receiver` | **Deprecated.** Fires when a receiver is connected to the [[30 Official Roblox Docs/API Reference/Classes/CustomEvent\|CustomEvent]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CustomEvent#ReceiverDisconnected\|ReceiverDisconnected]] | `receiver` | **Deprecated.** Fires when a receiver is disconnected from the [[30 Official Roblox Docs/API Reference/Classes/CustomEvent\|CustomEvent]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetAttachedReceivers

> [!warning] Deprecated
> CustomEvents have been superseded by `Class.BindableEvent|BindableEvents`
> and should not be used in new work.

```lua
CustomEvent:GetAttachedReceivers(): Instances
```

**Thread safety:** Unsafe

This function returns the [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver|CustomEventReceivers]] that are connected to the [[30 Official Roblox Docs/API Reference/Classes/CustomEvent|CustomEvent]].

**Returns**

| Type | Description |
| --- | --- |
| Instances |  |

### SetValue

> [!warning] Deprecated
> `Class.CustomEvent|CustomEvents` have been superseded by
> `Class.BindableEvent|BindableEvents` and should not be used in new work.

```lua
CustomEvent:SetValue(newValue: float): ()
```

**Thread safety:** Unsafe

This function sets the value of the [[30 Official Roblox Docs/API Reference/Classes/CustomEvent|CustomEvent]] and fires the [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver#SourceValueChanged|CustomEventReceiver.SourceValueChanged]] event for all connected `CustomEventReceiver|receivers`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `newValue` | float |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### ReceiverConnected

> [!warning] Deprecated
> `Class.CustomEvent|CustomEvents` have been superseded by
> `Class.BindableEvent|BindableEvents` and should not be used in new work.

```lua
CustomEvent.ReceiverConnected(receiver: Instance)
```

This event fires when a receiver is connected to the [[30 Official Roblox Docs/API Reference/Classes/CustomEvent|CustomEvent]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `receiver` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

### ReceiverDisconnected

> [!warning] Deprecated
> `Class.CustomEvent|CustomEvents` have been superseded by
> `Class.BindableEvent|BindableEvents` and should not be used in new work.

```lua
CustomEvent.ReceiverDisconnected(receiver: Instance)
```

This event fires when a receiver is disconnected from the [[30 Official Roblox Docs/API Reference/Classes/CustomEvent|CustomEvent]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `receiver` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

---
*Source: [CustomEvent](https://create.roblox.com/docs/reference/engine/classes/CustomEvent) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
