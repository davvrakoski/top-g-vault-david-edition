---
title: "ReplicatedFirst"
description: "A container whose contents are replicated to all clients (but not back to the server) first before anything else."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ReplicatedFirst"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container whose contents are replicated to all clients (but not back to the server) first before anything else.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`ReplicatedFirst` is a container whose contents are replicated to all clients (but not back to the server) before anything else. It's most commonly used to store [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] and other elements that are essential for the experience's start such as [[30 Official Roblox Docs/Players/Loading screens|loading screens]].

For objects that do **not** need to be replicated before anything else, use the [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] container instead.

There are some key considerations for running [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] in `ReplicatedFirst`:

- Since its contents replicate before anything else in the experience, [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] running in `ReplicatedFirst` will need to wait for any objects they require to replicate using [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|Instance:WaitForChild()]]
- Any objects that are to be used by a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] in `ReplicatedFirst` should also be parented to `ReplicatedFirst`. Otherwise, they may replicate to the client late, yielding the script and negating the benefit of initial replication.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst#RemoveDefaultLoadingScreen\|RemoveDefaultLoadingScreen()]] | () | Immediately removes the default Roblox loading screen. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### RemoveDefaultLoadingScreen

```lua
ReplicatedFirst:RemoveDefaultLoadingScreen(): ()
```

**Thread safety:** Unsafe

Immediately removes the default Roblox loading screen. Note that if any object has been placed in `ReplicatedFirst`, the default loading screen will be removed after a few seconds regardless if this method has been called or not.

You should **not** remove the default loading screen unless you want to display your own. If you remove the default screen without a replacement, players will be able to see geometry loading in the background.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [ReplicatedFirst](https://create.roblox.com/docs/reference/engine/classes/ReplicatedFirst) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
