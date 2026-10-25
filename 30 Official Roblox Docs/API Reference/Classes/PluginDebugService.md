---
title: "PluginDebugService"
description: "A service that holds the debuggable `Plugin` instances that are currently being debugged in Studio, parenting them into the data model."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginDebugService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that holds the debuggable [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] instances that are currently being debugged in Studio, parenting them into the data model.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Studio-only service for plugin debugging — not available in published games. It holds the [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] instances currently being debugged and parents them into the data model so the debugger can treat stepped scripts as data-model descendants, while keeping them out of serialization and under Studio Explorer visibility control.

Only a [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] marked as debuggable can be parented here; any other child raises an error. Debugging is opt-in through Studio settings and applies only to local plugins the user placed in their local plugins directory.

---
*Source: [PluginDebugService](https://create.roblox.com/docs/reference/engine/classes/PluginDebugService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
