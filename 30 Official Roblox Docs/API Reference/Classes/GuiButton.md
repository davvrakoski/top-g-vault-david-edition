---
title: "GuiButton"
description: "An abstract class for interactive 2D user interface elements."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GuiButton"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract class for interactive 2D user interface elements.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]]
- **Memory category:** Gui
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

[[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] is an abstract class that inherits from [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. It is the base class for the interactive, clickable [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] objects. This class also defines several properties for interactive behavior, namely [[30 Official Roblox Docs/API Reference/Classes/GuiButton#AutoButtonColor|AutoButtonColor]] and [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Modal|Modal]].

The most important event of a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] is [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated|Activated]], a **multi-platform event** that fires when the button is activated. When using a mouse, this means clicking the button and releasing with the cursor still over the UI object. For touch, the same applies but with a touch instead of button press. Finally, for gamepads, [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated|Activated]] fires if a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] is selected when the **A** button is pressed and released. In short, this event is very useful for multi-platform user interface programming as it provides a nice general interface for a single user input.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#AutoButtonColor\|AutoButtonColor]] | boolean | Determines whether the button automatically changes color when the mouse hovers over or clicks on it. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#HoverHapticEffect\|HoverHapticEffect]] | [[30 Official Roblox Docs/API Reference/Classes/HapticEffect\|HapticEffect]] | A [[30 Official Roblox Docs/API Reference/Classes/HapticEffect\|HapticEffect]] instance that will play when the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] is being hovered. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Modal\|Modal]] | boolean | If `true` while the GUI element is visible, the mouse will not be locked unless the right mouse button is down. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#PressHapticEffect\|PressHapticEffect]] | [[30 Official Roblox Docs/API Reference/Classes/HapticEffect\|HapticEffect]] | A [[30 Official Roblox Docs/API Reference/Classes/HapticEffect\|HapticEffect]] instance that will play when the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] is being pressed. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Selected\|Selected]] | boolean | A boolean property which indicates whether the object has been selected. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Style\|Style]] | [[30 Official Roblox Docs/API Reference/Enums/ButtonStyle\|ButtonStyle]] | Sets the style of the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] based on a list of pre-determined styles. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated\|Activated]] | `inputObject`, `clickCount` | Fires when the button is activated. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton1Click\|MouseButton1Click]] |  | Fires when the user's mouse fully left clicks the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton1Down\|MouseButton1Down]] | `x`, `y` | Fires when the user presses their left mouse button down on the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton1Up\|MouseButton1Up]] | `x`, `y` | Fires when the user releases their left mouse button off of the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton2Click\|MouseButton2Click]] |  | Fires when the user's mouse fully right clicks the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton2Down\|MouseButton2Down]] | `x`, `y` | Fires when the user presses their right mouse button down on the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton2Up\|MouseButton2Up]] | `x`, `y` | Fires when the user releases their right mouse button off of the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#SecondaryActivated\|SecondaryActivated]] | `inputObject` | Fires when the button's "secondary" input is activated. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoButtonColor

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the button automatically changes color when the user's [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] hovers over or clicks on it. If `true`, the button will automatically change color when the mouse hovers over or clicks on it. If `false`, the button will not change.

If you would like to customize how a button changes when the user's mouse hovers over or clicks on it, consider using an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] and changing the element's [[30 Official Roblox Docs/API Reference/Classes/ImageButton#HoverImage|HoverImage]] and [[30 Official Roblox Docs/API Reference/Classes/ImageButton#PressedImage|PressedImage]].

Please note that this property will not have an effect on an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] if its [[30 Official Roblox Docs/API Reference/Classes/ImageButton#Image|Image]] property is set to an image. Additionally, this property will not affect an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] on mouse hover when its [[30 Official Roblox Docs/API Reference/Classes/ImageButton#HoverImage|HoverImage]] is not `nil`, nor on mouse click if its [[30 Official Roblox Docs/API Reference/Classes/ImageButton#PressedImage|PressedImage]] is not `nil`.

### HoverHapticEffect

**Type:** [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]]

**Thread safety:** ReadSafe · **Category:** Haptic · **Loaded/Saved:** true/true · **Capabilities:** UI

A [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] that the engine plays the first time the pointer moves over the button, when the button transitions from its idle state to its hover state. Assign a [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] to give hover feedback (for example, a light effect on gamepad or mobile); leave it unset for no hover haptics.

The effect plays through the standard [[30 Official Roblox Docs/API Reference/Classes/HapticService|HapticService]] mixer, so whether the player actually feels vibration depends on their device and haptic settings. This property defaults to `nil` (no effect).

### Modal

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

If `true` while the GUI element is visible, the mouse will not be locked unless the right mouse button is down.

### PressHapticEffect

**Type:** [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]]

**Thread safety:** ReadSafe · **Category:** Haptic · **Loaded/Saved:** true/true · **Capabilities:** UI

A [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] that the engine plays when the button enters its pressed state. Assign a [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] to give press or click feedback; leave it unset for no press haptics.

The effect plays through the standard [[30 Official Roblox Docs/API Reference/Classes/HapticService|HapticService]] mixer, so whether the player actually feels vibration depends on their device and haptic settings. This property defaults to `nil` (no effect).

### Selected

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to `true`, the button renders in a highlighted "selected" state instead of its normal idle appearance. This property defaults to `false`, and the engine never changes it automatically; set it yourself to mark a button as selected.

`Selected` only has a visual effect on the legacy [[30 Official Roblox Docs/API Reference/Enums/ButtonStyle|Enum.ButtonStyle]] presets (the `Roblox*` styles) with [[30 Official Roblox Docs/API Reference/Classes/GuiButton#AutoButtonColor|AutoButtonColor]] enabled, where it swaps in the button's highlighted image. It has no effect under the default [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Style|Style]] of `Custom`. It is unrelated to gamepad and controller UI navigation; the currently focused element is tracked separately by [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|SelectedObject]].

### Style

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ButtonStyle|ButtonStyle]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the button's overall appearance from a fixed set of [[30 Official Roblox Docs/API Reference/Enums/ButtonStyle|Enum.ButtonStyle]] presets. The default value is `Custom`, which applies no built-in styling and lets you control the button's appearance entirely through properties such as [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] and, for an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]], its images.

A legacy method of applying a fixed set of Roblox-themed button styles. The remaining presets (`RobloxButton`, `RobloxButtonDefault`, `RobloxRoundButton`, `RobloxRoundDefaultButton`, and `RobloxRoundDropdownButton`) render Roblox-themed button art. New interfaces should keep `Custom` and style the button directly. This property defaults to [[30 Official Roblox Docs/API Reference/Enums/ButtonStyle|Enum.ButtonStyle.Custom]].

## Events

### Activated

```lua
GuiButton.Activated(inputObject: InputObject, clickCount: int)
```

**Capabilities:** UI

Fires when a left click press-and-release is detected on desktop, touch release is detected on mobile, or **A**/cross is activated in UI navigation mode on console. The first time this method is called, `clickCount` will start at `0`.

As this event doesn't fire on the server, it should only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `inputObject` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] representing the user input that activated the button. |
| `clickCount` | int |  | The number of consecutive rapid activations, starting at 0 for the first activation and incrementing with each subsequent activation within quick succession of the previous one. |

### MouseButton1Click

```lua
GuiButton.MouseButton1Click()
```

**Capabilities:** UI

This event fires when the user's mouse fully left clicks the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]].

In regards to clicking, the mouse must be in bounds of the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] and the mouse button must be pressed down and up again before this event fires. If the mouse leaves the bounds of the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] and is released, the event will not fire. If you would like to avoid this limitation, you can use [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton1Down|MouseButton1Down]] and [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton1Up|MouseButton1Up]]; these events are similar but will fire whenever the user presses their left mouse button down or up, respectively.

### MouseButton1Down

```lua
GuiButton.MouseButton1Down(x: int, y: int)
```

**Capabilities:** UI

This event fires when the user presses their left mouse button down on the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]].

For an event requiring the user to press **and** release their left mouse on a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] in order for the event to fire, consider using [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton1Click|MouseButton1Click]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The mouse's **X** screen coordinate in pixels. |
| `y` | int |  | The mouse's **Y** screen coordinate in pixels. |

### MouseButton1Up

```lua
GuiButton.MouseButton1Up(x: int, y: int)
```

**Capabilities:** UI

This event fires when the user releases their left mouse button off of the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]].

For an event requiring the user to press **and** release their left mouse on a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] in order for the event to fire, consider using [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton1Click|MouseButton1Click]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The mouse's **X** screen coordinate in pixels. |
| `y` | int |  | The mouse's **Y** screen coordinate in pixels. |

### MouseButton2Click

```lua
GuiButton.MouseButton2Click()
```

**Capabilities:** UI

This event fires when the user's mouse fully right clicks the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]].

In regards to clicking, the mouse must be in bounds of the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] and the mouse button must be pressed down and up again before this event fires. If the mouse leaves the bounds of the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] and is released, the event will not fire. If you would like to avoid this limitation, you can use [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton2Down|MouseButton2Down]] and [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton2Up|MouseButton2Up]]; these events are similar but will fire whenever the user presses their right mouse button down or up, respectively.

### MouseButton2Down

```lua
GuiButton.MouseButton2Down(x: int, y: int)
```

**Capabilities:** UI

This event fires when the user presses their right mouse button down on the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]].

For an event requiring the user to press **and** release their right mouse on a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] in order for the event to fire, consider using [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton2Click|MouseButton2Click]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The mouse's **X** screen coordinate in pixels. |
| `y` | int |  | The mouse's **Y** screen coordinate in pixels. |

### MouseButton2Up

```lua
GuiButton.MouseButton2Up(x: int, y: int)
```

**Capabilities:** UI

This event fires when the user releases their right mouse button off of the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]].

For an event requiring the user to press **and** release their right mouse on a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] in order for the event to fire, consider using [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton2Click|MouseButton2Click]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The mouse's **X** screen coordinate in pixels. |
| `y` | int |  | The mouse's **Y** screen coordinate in pixels. |

### SecondaryActivated

```lua
GuiButton.SecondaryActivated(inputObject: InputObject)
```

**Capabilities:** UI

Fires when a right-click press-and-release is detected from a mouse, long press is detected on a touch input, `R3` is detected from a gamepad, or
<kbd>Alt</kbd><kbd>Enter</kbd> is detected in UI navigation mode using
keyboard.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `inputObject` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | The input object representing the alternate activation action. |

---
*Source: [GuiButton](https://create.roblox.com/docs/reference/engine/classes/GuiButton) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
