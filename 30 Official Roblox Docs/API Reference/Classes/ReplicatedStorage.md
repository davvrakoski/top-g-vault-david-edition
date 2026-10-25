---
title: "ReplicatedStorage"
description: "A container service for objects that are replicated to all clients."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ReplicatedStorage"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container service for objects that are replicated to all clients.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

[[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] is a general container service for objects that are available to both the server and connected clients. It is ideal for [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]], [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]], [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]], and other objects that are useful to both server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] and client-side [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]].

Objects parented to this service are fully replicated to clients, and normal replication rules apply. Any changes that are made on the client persist but aren't replicated to the server. Client changes may be overwritten if the server does something that overwrites those changes.

Certain changes on the client, such as moving an object from the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] to [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], can lead to desynchronization issues (for example, physics updates not being replicated to the object).

[[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] do not run when parented to this service, even if they are [[30 Official Roblox Docs/API Reference/Classes/BaseScript#Enabled|Enabled]]; [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] have various other locations where they eventually run on a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] client such as [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]], [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]], or [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]].

Similarly, [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] do not run when parented to this service unless you change their [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext]] property from the default value of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Legacy]]. Server [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] that run on their own should be parented to [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] instead.

If a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] within this service is required by any other script, it runs as normal. Such modules typically house code that is shared by the server and client.

---
*Source: [ReplicatedStorage](https://create.roblox.com/docs/reference/engine/classes/ReplicatedStorage) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
