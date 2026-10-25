---
title: "PluginToolbarButton"
description: "A button on a `PluginToolbar` in the Studio ribbon, created by `PluginToolbar:CreateButton()`, that fires `Click` when pressed."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginToolbarButton"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A button on a [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar|PluginToolbar]] in the Studio ribbon, created by [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar#CreateButton|PluginToolbar:CreateButton()]], that fires [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Click|Click]] when pressed.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

A `PluginToolbarButton` object is created through the [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar#CreateButton|PluginToolbar:CreateButton()]] function. It allows the user to initiate a single, one-off action in Roblox Studio through the [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Click|Click]] event. Toolbar buttons can also be assigned a keyboard shortcut through Studio's **File** ⟩ **Customize Shortcuts** window.

When pressed, the [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Click|Click]] event fires. A button will also remain in the pressed state, which may be set manually using [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#SetActive|SetActive()]]. Upon plugin activation ([[30 Official Roblox Docs/API Reference/Classes/Plugin#Activate|Plugin:Activate()]]), buttons in all other [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar|PluginToolbars]] will be toggled off. If all buttons in a toolbar are off, the toolbar's plugin is deactivated ([[30 Official Roblox Docs/API Reference/Classes/Plugin#Deactivate|Plugin:Deactivate()]]).

When the game viewport is not visible, buttons will be disabled as if their [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Enabled|Enabled]] property were false. Disabled buttons are desaturated and do not respond to user clicks. By setting [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#ClickableWhenViewportHidden|ClickableWhenViewportHidden]] to true, you can allow plugin buttons to remain clickable, such as during script editing.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#ClickableWhenViewportHidden\|ClickableWhenViewportHidden]] | boolean | Determines whether the button can be clicked when the 3D viewport is hidden, such as when a [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]] is being edited in another tab. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Enabled\|Enabled]] | boolean | Determines whether the button is clickable in general. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Icon\|Icon]] | ContentId | Determines what icon should represent the button. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#IconContent\|IconContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The content of the image used as the button's icon in the toolbar. Only supports asset URIs. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#SetActive\|SetActive()]] | () | Sets the state of the plugin button. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Click\|Click]] |  | Fires when the user presses and releases their cursor on the button. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ClickableWhenViewportHidden

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

This property determines whether a [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton|PluginToolbarButton]] may be clicked while the 3D viewport is hidden, such as when a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] is being edited in another tab.

Typically, this property should be enabled if an action triggered by a plugin button's [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Click|Click]] event doesn't occur in the 3D world ([[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]). For example, a button that opens a widget should have this property as `true`, since showing a widget is visible to the user even if the 3D view isn't visible.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

This property determines whether a button is clickable in general. When `false`, the button will be greyed out and unclickable, preventing the user from firing the [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Click|Click]] event. Buttons are enabled by default.

When re-enabling this property, the plugin button's state won't be remembered from the previous state in which the user left the button in. Instead, it will default to the last state set by [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#SetActive|SetActive()]] or to the inactive state if [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#SetActive|SetActive()]] was never used.

Plugins should disable their buttons when the button action isn't relevant in the current context. For example, a plugin button that assigns random colors to selected should not be enabled when the selection contains no parts.

See also [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#ClickableWhenViewportHidden|ClickableWhenViewportHidden]] which determines whether a button is clickable when the game view is hidden (and not just in general).

*Code samples for this member (`brickcolor-randomizer-plugin`) are published on the source page; their code is not part of the open-source repo.*

### Icon

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

This property determines which [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] should be shown for the button's icon in the toolbar. When this property is not set, the button will instead use the button's text given by [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar#CreateButton|PluginToolbar:CreateButton()]].

### IconContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

This property sets the image content displayed as the button's icon in the plugin toolbar. When this property is not set, the button instead displays the text label provided when calling [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar#CreateButton|PluginToolbar:CreateButton()]]. Only asset URIs are supported for this property.

## Methods

### SetActive

```lua
PluginToolbarButton:SetActive(active: boolean): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method can be used to manually set the active state of the plugin button.

When the [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Enabled|Enabled]] property is toggled back on, the button will either revert to the last state set by this method or default to inactive if this method hasn't been used previously.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean |  | Whether to set the button to its active, pressed state (`true`) or its inactive state (`false`). |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### Click

```lua
PluginToolbarButton.Click()
```

**Security:** PluginSecurity

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton|PluginToolbarButton]] is pressed and released by the user.

See also [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#SetActive|SetActive()]] to manually set the state of the button.

*Code samples for this member (`plugintoolbarbutton-click`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [PluginToolbarButton](https://create.roblox.com/docs/reference/engine/classes/PluginToolbarButton) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
