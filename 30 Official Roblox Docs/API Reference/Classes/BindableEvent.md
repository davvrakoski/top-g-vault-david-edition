---
title: "BindableEvent"
description: "An object which enables custom events through asynchronous one-way communication between scripts on the same side of the client-server boundary. Scripts firing a `BindableEvent` do not yield."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BindableEvent"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object which enables custom events through asynchronous one-way communication between scripts on the same side of the client-server boundary. Scripts firing a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] do not yield.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **BindableEvent** object enables custom events through asynchronous one-way communication between scripts on the same side of the [[30 Official Roblox Docs/Projects/Client-server runtime|client-server]] boundary. When you fire a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] through the [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Fire|BindableEvent:Fire()]] method, the firing script does **not** yield and the target function receives the passed arguments with certain [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|limitations]]. [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvents]] create threads of each connected function, so even if one firing errors, others continue.

As an alternative for two-way communication between two scripts on the same side of the client-server boundary, consider [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]].

As stated, [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvents]] do not allow for communication between the server and clients. If you are looking for this functionality, use a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] as outlined in [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote Events and Callbacks]].

See [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks|Bindable events and callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]].

#### Parameter Limitations

Any type of Roblox object such as an [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], or others can be passed as a parameter when a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] is fired, as well as Luau types such as numbers, strings, and booleans, although you should carefully explore the [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks#Argument limitations|limitations]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Fire\|Fire()]] | () | Fires the [[30 Official Roblox Docs/API Reference/Classes/BindableEvent\|BindableEvent]] which in turn fires the [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Event\|Event]] event. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Event\|Event]] | `arguments` | Fires when any script calls the [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Fire\|Fire()]] method on the same [[30 Official Roblox Docs/API Reference/Classes/BindableEvent\|BindableEvent]] instance. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### Fire

```lua
BindableEvent:Fire(arguments: Tuple): ()
```

**Thread safety:** Safe

Fires the [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] which in turn fires the [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Event|Event]] event. This method does not yield, even if no script has connected to the event, and even if a connected function yields.

Any type of Roblox object such as an [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], or others can be passed as a parameter to [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Fire|Fire()]], as well as Luau types such as numbers, strings, and booleans, although you should carefully explore the [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks#Argument limitations|limitations]].

See [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks|Bindable events and callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Fire|Fire()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | Values to pass to [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Event\|Event]] events connected to the same [[30 Official Roblox Docs/API Reference/Classes/BindableEvent\|BindableEvent]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### Event

```lua
BindableEvent.Event(arguments: Tuple)
```

Fires when any script calls the [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Fire|Fire()]] method on the same [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] instance, using the same arguments as parameters.

See [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks|Bindable events and callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Event|Event]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | The parameters sent through [[30 Official Roblox Docs/API Reference/Classes/BindableEvent#Fire\|Fire()]]. |

---
*Source: [BindableEvent](https://create.roblox.com/docs/reference/engine/classes/BindableEvent) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
