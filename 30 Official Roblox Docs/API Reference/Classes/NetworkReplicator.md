---
title: "NetworkReplicator"
description: "An object which handles the replication of other objects either from the server to the client, or from the client to the server."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/NetworkReplicator"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object which handles the replication of other objects either from the server to the client, or from the client to the server.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/ClientReplicator|ClientReplicator]], [[30 Official Roblox Docs/API Reference/Classes/ServerReplicator|ServerReplicator]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Each `NetworkReplicator` corresponds to a single network connection between two peers and serializes, transmits, receives, and applies the stream of data model changes (new instances, property and attribute changes, event invocations, and instance removals) that keeps those peers in sync. It is the base class for the two concrete replicators: a [[30 Official Roblox Docs/API Reference/Classes/ServerReplicator|ServerReplicator]] runs on the server and replicates between the server and the connected client, while a [[30 Official Roblox Docs/API Reference/Classes/ClientReplicator|ClientReplicator]] runs on a client and replicates between that client and the server. A `NetworkReplicator` is created and managed by the engine automatically as clients connect and disconnect, and is not instantiated or manipulated by creator scripts.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkReplicator#GetPlayer\|GetPlayer()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns the player that is connected to the NetworkReplicator. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetPlayer

```lua
NetworkReplicator:GetPlayer(): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Network, Players

Returns the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] associated with the connection that this `NetworkReplicator` serves. On a [[30 Official Roblox Docs/API Reference/Classes/ServerReplicator|ServerReplicator]], this is the remote client's player; on a [[30 Official Roblox Docs/API Reference/Classes/ClientReplicator|ClientReplicator]] it is the local player. Returns `nil` if the replicator has no target player, such as before the connection has been assigned a player or after it has been torn down.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] associated with this `NetworkReplicator` connection, or `nil` if the replicator has no target player. |

---
*Source: [NetworkReplicator](https://create.roblox.com/docs/reference/engine/classes/NetworkReplicator) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
