---
title: "RBXScriptSignal"
description: "An object that runs connected functions upon a specific occurrence."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*An object that runs connected functions upon a specific occurrence.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal|RBXScriptSignal]] data type, more commonly known as an **Event**, provides a way for user-defined functions, called **listeners**, to call when something happens in the game. When an event happens, the [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal|RBXScriptSignal]] fires and calls any listeners that are connected to it. An [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal|RBXScriptSignal]] may also pass arguments to each listener to provide extra information about the event.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal#Connect\|Connect()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Connects the given function to the event and returns an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] that represents it. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal#ConnectParallel\|ConnectParallel()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Connects the given function to the event and returns an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] that represents it. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal#Once\|Once()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Connects the given function to the event (for a single invocation) and returns an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] that represents it. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal#Wait\|Wait()]] | Variant | Yields the current thread until the signal fires and returns the arguments provided by the signal. |

## Methods

### Connect

```lua
RBXScriptSignal:Connect(func: function): RBXScriptConnection
```

Establishes a function to be called when the event fires. Returns an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|RBXScriptConnection]] object associated with the connection.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `func` | function |  | The callback function to invoke each time the event fires. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | A connection object that can be used to disconnect the listener from the event. |

### ConnectParallel

```lua
RBXScriptSignal:ConnectParallel(func: function): RBXScriptConnection
```

Establishes a function to be called when the event fires. Returns an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|RBXScriptConnection]] object associated with the connection. When the event fires, the signal callback is executed in a desynchronized state. Using `ConnectParallel` is similar to, but more efficient than, using `Connect` followed by a call to [[30 Official Roblox Docs/API Reference/Libraries/task#desynchronize|task.desynchronize()]] in the signal handler.

Note: Scripts that connect in parallel must be rooted under an Actor.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `func` | function |  | The callback function to invoke when the event fires in a parallel execution context. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | A connection object that can be used to disconnect the listener from the event. |

### Once

```lua
RBXScriptSignal:Once(func: function): RBXScriptConnection
```

Establishes a function to be called when the event fires. Returns an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|RBXScriptConnection]] object associated with the connection. The behavior of `Once` is similar to `Connect`. However, instead of allowing multiple events to be received by the specified function, only the first event will be delivered. Using `Once` also ensures that the connection to the function will be automatically disconnected prior the function being called.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `func` | function |  | The callback function to invoke the next time the event fires, after which it is automatically disconnected. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | A connection object that can be used to disconnect the listener before it fires. |

### Wait

```lua
RBXScriptSignal:Wait(): Variant
```

Yields the current thread until the signal fires and returns the arguments provided by the signal.

**Returns**

| Type | Description |
| --- | --- |
| Variant | The arguments passed by the signal when it fires. |

---
*Source: [RBXScriptSignal](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
