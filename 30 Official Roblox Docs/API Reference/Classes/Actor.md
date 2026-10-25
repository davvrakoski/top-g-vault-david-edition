---
title: "Actor"
description: "An `Actor` is a container for code that can be safely split into its own thread."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Actor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] is a container for code that can be safely split into its own thread.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

An [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] is a container for code that can be safely split into its own thread using [[30 Official Roblox Docs/API Reference/Libraries/task#desynchronize|task.desynchronize()]]. It should also contain the instances used by its scripts.

To learn more about using multiple Actors to optimize script performance, see [[30 Official Roblox Docs/Scripting/Parallel Luau|Parallel Luau]].

#### Notes

- Each `Actor` runs in its own Luau VM. [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] required by an `Actor` are **not** shared or cached across `Actors` or with the main thread. Each VM executes its own copy of the module, so module-level state is isolated per `Actor`. Design accordingly if your modules hold state you intend to share.
- `script:GetActor()` returns `nil` when called from a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] unless the `ModuleScript` is a descendant of the `Actor`. `ModuleScripts` stored elsewhere (for example, [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]) and required by an `Actor` are not considered descendants of the `Actor`.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Actor#BindToMessage\|BindToMessage()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Binds a Luau callback to a message with the specified topic. |
| [[30 Official Roblox Docs/API Reference/Classes/Actor#BindToMessageParallel\|BindToMessageParallel()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Binds a Luau callback to a message with the specified topic. |
| [[30 Official Roblox Docs/API Reference/Classes/Actor#SendMessage\|SendMessage()]] | () | Sends a message to an Actor. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### BindToMessage

```lua
Actor:BindToMessage(topic: string, function: Function): RBXScriptConnection
```

**Thread safety:** Safe · **Capabilities:** Basic

This method is used to bind a Luau callback to a message with the specified topic. When a message is sent (using [[30 Official Roblox Docs/API Reference/Classes/Actor#SendMessage|SendMessage()]]) to the topic specified the provided callback will be called in a _serial_ execution context.

Multiple Luau callbacks may be bound to a single actor and even to a single message topic.

Note: Only the scripts which are descendants of an Actor may bind to its messages.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `topic` | string |  | The topic used to identify the type of message. |
| `function` | Function |  | The Luau callback to invoke when a message with the specified topic is received. The callback receives the message contents as its arguments. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | This connection object may be used to disconnect the Luau callback from receiving messages. |

*Code samples for this member (`Actor-BindToMessage`) are published on the source page; their code is not part of the open-source repo.*

### BindToMessageParallel

```lua
Actor:BindToMessageParallel(topic: string, function: Function): RBXScriptConnection
```

**Thread safety:** Safe · **Capabilities:** Basic

This method is used to bind a Luau callback to a message with the specified topic. When a message is sent (using [[30 Official Roblox Docs/API Reference/Classes/Actor#SendMessage|SendMessage()]]) to the topic specified the provided callback will be called in a _parallel_ execution context.

Multiple Luau callbacks may be bound to a single actor and even to a single message topic.

Note: Only the scripts which are descendants of an Actor may bind to its messages.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `topic` | string |  | The topic used to identify the type of message. |
| `function` | Function |  | The Luau callback to invoke when a message with the specified topic is received. The callback receives the message contents as its arguments. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | This connection object may be used to disconnect the Luau callback from receiving messages. |

*Code samples for this member (`Actor-BindToMessageParallel`) are published on the source page; their code is not part of the open-source repo.*

### SendMessage

```lua
Actor:SendMessage(topic: string, message: Tuple): ()
```

**Thread safety:** Safe · **Capabilities:** Basic

Sends a message to an Actor. Messages are sent asynchronously, so the sender will not block or yield when calling the [[30 Official Roblox Docs/API Reference/Classes/Actor#SendMessage|SendMessage()]] method.

Since a single Actor may receive different kinds of messages, a `topic` parameter is used to distinguish between various kinds of messages.

See [[30 Official Roblox Docs/API Reference/Classes/Actor#BindToMessage|BindToMessage()]] for details on receiving a message sent using [[30 Official Roblox Docs/API Reference/Classes/Actor#SendMessage|SendMessage()]].

Note that message arguments are **passed by copy** across Luau VM boundaries, not by reference. Sending large tables incurs a full copy on each call. Functions are bound to a specific VM and cannot be passed in messages.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `topic` | string |  | The topic used to identify the message being sent. |
| `message` | Tuple |  | The contents of the message to send to the Actor. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Actor-SendMessage`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Actor](https://create.roblox.com/docs/reference/engine/classes/Actor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
