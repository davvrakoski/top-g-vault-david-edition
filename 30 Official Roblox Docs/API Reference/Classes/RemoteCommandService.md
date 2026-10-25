---
title: "RemoteCommandService"
description: "Team Create service that executes Luau commands sent from a Studio client on the collaborative editing server and relays their output back to that client."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RemoteCommandService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Team Create service that executes Luau commands sent from a Studio client on the collaborative editing server and relays their output back to that client.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

Studio-only Team Create service; not accessible from experience scripts. Powers remote command execution: a Studio client submits Luau source, which the collaborative editing server runs inside a dedicated sandboxed thread, streaming the command's output and errors back to the client that started it.

Commands take one of two forms: a persistent command that opens a two-way channel between the client and the running code, and a one-shot command that runs once and hands back a single result or error.

While a persistent command runs, its server-side code communicates with the originating client through the members on this service: [[30 Official Roblox Docs/API Reference/Classes/RemoteCommandService#SendUpdate|SendUpdate()]] pushes values to the client, [[30 Official Roblox Docs/API Reference/Classes/RemoteCommandService#GetReceivedUpdateSignal|GetReceivedUpdateSignal()]] delivers values the client sends back, [[30 Official Roblox Docs/API Reference/Classes/RemoteCommandService#GetStoppingSignal|GetStoppingSignal()]] fires when the command is stopped, and [[30 Official Roblox Docs/API Reference/Classes/RemoteCommandService#GetExecutingPlayer|GetExecutingPlayer()]] identifies the collaborator who started it.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteCommandService#GetExecutingPlayer\|GetExecutingPlayer()]] | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] for the Studio collaborator who started the command that is currently executing. |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteCommandService#GetReceivedUpdateSignal\|GetReceivedUpdateSignal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | Returns a signal that fires on the server each time the Studio client that started the command sends it an update. |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteCommandService#GetStoppingSignal\|GetStoppingSignal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | Returns a signal that fires on the server when the command that is currently executing is being stopped. |
| [[30 Official Roblox Docs/API Reference/Classes/RemoteCommandService#SendUpdate\|SendUpdate()]] | () | Sends a set of values from the running command back to the Studio client that started it. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetExecutingPlayer

```lua
RemoteCommandService:GetExecutingPlayer(): Player
```

**Thread safety:** Unsafe · **Capabilities:** Unknown

Call this from inside a running command on the collaborative editing server to find the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] that represents the collaborator who submitted it. The server compares the command's originating network address against the connected players and returns the matching [[30 Official Roblox Docs/API Reference/Classes/Player|Player]], or `nil` when no player matches.

This method may only be called from within an active persistent command, and raises an error if there is no such command, such as when called from a one-shot command or after the command has stopped.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] representing the collaborator who started the running command, or `nil` if no connected player matches. |

### GetReceivedUpdateSignal

```lua
RemoteCommandService:GetReceivedUpdateSignal(): RBXScriptSignal
```

**Thread safety:** Unsafe · **Capabilities:** Unknown

Server-side command code connects to this signal to receive data pushed from the Studio client that started the command. The event fires with the tuple of values the client sends, forming the client-to-server half of the command's two-way channel.

This method may only be called from within an active persistent command, and raises an error if there is no such command, such as when called from a one-shot command or after the command has stopped.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | An event that fires with the values the initiating Studio client passes each time it sends an update to the running command. |

### GetStoppingSignal

```lua
RemoteCommandService:GetStoppingSignal(): RBXScriptSignal
```

**Thread safety:** Unsafe · **Capabilities:** Unknown

Server-side command code connects to this signal to learn when its command is being stopped, giving it a chance to clean up before the sandboxed thread is torn down. The event fires when the initiating Studio client stops the command, or when that collaborator disconnects from the Team Create session.

This method may only be called from within an active persistent command, and raises an error if there is no such command, such as when called from a one-shot command or after the command has stopped.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | An event that fires, with no arguments, when the running command is stopped. |

### SendUpdate

```lua
RemoteCommandService:SendUpdate(args: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** Unknown

Server-side command code calls this to push values to the Studio client that started the command, forming the server-to-client half of the command's two-way channel; the values reach that client through the command's update event.

This method may only be called from within an active persistent command. When there is no such command, such as when called from a one-shot command or after the command has stopped, the call has no effect.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | Tuple |  | The values to deliver to the initiating Studio client. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [RemoteCommandService](https://create.roblox.com/docs/reference/engine/classes/RemoteCommandService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
