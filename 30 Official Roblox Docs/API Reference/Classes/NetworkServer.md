---
title: "NetworkServer"
description: "A server-side service that manages all `NetworkReplicator` instances and handles incoming client connections."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/NetworkServer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A server-side service that manages all [[30 Official Roblox Docs/API Reference/Classes/NetworkReplicator|NetworkReplicator]] instances and handles incoming client connections.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/NetworkPeer|NetworkPeer]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

The [[30 Official Roblox Docs/API Reference/Classes/NetworkServer|NetworkServer]] stores all the [[30 Official Roblox Docs/API Reference/Classes/NetworkReplicator|NetworkReplicator]] in the game and handles all connections. [[30 Official Roblox Docs/API Reference/Classes/NetworkPeer#SetOutgoingKBPSLimit|NetworkPeer:SetOutgoingKBPSLimit()]] can be used to imitate latency while using Start Server.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkServer#EncryptStringForPlayerId\|EncryptStringForPlayerId()]] | string | Encrypts a string with the session key of the connection belonging to the player with the given `playerId`, returning the ciphertext. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/NetworkPeer|NetworkPeer]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### EncryptStringForPlayerId

```lua
NetworkServer:EncryptStringForPlayerId(toEncrypt: string, playerId: int64): string
```

**Thread safety:** Unsafe · **Capabilities:** Network

Encrypts `toEncrypt` using the per-session encryption key of the connected player whose [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] equals `playerId`, then returns the ciphertext. Only that player's client can decrypt the result.

This supports the encrypted-assets workflow: the server session-encrypts an asset encryption key for a single player, and that client decrypts and registers it through [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterSessionEncryptedAsset|ContentProvider:RegisterSessionEncryptedAsset()]] (or [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#RegisterDefaultSessionKey|ContentProvider:RegisterDefaultSessionKey()]]), so the raw key is never transmitted in plain text.

Returns an empty string when no player with the given `playerId` is currently connected.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `toEncrypt` | string |  | The plain text string to encrypt, typically an asset encryption key. |
| `playerId` | int64 |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the connected player whose session key is used to encrypt the string. |

**Returns**

| Type | Description |
| --- | --- |
| string | The session-encrypted string, or an empty string if no player with the given `playerId` is currently connected. |

---
*Source: [NetworkServer](https://create.roblox.com/docs/reference/engine/classes/NetworkServer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
