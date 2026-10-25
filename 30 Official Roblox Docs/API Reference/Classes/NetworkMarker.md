---
title: "NetworkMarker"
description: "The NetworkMarker is used to tell the client when the server has finished loading the world for the client."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/NetworkMarker"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The NetworkMarker is used to tell the client when the server has finished loading the world for the client.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

The NetworkMarker is used to tell the client when the server has finished loading the world for the client.

## Summary

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkMarker#Received\|Received]] |  | Fired when the server has finished replicating the world to the client. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Events

### Received

```lua
NetworkMarker.Received()
```

**Capabilities:** Network

Fired when the server has finished replicating the world to the client.

---
*Source: [NetworkMarker](https://create.roblox.com/docs/reference/engine/classes/NetworkMarker) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
