---
title: "Plugin"
description: "The main object responsible for creating custom Studio widgets, toolbars, buttons, and other plugin UI elements."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Plugin"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The main object responsible for creating custom Studio widgets, toolbars, buttons, and other plugin UI elements.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

`Plugin` is the main object responsible for creating custom Studio widgets, plugin toolbars, plugin buttons, and more. The `Plugin` object can be accessed through the [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#plugin|plugin]] global reference in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] that is executed as a plugin.

*Code samples for this API (`Plugin-Global-Pass`, `Plugin-Global-Receive`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Plugin); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#CollisionEnabled\|CollisionEnabled]] | boolean | Returns whether the user has enabled **Collisions** in Studio's toolbar. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#DisableUIDragDetectorDrags\|DisableUIDragDetectorDrags]] | boolean | If `true`, toolbars and buttons for the plugin will ignore dragging related to a [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]] instance. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#GridSize\|GridSize]] | float | Returns the grid snapping size the user has set in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#IsDebuggable\|IsDebuggable]] | boolean | Indicates whether the plugin's scripts can be debugged in Studio. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#Activate\|Activate()]] | () | Sets the state of the calling plugin to activated. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateDockWidgetPluginGui\|CreateDockWidgetPluginGui()]] | [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui\|DockWidgetPluginGui]] | **Deprecated.** Creates a [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui\|DockWidgetPluginGui]] given a [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo\|DockWidgetPluginGuiInfo]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateDockWidgetPluginGuiAsync\|CreateDockWidgetPluginGuiAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui\|DockWidgetPluginGui]] | Creates a [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui\|DockWidgetPluginGui]] given a [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo\|DockWidgetPluginGuiInfo]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreatePluginAction\|CreatePluginAction()]] | [[30 Official Roblox Docs/API Reference/Classes/PluginAction\|PluginAction]] | Creates a [[30 Official Roblox Docs/API Reference/Classes/PluginAction\|PluginAction]] which represents a generic performable action in Studio with no directly‑associated [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton\|PluginToolbarButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreatePluginMenu\|CreatePluginMenu()]] | [[30 Official Roblox Docs/API Reference/Classes/PluginMenu\|PluginMenu]] | Creates a new plugin menu. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateToolbar\|CreateToolbar()]] | [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar\|PluginToolbar]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar\|PluginToolbar]] with the given name. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#Deactivate\|Deactivate()]] | () | Deactivates the plugin. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetJoinMode\|GetJoinMode()]] | [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode\|JointCreationMode]] | Returns the [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode\|Enum.JointCreationMode]] the user has set in Studio's toolbar. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetMouse\|GetMouse()]] | [[30 Official Roblox Docs/API Reference/Classes/PluginMouse\|PluginMouse]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/Mouse\|Mouse]] that can be used while the plugin is active. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetSelectedRibbonTool\|GetSelectedRibbonTool()]] | [[30 Official Roblox Docs/API Reference/Enums/RibbonTool\|RibbonTool]] | Returns the currently selected [[30 Official Roblox Docs/API Reference/Enums/RibbonTool\|Enum.RibbonTool]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetSetting\|GetSetting()]] | Variant | Retrieves a previously stored value with the given key, or `nil` if the given key doesn't exist. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetStudioUserId\|GetStudioUserId()]] | int64 | **Deprecated.** Returns the Studio user's userId if they're logged in, otherwise returns 0. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#ImportFbxAnimation\|ImportFbxAnimation()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Prompts the user to open a `.fbx` animation file that can be loaded onto the `rigModel`, then proceeds to insert the animation as a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] in the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#ImportFbxAnimationAsync\|ImportFbxAnimationAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Prompts the user to open a `.fbx` animation file that can be loaded onto the `rigModel`, then proceeds to insert the animation as a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence\|KeyframeSequence]] in the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#ImportFbxRig\|ImportFbxRig()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Prompts the user to open a `.fbx` file, uploads the individual components of the model as meshes, and generates a character rig for use in animation, which is loaded into the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#ImportFbxRigAsync\|ImportFbxRigAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Prompts the user to open a `.fbx` file, uploads the individual components of the model as meshes, and generates a character rig for use in animation, which is loaded into the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#Intersect\|Intersect()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Intersects the given parts and returns the resulting [[30 Official Roblox Docs/API Reference/Classes/IntersectOperation\|IntersectOperation]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#IsActivated\|IsActivated()]] | boolean | Returns `true` if this plugin is currently active, after having been activated via the [[30 Official Roblox Docs/API Reference/Classes/Plugin#Activate\|Activate()]] function. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#IsActivatedWithExclusiveMouse\|IsActivatedWithExclusiveMouse()]] | boolean | Returns `true` if this plugin is currently active with an exclusive mouse. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#Negate\|Negate()]] | Instances | Negates the given parts and returns the resulting [[30 Official Roblox Docs/API Reference/Classes/NegateOperation\|NegateOperations]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#OpenScript\|OpenScript()]] | () | **Deprecated.** Used to open the given script instance in an editor window, in Roblox studio, at the given line. If no line is given as an argument it will default to 1. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#OpenWikiPage\|OpenWikiPage()]] | () | Opens the context help window to the wiki page that `url` links to. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#PromptForExistingAssetId\|PromptForExistingAssetId()]] | int64 | Opens a window in Roblox Studio that prompts the user to select an existing [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Animation]] asset. The `assetType` parameter must be `Animation`; other values are not supported and cause an error. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#PromptForExistingAssetIdAsync\|PromptForExistingAssetIdAsync()]] | int64 | Opens a window in Roblox Studio that prompts the user to select an existing [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType.Animation]] asset. The `assetType` parameter must be `Animation`; other values are not supported and cause an error. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#PromptSaveSelection\|PromptSaveSelection()]] | boolean | **Deprecated.** Prompts the user to save their current selection with the specified file name. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#PromptSaveSelectionAsync\|PromptSaveSelectionAsync()]] | boolean | Prompts the user to save their current selection with the specified file name. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#SaveSelectedToRoblox\|SaveSelectedToRoblox()]] | () | Opens an upload window for the user's current selection. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#SelectRibbonTool\|SelectRibbonTool()]] | () | Activates the specified Roblox Studio tool. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#Separate\|Separate()]] | Instances | Separates the given [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperations]] and returns the resulting parts. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#SetSetting\|SetSetting()]] | () | Stores a given value for later use under the given key. The value will persist even after Studio is closed. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag\|StartDrag()]] | () | Starts a drag action given a dictionary of parameters. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#Union\|Union()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Unions the given parts and returns the resulting [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperation]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#Deactivation\|Deactivation]] |  | Fired when the plugin is deactivated. |
| [[30 Official Roblox Docs/API Reference/Classes/Plugin#Unloading\|Unloading]] |  | Fires immediately before the [[30 Official Roblox Docs/API Reference/Classes/Plugin\|Plugin]] stops running. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CollisionEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

Returns whether the user has enabled **Collisions** in Studio's toolbar.

### DisableUIDragDetectorDrags

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

If `true`, toolbars and buttons for the plugin will ignore dragging related to a [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] instance.

### GridSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

Returns the grid snapping size the user has set in Studio's toolbar. Note that this property may have slight rounding errors; for example it may be `0.0099999997764826` for a user setting of `0.01`, or `0.4000000059604645` for a user setting of `0.4`.

### IsDebuggable

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether the plugin's scripts can be debugged in Studio. This property is not accessible through scripts.

## Methods

### Activate

```lua
Plugin:Activate(exclusiveMouse: boolean): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method sets the state of the calling plugin to activated. Activating the plugin allows mouse control through the [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetMouse|GetMouse()]] method.

At any given time, there are either 0 or 1 activated plugins. Activating a plugin will deactivate all other plugins and they will receive a [[30 Official Roblox Docs/API Reference/Classes/Plugin#Deactivation|Deactivation]] event.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/Plugin#IsActivatedWithExclusiveMouse|IsActivatedWithExclusiveMouse()]] which returns `true` if the plugin is currently active with an exclusive mouse, after having been activated via this method.
- [[30 Official Roblox Docs/API Reference/Classes/Plugin#Unloading|Unloading]] which fires immediately before the plugin is unloaded or reloaded via uninstallation, deactivation, or updating.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `exclusiveMouse` | boolean |  | A boolean specifying whether to activate the plugin with exclusive mouse. If `true`, a [[30 Official Roblox Docs/API Reference/Classes/PluginMouse\|PluginMouse]] can be retrieved via [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetMouse\|GetMouse()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### CreateDockWidgetPluginGui

> [!warning] Deprecated
> This method has been superseded by
> `Class.Plugin:CreateDockWidgetPluginGuiAsync()|CreateDockWidgetPluginGuiAsync()`.

```lua
Plugin:CreateDockWidgetPluginGui(pluginGuiId: string, dockWidgetPluginGuiInfo: DockWidgetPluginGuiInfo): DockWidgetPluginGui
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateDockWidgetPluginGuiAsync|CreateDockWidgetPluginGuiAsync()]]. It creates a new [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGui]] from the given [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pluginGuiId` | string |  | A unique and consistent identifier used to storing the widget's dock state and other internal details. |
| `dockWidgetPluginGuiInfo` | [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo\|DockWidgetPluginGuiInfo]] |  | Describes the [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui\|DockWidgetPluginGui]] to create (initial state, size, etc). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui\|DockWidgetPluginGui]] |  |

### CreateDockWidgetPluginGuiAsync

```lua
Plugin:CreateDockWidgetPluginGuiAsync(pluginGuiId: string, dockWidgetPluginGuiInfo: DockWidgetPluginGuiInfo): DockWidgetPluginGui
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

This method creates a new [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGui]] from the given [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]]. The first parameter, `pluginGuiId`, should be a unique and consistent string. It is used to save the state of the widget's dock state and other internal details.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pluginGuiId` | string |  | A unique and consistent identifier used to storing the widget's dock state and other internal details. |
| `dockWidgetPluginGuiInfo` | [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo\|DockWidgetPluginGuiInfo]] |  | Describes the [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui\|DockWidgetPluginGui]] to create (initial state, size, etc). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui\|DockWidgetPluginGui]] |  |

*Code samples for this member (`DockWidgetPluginGui-Hello-World-Example`) are published on the source page; their code is not part of the open-source repo.*

### CreatePluginAction

```lua
Plugin:CreatePluginAction(actionId: string, text: string, statusTip: string, iconName: string, allowBinding: boolean = True): PluginAction
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method creates a [[30 Official Roblox Docs/API Reference/Classes/PluginAction|PluginAction]] which represents a generic performable action in Studio with no directly‑associated [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton|PluginToolbarButton]].

See also [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreatePluginMenu|CreatePluginMenu()]] which creates a Studio [[30 Official Roblox Docs/API Reference/Classes/PluginMenu|PluginMenu]] that can display a list of [[30 Official Roblox Docs/API Reference/Classes/PluginAction|PluginActions]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionId` | string |  | Must be a unique string that identifies this PluginAction from others. |
| `text` | string |  | The displayed name of the action. |
| `statusTip` | string |  | The displayed description of the action. |
| `iconName` | string |  | The name of the icon used to display the plugin. |
| `allowBinding` | boolean | `True` | Whether the [[30 Official Roblox Docs/API Reference/Classes/PluginAction\|PluginAction]] will be hidden from Studio's shortcuts view. Useful for contextual actions. Defaults to true. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginAction\|PluginAction]] |  |

*Code samples for this member (`creating-a-pluginaction`) are published on the source page; their code is not part of the open-source repo.*

### CreatePluginMenu

```lua
Plugin:CreatePluginMenu(id: string, title: string, icon: string): PluginMenu
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This function creates a new [[30 Official Roblox Docs/API Reference/Classes/PluginMenu|PluginMenu]] which is a context menu that can be shown in Studio that displays a list of [[30 Official Roblox Docs/API Reference/Classes/PluginAction|PluginActions]] and also supports submenus.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | string |  | Unique ID for the menu. |
| `title` | string |  | The text to be displayed when used as a submenu. |
| `icon` | string |  | The icon to be displayed when used as a submenu. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMenu\|PluginMenu]] |  |

*Code samples for this member (`creating-a-pluginaction-and-pluginmenu`) are published on the source page; their code is not part of the open-source repo.*

### CreateToolbar

```lua
Plugin:CreateToolbar(name: string): PluginToolbar
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method creates a new [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar|PluginToolbar]] with the given name. The toolbar can then be used to create plugin buttons.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The visible text on the toolbar, labeling the group of buttons contained within. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar\|PluginToolbar]] |  |

*Code samples for this member (`Plugin-CreateToolbar1`) are published on the source page; their code is not part of the open-source repo.*

### Deactivate

```lua
Plugin:Deactivate(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Deactivates the plugin. This will disengage the associated [[30 Official Roblox Docs/API Reference/Classes/PluginMouse|PluginMouse]] if it has been activated.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/Plugin#Activate|Activate()]] which sets the state of the calling plugin to activated.
- [[30 Official Roblox Docs/API Reference/Classes/Plugin#Deactivation|Deactivation]] which fires when the plugin is deactivated.
- [[30 Official Roblox Docs/API Reference/Classes/Plugin#Unloading|Unloading]] which fires immediately before the plugin is unloaded or reloaded via uninstallation, deactivation, or updating.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetJoinMode

```lua
Plugin:GetJoinMode(): JointCreationMode
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode|Enum.JointCreationMode]] the user has set in Studio's toolbar.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode\|JointCreationMode]] |  |

### GetMouse

```lua
Plugin:GetMouse(): PluginMouse
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method returns a [[30 Official Roblox Docs/API Reference/Classes/PluginMouse|PluginMouse]] that can be used while the plugin is active through [[30 Official Roblox Docs/API Reference/Classes/Plugin#Activate|Activate()]].

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginMouse\|PluginMouse]] |  |

*Code samples for this member (`Plugin-GetMouse1`) are published on the source page; their code is not part of the open-source repo.*

### GetSelectedRibbonTool

```lua
Plugin:GetSelectedRibbonTool(): RibbonTool
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method returns the currently selected [[30 Official Roblox Docs/API Reference/Enums/RibbonTool|Enum.RibbonTool]].

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/RibbonTool\|RibbonTool]] |  |

*Code samples for this member (`Plugin-GetSelectedRibbonTool1`) are published on the source page; their code is not part of the open-source repo.*

### GetSetting

```lua
Plugin:GetSetting(key: string): Variant
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Retrieves a previously stored value with the given key, or `nil` if the given key doesn't exist.

Because multiple instances of the same plugin can run simultaneously (for example, if multiple Studio windows are open), you shouldn't depend on this value staying the same over time. The other plugin instances can update the setting at any time.

This call can silently fail and return `nil` if multiple instances of the same plugin are actively reading and writing data. If your plugin expects to write to settings frequently, you should double-check the returned value from this call after a short while to distinguish between a setting being temporarily unavailable and a setting not existing.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The string key that was previously passed to [[30 Official Roblox Docs/API Reference/Classes/Plugin#SetSetting\|SetSetting()]]. |

**Returns**

| Type | Description |
| --- | --- |
| Variant |  |

*Code samples for this member (`Plugin-GetSetting1`) are published on the source page; their code is not part of the open-source repo.*

### GetStudioUserId

> [!warning] Deprecated
> This member is deprecated.

```lua
Plugin:GetStudioUserId(): int64
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Deprecated`

Returns the Studio user's userId if they're logged in, otherwise returns 0.

**Returns**

| Type | Description |
| --- | --- |
| int64 |  |

### ImportFbxAnimation

> [!warning] Deprecated
> This member is deprecated.

```lua
Plugin:ImportFbxAnimation(rigModel: Instance, isR15: boolean = True): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

This method prompts the user to open a `.fbx` animation file that can be loaded onto the `rigModel`, then proceeds to insert the animation as a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] named "ImportedAnimation" in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. The `isR15` parameter determines whether the file is interpreted as an R15 rig and defaults to `true`.

Returns the resulting [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] instance. Errors if `rigModel` is `nil` or if the user cancels the file dialog without selecting a file.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rigModel` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The rig model that the imported animation will be applied to. |
| `isR15` | boolean | `True` | Whether the animation file should be interpreted as an R15 rig. Defaults to `true`. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

### ImportFbxAnimationAsync

```lua
Plugin:ImportFbxAnimationAsync(rigModel: Instance, isR15: boolean = True): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

This function prompts the user to open a `.fbx` animation file that can be loaded onto the `rigModel`, then proceeds to insert the animation as a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rigModel` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The rig model that the imported animation will be applied to. |
| `isR15` | boolean | `True` | Whether the animation file should be interpreted as an R15 rig. Defaults to `true`. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

### ImportFbxRig

> [!warning] Deprecated
> This method has been superseded by
> `Class.Plugin:ImportFbxRigAsync()|ImportFbxRigAsync()`.

```lua
Plugin:ImportFbxRig(isR15: boolean = True): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Plugin#ImportFbxRigAsync|ImportFbxRigAsync()]]. It prompts the user to open a `.fbx` file, uploads the individual components of the model as meshes, and generates a character rig for use in animation, which is loaded into the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `isR15` | boolean | `True` | Whether the rig file should be interpreted as R15. Defaults to `true`. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

### ImportFbxRigAsync

```lua
Plugin:ImportFbxRigAsync(isR15: boolean = True): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Prompts the user to open a `.fbx` file, uploads the individual components of the model as meshes, and generates a character rig for use in animation, which is loaded into the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `isR15` | boolean | `True` | Whether the rig file should be interpreted as R15. Defaults to `true`. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

### Intersect

```lua
Plugin:Intersect(objects: Instances): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Intersects the given parts and returns the resulting [[30 Official Roblox Docs/API Reference/Classes/IntersectOperation|IntersectOperation]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `objects` | Instances |  | The array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] to intersect. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

### IsActivated

```lua
Plugin:IsActivated(): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This function returns true if this plugin is currently active, after having been activated via the [[30 Official Roblox Docs/API Reference/Classes/Plugin#Activate|Activate()]] function.

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether the plugin is currently active. |

### IsActivatedWithExclusiveMouse

```lua
Plugin:IsActivatedWithExclusiveMouse(): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This function returns `true` if this plugin is currently active with an exclusive mouse, after having been activated via the [[30 Official Roblox Docs/API Reference/Classes/Plugin#Activate|Activate()]] function. If this returns `true`, a [[30 Official Roblox Docs/API Reference/Classes/PluginMouse|PluginMouse]] can be retrieved via [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetMouse|GetMouse()]].

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/Plugin#Deactivation|Deactivation]] which fires when the plugin is deactivated.
- [[30 Official Roblox Docs/API Reference/Classes/Plugin#Unloading|Unloading]] which fires immediately before the plugin is unloaded or reloaded via uninstallation, deactivation, or updating.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether this plugin is currently active with an exclusive mouse. |

### Negate

```lua
Plugin:Negate(objects: Instances): Instances
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Negates the given parts and returns the resulting [[30 Official Roblox Docs/API Reference/Classes/NegateOperation|NegateOperations]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `objects` | Instances |  | The array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] to negate. |

**Returns**

| Type | Description |
| --- | --- |
| Instances |  |

### OpenScript

> [!warning] Deprecated
> This member is deprecated.

```lua
Plugin:OpenScript(script: LuaSourceContainer, lineNumber: int = 1): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Deprecated`

Used to open the given script instance in an editor window, in Roblox studio, at the given line. If no line is given as an argument it will default to 1.

Prefer [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#OpenScriptDocumentAsync|ScriptEditorService:OpenScriptDocumentAsync()]], which provides better integration with other script editor APIs and is more extensible.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] |  | The [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] script instance to open. |
| `lineNumber` | int | `1` | The line number to navigate to in the editor. Defaults to `1`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Plugin-OpenScript1`) are published on the source page; their code is not part of the open-source repo.*

### OpenWikiPage

```lua
Plugin:OpenWikiPage(url: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Opens the context help window to the wiki page that `url` links to.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `url` | string |  | The URL of the wiki/documentation page to open. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Plugin-OpenWikiPage1`) are published on the source page; their code is not part of the open-source repo.*

### PromptForExistingAssetId

```lua
Plugin:PromptForExistingAssetId(assetType: string): int64
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Opens a window in Roblox Studio that prompts the user to select an existing animation asset from the user's inventory. Pass `Animation` as the `assetType` argument.

Returns the selected animation asset ID as an `int64`, or `-1` if the user closes the dialog without selecting an asset. If `assetType` is not `Animation`, this method errors.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetType` | string |  | The asset type to browse. Only `Animation` is supported. |

**Returns**

| Type | Description |
| --- | --- |
| int64 |  |

### PromptForExistingAssetIdAsync

```lua
Plugin:PromptForExistingAssetIdAsync(assetType: string): int64
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Opens a window in Roblox Studio that prompts the user to select an existing animation asset from the user's inventory. Pass `Animation` as the `assetType` argument.

Returns the selected animation asset ID as an `int64`, or `-1` if the user closes the dialog without selecting an asset. If `assetType` is not `Animation`, this method errors.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetType` | string |  | The asset type to browse. Only `Animation` is supported. |

**Returns**

| Type | Description |
| --- | --- |
| int64 |  |

### PromptSaveSelection

> [!warning] Deprecated
> This method has been superseded by
> `Class.Plugin:PromptSaveSelectionAsync()|PromptSaveSelectionAsync()`.

```lua
Plugin:PromptSaveSelection(suggestedFileName: string): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Plugin#PromptSaveSelectionAsync|PromptSaveSelectionAsync()]]. It prompts the user to save their current selection with the specified file name and returns whether the user completed the save.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `suggestedFileName` | string |  | The default file name shown in the save dialog. Defaults to an empty string. |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### PromptSaveSelectionAsync

```lua
Plugin:PromptSaveSelectionAsync(suggestedFileName: string): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Prompts the user to save their current selection with the specified file name. Returns `true` if the user did save the file.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `suggestedFileName` | string |  | The default file name shown in the save dialog. Defaults to an empty string. |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### SaveSelectedToRoblox

```lua
Plugin:SaveSelectedToRoblox(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Opens an upload window for the user's current selection.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SelectRibbonTool

```lua
Plugin:SelectRibbonTool(tool: RibbonTool, position: UDim2): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Activates the specified Roblox Studio tool. If the tool opens a window, the position parameter specifies where it should be shown on the screen.

An object must be selected in order for this to work correctly. Also note that altering the scale fields of the `position` property will not affect the dialog popups.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tool` | [[30 Official Roblox Docs/API Reference/Enums/RibbonTool\|RibbonTool]] |  | The [[30 Official Roblox Docs/API Reference/Enums/RibbonTool\|Enum.RibbonTool]] to activate. |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] screen position at which to show the tool's dialog window, if applicable. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Separate

```lua
Plugin:Separate(objects: Instances): Instances
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Separates the given [[30 Official Roblox Docs/API Reference/Classes/UnionOperation|UnionOperations]] and returns the resulting parts.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `objects` | Instances |  | The array of [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperations]] to separate. |

**Returns**

| Type | Description |
| --- | --- |
| Instances |  |

### SetSetting

```lua
Plugin:SetSetting(key: string, value: Variant): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Stores a given value for later use under the given key. The value will persist even after Roblox Studio is closed. These settings are saved in `.json` format as a map with string keys. Arrays are automatically converted to maps by converting the numeric keys to strings first.

Note that the `.json` format imposes additional restrictions, including the following characters which can corrupt the settings file:

- Backslashes (`\`) in keys or values, in particular escaped quotes (`\"`).
- Newlines (`\n`) in keys.
- Quotes (`"`) in keys.
- Periods (`.`) in keys.

This call can silently fail if multiple instances of the same plugin are actively reading and writing data. If your plugin expects to write to settings frequently, you may check that the data has been properly written by calling [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetSetting|GetSetting()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The string key to store the value under. |
| `value` | Variant |  | The value to store. Must be JSON-serializable (string, number, boolean, table, or `nil`). |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Plugin-SetSetting1`) are published on the source page; their code is not part of the open-source repo.*

### StartDrag

```lua
Plugin:StartDrag(dragData: Dictionary): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method initiates a drag action using a dictionary of parameters. The parameters are as follows:

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Sender` | string | `""` | Identifies the source of the drag action to the drop target |
| `MimeType` | string | `""` | The MIME type of `Data`. |
| `Data` | string | `""` | Information about the drag action, for example what is being dragged. Should be used by the drop target. |
| `MouseIcon` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | `""` | The icon to use for the mouse cursor during the drag. If empty, uses the default cursor. |
| `DragIcon` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | `""` | An image to render under the mouse cursor during the drag. This should represent the item being dragged. |
| `HotSpot` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | `Datatype.Vector2.new(0, 0)` | The pixel offset from the top-left where the cursor should "hold" the `DragIcon`. |

See also [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragEntered|PluginGui.PluginDragEntered]], [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragMoved|PluginGui.PluginDragMoved]], [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragDropped|PluginGui.PluginDragDropped]], and [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragLeft|PluginGui.PluginDragLeft]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `dragData` | Dictionary |  | A dictionary describing the drag, including fields such as `Sender`, `MimeType`, `Data`, `MouseIcon`, `DragIcon`, and `HotSpot`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`plugin-drag-and-drop`) are published on the source page; their code is not part of the open-source repo.*

### Union

```lua
Plugin:Union(objects: Instances): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Unions the given parts and returns the resulting [[30 Official Roblox Docs/API Reference/Classes/UnionOperation|UnionOperation]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `objects` | Instances |  | The array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] to union together. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

## Events

### Deactivation

```lua
Plugin.Deactivation()
```

**Security:** PluginSecurity

Fired when the [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] is deactivated. This occurs when either the plugin code calls [[30 Official Roblox Docs/API Reference/Classes/Plugin#Deactivate|Deactivate()]], or because some other plugin called [[30 Official Roblox Docs/API Reference/Classes/Plugin#Activate|Activate()]], which forces all other plugins to lose their active state.

See also [[30 Official Roblox Docs/API Reference/Classes/Plugin#Unloading|Unloading]] which fires immediately before the plugin is unloaded or reloaded via uninstallation, deactivation, or updating.

### Unloading

```lua
Plugin.Unloading()
```

**Security:** PluginSecurity

This event fires immediately before the [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] stops running. Plugins are unloaded when disabled, uninstalled, about to be updated, or when the place is closing.

It enables a plugin to clean up after itself before its scripts stop running, e.g. to remove unnecessary instances from the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. If a plugin does not clean up properly, the old copies will remain. When this occurs, users may be forced to close and reopen the place which is a bad user experience.

Plugin-related instances such as [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton|PluginToolbarButtons]], [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGuis]], and [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGuis]] are automatically cleaned up when the plugin is unloaded so there is no need to remove them.

---
*Source: [Plugin](https://create.roblox.com/docs/reference/engine/classes/Plugin) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
