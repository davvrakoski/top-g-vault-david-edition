---
title: "RemoteEvent"
description: "An object which facilitates asynchronous, one-way communication across the client-server boundary. Scripts firing a `RemoteEvent` do not yield."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RemoteEvent"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object which facilitates asynchronous, one-way communication across the client-server boundary. Scripts firing a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] do not yield.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BaseRemoteEvent|BaseRemoteEvent]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **RemoteEvent** object facilitates asynchronous, one-way communication across the [[30 Official Roblox Docs/Projects/Client-server runtime|client-server]] boundary without yielding for a response. This communication can be directed from one client to the server, from the server to a specific client, or from the server to all clients.

In order for both the server and clients to access a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] instance, it must be in a place where both sides can see it, such as [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], although in some cases it's appropriate to store it in [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or inside a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]].

If no connected listener exists to handle an event, you might see a `Remote event invocation discarded` error in the log to indicate that the event was discarded and that you need to implement either `OnClientEvent` or `OnServerEvent`. Unlike [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvents]], [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvents]] buffer a large number of events before throwing this error.

If you need the result of the call, you should use a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] instead. Otherwise a remote event is recommended since it will minimize network traffic/latency and won't yield the script to wait for a response.

See [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote events and callbacks]] for code samples and further details.

#### Throttling

Remote events are subject to rate limits when sent from the client to the server with the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer|FireServer()]] method. [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvents]] and [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvents]] both have a limit of approximately 500 requests per second, per client. This limit is **shared among all remote events of the same type**. To avoid throttling and latency issues, limit recurring remote events whenever possible.

#### Parameter limitations

Any type of Roblox object ([[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], etc.) can be passed as a parameter when a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] is fired, as well as Luau types such as numbers, strings, and booleans, although you should carefully explore the [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Argument limitations|limitations]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireAllClients\|FireAllClients()]] | () | Fires the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent\|OnClientEvent]] event for each connected client. |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient\|FireClient()]] | () | Fires the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent\|OnClientEvent]] event for a specific client. |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer\|FireServer()]] | () | Fires the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnServerEvent\|OnServerEvent]] event on the server from one connected client. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent\|OnClientEvent]] | `arguments` | Fires from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]] when either [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient\|FireClient()]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireAllClients\|FireAllClients()]] is called on the same [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent\|RemoteEvent]] instance from a [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnServerEvent\|OnServerEvent]] | `player`, `arguments` | Fires from a [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]] when [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer\|FireServer()]] is called on the same [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent\|RemoteEvent]] instance from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BaseRemoteEvent|BaseRemoteEvent]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### FireAllClients

```lua
RemoteEvent:FireAllClients(arguments: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** RemoteEvent

Fires the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent|OnClientEvent]] event for each connected client. Unlike [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient|FireClient()]], this event does not take a target [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] as the first argument, since it fires to multiple clients. Since this method is used to communicate from the server to clients, it only works when used in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | Values to pass to all [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent\|OnClientEvent]] events connected to the same [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent\|RemoteEvent]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FireClient

```lua
RemoteEvent:FireClient(player: Player, arguments: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** RemoteEvent

Fires the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent|OnClientEvent]] event for the specific client in the required [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] argument. Since this method is used to communicate from the server to a client, it only works when used in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The client of the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to fire the event to. |
| `arguments` | Tuple |  | Values to pass to [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent\|OnClientEvent]] events connected to the same [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent\|RemoteEvent]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FireServer

```lua
RemoteEvent:FireServer(arguments: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** RemoteEvent

Fires the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnServerEvent|OnServerEvent]] event on the server from one client. Connected events receive the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] argument of the firing client. Since this method is used to communicate from a client to the server, it only works when used in a client script.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | Values to pass to [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnServerEvent\|OnServerEvent]] events connected to the same [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent\|RemoteEvent]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### OnClientEvent

```lua
RemoteEvent.OnClientEvent(arguments: Tuple)
```

**Capabilities:** RemoteEvent

Fires from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] when either [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient|FireClient()]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireAllClients|FireAllClients()]] is called on the same [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] instance from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

See [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote Events and Callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnClientEvent|OnClientEvent]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | The parameters sent through [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireClient\|FireClient()]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireAllClients\|FireAllClients()]]. |

### OnServerEvent

```lua
RemoteEvent.OnServerEvent(player: Player, arguments: Tuple)
```

**Capabilities:** RemoteEvent

Fires from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] when [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer|FireServer()]] is called on the same [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] instance from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

See [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote Events and Callbacks]] for code samples and further details on [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#OnServerEvent|OnServerEvent]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] associated with the client that the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer\|FireServer()]] call originates from. |
| `arguments` | Tuple |  | The parameters sent through [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer\|FireServer()]]. |

---
*Source: [RemoteEvent](https://create.roblox.com/docs/reference/engine/classes/RemoteEvent) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
