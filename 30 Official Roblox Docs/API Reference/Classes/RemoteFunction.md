---
title: "RemoteFunction"
description: "An object which facilitates synchronous, two-way communication across the client-server boundary. Scripts invoking a `RemoteFunction` yield until they receive a response from the recipient."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RemoteFunction"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object which facilitates synchronous, two-way communication across the client-server boundary. Scripts invoking a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] yield until they receive a response from the recipient.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **RemoteFunction** object facilitates synchronous, two-way communication across the [[30 Official Roblox Docs/Projects/Client-server runtime|client-server]] boundary. You can use it to define a custom callback function and invoke it manually by calling [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeClient|RemoteFunction:InvokeClient()]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer|RemoteFunction:InvokeServer()]]. The code invoking the function **yields** until it receives a response from the recipient.

In order for both the server and clients to access a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] instance, it must be in a place where both sides can see it, such as [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], although in some cases it's appropriate to store it in [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or inside a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]].

If the result is **not** needed, it is recommended that you use a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] instead, since its call is asynchronous and doesn't need to wait for a response to continue execution. See [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote Events and Callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]].

#### Streaming Precautions

Note that if an invoked [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] creates an instance on the server, there is no guarantee that it exists on the client when the function returns. This is particularly important in places where instance [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|streaming]] is enabled and when the created instances are [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] or [[30 Official Roblox Docs/API Reference/Classes/Model|Models]], since parts that are far away from the player's character may not be streamed to the client, and models that are [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Atomic]] depend on whether their parts are streamed. Even if a model is [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Persistent]], there may be some delay between the creation of the model and when it is replicated to the client.

#### Parameter Limitations

Any type of Roblox object such as an [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], or others can be passed as a parameter when a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] is invoked, as well as Luau types such as numbers, strings, and booleans, although you should carefully explore the [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Argument limitations|limitations]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeClient\|InvokeClient()]] | Tuple | Invokes the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction\|RemoteFunction]] which in turn calls the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnClientInvoke\|OnClientInvoke]] callback. |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer\|InvokeServer()]] | Tuple | Invokes the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction\|RemoteFunction]] which in turn calls the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnServerInvoke\|OnServerInvoke]] callback. |

### Callbacks

| Callback | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnClientInvoke\|OnClientInvoke()]] | Tuple | Callback for when the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction\|RemoteFunction]] is invoked with [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeClient\|InvokeClient()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnServerInvoke\|OnServerInvoke()]] | Tuple | Callback for when the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction\|RemoteFunction]] is invoked with [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer\|InvokeServer()]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### InvokeClient

```lua
RemoteFunction:InvokeClient(player: Player, arguments: Tuple): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** RemoteEvent · **Tags:** `Yields`

Invokes the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] which in turn calls the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnClientInvoke|OnClientInvoke]] callback. Since this method is used to communicate from the server to a client, it will only work when used in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

Any type of Roblox object such as an [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], or others can be passed as a parameter to [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeClient|InvokeClient()]], as well as Luau types such as numbers, strings, and booleans, although you should carefully explore the [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Argument limitations|limitations]].

See [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote Events and Callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]].

#### Warning

In practice, the server does not often invoke the client, as clients typically do not have information that the server doesn't have, and actions that only a client can take, such as displaying a GUI, typically do not require a callback. As such, [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient|RemoteEvent:FireClient()]] is recommended as an asynchronous method that doesn't need to wait for a response to continue execution.

If you legitimately need to invoke a client from the server, note the following risks:

- If the client throws an error, the server throws the error too.
- If the client disconnects while it's being invoked, [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeClient|InvokeClient()]] throws an error.
- If the client doesn't return a value, the server yields forever.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] associated with the client to invoke. |
| `arguments` | Tuple |  | Values to pass to the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnClientInvoke\|OnClientInvoke]] callback. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Values returned from the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnClientInvoke\|OnClientInvoke]] callback. |

### InvokeServer

```lua
RemoteFunction:InvokeServer(arguments: Tuple): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** RemoteEvent · **Tags:** `Yields`

Invokes the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] which in turn calls the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnServerInvoke|OnServerInvoke]] callback. Since this method is used to communicate from a client to the server, it will only work when used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

If a returned result is not needed, it's recommended to use [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer|RemoteEvent:FireServer()]] instead, as its call is asynchronous and doesn't need to wait for a response to continue execution.

Any type of Roblox object such as an [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], or others can be passed as a parameter to [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer|InvokeServer()]], as well as Luau types such as numbers, strings, and booleans, although you should carefully explore the [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Argument limitations|limitations]].

See [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote Events and Callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | Values to pass to the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnServerInvoke\|OnServerInvoke]] callback. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Values returned from the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnServerInvoke\|OnServerInvoke]] callback. |

## Callbacks

### OnClientInvoke

```lua
RemoteFunction.OnClientInvoke(arguments: Tuple): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** RemoteEvent

This callback is called when the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] is invoked with [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeClient|InvokeClient()]]. When the bound function returns, the returned values are sent back to the calling server.

See [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote Events and Callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnClientInvoke|OnClientInvoke]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | The parameters sent through [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeClient\|InvokeClient()]]. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Values returned by the callback function. |

### OnServerInvoke

```lua
RemoteFunction.OnServerInvoke(player: Player, arguments: Tuple): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** RemoteEvent

This callback is called when the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] is invoked with [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer|InvokeServer()]]. When the bound function returns, the returned values are sent back to the calling client.

See [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote Events and Callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#OnServerInvoke|OnServerInvoke]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] associated with the client that the [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer\|InvokeServer()]] call originates from. |
| `arguments` | Tuple |  | The parameters sent through [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer\|InvokeServer()]]. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Values returned by the callback function. |

---
*Source: [RemoteFunction](https://create.roblox.com/docs/reference/engine/classes/RemoteFunction) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
