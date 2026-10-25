---
title: "PluginToolbar"
description: "A toolbar created by `Plugin:CreateToolbar()` that groups `PluginToolbarButtons` in the Studio ribbon."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginToolbar"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A toolbar created by [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateToolbar|Plugin:CreateToolbar()]] that groups [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton|PluginToolbarButtons]] in the Studio ribbon.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

A `PluginToolbar` object is created by calling the [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateToolbar|Plugin:CreateToolbar()]] method and is used to contain [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton|PluginToolbarButtons]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar#CreateButton\|CreateButton()]] | [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton\|PluginToolbarButton]] | Creates a [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton\|PluginToolbarButton]] that allows the user to initiate a single, one-off action in Studio. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CreateButton

```lua
PluginToolbar:CreateButton(buttonId: string, tooltip: string, iconname: string, text: string): PluginToolbarButton
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Creates a [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton|PluginToolbarButton]] that allows the user to initiate a single, one-off action in Studio through its [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Click|Click]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `buttonId` | string |  | A unique button ID. |
| `tooltip` | string |  | The text displayed in the tooltip shown when a user hovers over the button. |
| `iconname` | string |  | The asset ID of the icon displayed in the button. |
| `text` | string |  | Optional text displayed under the button icon. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton\|PluginToolbarButton]] | The created [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton\|PluginToolbarButton]] instance. |

*Code samples for this member (`adding-a-plugin-toolbar-button`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [PluginToolbar](https://create.roblox.com/docs/reference/engine/classes/PluginToolbar) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
