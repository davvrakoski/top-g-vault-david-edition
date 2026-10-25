---
title: "PlayerGui"
description: "A container that holds a player's UI."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PlayerGui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container that holds a player's UI.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BasePlayerGui|BasePlayerGui]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `PlayerReplicated`

## Description

The `PlayerGui` container stores objects that create the player's GUI. If a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] is a descendant of `PlayerGui`, any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] inside that [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] displays on the player's screen. Any [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] will also run if it is inserted into a `PlayerGui`.

When a player first joins the experience, their `PlayerGui` is automatically inserted into their [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object. When the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] spawns for the first time, all of the contents of [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] are automatically copied into the player's `PlayerGui`. If [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ResetPlayerGuiOnSpawn|StarterGui.ResetPlayerGuiOnSpawn]] is set to `true`, all the contents of a player's `PlayerGui` are cleared and replaced with the contents of [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] every time the player's character respawns.

Note that if [[30 Official Roblox Docs/API Reference/Classes/Players#CharacterAutoLoads|Players.CharacterAutoLoads]] is set to `false`, the character won't spawn and [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] contents won't copy over until [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|Player:LoadCharacterAsync()]] is called.

If you need to control a player's UI container during playtime, for example to show/hide a specific [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] or any of its children, access it as follows from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]:

*Code samples for this API (`PlayerGui-Overview`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/PlayerGui); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#CurrentScreenOrientation\|CurrentScreenOrientation]] | [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|ScreenOrientation]] | Describes the player's current screen orientation. |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#ScreenOrientation\|ScreenOrientation]] | [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|ScreenOrientation]] | Sets the preferred screen orientation mode for this player, if on a mobile device. |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#SelectionImageObject\|SelectionImageObject]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] | Overrides the default selection adornment used for gamepads. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#GetTopbarTransparency\|GetTopbarTransparency()]] | float | **Deprecated.** Returns the transparency of the Topbar. |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#SetTopbarTransparency\|SetTopbarTransparency()]] | () | **Deprecated.** Sets the transparency of the top bar. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#TopbarTransparencyChangedSignal\|TopbarTransparencyChangedSignal]] | `transparency` | **Deprecated.** Fires when the transparency of the Topbar CoreGui changes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BasePlayerGui|BasePlayerGui]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CurrentScreenOrientation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|ScreenOrientation]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Describes the player's current screen orientation as an [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|Enum.ScreenOrientation]] value. Unlike the writable [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#ScreenOrientation|PlayerGui.ScreenOrientation]] property, which requests a _preferred_ orientation mode, [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#CurrentScreenOrientation|PlayerGui.CurrentScreenOrientation]] is read-only and reports the orientation the device is actually displaying, updating as the player physically rotates a mobile device.

### ScreenOrientation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|ScreenOrientation]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the preferred screen orientation mode for this player when on a mobile device, expressed as an [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|Enum.ScreenOrientation]] value. Changing it requests that the device lock to, or follow, a particular orientation (for example [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|Portrait]] or [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|LandscapeSensor]]). The orientation the device is actually displaying is reported separately by the read-only [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#CurrentScreenOrientation|PlayerGui.CurrentScreenOrientation]] property. This property defaults to [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|LandscapeSensor]].

### SelectionImageObject

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Overrides the default selection adornment used for gamepads. For best results, this should point to a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].

## Methods

### GetTopbarTransparency

> [!warning] Deprecated
> This member is deprecated.

```lua
PlayerGui:GetTopbarTransparency(): float
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

Returns the current transparency of the topbar [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], a value in the range `[0, 1]` where `0` is completely opaque and `1` is completely transparent. This is the value previously assigned with [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#SetTopbarTransparency|PlayerGui:SetTopbarTransparency()]], and it defaults to `0.5`. This method can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]; calling it from a server script raises an error.

**Returns**

| Type | Description |
| --- | --- |
| float | The current topbar transparency, a number between 0 (completely opaque) and 1 (completely transparent). |

*Code samples for this member (`PlayerGui-GetTopbarTransparency1`) are published on the source page; their code is not part of the open-source repo.*

### SetTopbarTransparency

> [!warning] Deprecated
> This member is deprecated.

```lua
PlayerGui:SetTopbarTransparency(transparency: float): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

This method sets the transparency of the top bar [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]]. A value of `0` is completely opaque and a value of `1` is completely transparent. Values outside of the range `[0, 1]` are clamped. The default transparency of the topbar is `0.5`.

Using the [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCore|StarterGui:SetCore()]] method with the `"TopbarEnabled"` option allows you to enable/disable the entire topbar and all of its features (player list, health, etc). By contrast, this method only affects how the top bar is displayed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `transparency` | float |  | A number between 0 (completely opaque) and 1 (completely transparent). Values outside this range are clamped. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`PlayerGui-SetTopbarTransparency1`, `custom-topbar-style`) are published on the source page; their code is not part of the open-source repo.*

## Events

### TopbarTransparencyChangedSignal

> [!warning] Deprecated
> This member is deprecated.

```lua
PlayerGui.TopbarTransparencyChangedSignal(transparency: float)
```

**Capabilities:** UI · **Tags:** `Deprecated`

Fires whenever the transparency of the topbar [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] changes, such as after a call to [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#SetTopbarTransparency|PlayerGui:SetTopbarTransparency()]]. The event passes the new transparency as its `transparency` argument, a value in the range `[0, 1]`. It only fires when the clamped transparency differs from the previous value, so setting the same value again does not re-fire it.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `transparency` | float |  | The new topbar transparency after the change, a number between 0 (completely opaque) and 1 (completely transparent). |

*Code samples for this member (`PlayerGui-TopbarTransparencyChangedSignal1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [PlayerGui](https://create.roblox.com/docs/reference/engine/classes/PlayerGui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
