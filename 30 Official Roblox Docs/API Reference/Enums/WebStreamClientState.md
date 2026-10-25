---
title: "WebStreamClientState"
description: "WebStreamClientState indicates the current state of a WebStreamClient object."
api_type: enum
aliases: ["Enum.WebStreamClientState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/WebStreamClientState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*WebStreamClientState indicates the current state of a WebStreamClient object.*

## Description

`WebStreamClientState` describes the lifecycle state of a [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient|WebStreamClient]] connection, readable through the [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#ConnectionState|WebStreamClient.ConnectionState]] property.

A newly created [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient|WebStreamClient]] begins in the `Connecting` state. On a successful handshake the state advances to `Open`, after which messages can be received (and sent, for WebSocket connections). The connection terminates in either `Closed` (clean shutdown) or `Error` (unrecoverable failure). Listening to the [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Opened|WebStreamClient.Opened]], [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Closed|WebStreamClient.Closed]], and [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Error|WebStreamClient.Error]] events is the recommended way to react to these transitions.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Connecting` | 0 | The client has sent a request to connect with the server and is waiting for a response. |
| `Open` | 1 | The client is connected to the server, allowing for data to be streamed between the server and client. |
| `Error` | 2 | An unrecoverable error has occured while setting up the connection orduring the connection lifetime, cutting off the stream. |
| `Closed` | 3 | The connection has run to completion without issues, either closed naturally by the server or manually by the user. |

---
*Source: [WebStreamClientState](https://create.roblox.com/docs/reference/engine/enums/WebStreamClientState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
