---
title: "ServerStorage"
description: "A container whose contents are only accessible on the server. Objects descending from ServerStorage will not replicate to the client and will not be accessible from `LocalScripts`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ServerStorage"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container whose contents are only accessible on the server. Objects descending from ServerStorage will not replicate to the client and will not be accessible from [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

A container whose contents are only accessible on the server. Objects descending from ServerStorage will not replicate to the client and will not be accessible from [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]].

As ServerStorage is a service it can only be accessed using the [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#GetService|DataModel.GetService]] method.

By storing large objects such as maps in ServerStorage until they are needed, network traffic will not be used up transmitting these objects to the client when they join the game.

[[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] will not run when they are parented to ServerStorage, although [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] contained within can be accessed and ran. It is recommended developers use [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] to hold [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] they wish the server to execute.

Note that as the contents of ServerStorage can only be accessed by the server, its contents will need to be parented elsewhere (such as [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]) before clients can access them. Developers who require a container that is accessible by both the server and client are advised to use [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] instead.

*Code samples for this API (`ServerStorage-Maps`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ServerStorage); their code is not part of the open-source repo.*

---
*Source: [ServerStorage](https://create.roblox.com/docs/reference/engine/classes/ServerStorage) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
