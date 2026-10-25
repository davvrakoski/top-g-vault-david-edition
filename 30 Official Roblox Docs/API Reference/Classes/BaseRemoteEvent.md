---
title: "BaseRemoteEvent"
description: "Abstract base class inherited by `RemoteEvent` and `UnreliableRemoteEvent` for asynchronous, one-way communication across the client-server boundary."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BaseRemoteEvent"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Abstract base class inherited by [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] and [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]] for asynchronous, one-way communication across the client-server boundary.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]], [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

Abstract base class inherited by [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] and [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]]. It defines shared behavior for asynchronous, one-way communication across the [[30 Official Roblox Docs/Projects/Client-server runtime|client-server]] boundary without yielding for a response — from a client to the server, from the server to a specific client, or from the server to all clients.

This class isn't creatable. Use [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] for reliable, ordered delivery, or [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]] when reduced latency and network traffic matter more than guaranteed delivery. Fire and receive APIs (`FireServer`, `FireClient`, `FireAllClients`, `OnServerEvent`, `OnClientEvent`) are defined on those subclasses. If you need a return value, use a [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] instead.

---
*Source: [BaseRemoteEvent](https://create.roblox.com/docs/reference/engine/classes/BaseRemoteEvent) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
