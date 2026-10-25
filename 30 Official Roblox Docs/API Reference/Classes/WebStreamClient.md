---
title: "WebStreamClient"
description: "Maintains a streaming connection."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/WebStreamClient"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Maintains a streaming connection.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Maintains a streaming connection. To process stream events as they arrive, connect callback functions to each event using [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal#Connect|RBXScriptSignal:Connect()]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#ConnectionState\|ConnectionState]] | [[30 Official Roblox Docs/API Reference/Enums/WebStreamClientState\|WebStreamClientState]] | The current [[30 Official Roblox Docs/API Reference/Enums/WebStreamClientState\|Enum.WebStreamClientState]] of the client. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Close\|Close()]] | () | Closes the client, aborting the ongoing request. |
| [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Send\|Send()]] | () | Enqueues data to be transmitted to the server over the streaming connection. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Closed\|Closed]] |  | Fires when the streaming connection is closed, either by the server or by a call to [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Close\|WebStreamClient:Close()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Error\|Error]] | `responseStatusCode`, `errorMessage` | Fires if an error is received while establishing the connection or during the connection lifetime. |
| [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#MessageReceived\|MessageReceived]] | `message` | Fires each time a message is received from the server. |
| [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Opened\|Opened]] | `responseStatusCode`, `headers` | Fires when the a connection is successfully established between the client and server, allowing for events to begin streaming. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ConnectionState

**Type:** [[30 Official Roblox Docs/API Reference/Enums/WebStreamClientState|WebStreamClientState]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Network · **Tags:** `ReadOnly`, `NotReplicated`

The current [[30 Official Roblox Docs/API Reference/Enums/WebStreamClientState|Enum.WebStreamClientState]] of the client.

## Methods

### Close

```lua
WebStreamClient:Close(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Network

Closes the client, aborting the ongoing request. If successful, fires the [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Closed|WebStreamClient.Closed]] event.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Send

```lua
WebStreamClient:Send(data: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Network

Enqueues data to be transmitted to the server over the connection. Only works on clients created with [[30 Official Roblox Docs/API Reference/Enums/WebStreamClientType|Enum.WebStreamClientType.WebSocket]]. For other client types it does nothing.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | string |  | Text string to send to the server. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### Closed

```lua
WebStreamClient.Closed()
```

**Capabilities:** Network

Fires when the server closes the connection succesfully or the user calls [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Close|WebStreamClient:Close()]]

### Error

```lua
WebStreamClient.Error(responseStatusCode: int, errorMessage: string)
```

**Capabilities:** Network

Fires if an error is received while establishing the connection or during the connection lifetime.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `responseStatusCode` | int |  | The standard HTTP error status code (e.g., 404, 500). |
| `errorMessage` | string |  | A descriptive message containing details about the error. |

### MessageReceived

```lua
WebStreamClient.MessageReceived(message: string)
```

**Capabilities:** Network

Fires each time a message is received from the server. The format differs based on the [[30 Official Roblox Docs/API Reference/Enums/WebStreamClientType|Enum.WebStreamClientType]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The message data payload received from the server stream. |

### Opened

```lua
WebStreamClient.Opened(responseStatusCode: int, headers: string)
```

**Capabilities:** Network

Fires when the a connection is successfully established between the client and server, allowing for events to begin streaming. Provides any response headers in raw format, which can be used for validation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `responseStatusCode` | int |  | The standard HTTP success status code (e.g., 200). |
| `headers` | string |  | The raw HTTP response headers from the server. |

---
*Source: [WebStreamClient](https://create.roblox.com/docs/reference/engine/classes/WebStreamClient) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
