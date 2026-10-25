---
title: "RemoteDebuggerServer"
description: "Studio service that runs the server side of Luau remote debugging over DAP; not created during normal script execution."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RemoteDebuggerServer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Studio service that runs the server side of Luau remote debugging over DAP; not created during normal script execution.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Not created during normal script execution. Implements the server side of Luau remote debugging: it bridges the script debugger to an external debug client over a JSON-RPC channel that speaks the Debug Adapter Protocol (DAP), and is compatible with the `vscode-rbx-lrdb` Visual Studio Code extension.

Once a client connects, the service handles debug requests (initialize, breakpoints, stepping, continue/pause, threads, stack frames, scopes, variables, expression evaluation, and source) and pushes debugger events (stopped, continued, breakpoint changes, exit) back to the client.

---
*Source: [RemoteDebuggerServer](https://create.roblox.com/docs/reference/engine/classes/RemoteDebuggerServer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
