---
title: "PluginMenu"
description: "A context menu that can be shown in Studio. Displays a list of `PluginActions` and supports submenus."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginMenu"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A context menu that can be shown in Studio. Displays a list of [[30 Official Roblox Docs/API Reference/Classes/PluginAction|PluginActions]] and supports submenus.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

`PluginMenu` represents a context menu which can be shown in Studio to display a list of [[30 Official Roblox Docs/API Reference/Classes/PluginAction|PluginActions]] and which also supports submenus. A `PluginMenu` must be created using the [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreatePluginMenu|Plugin:CreatePluginMenu()]] method in order to work as expected.

*Code samples for this API (`creating-a-pluginaction-and-pluginmenu`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/PluginMenu); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#Icon\|Icon]] | string | The icon to be displayed when used as a submenu. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#Title\|Title]] | string | The text to be displayed when used as a submenu. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#Visible\|Visible]] | boolean | Determines whether the menu is shown when it is used as a submenu. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#AddAction\|AddAction()]] | () | Adds the given action to the menu. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#AddMenu\|AddMenu()]] | () | Adds the given menu as a separator. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#AddNewAction\|AddNewAction()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Creates a temporary action that is hidden from Studio's customize shortcuts window. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#AddSeparator\|AddSeparator()]] | () | Adds a separator between items in the menu. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#Clear\|Clear()]] | () | Clears the menu. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#ShowAsync\|ShowAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Shows the menu at the mouse cursor. Yields until either an item is selected or the menu is closed. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Icon

**Type:** string

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

This property determines the icon to be displayed when used as a submenu. It defaults to an empty string `""`.

### Title

**Type:** string

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

This property determines the text to be displayed when a [[30 Official Roblox Docs/API Reference/Classes/PluginMenu|PluginMenu]] is used as a submenu. It defaults to an empty string `""`.

### Visible

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

This property determines whether a [[30 Official Roblox Docs/API Reference/Classes/PluginMenu|PluginMenu]] is shown when it is displayed as a submenu of another menu, that is, when it has been added to a parent menu through [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#AddMenu|PluginMenu:AddMenu()]]. It defaults to `true`; setting it to `false` hides the submenu's entry in its parent menu.

## Methods

### AddAction

```lua
PluginMenu:AddAction(action: Instance): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Adds the given action to the menu.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `action` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The action to add. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### AddMenu

```lua
PluginMenu:AddMenu(menu: Instance): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Adds the given menu as a separator.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The menu to add as a submenu. Uses its [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#Title\|Title]] and [[30 Official Roblox Docs/API Reference/Classes/PluginMenu#Icon\|Icon]] to display. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### AddNewAction

```lua
PluginMenu:AddNewAction(actionId: string, text: string, icon: string): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Creates a temporary action that is hidden from Studio's **File** ⟩ **Customize Shortcuts** window.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionId` | string |  | Must be a unique string that identifies this [[30 Official Roblox Docs/API Reference/Classes/PluginAction\|PluginAction]] from others. |
| `text` | string |  | The text to be displayed. |
| `icon` | string |  | The icon to be displayed. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The created [[30 Official Roblox Docs/API Reference/Classes/PluginAction\|PluginAction]]. |

### AddSeparator

```lua
PluginMenu:AddSeparator(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Adds a separator between items in the menu.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Clear

```lua
PluginMenu:Clear(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Clears the menu.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ShowAsync

```lua
PluginMenu:ShowAsync(): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Shows the menu at the mouse cursor. It yields until either an item is selected or the menu is closed. The selected action fires its [[30 Official Roblox Docs/API Reference/Classes/PluginAction#Triggered|PluginAction.Triggered]] event.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/PluginAction\|PluginAction]] item that was selected or `nil`. |

---
*Source: [PluginMenu](https://create.roblox.com/docs/reference/engine/classes/PluginMenu) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
