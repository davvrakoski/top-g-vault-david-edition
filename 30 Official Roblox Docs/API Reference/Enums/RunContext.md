---
title: "RunContext"
description: "Controls the execution context of a `Script`, determining whether it runs as server, client, plugin, or legacy container-based code."
api_type: enum
aliases: ["Enum.RunContext"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RunContext"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls the execution context of a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], determining whether it runs as server, client, plugin, or legacy container-based code.*

## Description

The `RunContext` enum is used with the [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|BaseScript.RunContext]] property to specify the context in which a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] executes. The default value is [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Legacy]], which preserves the original container-based behavior where a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] runs on the server and a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] runs on the client depending on its placement in the instance hierarchy.

Setting a non-`Legacy` value allows a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] to run explicitly on the server, client, or as plugin code, regardless of container placement. [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] objects cannot use this property — only [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] objects support non-`Legacy` run contexts.

Changing this property while the script is running terminates any active threads and restarts the script under the new context if conditions permit.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Legacy` | 0 | Runs with legacy container-based behavior that depends on the script type, such as [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]] or [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]]. |
| `Server` | 1 | Runs on the server. |
| `Client` | 2 | Runs on the client. |
| `Plugin` | 3 | Runs as a descendant of [[30 Official Roblox Docs/API Reference/Classes/Plugin\|Plugin]] instances. |

---
*Source: [RunContext](https://create.roblox.com/docs/reference/engine/enums/RunContext) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
