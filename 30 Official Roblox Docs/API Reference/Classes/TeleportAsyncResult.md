---
title: "TeleportAsyncResult"
description: "The return structure of the `TeleportAsync` function call."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TeleportAsyncResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The return structure of the `TeleportAsync` function call.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

This class is an instance that is returned by the `TeleportAsync` function with information about the teleport.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportAsyncResult#PrivateServerId\|PrivateServerId]] | string | The private server ID of the reserved server that the players are being teleported to. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportAsyncResult#ReservedServerAccessCode\|ReservedServerAccessCode]] | string | The access code of the reserved server that the players are being teleported to. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### PrivateServerId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Teleport · **Tags:** `ReadOnly`, `NotReplicated`

The private server ID of the reserved server that the players are being teleported to. This field is populated only if the teleport is to a reserved server.

This field is not the same as the private server ID of the server that initiated the teleport, please see: [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId|DataModel.PrivateServerId]]

See also:

For more information on how to teleport players between servers, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleporting Between Places]].

### ReservedServerAccessCode

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Teleport · **Tags:** `ReadOnly`, `NotReplicated`

The access code of the reserved server that the players are being teleported to. This field is populated only if the teleport is to a reserved server. This allows developers to perform subsequent teleports to this same reserved server.

For more information on how to teleport players between servers, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleporting Between Places]].

---
*Source: [TeleportAsyncResult](https://create.roblox.com/docs/reference/engine/classes/TeleportAsyncResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
