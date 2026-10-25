---
title: "PluginGui"
description: "An abstract base class for GUIs that display `GuiObjects` in Roblox Studio widgets."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginGui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract base class for GUIs that display [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] in Roblox Studio widgets.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGui]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

PluginGui is an abstract class for GUIs that allow the display of [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] in various Roblox Studio widgets. As of right now, the only available PluginGui type is [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGui]], but there may be more in the future!

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginGui#Title\|Title]] | string | The title that is displayed above the contents of the [[30 Official Roblox Docs/API Reference/Classes/PluginGui\|PluginGui]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginGui#BindToClose\|BindToClose()]] | () | Binds a function that runs when the user closes the [[30 Official Roblox Docs/API Reference/Classes/PluginGui\|PluginGui]]. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginGui#GetRelativeMousePosition\|GetRelativeMousePosition()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns the position of the mouse relative to the PluginGui. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragDropped\|PluginDragDropped]] | `dragData` | Fires when the user releases their mouse when hovering over a PluginGui during a drag operation started by [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag\|Plugin:StartDrag()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragEntered\|PluginDragEntered]] | `dragData` | Fires when the user's mouse enters a PluginGui during a drag operation started by [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag\|Plugin:StartDrag()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragLeft\|PluginDragLeft]] | `dragData` | Fires when the user's mouse leaves a PluginGui during a drag operation started by [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag\|Plugin:StartDrag()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragMoved\|PluginDragMoved]] | `dragData` | Fires when the user's mouse moves within a PluginGui during a drag operation started by [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag\|Plugin:StartDrag()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginGui#WindowFocused\|WindowFocused]] |  | Fires when the user begins interacting with the window of the PluginGui. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginGui#WindowFocusReleased\|WindowFocusReleased]] |  | Fires when the user stops interacting with the window of the PluginGui. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Title

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The title that is displayed above the contents of the [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]]. Defaults to empty string.

## Methods

### BindToClose

```lua
PluginGui:BindToClose(function: Function = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

This method binds a function that runs when the user clicks the close button of the [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]]. The widget closes and its [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#Enabled|Enabled]] property becomes `false` even when a function is bound, so the function can't prevent or delay closing. Use it to perform tasks such as saving work when the widget closes.

For example, the following code saves work when the user closes the widget:

```lua
local function saveWork()
	-- Save the user's work here.
end

pluginGui:BindToClose(function()
	saveWork()
end)
```

Call `BindToClose()` without an argument to unbind the current function:

```lua
pluginGui:BindToClose()
```

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateDockWidgetPluginGuiAsync|Plugin:CreateDockWidgetPluginGuiAsync()]] to create a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]]
- [[30 Official Roblox Docs/API Reference/Classes/DataModel#BindToClose|DataModel:BindToClose()]], which can be used to bind a function to the game ending and should not be confused with this function

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `function` | Function | `nil` | The function to bind the close button to. If no function is specified then any previously specified function will be unbound. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetRelativeMousePosition

```lua
PluginGui:GetRelativeMousePosition(): Vector2
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** UI

GetRelativeMousePosition returns the position of the mouse relative to the top-left corner of the [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]]. The returned value changes only if a mouse input began on the PluginGui, or if the mouse is presently hovering over the window.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The screen position of the mouse relative to the PluginGui in pixels. |

*Code samples for this member (`plugingui-getrelativemouseposition`) are published on the source page; their code is not part of the open-source repo.*

## Events

### PluginDragDropped

```lua
PluginGui.PluginDragDropped(dragData: Dictionary)
```

**Security:** PluginSecurity · **Capabilities:** UI

**PluginDragDropped** fires when the user releases their mouse over a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] during a drag operation started by [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]].

See also:

- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragEntered|PluginGui.PluginDragEntered]]
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragLeft|PluginGui.PluginDragLeft]]
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragMoved|PluginGui.PluginDragMoved]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `dragData` | Dictionary |  | A copy of the data originally passed to [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag\|Plugin:StartDrag()]]. |

*Code samples for this member (`plugin-drag-and-drop`) are published on the source page; their code is not part of the open-source repo.*

### PluginDragEntered

```lua
PluginGui.PluginDragEntered(dragData: Dictionary)
```

**Security:** PluginSecurity · **Capabilities:** UI

**PluginDragEntered** fires when the user's mouse enters the [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] during a drag operation started by [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]].

This event is useful for displaying a "Drop Here" UI on PluginGuis where a drag operation can be dropped. Such a UI should be hidden when either [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragLeft|PluginDragLeft]] or [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragDropped|PluginDragDropped]] fire.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragLeft|PluginGui.PluginDragLeft]]
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragMoved|PluginGui.PluginDragMoved]]
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragDropped|PluginGui.PluginDragDropped]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `dragData` | Dictionary |  | A copy of the data originally passed to [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag\|Plugin:StartDrag()]]. |

*Code samples for this member (`plugin-drag-and-drop`) are published on the source page; their code is not part of the open-source repo.*

### PluginDragLeft

```lua
PluginGui.PluginDragLeft(dragData: Dictionary)
```

**Security:** PluginSecurity · **Capabilities:** UI

**PluginDragLeft** fires when the user's mouse leaves a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] during a drag operation started by [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]].

This event and [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragDropped|PluginDragDropped]] are useful for hiding a "Drop Here" UI on PluginGuis where a drag operation can be dropped. Such a UI should be shown when either [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragEntered|PluginDragEntered]] fires.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragEntered|PluginGui.PluginDragEntered]]
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragMoved|PluginGui.PluginDragMoved]]
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragDropped|PluginGui.PluginDragDropped]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `dragData` | Dictionary |  | A copy of the data originally passed to [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag\|Plugin:StartDrag()]]. |

*Code samples for this member (`plugin-drag-and-drop`) are published on the source page; their code is not part of the open-source repo.*

### PluginDragMoved

```lua
PluginGui.PluginDragMoved(dragData: Dictionary)
```

**Security:** PluginSecurity · **Capabilities:** UI

**PluginDragMoved** fires when the user's mouse moves within a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] during a drag operation started by [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]].

See also:

- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragEntered|PluginGui.PluginDragEntered]]
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragLeft|PluginGui.PluginDragLeft]]
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragDropped|PluginGui.PluginDragDropped]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `dragData` | Dictionary |  | A copy of the data originally passed to [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag\|Plugin:StartDrag()]]. |

### WindowFocused

```lua
PluginGui.WindowFocused()
```

**Security:** PluginSecurity · **Capabilities:** UI

**WindowFocused** fires immediately when the user starts interacting with the PluginGui's window, usually by clicking on it. This functions works similarly to the similarly-named [[30 Official Roblox Docs/API Reference/Classes/UserInputService#WindowFocused|UserInputService.WindowFocused]] event. It fires before any [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputBegan|GuiObject.InputBegan]] events related to mouse buttons.

If another [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] is in focus and the user focuses this PluginGui, then this event fires after the other's [[30 Official Roblox Docs/API Reference/Classes/PluginGui#WindowFocusReleased|WindowFocusReleased]] event. However, if the main game window was in focus, this event fires **after** [[30 Official Roblox Docs/API Reference/Classes/UserInputService#WindowFocusReleased|UserInputService.WindowFocusReleased]].

*Code samples for this member (`plugingui-focus`) are published on the source page; their code is not part of the open-source repo.*

### WindowFocusReleased

```lua
PluginGui.WindowFocusReleased()
```

**Security:** PluginSecurity · **Capabilities:** UI

**WindowFocusReleased** fires immediately when the user stops interacting with the PluginGui's window, usually by clicking on something not in the window. This functions works similarly to the similarly-named [[30 Official Roblox Docs/API Reference/Classes/UserInputService#WindowFocusReleased|UserInputService.WindowFocusReleased]] event.

If focus is moving to another [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] while the user had this PluginGui in focus, then this event fires before the other's [[30 Official Roblox Docs/API Reference/Classes/PluginGui#WindowFocused|WindowFocused]] event. However, if the main game window is being put in focus, this event fires **after** [[30 Official Roblox Docs/API Reference/Classes/UserInputService#WindowFocused|UserInputService.WindowFocused]].

*Code samples for this member (`plugingui-focus`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [PluginGui](https://create.roblox.com/docs/reference/engine/classes/PluginGui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
