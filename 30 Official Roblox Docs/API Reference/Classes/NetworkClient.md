---
title: "NetworkClient"
description: "A service that manages a network connection's properties server."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/NetworkClient"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that manages a network connection's properties server.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/NetworkPeer|NetworkPeer]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

This service is responsible for connecting a client to a server.

## Summary

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkClient#ConnectionAccepted\|ConnectionAccepted]] | `peer`, `replicator` | Fired when the client successfully connects to a server. Returns a string showing the server's IP and port, and the client's [[30 Official Roblox Docs/API Reference/Classes/ClientReplicator\|ClientReplicator]]. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkClient#ConnectionFailed\|ConnectionFailed]] | `peer`, `code` | Fired if the client fails to connect to the server. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/NetworkPeer|NetworkPeer]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Events

### ConnectionAccepted

```lua
NetworkClient.ConnectionAccepted(peer: string, replicator: Instance)
```

**Capabilities:** Network

Fired when the client successfully connects to a server. Returns a string showing the server's IP and Port, and the client's [[30 Official Roblox Docs/API Reference/Classes/ClientReplicator|ClientReplicator]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `peer` | string |  | The server's IP and port. |
| `replicator` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The client's [[30 Official Roblox Docs/API Reference/Classes/ClientReplicator\|ClientReplicator]]. |

### ConnectionFailed

```lua
NetworkClient.ConnectionFailed(peer: string, code: int)
```

**Capabilities:** Network

Fired if the client fails to connect to the server.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `peer` | string |  | The server's IP and port. |
| `code` | int |  | The error code representing why the client failed to connect. |

---
*Source: [NetworkClient](https://create.roblox.com/docs/reference/engine/classes/NetworkClient) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
