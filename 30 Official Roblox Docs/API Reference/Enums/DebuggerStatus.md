---
title: "DebuggerStatus"
description: "Result of a debugger request."
api_type: enum
aliases: ["Enum.DebuggerStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DebuggerStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Result of a debugger request.*

## Description

`Status` on every `DebuggerLuaResponse`, indicating whether the corresponding debugger request succeeded or failed. See individual items for timeout, connection, and other failure modes.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 0 | Request has completed successfully. |
| `Timeout` | 1 | Timed out while waiting for response. |
| `ConnectionLost` | 2 | Connection to the debugger was lost. |
| `InvalidResponse` | 3 | Failed to parse response. |
| `InternalError` | 4 | Exception encountered while processing response. |
| `InvalidState` | 5 | The request was not appropriate for the current debugger state. |
| `RpcError` | 6 | Response was an error. |
| `InvalidArgument` | 7 | One of the request arguments was invalid. |
| `ConnectionClosed` | 8 | Connection closed while waiting for response. |

---
*Source: [DebuggerStatus](https://create.roblox.com/docs/reference/engine/enums/DebuggerStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
