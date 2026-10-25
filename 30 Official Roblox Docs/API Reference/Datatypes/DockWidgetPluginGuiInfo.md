---
title: "DockWidgetPluginGuiInfo"
description: "Describes details for a `DockWidgetPluginGui`."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/DockWidgetPluginGuiInfo"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Describes details for a [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGui]].*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]] data type describes details for a [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGui]]. This data type is used when constructing a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] via the plugin's [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateDockWidgetPluginGuiAsync|Plugin:CreateDockWidgetPluginGuiAsync()]] method.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo#new\|new()]] | `InitialDockState`, `InitialEnabled`, `InitialEnabledShouldOverrideRestore`, `FloatingXSize`, `FloatingYSize`, `MinWidth`, `MinHeight` | Returns a new DockWidgetPluginGuiInfo object. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo#InitialEnabled\|InitialEnabled]] | bool | The enabled state of the [[30 Official Roblox Docs/API Reference/Classes/PluginGui\|PluginGui]] if it does not have a saved state from a previous session. |
| [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo#InitialEnabledShouldOverrideRestore\|InitialEnabledShouldOverrideRestore]] | bool | If true, will override any saved enabled state with the `InitialEnabled` value. |
| [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo#FloatingXSize\|FloatingXSize]] | number | The initial pixel width of the PluginGui when floating. |
| [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo#FloatingYSize\|FloatingYSize]] | number | The initial pixel height of the PluginGui when floating. |
| [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo#MinWidth\|MinWidth]] | number | The minimum pixel width of the PluginGui. |
| [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo#MinHeight\|MinHeight]] | number | The minimum pixel height of the PluginGui. |

## Constructors

### new

```lua
DockWidgetPluginGuiInfo.new(InitialDockState: InitialDockState = Enum.InitialDockState.Right, InitialEnabled: bool = False, InitialEnabledShouldOverrideRestore: bool = False, FloatingXSize: number = 0, FloatingYSize: number = 0, MinWidth: number = 0, MinHeight: number = 0): DockWidgetPluginGuiInfo
```

The main constructor function for the [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `InitialDockState` | [[30 Official Roblox Docs/API Reference/Enums/InitialDockState\|InitialDockState]] | `Enum.InitialDockState.Right` |  |
| `InitialEnabled` | bool | `False` |  |
| `InitialEnabledShouldOverrideRestore` | bool | `False` |  |
| `FloatingXSize` | number | `0` |  |
| `FloatingYSize` | number | `0` |  |
| `MinWidth` | number | `0` |  |
| `MinHeight` | number | `0` |  |

## Properties

### InitialEnabled

**Type:** bool

The initial enabled state of a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] created using this [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]]. If a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] with the same ''pluginGuiId'' has previously been created in an earlier session of Roblox Studio, then it will reload that saved enabled state (unless `InitialEnabledShouldOverrideRestore` is true).

### InitialEnabledShouldOverrideRestore

**Type:** bool

If true, the value of `InitialEnabled` will override the previously saved enabled state of a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] being created with this [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]]. The previously saved enabled state is loaded based on the `pluginGuiId` argument of [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateDockWidgetPluginGuiAsync|Plugin:CreateDockWidgetPluginGuiAsync()]].

### FloatingXSize

**Type:** number

The initial pixel width of a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] created using this [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]], when the [[30 Official Roblox Docs/API Reference/Enums/InitialDockState|Enum.InitialDockState]] is set to `Float`.

### FloatingYSize

**Type:** number

The initial pixel height of a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] created using this [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]], when the [[30 Official Roblox Docs/API Reference/Enums/InitialDockState|Enum.InitialDockState]] is set to `Float`.

### MinWidth

**Type:** number

The minimum width of a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] created using this [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]], in pixels.

Each platform has its own absolute minimum that Roblox will enforce. These variations exist to account for the contents of the title bar (which varies by platform) when the widget is floating. For example, on a Mac, the width can never be less than ~80 pixels to accommodate the close/minimize/maximize buttons.

### MinHeight

**Type:** number

The minimum height of a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] created using this [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]], in pixels.

---
*Source: [DockWidgetPluginGuiInfo](https://create.roblox.com/docs/reference/engine/datatypes/DockWidgetPluginGuiInfo) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
