---
title: "GuiService"
description: "Offers numerous properties and methods for working with `GuiObjects`, player preferences, and other UI‑related tasks."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GuiService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Offers numerous properties and methods for working with [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]], player preferences, and other UI‑related tasks.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`GuiService` offers numerous properties and methods for working with [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]], player preferences, and other UI‑related tasks.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#AutoSelectGuiEnabled\|AutoSelectGuiEnabled]] | boolean | If activated, the <kbd>Select</kbd> button on a gamepad or <kbd>Backslash</kbd> will automatically set a GUI as the selected object. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#CoreGuiNavigationEnabled\|CoreGuiNavigationEnabled]] | boolean | Toggles whether or not objects in the [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] can be navigated using a gamepad. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#GuiNavigationEnabled\|GuiNavigationEnabled]] | boolean | Used to enable and disable the default controller GUI navigation. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#IsModalDialog\|IsModalDialog]] | boolean | **Deprecated.** Indicates whether a modal dialog is visible. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#IsWindows\|IsWindows]] | boolean | **Deprecated.** Indicates whether the user is playing on a computer running Windows. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#MenuIsOpen\|MenuIsOpen]] | boolean | Returns `true` if any menu of [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] is open. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize\|PreferredTextSize]] | [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize\|PreferredTextSize]] | Gets the player's preferred text size as an [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize\|Enum.PreferredTextSize]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency\|PreferredTransparency]] | float | Gets the player's preferred transparency as a number between `0` and `1`. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#ReducedMotionEnabled\|ReducedMotionEnabled]] | boolean | Returns `true` if the player has enabled reduced motion. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject\|SelectedObject]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] | Sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] currently being focused on by the GUI navigator. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#TopbarInset\|TopbarInset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] | Used to determine the absolute size and position of unobstructed area within top bar space. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#TouchControlsEnabled\|TouchControlsEnabled]] | boolean | Used to enable and disable touch controls and touch control display UI. Defaults to `true`. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#ViewportDisplaySize\|ViewportDisplaySize]] | [[30 Official Roblox Docs/API Reference/Enums/DisplaySize\|DisplaySize]] | Read-only property which represents the physical rendering size of the viewport. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#AddSelectionParent\|AddSelectionParent()]] | () | **Deprecated.** Creates a selection group where gamepad GUI navigation will only consider selectable objects that are within the group. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#AddSelectionTuple\|AddSelectionTuple()]] | () | **Deprecated.** **AddSelectionTuple** works similarly to [[30 Official Roblox Docs/API Reference/Classes/GuiService#AddSelectionParent\|GuiService:AddSelectionParent()]], but you can give it a tuple of [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] that you want to be contained in the group.<br><br>Beware that the second argument is _not_ a table, but rather the first of several [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] in the tuple. To pass the contents of a table, use `unpack`/`table.unpack`:<br><br>`local frame = script.Parent`<br>`-- Passing various GuiObject individually`<br>`GuiService:AddSelectionTuple("InventoryButtons", frame.Sort, frame.Trash, frame.Drop)`<br>`-- Unpacking a table of GuiObject (unpack/table.unpack are equivalent)`<br>`local inventoryButtons = { frame.Sort, frame.Trash, frame.Drop }`<br>`GuiService:AddSelectionTuple("InventoryButtons", unpack(inventoryButtons))` |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#CloseInspectMenu\|CloseInspectMenu()]] | () | Closes the avatar inspection menu, if open. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#DismissNotification\|DismissNotification()]] | boolean | Dismisses a notification previously shown by [[30 Official Roblox Docs/API Reference/Classes/GuiService#SendNotification\|SendNotification()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#GetEmotesMenuOpen\|GetEmotesMenuOpen()]] | boolean | Checks if the player emotes menu is open. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#GetGameplayPausedNotificationEnabled\|GetGameplayPausedNotificationEnabled()]] | boolean | Returns whether or not the [[30 Official Roblox Docs/API Reference/Classes/Player#GameplayPaused\|Player.GameplayPaused]] notification has been disabled. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#GetGuiInset\|GetGuiInset()]] | Tuple | Returns two [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] values representing the inset of user GUIs in pixels, from the top‑left corner of the screen and the bottom‑right corner of the screen respectively. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#GetInsetArea\|GetInsetArea()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] | Takes an [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets\|Enum.ScreenInsets]] value and returns a [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] describing the inset region, relative to the [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets\|CoreUISafeInsets]] area. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#GetInspectMenuEnabled\|GetInspectMenuEnabled()]] | boolean | Returns whether the avatar inspection menu is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#InspectPlayerFromHumanoidDescription\|InspectPlayerFromHumanoidDescription()]] | () | Allows the avatar inspection menu to appear showing the assets listed in a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] object. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#InspectPlayerFromUserId\|InspectPlayerFromUserId()]] | () | Allows the avatar inspection menu to appear showing the user that has the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#IsTenFootInterface\|IsTenFootInterface()]] | boolean | **Deprecated.** Returns `true` if the client is using the ten foot interface, a special version of Roblox's UI exclusive to consoles. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#RemoveSelectionGroup\|RemoveSelectionGroup()]] | () | **Deprecated.** Removes a group that was created with [[30 Official Roblox Docs/API Reference/Classes/GuiService#AddSelectionParent\|AddSelectionParent()]] or [[30 Official Roblox Docs/API Reference/Classes/GuiService#AddSelectionTuple\|AddSelectionTuple()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#Select\|Select()]] | () | Sets [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject\|GuiService.SelectedObject]] to a child of a provided instance that is the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui\|PlayerGui]] or its descendants. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#SendNotification\|SendNotification()]] | string | Displays a notification described by `notificationInfo` and returns a unique identifier for it. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#SetEmotesMenuOpen\|SetEmotesMenuOpen()]] | () | Opens or closes the player emotes menu. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#SetGameplayPausedNotificationEnabled\|SetGameplayPausedNotificationEnabled()]] | () | Lets you disable the built-in notification when a player's gameplay is paused. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#SetInspectMenuEnabled\|SetInspectMenuEnabled()]] | () | Allows you to enable or disable the avatar inspection menu. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#MenuClosed\|MenuClosed]] |  | Fires when the user **closes** the Roblox [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] escape menu. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiService#MenuOpened\|MenuOpened]] |  | Fires when the user **opens** the Roblox [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] escape menu. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoSelectGuiEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

If activated, the <kbd>Select</kbd> button on a gamepad or
<kbd>Backslash</kbd> will automatically set a GUI as the selected object.
Disabling this means that GUI navigation will still work if [[30 Official Roblox Docs/API Reference/Classes/GuiService#GuiNavigationEnabled|GuiNavigationEnabled]] is enabled, but you will have to set [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|SelectedObject]] manually to start navigation.

### CoreGuiNavigationEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI, Input · **Tags:** `Hidden`, `NotReplicated`

Toggles whether or not objects in the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] can be navigated using a gamepad.

### GuiNavigationEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

Used to enable and disable the default controller GUI navigation.

### IsModalDialog

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

This property tells whether or not a modal dialog is visible, such as the game menu or a purchase prompt.

### IsWindows

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

The IsWindows property defines if the user is playing on a computer running Windows.

### MenuIsOpen

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Returns `true` if any menu of [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] is open.

### PreferredTextSize

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|PreferredTextSize]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Gets the player's preferred text size as an [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|Enum.PreferredTextSize]] value of [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|Medium]] (default), [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|Large]], [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|Larger]], or [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|Largest]]. This property maps to the **Text Size** setting available to players from the Roblox and in‑game **Settings** menus, and it can be combined with [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Object.GetPropertyChangedSignal()]] to detect text size setting changes for purposes of adjusting UI.

When working with UI elements, note the following behaviors:

- Text that is constrained to a minimum and/or maximum size through a [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint|UITextSizeConstraint]] will **not** shrink below or expand above the set [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize|MinTextSize]]/[[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MaxTextSize|MaxTextSize]], regardless of the player's text size setting.

- When [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextScaled]] is enabled for a [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextScaled|TextButton]], the element's text will **not** be scaled by the [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|PreferredTextSize]] value.

- UI elements with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] enabled will shrink/grow as [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|PreferredTextSize]] decreases/increases (element bounds will resize to fit the resized text).

- When [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextWrapped|TextWrapped]] is enabled for a [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextWrapped|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextWrapped|TextButton]], the element's text will wrap to additional lines as [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|PreferredTextSize]] increases, within limits of the element's absolute size.

- The results returned by [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextSize|TextService:GetTextSize()]] and [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextBoundsAsync|TextService:GetTextBoundsAsync()]] honor changes related to [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|PreferredTextSize]].

*Code samples for this member (`GuiService-PreferredTextSize`) are published on the source page; their code is not part of the open-source repo.*

### PreferredTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

Gets the player's preferred transparency as a number between `0` and `1`. This property maps to the **Background Transparency** setting available to players from the Roblox and in‑experience **Settings** menus, and it can be combined with [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Object.GetPropertyChangedSignal()]] to detect transparency setting changes for purposes of adjusting UI.

A value of `1` (default) indicates the player prefers the default background transparency, while a value of `0` indicates the player prefers fully opaque (non‑transparent) background transparency for improved readability and contrast. Multiplying a UI element's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] with [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|PreferredTransparency]] is the recommended approach, such that backgrounds become more opaque as [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|PreferredTransparency]] approaches `0`.

*Code samples for this member (`GuiService-PreferredTransparency`) are published on the source page; their code is not part of the open-source repo.*

### ReducedMotionEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

Returns `true` if the player has enabled reduced motion, indicating that they want motion effects and animations to be reduced or completely removed. This property maps to the **Reduce Motion** toggle available from the Roblox and in‑experience **Settings** menus. See [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines#Reduced motion|accessibility guidelines]] for usage recommendations.

### SelectedObject

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

Sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] currently being focused on by the GUI navigator. This may reset to `nil` if the object is off screen.

This property is changed by the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionGained|SelectionGained]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionLost|SelectionLost]] events. If you would like to determine when this property changes without tracking these events for all GUI elements, you can use the [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] event.

*Code samples for this member (`printing-when-gamepad-selection-changes`) are published on the source page; their code is not part of the open-source repo.*

### TopbarInset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]] object representing the unoccupied area between the Roblox left-most controls and the edge of the device safe area.

The value is dynamic and can be expected to change based on the visibility of UI controls such as changing the local player's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] property, usage of [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|StarterGui:SetCoreGuiEnabled()]], changing the size and position of Roblox UI Controls, and/or others. For this reason, it's recommend that you detect and react to changes of this property with [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Object:GetPropertyChangedSignal()]].

*Code samples for this member (`GuiService-TopbarInset`) are published on the source page; their code is not part of the open-source repo.*

### TouchControlsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI, Input

Used to enable and disable touch controls and touch control display UI. Defaults to `true`.

### ViewportDisplaySize

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|DisplaySize]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Read-only property which represents the physical rendering size of the viewport:

- [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Enum.DisplaySize.Small]] — Most tablet/mobile/handheld devices
- [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Enum.DisplaySize.Medium]] — Most laptops and monitors
- [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Enum.DisplaySize.Large]] — Most TVs or larger

You can listen for changes to this property through the [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|GetPropertyChangedSignal()]] method to adapt UI to various display sizes.

*Code samples for this member (`GuiService-ViewportDisplaySize`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### AddSelectionParent

> [!warning] Deprecated
> This member is deprecated.

```lua
GuiService:AddSelectionParent(selectionName: string, selectionParent: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

Creates a selection group where gamepad GUI navigation will only consider selectable objects that are within the group (children of `selectionParent`). An example is when you have a menu pop open and there are other selectable objects on the screen, possibly from previous menus, but you want the user to only be able to select GUI objects in the new menu.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `selectionName` | string |  | A unique name identifying this selection group. |
| `selectionParent` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] whose selectable descendants form the navigation group. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### AddSelectionTuple

> [!warning] Deprecated
> This member is deprecated.

```lua
GuiService:AddSelectionTuple(selectionName: string, selections: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

Functions similarly to [[30 Official Roblox Docs/API Reference/Classes/GuiService#AddSelectionParent|GuiService:AddSelectionParent()]], but you can give it a tuple of [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that you want to be contained in the group.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `selectionName` | string |  | The name of the added selection. |
| `selections` | Tuple |  | The selection(s) added. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### CloseInspectMenu

```lua
GuiService:CloseInspectMenu(): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

This method closes the [[30 Official Roblox Docs/Players/Avatar Inspect Menu|Avatar Inspect Menu]], if open, when run from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/GuiService#InspectPlayerFromHumanoidDescription|InspectPlayerFromHumanoidDescription()]] which allows the avatar inspection menu to appear showing the assets listed in a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] object.

- [[30 Official Roblox Docs/API Reference/Classes/GuiService#InspectPlayerFromUserId|InspectPlayerFromUserId()]] which allows the avatar inspection menu to appear showing the user that has the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### DismissNotification

```lua
GuiService:DismissNotification(notificationId: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI

Dismisses the notification identified by `notificationId`, which is the string returned when the notification was created with [[30 Official Roblox Docs/API Reference/Classes/GuiService#SendNotification|SendNotification()]]. If the notification was created with an `OnDismiss` callback, that callback is invoked. Returns `true` when a matching notification is found and dismissed, or `false` when no active notification has the given `notificationId`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `notificationId` | string |  | The identifier returned by [[30 Official Roblox Docs/API Reference/Classes/GuiService#SendNotification\|SendNotification()]] for the notification to dismiss. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if a matching notification was found and dismissed; `false` if no active notification has the given `notificationId`. |

### GetEmotesMenuOpen

```lua
GuiService:GetEmotesMenuOpen(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns a boolean indicating whether or not the player emotes menu is open. You can open or close the emotes menu by calling the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SetEmotesMenuOpen|SetEmotesMenuOpen()]] method.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the emotes menu is open. |

### GetGameplayPausedNotificationEnabled

```lua
GuiService:GetGameplayPausedNotificationEnabled(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI

This method returns whether or not the [[30 Official Roblox Docs/API Reference/Classes/Player#GameplayPaused|Player.GameplayPaused]] notification has been disabled through [[30 Official Roblox Docs/API Reference/Classes/GuiService#SetGameplayPausedNotificationEnabled|SetGameplayPausedNotificationEnabled()]].

See also [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode|Workspace.StreamingIntegrityMode]] and [[30 Official Roblox Docs/API Reference/Enums/StreamingIntegrityMode|Enum.StreamingIntegrityMode]] for more details on when gameplay is paused.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether or not the [[30 Official Roblox Docs/API Reference/Classes/Player#GameplayPaused\|Player.GameplayPaused]] notification has been disabled. |

### GetGuiInset

```lua
GuiService:GetGuiInset(): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns two [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] values representing the inset of user GUIs in pixels, from the top‑left corner of the screen and the bottom‑right corner of the screen respectively.

Note that the inset values supplied by this method only take effect on [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGuis]] that have their [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#IgnoreGuiInset|IgnoreGuiInset]] property set to `false`.

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple of two [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] values describing the current specified GUI inset. |

*Code samples for this member (`GuiService-GetGuiInset`) are published on the source page; their code is not part of the open-source repo.*

### GetInsetArea

```lua
GuiService:GetInsetArea(screenInsets: ScreenInsets): Rect
```

**Thread safety:** Unsafe · **Capabilities:** UI

Takes an [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|Enum.ScreenInsets]] value and returns a [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]] describing the inset region relative to the [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|CoreUISafeInsets]] area, effectively the usable rectangle for a particular [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|Enum.ScreenInsets]] area.

On a mobile device screen, for example, querying `GetInsetArea(Enum.ScreenInsets.None)` may return a result such as `-59, -58, 792, 334`, meaning the usable rectangle for [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|Enum.ScreenInsets.None]] has a top‑left corner `59` pixels left and `58` pixels up from the top‑left corner of the core UI area, and a bottom‑right corner `792` pixels right and `334` pixels down from the top‑left corner of the core UI area.

*(image in the full Top G Vault)*

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `screenInsets` | [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets\|ScreenInsets]] |  | The [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets\|Enum.ScreenInsets]] value indicating which inset area to query. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] of the usable region for the specified [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets\|Enum.ScreenInsets]] area. |

*Code samples for this member (`GuiService-GetInsetArea`) are published on the source page; their code is not part of the open-source repo.*

### GetInspectMenuEnabled

```lua
GuiService:GetInspectMenuEnabled(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI

This method returns whether the [[30 Official Roblox Docs/Players/Avatar Inspect Menu|Avatar Inspect Menu]] is currently enabled. The feature is enabled by default and can be disabled using the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SetInspectMenuEnabled|SetInspectMenuEnabled()]] method.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the avatar inspection menu is enabled. |

### InspectPlayerFromHumanoidDescription

```lua
GuiService:InspectPlayerFromHumanoidDescription(humanoidDescription: Instance, name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI, AvatarAppearance

This method allows the [[30 Official Roblox Docs/Players/Avatar Inspect Menu|Avatar Inspect Menu]] to appear showing the assets listed in a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] object. This allows further customization with what is shown in the inspection menu when players inspect other players in your experience.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiService#InspectPlayerFromUserId|InspectPlayerFromUserId()]] which allows the avatar inspection menu to appear showing the user that has the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | A [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] object that contains the assets to show in the inspection menu. |
| `name` | string |  | The name of the player being inspected to show in the menu. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`opening-an-inspect-menu-with-a-humanoiddescription`) are published on the source page; their code is not part of the open-source repo.*

### InspectPlayerFromUserId

```lua
GuiService:InspectPlayerFromUserId(userId: User): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI, AvatarAppearance

This method allows the [[30 Official Roblox Docs/Players/Avatar Inspect Menu|Avatar Inspect Menu]] to appear showing the user that has the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]]. This is especially useful when you want to inspect players who aren't in the current experience.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiService#InspectPlayerFromHumanoidDescription|InspectPlayerFromHumanoidDescription()]] which allows you to bring up the avatar inspection menu showing the assets listed in a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] object.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the player to inspect. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`opening-the-inspect-menu-for-a-userid`) are published on the source page; their code is not part of the open-source repo.*

### IsTenFootInterface

> [!warning] Deprecated
> This method has been superseded by the
> `Class.GuiService.ViewportDisplaySize|ViewportDisplaySize` property which
> represents the internally‑categorized rendering size of the viewport.

```lua
GuiService:IsTenFootInterface(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns `true` if the client is using the ten foot interface, a special version of Roblox's UI exclusive to consoles.

Note that you should **not** use this property in an attempt to verify if the player is on a console or not. Instead, consider reading [[30 Official Roblox Docs/API Reference/Classes/GuiService#ViewportDisplaySize|ViewportDisplaySize]]. This method is hardcoded to return `true` whenever the client runs on a console, regardless of how the player is actually interacting with the device, making it an unreliable proxy for rendering context.

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the client is using the ten foot interface (console UI mode); `false` otherwise. |

### RemoveSelectionGroup

> [!warning] Deprecated
> This member is deprecated.

```lua
GuiService:RemoveSelectionGroup(selectionName: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

Removes a group that was created with [[30 Official Roblox Docs/API Reference/Classes/GuiService#AddSelectionParent|AddSelectionParent()]] or [[30 Official Roblox Docs/API Reference/Classes/GuiService#AddSelectionTuple|AddSelectionTuple()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `selectionName` | string |  | The name of the selection group to remove. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Select

```lua
GuiService:Select(selectionParent: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

When called on an instance `selectionParent` that is the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or a descendant of it, the engine searches all available selectable, visible and on-screen [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] that are descendants of `selectionParent` and sets the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|SelectedObject]] to the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] with the smallest [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionOrder|SelectionOrder]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `selectionParent` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The parent of selection whose descendants are searched. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SendNotification

```lua
GuiService:SendNotification(notificationInfo: Dictionary): string
```

**Thread safety:** Unsafe · **Capabilities:** UI

Displays a notification built from the `notificationInfo` dictionary using Roblox's native notification UI, and returns a unique identifier string for the notification. The following fields of `notificationInfo` are recognized:

| Field | Type | Description |
| --- | --- | --- |
| `Title` | `string` | The notification's title text. |
| `Text` | `string` | The notification's body text. |
| `Icon` | `string` | An image asset to display with the notification. |
| `Buttons` |  | An array of button definitions. Each entry is a table with a `Text` (`string`), a `ButtonType` ([Enum.NotificationButtonType](https://create.roblox.com/docs/reference/engine/enums/NotificationButtonType)), and an `OnActivated` (`function`) callback invoked when the button is pressed. |
| `OnDisplay` | `function` | Invoked when the notification is shown. |
| `OnDismiss` | `function` | Invoked when the notification is dismissed. |

The returned identifier can be passed to [[30 Official Roblox Docs/API Reference/Classes/GuiService#DismissNotification|DismissNotification()]] to dismiss the notification programmatically; an empty string is returned if the notification could not be queued.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `notificationInfo` | Dictionary |  | A dictionary describing the notification. Recognized fields are `Title` (string), `Text` (string), `Icon` (string), `Buttons` (an array of button tables, each with a `Text` string, a `ButtonType` [Enum.NotificationButtonType](https://create.roblox.com/docs/reference/engine/enums/NotificationButtonType) value, and an `OnActivated` callback), and `OnDisplay`/`OnDismiss` callback functions. |

**Returns**

| Type | Description |
| --- | --- |
| string | A unique identifier string for the notification, which can be passed to [[30 Official Roblox Docs/API Reference/Classes/GuiService#DismissNotification\|DismissNotification()]]. Returns an empty string if the notification could not be queued. |

### SetEmotesMenuOpen

```lua
GuiService:SetEmotesMenuOpen(isOpen: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Opens or closes the player emotes menu.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `isOpen` | boolean |  | Whether to open (`true`) or close (`false`) the emotes menu. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetGameplayPausedNotificationEnabled

```lua
GuiService:SetGameplayPausedNotificationEnabled(enabled: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

This method lets you disable the built-in notification when a player's gameplay is paused. You can then add in your own UI and customize it.

You can query whether the notification is enabled by calling the [[30 Official Roblox Docs/API Reference/Classes/GuiService#GetGameplayPausedNotificationEnabled|GetGameplayPausedNotificationEnabled()]] method.

See also [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode|Workspace.StreamingIntegrityMode]] and [[30 Official Roblox Docs/API Reference/Enums/StreamingIntegrityMode|Enum.StreamingIntegrityMode]] for more details on when gameplay is paused.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | boolean |  | Whether or not the built-in notification GUI is disabled. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetInspectMenuEnabled

```lua
GuiService:SetInspectMenuEnabled(enabled: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

This method allows you to enable or disable the [[30 Official Roblox Docs/Players/Avatar Inspect Menu|Avatar Inspect Menu]]. The feature is enabled by default.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | boolean |  | A boolean indicating whether to enable or disable the menu. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### MenuClosed

```lua
GuiService.MenuClosed()
```

**Capabilities:** UI

Fires when the user **closes** the Roblox [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] escape menu.

### MenuOpened

```lua
GuiService.MenuOpened()
```

**Capabilities:** UI

Fires when the user **opens** the Roblox [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] escape menu.

---
*Source: [GuiService](https://create.roblox.com/docs/reference/engine/classes/GuiService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
