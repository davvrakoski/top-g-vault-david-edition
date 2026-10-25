---
title: "StarterGui"
description: "A container for `LayerCollector` objects to be copied into the `PlayerGui` of `Players`. Also provides a range of functions for interacting with the `CoreGui`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StarterGui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container for [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] objects to be copied into the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] of [[30 Official Roblox Docs/API Reference/Classes/Player|Players]]. Also provides a range of functions for interacting with the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BasePlayerGui|BasePlayerGui]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

[[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] is a container object designed to hold [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] objects such as [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGuis]].

When a [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] spawns, the contents of their [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] (if any) are emptied. Children of the [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] are then copied along with their descendants into the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]. Note, however, that [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] objects such as [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGuis]] with their [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#ResetOnSpawn|ResetOnSpawn]] property set to `false` will only be placed into each player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] once and will not be deleted when the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] respawns.

[[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] also includes a range of functions allowing you to interact with the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]]. For example [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|StarterGui:SetCoreGuiEnabled()]] can be used to disable elements of the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], and [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCore|StarterGui:SetCore()]] can perform a range of functions including creating notifications and system messages.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ClipsDescendantsSupportsRotation\|ClipsDescendantsSupportsRotation]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants\|ClipsDescendants]] property of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] clips **rotated** descendants. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ProcessUserInput\|ProcessUserInput]] | boolean | Allows this service to process input like [[30 Official Roblox Docs/API Reference/Classes/PlayerGui\|PlayerGui]] and [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] do. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ResetPlayerGuiOnSpawn\|ResetPlayerGuiOnSpawn]] | boolean | **Deprecated.** Determines whether each child parented to the StarterGui will be cloned into a player's PlayerGui when that player's character is respawned. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#RtlTextSupport\|RtlTextSupport]] | [[30 Official Roblox Docs/API Reference/Enums/RtlTextSupport\|RtlTextSupport]] | Controls whether right-to-left (RTL) text layout is enabled for text in [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] throughout the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ScreenOrientation\|ScreenOrientation]] | [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|ScreenOrientation]] | Sets the default screen orientation mode for users with mobile devices. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ShowDevelopmentGui\|ShowDevelopmentGui]] | boolean | Determines whether the contents of [[30 Official Roblox Docs/API Reference/Classes/StarterGui\|StarterGui]] is visible in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#VirtualCursorMode\|VirtualCursorMode]] | [[30 Official Roblox Docs/API Reference/Enums/VirtualCursorMode\|VirtualCursorMode]] | Controls whether the gamepad virtual cursor is enabled for navigating [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] with a controller. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#GetCore\|GetCore()]] | Variant | Returns a variable that has been specified by a Roblox core script. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#GetCoreGuiEnabled\|GetCoreGuiEnabled()]] | boolean | Returns whether the given [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType]]is enabled, or if it has been disabled using [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled\|StarterGui:SetCoreGuiEnabled()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCore\|SetCore()]] | () | Allows you to perform certain interactions with Roblox's core scripts. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled\|SetCoreGuiEnabled()]] | () | Sets whether the [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] element associated with the given [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType]] is enabled or disabled. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BasePlayerGui|BasePlayerGui]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ClipsDescendantsSupportsRotation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `NotScriptable`

If `true`, the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants|ClipsDescendants]] property of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] clips its **rotated** descendants.

### ProcessUserInput

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `Hidden`, `NotReplicated`

Allows [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] to process input like [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] and [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] do. The default value is `false`.

### ResetPlayerGuiOnSpawn

> [!warning] Deprecated
> This property is deprecated. Use `Class.LayerCollector.ResetOnSpawn` to
> control the resetting behavior for individual `Class.LayerCollector`
> objects.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `Deprecated`

If set to true, each child parented to the [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] will be cloned into a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] when that player's character is respawned.

If one of the children is a PlayerGui and it has its PlayerGui property set to false, it will not be cloned.

### RtlTextSupport

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RtlTextSupport|RtlTextSupport]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `NotScriptable`

This property determines whether right-to-left (RTL) text layout is applied to the text of [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] in the experience, which is needed to correctly display languages written right-to-left, such as Arabic and Hebrew.

The default value is [[30 Official Roblox Docs/API Reference/Enums/RtlTextSupport|Enum.RtlTextSupport.Default]]. Both [[30 Official Roblox Docs/API Reference/Enums/RtlTextSupport|Enum.RtlTextSupport.Default]] and [[30 Official Roblox Docs/API Reference/Enums/RtlTextSupport|Enum.RtlTextSupport.Enabled]] turn RTL text layout support on, while [[30 Official Roblox Docs/API Reference/Enums/RtlTextSupport|Enum.RtlTextSupport.Disabled]] turns it off.

### ScreenOrientation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|ScreenOrientation]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the preferred screen orientation mode for users with mobile devices. For the different modes available, see [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|Enum.ScreenOrientation]].

By default, this property is set to [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|Sensor]], meaning the experience is displayed depending on the best match to the device's current orientation, either landscape (left/right) or portrait.

When a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] joins the experience on a mobile device, this property determines the device's starting orientation and sets that player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#ScreenOrientation|PlayerGui.ScreenOrientation]] accordingly. You can also get the player's current screen orientation through [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#CurrentScreenOrientation|PlayerGui.CurrentScreenOrientation]], useful when using one of the "sensor" [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|Enum.ScreenOrientation]] settings.

Note that changing this property will not change the screen orientation for [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] already in the experience. To change the orientation for an existing player, use their [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#ScreenOrientation|PlayerGui.ScreenOrientation]] property.

### ShowDevelopmentGui

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the contents of [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] is visible in Studio.

### VirtualCursorMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VirtualCursorMode|VirtualCursorMode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `NotScriptable`

This property determines whether the gamepad virtual cursor, which lets players move a pointer across on-screen [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] using a controller, is enabled.

The default value is [[30 Official Roblox Docs/API Reference/Enums/VirtualCursorMode|Enum.VirtualCursorMode.Default]]. Setting it to [[30 Official Roblox Docs/API Reference/Enums/VirtualCursorMode|Enum.VirtualCursorMode.Enabled]] turns the virtual cursor on and [[30 Official Roblox Docs/API Reference/Enums/VirtualCursorMode|Enum.VirtualCursorMode.Disabled]] turns it off. When a player is in VR, the virtual cursor is always active regardless of this property's value.

## Methods

### GetCore

```lua
StarterGui:GetCore(parameterName: string): Variant
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`

This method returns data set or made available by Roblox's core scripts. The first and only parameter is a string that selects the information to be fetched. The following sections describe the strings and the data they return by this function.

Calling this method may yield. Many of these also register an equivalent [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCore|SetCore()]] function (these are marked with an asterisk).

##### PointsNotificationsActive \*

Returns `true` if player point notifications are enabled.

##### BadgesNotificationsActive \*

Returns `true` if badge notifications are enabled.

##### AvatarContextMenuEnabled \*

Returns `true` if the [[30 Official Roblox Docs/Players/Avatar Context Menu|Avatar Context Menu]] is enabled.

##### ChatActive \*

Returns whether the chat is active or not. This is indicated by the selection state of the top bar's chat icon.

##### ChatWindowSize \*

Returns the size of the chat window as a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]].

##### ChatWindowPosition \*

Returns the size of the chat window as a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]].

##### ChatBarDisabled \*

Returns `true` if the chat bar is disabled.

##### GetBlockedUserIds

Returns a list of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] associated with users that have been blocked by the local player.

##### PlayerBlockedEvent

Returns a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] that is fired whenever a player is blocked by the local player.

##### PlayerUnblockedEvent

Returns a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] that is fired whenever a player is unblocked by the local player.

##### PlayerMutedEvent

Returns a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] that is fired whenever a player is muted by the local player.

##### PlayerUnmutedEvent

Returns a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] that is fired whenever a player is unmuted by the local player.

##### PlayerFriendedEvent

Returns a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] that is fired whenever a player is connected by the local player.

##### PlayerUnfriendedEvent

Returns a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] that is fired whenever a player is unconnected by the local player.

##### DevConsoleVisible \*

Returns `true` if the [[30 Official Roblox Docs/Studio/Developer Console|Developer Console]] is visible.

##### VRRotationIntensity

Returns a string describing the camera rotation sensitivity in VR: `Low`, `High` and `Smooth`. This will not be available unless [[30 Official Roblox Docs/API Reference/Classes/VRService#VREnabled|VRService.VREnabled]] is `true`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `parameterName` | string |  | The name of the core parameter to retrieve, such as `"PointsNotificationsActive"` or `"ChatActive"`. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The value associated with the specified core parameter name, whose type depends on the parameter queried. |

### GetCoreGuiEnabled

```lua
StarterGui:GetCoreGuiEnabled(coreGuiType: CoreGuiType): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI

This function returns whether the given [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType|Enum.CoreGuiType]]is enabled, or if it has been disabled using [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|StarterGui:SetCoreGuiEnabled()]]. This function should be called on the client.

Note that setting `"TopbarEnabled"` to `false` using [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCore|SetCore()]] hides all [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType|CoreGuiTypes]] but does not affect the result of this function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `coreGuiType` | [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|CoreGuiType]] |  | The given [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType]]. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the given [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType]] is enabled. |

*Code samples for this member (`StarterGui-GetCoreGuiEnabled1`) are published on the source page; their code is not part of the open-source repo.*

### SetCore

```lua
StarterGui:SetCore(parameterName: string, value: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

This method (not to be confused with [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|SetCoreGuiEnabled()]]) exposes a variety of functionality defined by Roblox's core scripts, such as sending notifications, toggling notifications for badges/points, defining a callback for the reset button, or toggling the topbar.

The first parameter is a string that selects the functionality with which the call will interact. It may be necessary to call this method multiple times using [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] in case the respective core script has not yet loaded (or if it has been disabled entirely).

The following table describes the strings that may be accepted as the first parameter. The parameters that should follow are dependent on the functionality that will be used and are described in sub-tables.

##### ChatActive

Controls whether the chat is active.

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean | (required) | Determines whether the chat should be made active. |

##### PointsNotificationsActive

Controls whether notifications for earned player points will appear.

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean | (required) | Determines whether notifications for earned player points will appear. |

##### BadgesNotificationsActive

Controls whether notifications for earned badges will appear.

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean | (required) | Determines whether notifications for earned badges will appear. |

##### ResetButtonCallback

Determines the behavior, if any, of the reset button given a boolean or a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] to be fired when a player requests to reset.

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | boolean | (required) | Determines whether the reset button retains its default behavior. |
| **OR** |  |  |  |
| `callback` | [[30 Official Roblox Docs/API Reference/Classes/BindableEvent\|BindableEvent]] | (required) | A [[30 Official Roblox Docs/API Reference/Classes/BindableEvent\|BindableEvent]] to be fired when the player confirms they want to reset. |

##### ChatMakeSystemMessage

Display a formatted message in the chat. Using this method requires the experience's [[30 Official Roblox Docs/API Reference/Classes/TextChatService#ChatVersion|TextChatService.ChatVersion]] to be set to [[30 Official Roblox Docs/API Reference/Enums/ChatVersion|LegacyChatService]], although legacy chat is **deprecated** and usage is discouraged. For experiences using the current [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]], refer to [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DisplaySystemMessage|TextChannel:DisplaySystemMessage()]].

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `configTable` | dictionary | (required) | A dictionary of information describing the message (see below). |

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Text` | string | (required) | The message to display. |
| `Color` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | `Datatype.Color3.fromRGB(255, 255, 243)` | Text color of the message. |
| `Font` | [[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]] | `SourceSansBold` | Font of the message. |
| `TextSize` | integer | `18` | Text size of the message. |

##### SendNotification

Causes a non-intrusive notification to appear at the bottom right of the screen. The notification may have up to two buttons.

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `configTable` | dictionary | (required) | A dictionary of information describing the notification (see below). |

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Title` | string | (required) | The title of the notification. |
| `Text` | string | (required) | The main text of the notification. |
| `Icon` | string |  | The image to display with the notification. |
| `Duration` | number | `5` | Duration (in seconds) the notification should stay visible. |
| `Callback` | [[30 Official Roblox Docs/API Reference/Classes/BindableFunction\|BindableFunction]] |  | A [[30 Official Roblox Docs/API Reference/Classes/BindableFunction\|BindableFunction]] that should be invoked with the text of the button pressed by the player. |
| `Button1` | string |  | The text to display on the first button. |
| `Button2` | string |  | The text to display on the second button. |

##### TopbarEnabled

Determines whether the topbar is displayed. Disabling the topbar will also disable all [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGuis]] such as the chat, inventory, and player list (for example, those set with [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|SetCoreGuiEnabled]]).

When disabled, the region the topbar once occupied will still capture mouse events; however, buttons placed there will not respond to clicks. The origin of GUI space will still be offset 36 pixels from the top of the screen.

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | boolean | (required) | Determines whether the topbar should be visible. |

##### DevConsoleVisible

Determines whether the [[30 Official Roblox Docs/Studio/Developer Console|Developer Console]] is visible.

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `visibility` | boolean | (required) | Determines whether the console is visible. |

##### PromptSendFriendRequest

Prompts the current player to send a friend request to the given [[30 Official Roblox Docs/API Reference/Classes/Player|Player]].

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | (required) | The player to which the friend request should be sent. |

##### PromptUnfriend

Prompts the current player to remove a given [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] from their friends list.

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | (required) | The player who should be unconnected. |

##### PromptBlockPlayer

Prompts the current player to block the given [[30 Official Roblox Docs/API Reference/Classes/Player|Player]].

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | (required) | The player who should be blocked. |

##### PromptUnblockPlayer

Prompts the current player to unblock the given [[30 Official Roblox Docs/API Reference/Classes/Player|Player]].

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | (required) | The player who should be unblocked. |

##### AvatarContextMenuEnabled

Determines whether the [[30 Official Roblox Docs/Players/Avatar Context Menu|Avatar Context Menu]] is enabled.

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled` | boolean | (required) | Determines whether the context menu is enabled. |

##### AvatarContextMenuTarget

Forcibly opens the [[30 Official Roblox Docs/Players/Avatar Context Menu|Avatar Context Menu]].

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | (required) | The player on whom the context menu will be opened. |

##### AddAvatarContextMenuOption

Adds an option to the [[30 Official Roblox Docs/Players/Avatar Context Menu|Avatar Context Menu]].

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `option` | [[30 Official Roblox Docs/API Reference/Enums/AvatarContextMenuOption\|Enum.AvatarContextMenuOption]] | (required) | Option to add. |
| **OR** |  |  |  |
| `option` | table | (required) | A two-element table, where the first is the name of the custom action, and the second is a [[30 Official Roblox Docs/API Reference/Classes/BindableEvent\|BindableEvent]] which will be fired with a player was selected when the option was activated. |

##### RemoveAvatarContextMenuOption

Removes an option to the [[30 Official Roblox Docs/Players/Avatar Context Menu|Avatar Context Menu]]. The `option` argument must be the same as what was used with `"AddAvatarContextMenuOption"` (see above).

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `option` | Variant | (required) | The same value provided to **AddAvatarContextMenuOption**. |

##### AvatarContextMenuTheme

Configures the customizable [[30 Official Roblox Docs/Players/Avatar Context Menu|Avatar Context Menu]] which is an opt-in feature that allows easy player-to-player social interaction via custom actions, such as initiating trades, battles, and more. For more info on how to customize its theme, see the [[30 Official Roblox Docs/Players/Avatar Context Menu|Avatar Context Menu]] article.

##### CoreGuiChatConnections

Sets up a bindable gateway connection between the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] topbar's chat button and the legacy chat system. The second parameter must be a table of [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvents]] and [[30 Official Roblox Docs/API Reference/Classes/BindableFunction|BindableFunctions]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `parameterName` | string |  | Selects the functionality with which the call will interact. |
| `value` | Variant |  | A table of [[30 Official Roblox Docs/API Reference/Classes/BindableEvent\|BindableEvents]] and [[30 Official Roblox Docs/API Reference/Classes/BindableFunction\|BindableFunctions]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`StarterGui-SetCore1`) are published on the source page; their code is not part of the open-source repo.*

### SetCoreGuiEnabled

```lua
StarterGui:SetCoreGuiEnabled(coreGuiType: CoreGuiType, enabled: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

This function sets whether the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element associated with the given [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType|Enum.CoreGuiType]] is enabled or disabled.

The top bar cannot be disabled using this function. To disable it, set `"TopbarEnabled"` to `false` using [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCore|StarterGui:SetCore()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `coreGuiType` | [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|CoreGuiType]] |  | The given [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType]]. |
| `enabled` | boolean |  | Whether to enable or disable the given [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [StarterGui](https://create.roblox.com/docs/reference/engine/classes/StarterGui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
