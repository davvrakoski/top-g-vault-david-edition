---
title: "BasePlayerGui"
description: "`BasePlayerGui` is an abstract class which the GUI drawing storage classes inherit from."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BasePlayerGui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*`BasePlayerGui` is an abstract class which the GUI drawing storage classes inherit from.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]], [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

`BasePlayerGui` is an abstract class that all GUI drawing storage classes inherit from.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BasePlayerGui#GetGuiObjectsAtPosition\|GetGuiObjectsAtPosition()]] | Instances | Returns a list of all [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] instances occupying the given |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetGuiObjectsAtPosition

```lua
BasePlayerGui:GetGuiObjectsAtPosition(x: int, y: int): Instances
```

**Thread safety:** Unsafe · **Capabilities:** UI

Takes a screen position and returns a list of all the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] instances which are occupying that screen position, sorted in the order they appear on screen from top to bottom as the first and last index, respectively. The main use case is to get GUI objects under the player's mouse or touch inputs to allow for selection or highlighting.

Since the child classes of [[30 Official Roblox Docs/API Reference/Classes/BasePlayerGui|BasePlayerGui]] inherit this function, it can be fired by container classes such as [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] and [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The **X** position on the screen relative to the top-left corner after the GUI inset is applied (see [[30 Official Roblox Docs/API Reference/Classes/GuiService#GetGuiInset\|GuiService:GetGuiInset()]]). |
| `y` | int |  | The **Y** position on the screen relative to the top-left corner after the GUI inset is applied (see [[30 Official Roblox Docs/API Reference/Classes/GuiService#GetGuiInset\|GuiService:GetGuiInset()]]). |

**Returns**

| Type | Description |
| --- | --- |
| Instances | A table of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] instances that occupy the given screen space. |

*Code samples for this member (`selecting-guis-at-a-position`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [BasePlayerGui](https://create.roblox.com/docs/reference/engine/classes/BasePlayerGui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
