---
title: "LayerCollector"
description: "The base class of 2D UI containers which render `GuiObjects` in layers."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/LayerCollector"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The base class of 2D UI containers which render [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] in layers.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]], [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]], [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase|SurfaceGuiBase]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

**LayerCollector** is the base class of 2D UI containers which render [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] descendants, such as [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].

For performance improvements, the appearance of a [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] is cached until one of the following events occurs:

- A descendant is added to or removed from it.
- A property of a descendant changes.
- A property of the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] itself changes.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#Enabled\|Enabled]] | boolean | Toggles the visibility of this [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#ResetOnSpawn\|ResetOnSpawn]] | boolean | Determines if the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollector]] resets (deletes itself and re-clones into the player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui\|PlayerGui]]) every time the player's character respawns. |
| [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#ZIndexBehavior\|ZIndexBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/ZIndexBehavior\|ZIndexBehavior]] | Controls how [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex\|GuiObject.ZIndex]] behaves on all descendants of this [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollector]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#GetLayoutNodeTree\|GetLayoutNodeTree()]] | Dictionary | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Toggles the visibility of this [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]]. When `false`, the UI contents will not render, process user input, or update in response to changes.

### ResetOnSpawn

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to `false` and this [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] is a direct child of [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]], it will only be cloned into each player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] once and it will not be deleted when the player's character respawns.

When set to `true` (default), or if this [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] is an **indirect** descendant of [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]], it will be cloned into each player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] when their character respawns, and it will delete itself when the player's character respawns again.

### ZIndexBehavior

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ZIndexBehavior|ZIndexBehavior]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls how [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|GuiObject.ZIndex]] behaves on all descendants of this [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]].

With [[30 Official Roblox Docs/API Reference/Enums/ZIndexBehavior|Enum.ZIndexBehavior.Sibling]] (default), children always render above their parents, and the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] is used to decide the order in which children of a single UI object will render over each other.

[[30 Official Roblox Docs/API Reference/Enums/ZIndexBehavior|Enum.ZIndexBehavior.Global]] sorts all descendants according to the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]], then breaks ties using the hierarchy order. As a result, descendants of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] need to have a [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] value that's at least as high as the parent, or they will render underneath their parent.

## Methods

### GetLayoutNodeTree

> [!warning] Deprecated
> This method should not be used for new work.

```lua
LayerCollector:GetLayoutNodeTree(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| Dictionary |  |

---
*Source: [LayerCollector](https://create.roblox.com/docs/reference/engine/classes/LayerCollector) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
