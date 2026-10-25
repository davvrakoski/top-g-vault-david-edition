---
title: "PluginManager"
description: "A deprecated singleton that was previously required to create plugins."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginManager"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A deprecated singleton that was previously required to create plugins.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

`PluginManager` is a deprecated singleton that was previously required to create plugins. It still has some applicable uses, such as if you need to create a [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] object from Studio's [Command Bar](https://create.roblox.com/docs/studio/ui-overview#command-bar).

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginManager#CreatePlugin\|CreatePlugin()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Creates a new [[30 Official Roblox Docs/API Reference/Classes/Plugin\|Plugin]] object and returns it. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginManager#ExportPlace\|ExportPlace()]] | () | Exports the place to an `.obj` file that is saved to the path chosen by the user in a file save dialogue. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginManager#ExportSelection\|ExportSelection()]] | () | Exports the current [[30 Official Roblox Docs/API Reference/Classes/Selection\|Selection]] to an `.obj` file that is saved to the path chosen by the user in a file save dialogue. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CreatePlugin

> [!warning] Deprecated
> The steps to create a plugin have changed. To learn more, see
> `Class.Plugin`.

```lua
PluginManager:CreatePlugin(): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Deprecated`, `CustomLuaState`

Creates a new [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] object and returns it.

Creating plugins this way is deprecated; see [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] for the current process. `CreatePlugin` still has limited uses, such as creating a [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] from Studio's [Command Bar](https://create.roblox.com/docs/studio/ui-overview#command-bar).

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The newly created [[30 Official Roblox Docs/API Reference/Classes/Plugin\|Plugin]]. |

### ExportPlace

```lua
PluginManager:ExportPlace(filePath: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method exports all geometry in the place to an `.obj` file. The file is saved to the path chosen by the user in a file save dialogue (the `filePath` argument is ignored).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `filePath` | string |  | Ignored. A file save dialogue determines the export path. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ExportSelection

```lua
PluginManager:ExportSelection(filePath: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method exports all geometry in the current [[30 Official Roblox Docs/API Reference/Classes/Selection|Selection]] to an `.obj` file. The file is saved to the path chosen by the user in a file save dialogue (the `filePath` argument is ignored).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `filePath` | string |  | Ignored. A file save dialogue determines the export path. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [PluginManager](https://create.roblox.com/docs/reference/engine/classes/PluginManager) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
