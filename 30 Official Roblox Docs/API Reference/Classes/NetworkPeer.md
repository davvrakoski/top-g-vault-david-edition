---
title: "NetworkPeer"
description: "The `NetworkPeer` object is the most basic class of the network objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/NetworkPeer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The `NetworkPeer` object is the most basic class of the network objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/NetworkClient|NetworkClient]], [[30 Official Roblox Docs/API Reference/Classes/NetworkServer|NetworkServer]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

The `NetworkPeer` object is the most basic class of the network objects.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkPeer#SetOutgoingKBPSLimit\|SetOutgoingKBPSLimit()]] | () | Sets the maximum outgoing bandwidth that Roblox can use. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### SetOutgoingKBPSLimit

```lua
NetworkPeer:SetOutgoingKBPSLimit(limit: int): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Sets the maximum outgoing bandwidth (in 1,000 bits/second) that Roblox can use.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `limit` | int |  | The maximum outgoing bandwidth, in kilobits per second (1,000 bits/second). The value is clamped to the range `10`–`10,000`; a value of `0` or less removes the limit entirely. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`NetworkPeer-SetOutgoingKBPSLimit1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [NetworkPeer](https://create.roblox.com/docs/reference/engine/classes/NetworkPeer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
