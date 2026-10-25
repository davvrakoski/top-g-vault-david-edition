---
title: "DebuggerEndReason"
description: "Reason for the end of the debugger session."
api_type: enum
aliases: ["Enum.DebuggerEndReason"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DebuggerEndReason"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Reason for the end of the debugger session.*

## Description

Indicates why a `ConnectionEnded` event fired on a `DebuggerConnectionManager`. Each value corresponds to a distinct termination path in the Debugger V2 connection lifecycle.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `ClientRequest` | 0 | Client requested connection termination. |
| `Timeout` | 1 | Connection timed out. |
| `InvalidHost` | 2 | Invalid host:port combination. |
| `Disconnected` | 3 | Connection was lost. |
| `ServerShutdown` | 4 | Server terminated the connection because it shut down. |
| `ServerProtocolMismatch` | 5 | Server has wrong version of protocol. |
| `ConfigurationFailed` | 6 | Got a failure response when trying to configure the server. |
| `RpcError` | 7 | An error occurred in the RPC layer. |

---
*Source: [DebuggerEndReason](https://create.roblox.com/docs/reference/engine/enums/DebuggerEndReason) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
