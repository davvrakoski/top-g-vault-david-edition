---
title: "PluginManagerInterface"
description: "The singleton object returned by the global `PluginManager()` function, exposing a small set of legacy Studio plugin utilities."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginManagerInterface"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The singleton object returned by the global `PluginManager()` function, exposing a small set of legacy Studio plugin utilities.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

`PluginManagerInterface` is the singleton object returned by the global `PluginManager()` function, which can be called from a plugin or from Studio's [Command Bar](https://create.roblox.com/docs/studio/ui-overview#command-bar). It provides a small set of legacy Studio utilities for exporting geometry — [[30 Official Roblox Docs/API Reference/Classes/PluginManagerInterface#ExportPlace|PluginManagerInterface:ExportPlace()]] and [[30 Official Roblox Docs/API Reference/Classes/PluginManagerInterface#ExportSelection|PluginManagerInterface:ExportSelection()]] — along with the deprecated [[30 Official Roblox Docs/API Reference/Classes/PluginManagerInterface#CreatePlugin|PluginManagerInterface:CreatePlugin()]] method. Calling the `PluginManager()` global requires plugin security.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginManagerInterface#CreatePlugin\|CreatePlugin()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Deprecated. Creates and returns a new [[30 Official Roblox Docs/API Reference/Classes/Plugin\|Plugin]]; use [[30 Official Roblox Docs/API Reference/Classes/Plugin\|Plugin]] instead. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginManagerInterface#ExportPlace\|ExportPlace()]] | () | Exports the entire place to an `.obj` file saved to a path chosen by the user in a file save dialog. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginManagerInterface#ExportSelection\|ExportSelection()]] | () | Exports the current [[30 Official Roblox Docs/API Reference/Classes/Selection\|Selection]] to an `.obj` file saved to a path chosen by the user in a file save dialog. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CreatePlugin

> [!warning] Deprecated
> The steps to create a plugin have changed. To learn more, see
> `Class.Plugin`.

```lua
PluginManagerInterface:CreatePlugin(): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Deprecated`, `CustomLuaState`

Creates and returns a new [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] object, attached to the current place's data model. The returned plugin is associated with the plugin that called this method, so it unloads together with its creator.

This method is deprecated. The steps to create a plugin have changed, and new work should use [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] directly rather than constructing one through `PluginManager()`. Calling this method requires plugin security.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The newly created [[30 Official Roblox Docs/API Reference/Classes/Plugin\|Plugin]]. |

### ExportPlace

```lua
PluginManagerInterface:ExportPlace(filePath: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Exports all geometry in the place to an `.obj` file. The file is saved to the path chosen by the user in a file save dialog; the `filePath` argument is ignored.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `filePath` | string |  | Ignored. A file save dialog determines the export path. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ExportSelection

```lua
PluginManagerInterface:ExportSelection(filePath: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Exports all geometry in the current [[30 Official Roblox Docs/API Reference/Classes/Selection|Selection]] to an `.obj` file. The file is saved to the path chosen by the user in a file save dialog; the `filePath` argument is ignored.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `filePath` | string |  | Ignored. A file save dialog determines the export path. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [PluginManagerInterface](https://create.roblox.com/docs/reference/engine/classes/PluginManagerInterface) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
