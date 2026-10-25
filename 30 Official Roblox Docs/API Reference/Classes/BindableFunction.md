---
title: "BindableFunction"
description: "An object which allows for synchronous two-way communication between scripts on the same side of the client-server boundary. Scripts invoking a `BindableFunction` yield until the corresponding callback is found."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BindableFunction"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object which allows for synchronous two-way communication between scripts on the same side of the client-server boundary. Scripts invoking a [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]] yield until the corresponding callback is found.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **BindableFunction** object allows for synchronous two-way communication between scripts on the same side of the [[30 Official Roblox Docs/Projects/Client-server runtime|client-server]] boundary. You can use it to define a custom callback function and invoke it manually by calling [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke|BindableFunction:Invoke()]]. The code invoking the function **yields** until the corresponding callback is found, and the callback receives the arguments that you passed to [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke|Invoke()]]. If the callback was never set, the script that invokes it will not resume execution.

As an alternative for one-way communication between two scripts on the same side of the client-server boundary, consider [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] which does **not** yield for a return.

As stated, [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunctions]] do not allow for communication between the server and clients. If you are looking for this functionality, use a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] as outlined in [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote events and callbacks]].

See [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks|Bindable events and callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]].

#### Parameter Limitations

Any type of Roblox object such as an [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], or others can be passed as a parameter when a [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]] is invoked, as well as Luau types such as numbers, strings, and booleans, although you should carefully explore the [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks#Argument limitations|limitations]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke\|Invoke()]] | Tuple | Invokes the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction\|BindableFunction]] which in turn calls the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#OnInvoke\|OnInvoke]] callback, returning any values returned by the callback. |

### Callbacks

| Callback | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#OnInvoke\|OnInvoke()]] | Tuple | Callback for when the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction\|BindableFunction]] is invoked with [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke\|Invoke()]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### Invoke

```lua
BindableFunction:Invoke(arguments: Tuple): Tuple
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Invokes the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]] which in turn calls the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#OnInvoke|OnInvoke]] callback, returning any values returned by the callback. Invocations yield until the corresponding callback is found, and if the callback was never set, the script that invokes it will not resume execution.

Any type of Roblox object such as an [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], or others can be passed as a parameter to [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke|Invoke()]], as well as Luau types such as numbers, strings, and booleans, although you should carefully explore the [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks#Argument limitations|limitations]].

Only one function can be bound to [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke|Invoke()]] at a time. If you assign multiple functions, only the last one assigned will be used.

See [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks|Bindable events and callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke|Invoke()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | Values to pass to the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#OnInvoke\|OnInvoke]] callback. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Values returned from the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#OnInvoke\|OnInvoke]] callback. |

## Callbacks

### OnInvoke

```lua
BindableFunction.OnInvoke(arguments: Tuple): Tuple
```

**Thread safety:** Unsafe

This callback is called when the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunction]] is invoked with [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke|Invoke()]]. It can be set multiple times but cannot be called directly. Invocations will yield until this callback is found and, if it is never set, the script that invoked it will not resume execution.

See [[30 Official Roblox Docs/Scripting/Events/Bindable events and callbacks|Bindable events and callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#OnInvoke|OnInvoke]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | The parameters sent through [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke\|Invoke()]]. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Values returned by the callback function. |

---
*Source: [BindableFunction](https://create.roblox.com/docs/reference/engine/classes/BindableFunction) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
