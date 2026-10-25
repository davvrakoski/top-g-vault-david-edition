---
title: "UnreliableRemoteEvent"
description: "An object which facilitates asynchronous, unordered and unreliable, one-way communication across the client-server boundary. Scripts firing a `UnreliableRemoteEvent` do not yield."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UnreliableRemoteEvent"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object which facilitates asynchronous, unordered and unreliable, one-way communication across the client-server boundary. Scripts firing a [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]] do not yield.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BaseRemoteEvent|BaseRemoteEvent]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **UnreliableRemoteEvent** object is a variant of the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] object. It facilitates asynchronous, unordered and unreliable, one-way communication across the [[30 Official Roblox Docs/Projects/Client-server runtime|client-server]] boundary without yielding for a response. This communication can be directed from one client to the server, from the server to a specific client, or from the server to all clients.

In order for both the server and clients to access a [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]] instance, it must be in a place where both sides can see it, such as [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], although in some cases it's appropriate to store it in [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or inside a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]].

[[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]] is best used for ephemeral events, including effects that are only relevant for a short time, or for replicating continuously changing data. These events are not resent if they are lost and they do not wait for previously fired events to arrive before being processed, potentially resulting in reduced latency and network traffic. When you need ordering and reliability, use a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] instead.

If no connected listener exists to handle an event, you might see a `Remote event invocation discarded` error in the log to indicate that the event was discarded and that you need to implement either `OnClientEvent` or `OnServerEvent`.

#### Throttling

Remote events are subject to rate limits when sent from the client to the server with the [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent#FireServer|FireServer()]] method. [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvents]] and [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvents]] both have a limit of approximately 500 requests per second, per client. This limit is **shared among all remote events of the same type**. To avoid throttling and latency issues, limit recurring remote events whenever possible.

#### Parameter limitations

Any type of Roblox object ([[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], etc.) can be passed as a parameter when an [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]] is fired, as well as Luau types such as numbers, strings, and booleans, although you should carefully explore the [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks#Argument limitations|limitations]].

Events with payloads larger than 1000 bytes are dropped. When this happens in Studio, a log message in the [[30 Official Roblox Docs/Studio/Output|Output]] window indicates the number of bytes the event went over.

Like all events, the [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]] methods encode and compress certain object types, such as buffers, which shrinks the payload size and can make it difficult to verify whether you are under the limit prior to firing the event. If you frequently reach this limit, consider whether a standard [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] is the better fit for your use case.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireAllClients\|FireAllClients()]] | () | Fires the [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnClientEvent\|OnClientEvent]] event for all connected clients. Has a 1000 byte limit to the payload of the event. Events with larger payloads are dropped. |
| [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireClient\|FireClient()]] | () | Fires the [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnClientEvent\|OnClientEvent]] event for a specific client. Has a 1000 byte limit to the payload of the event. Events with larger payloads are dropped. |
| [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireServer\|FireServer()]] | () | Fires the [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnServerEvent\|OnServerEvent]] event on the server from one connected client. Has a 1000 byte limit to the payload of the event. Events with larger payloads are dropped. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnClientEvent\|OnClientEvent]] | `arguments` | Fires from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]] when either [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireClient\|FireClient()]] or [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireAllClients\|FireAllClients()]] is called on the same [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent\|UnreliableRemoteEvent]] instance from a [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]], although this firing is not guaranteed even if one of the above methods are called. This can occur due to packet loss or to maintain optimal engine performance. |
| [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnServerEvent\|OnServerEvent]] | `player`, `arguments` | Fires from a [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]] when [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireServer\|FireServer()]] is called on the same [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent\|UnreliableRemoteEvent]] instance from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]], although this firing is not guaranteed even if the above methods is called. This can occur due to packet loss or to maintain optimal engine performance. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BaseRemoteEvent|BaseRemoteEvent]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### FireAllClients

```lua
UnreliableRemoteEvent:FireAllClients(arguments: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** RemoteEvent

Fires the [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnClientEvent|OnClientEvent]] event for all connected clients. Unlike [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireClient|FireClient()]], this event does not take a target [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] as the first argument, since it fires to multiple clients. Since this method is used to communicate from the server to clients, it only works when used in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | Values to pass to all [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnClientEvent\|OnClientEvent]] events connected to the same [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent\|UnreliableRemoteEvent]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FireClient

```lua
UnreliableRemoteEvent:FireClient(player: Player, arguments: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** RemoteEvent

Fires the [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnClientEvent|OnClientEvent]] event for the specific client in the required [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] argument. Since this method is used to communicate from the server to a client, it only works when used in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The client of the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to fire the event to. |
| `arguments` | Tuple |  | Values to pass to [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnClientEvent\|OnClientEvent]] events connected to the same [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent\|UnreliableRemoteEvent]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FireServer

```lua
UnreliableRemoteEvent:FireServer(arguments: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** RemoteEvent

Fires the [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnServerEvent|OnServerEvent]] event on the server from one connected client. Connected events receive the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] argument of the firing client. Since this method is used to communicate from a client to the server, it only works when used in a client script.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | Values to pass to [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#OnServerEvent\|OnServerEvent]] events connected to the same [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent\|UnreliableRemoteEvent]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### OnClientEvent

```lua
UnreliableRemoteEvent.OnClientEvent(arguments: Tuple)
```

**Capabilities:** RemoteEvent

Fires from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] when either [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireClient|FireClient()]] or [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireAllClients|FireAllClients()]] is called on the same [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]] instance from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], although this firing is not guaranteed even if one of the above methods are called. This can occur due to packet loss or to maintain optimal engine performance.

Also note that it is not guaranteed that the order of events will match the order of [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireClient|FireClient()]] or [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireAllClients|FireAllClients()]] calls.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `arguments` | Tuple |  | The parameters sent through [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireClient\|FireClient()]] or [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireAllClients\|FireAllClients()]]. |

### OnServerEvent

```lua
UnreliableRemoteEvent.OnServerEvent(player: Player, arguments: Tuple)
```

**Capabilities:** RemoteEvent

Fires from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] when [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireServer|FireServer()]] is called on the same [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]] instance from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], although this firing is not guaranteed even if the above methods is called. This can occur due to packet loss or to maintain optimal engine performance.

Also note that it is not guaranteed that the order of events will match the order of [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireServer|FireServer()]] calls.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] associated with the client that the [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireServer\|FireServer()]] call originates from. |
| `arguments` | Tuple |  | The parameters sent through [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent#FireServer\|FireServer()]]. |

---
*Source: [UnreliableRemoteEvent](https://create.roblox.com/docs/reference/engine/classes/UnreliableRemoteEvent) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
