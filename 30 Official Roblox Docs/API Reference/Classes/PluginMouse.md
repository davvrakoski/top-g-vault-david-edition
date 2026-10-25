---
title: "PluginMouse"
description: "The PluginMouse object gives `Plugins` access to the mouse. It works like the `Mouse` object and can be obtained using the plugin `Plugin:GetMouse()` method."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginMouse"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The PluginMouse object gives [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]] access to the mouse. It works like the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object and can be obtained using the plugin [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetMouse|Plugin:GetMouse()]] method.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

The PluginMouse object gives [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]] access to the mouse. It works like the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object and can be obtained using the plugin [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetMouse|Plugin:GetMouse()]] method.

Note the PluginMouse can only be used when the plugin has been activated using [[30 Official Roblox Docs/API Reference/Classes/Plugin#Activate|Plugin:Activate()]].

In addition to the functions from the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object, the PluginMouse includes the [[30 Official Roblox Docs/API Reference/Classes/PluginMouse#DragEnter|PluginMouse.DragEnter]] function which keeps track of items being selected while the mouse is dragging.

For more information on how to use mouse objects, see the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] page.

*Code samples for this API (`PluginMouse-Get`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/PluginMouse); their code is not part of the open-source repo.*

## Summary

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMouse#DragEnter\|DragEnter]] | `instances` | Fired when Instances are being selected while the mouse is dragging. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Events

### DragEnter

```lua
PluginMouse.DragEnter(instances: Instances)
```

**Security:** PluginSecurity · **Capabilities:** Input

Fired when Instances are being selected while the mouse is dragging.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instances` | Instances |  | An array of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] that were inserted into the 3D viewport by the drag-and-drop operation. |

---
*Source: [PluginMouse](https://create.roblox.com/docs/reference/engine/classes/PluginMouse) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
