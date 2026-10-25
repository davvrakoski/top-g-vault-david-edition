---
title: "PluginConnection"
description: "Encapsulates a connection between the current data model and another for plugin communication."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginConnection"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Encapsulates a connection between the current data model and another for plugin communication.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Studio plugins run in each Studio data model that the user opens, including both edit and playtest data models. `PluginConnection` objects allow these instances of the same plugin to communicate across data model boundaries. Messages sent by [[30 Official Roblox Docs/API Reference/Classes/PluginConnection#SendMessage|PluginConnection:SendMessage()]] will be received in the remote data model via the callback the same plugin registers with [[30 Official Roblox Docs/API Reference/Classes/PluginConnection#BindToMessage|PluginConnection:BindToMessage()]]. Each `PluginConnection` object can both send and receive messages while connected, and messages will be received reliably and in order unless the connection drops (e.g. due to the remote data model shutting down) before their receipt.

Note that although multiple plugins may share the same `PluginConnection` object, they each have their own internal connection; each plugin will receive only its own messages in its callback to `BindToMessage()`, even if other plugins call `SendMessage()`.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginConnection#Connected\|Connected]] | boolean | Whether this `PluginConnection` object is still connected. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginConnection#TargetId\|TargetId]] | string | A unique ID for the target data model. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginConnection#Type\|Type]] | [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType\|PluginConnectionTargetType]] | This [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType\|Enum.PluginConnectionTargetType]] describes the relationship of the target data model to the current one. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginConnection#BindToMessage\|BindToMessage()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Binds a callback to this `PluginConnection` to receive messages from `SendMessage()`. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginConnection#SendMessage\|SendMessage()]] | () | Sends a payload to the remote data model. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Connected

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

If true, then this `PluginConnection` remains connected to the target data model, and it is still possible to send messages to that data model and receive them from it. If false, then the connection has been lost. Once disconnected, `PluginConnection` objects cannot reconnect, so a value of false here indicates it is now safe to discard the `PluginConnection` object.

### TargetId

**Type:** string

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This string contains a globally unique identifier for the target data model, which will be the same for any two plugin connections that target the same data model (even if those connections originate from different data models). This property is immutable.

### Type

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType|PluginConnectionTargetType]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType|Enum.PluginConnectionTargetType]] describes the relationship of the target data model to the current data model. For example, a value of [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType|Enum.PluginConnectionTargetType.Test]] means that the target data model is a playtest data model spawned from this data model. Alternatively, a value of [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType|Enum.PluginConnectionTargetType.Edit]] means the target data model is the edit session which spawned this test data model. This property is immutable.

## Methods

### BindToMessage

```lua
PluginConnection:BindToMessage(callback: Function): RBXScriptConnection
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This function binds a callback to this connection, which will be called when the connection receives a message from the current plugin running in the remote data model. The message passed to the callback will be the same as the one the plugin passed to `SendMessage()`. The `PluginConnection` will buffer any messages received before the plugin calls `BindToMessage()` and deliver them immediately when the plugin does call `BindToMessage()`. Each plugin may only bind one callback at a time.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | Function |  | A function accepting a string or a buffer which will be called when this `PluginConnection` receives a message. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | A [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] representing the binding of this callback to the `PluginConnection`. Disconnect it to disconnect this callback from the connection. |

### SendMessage

```lua
PluginConnection:SendMessage(message: Variant): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This function transmits a string or buffer to the remote data model. The callback registered in `BindToMessage()` by the instance of the current plugin running in the remote data model will be called asynchronously with the message as its argument.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | Variant |  | The string or buffer to be sent. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [PluginConnection](https://create.roblox.com/docs/reference/engine/classes/PluginConnection) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
