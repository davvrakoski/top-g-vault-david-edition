---
title: "UserInputService"
description: "`UserInputService` is primarily used to detect the input types available on a user's device, as well as detect input events."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UserInputService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*`UserInputService` is primarily used to detect the input types available on a user's device, as well as detect input events.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`UserInputService` is primarily used to detect the input types available on a user's device, as well as detect input events. It allows you to perform different actions depending on the device and, in turn, provide the best experience for the end user.

As this service is intended for client-side usage only, its properties, methods, and events can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] required by a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#AccelerometerEnabled\|AccelerometerEnabled]] | boolean | Describes whether the user's device has an accelerometer. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadEnabled\|GamepadEnabled]] | boolean | Describes whether the user's device has an available gamepad. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GyroscopeEnabled\|GyroscopeEnabled]] | boolean | Describes whether the user's device has a gyroscope. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#KeyboardEnabled\|KeyboardEnabled]] | boolean | Describes whether the user's device has a keyboard available. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#ModalEnabled\|ModalEnabled]] | boolean | **Deprecated.** Toggles whether Roblox's mobile controls are hidden on mobile devices. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseBehavior\|MouseBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/MouseBehavior\|MouseBehavior]] | Determines whether the user's mouse can be moved freely or is locked. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseDeltaSensitivity\|MouseDeltaSensitivity]] | float | Scales the delta (change) output of the user's [[30 Official Roblox Docs/API Reference/Classes/Mouse\|Mouse]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseEnabled\|MouseEnabled]] | boolean | Describes whether the user's device has a mouse available. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIcon\|MouseIcon]] | ContentId | The content ID of the image for the user's mouse icon. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIconContent\|MouseIconContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The content ID of the image for the user's mouse icon. Only supports asset URIs. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIconEnabled\|MouseIconEnabled]] | boolean | Determines whether the mouse icon is visible. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#OnScreenKeyboardPosition\|OnScreenKeyboardPosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Determines the position of the on-screen keyboard. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#OnScreenKeyboardSize\|OnScreenKeyboardSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Determines the size of the on-screen keyboard. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#OnScreenKeyboardVisible\|OnScreenKeyboardVisible]] | boolean | Describes whether an on-screen keyboard is currently visible on the user's screen. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput\|PreferredInput]] | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|PreferredInput]] | Queries the primary input type a player is using, based on anticipated user behavior. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] | boolean | Describes whether the user's device has a touch screen available. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchScreenEnabled\|TouchScreenEnabled]] | boolean | Describes whether the user's device has a touch screen, reflecting the device's true hardware capability. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#UserHeadCFrame\|UserHeadCFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | **Deprecated.** Describes the orientation and position of a user's head, if they are actively using a virtual reality headset. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#VREnabled\|VREnabled]] | boolean | **Deprecated.** Indicates whether the user is using a virtual reality headset. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#CreateVirtualInput\|CreateVirtualInput()]] | [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] | Creates a [[30 Official Roblox Docs/API Reference/Classes/VirtualInput\|VirtualInput]] object for simulating mouse, keyboard, and pointer input. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadSupports\|GamepadSupports()]] | boolean | Returns whether the given [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] gamepad supports a button corresponding with the given [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetConnectedGamepads\|GetConnectedGamepads()]] | Array | Returns an array of [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] gamepads currently connected. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetDeviceAcceleration\|GetDeviceAcceleration()]] | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] | Returns an [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] that describes the device's current acceleration. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetDeviceGravity\|GetDeviceGravity()]] | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] | Returns an [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] describing the device's current gravity vector. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetDeviceRotation\|GetDeviceRotation()]] | Tuple | Returns an [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] and a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] describing the device's current rotation vector. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetFocusedTextBox\|GetFocusedTextBox()]] | [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] the client is currently focused on. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetGamepadConnected\|GetGamepadConnected()]] | boolean | Returns whether a gamepad with the given [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] is connected. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetGamepadState\|GetGamepadState()]] | List<[[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObjects]] for all available inputs on the given gamepad, representing each input's last input state. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetImageForKeyCode\|GetImageForKeyCode()]] | ContentId | Returns an image for the requested [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetKeysPressed\|GetKeysPressed()]] | List<[[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObjects]] associated with the [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|keys]] currently being pressed down. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetLastInputType\|GetLastInputType()]] | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] | Returns the [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] associated with the user's most recent input. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetMouseButtonsPressed\|GetMouseButtonsPressed()]] | List<[[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObjects]] associated with the mouse buttons currently being held down. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetMouseDelta\|GetMouseDelta()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns the change, in pixels, of the position of the player's [[30 Official Roblox Docs/API Reference/Classes/Mouse\|Mouse]] in the last rendered frame. Only works if the mouse is locked. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetMouseLocation\|GetMouseLocation()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns the current screen location of the player's [[30 Official Roblox Docs/API Reference/Classes/Mouse\|Mouse]] relative to the top-left corner of the screen. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetNavigationGamepads\|GetNavigationGamepads()]] | Array | Returns an array of gamepads connected and enabled for [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] navigation in descending order of priority. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetStringForKeyCode\|GetStringForKeyCode()]] | string | Returns a string representing a key the user should press in order to input a given [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]], optionally in an abbreviated format. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetSupportedGamepadKeyCodes\|GetSupportedGamepadKeyCodes()]] | Array | Returns an array of [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCodes]] that the gamepad associated with the given [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] supports. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetUserCFrame\|GetUserCFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | **Deprecated.** Returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] describing the position and orientation of a specified virtual reality device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#IsGamepadButtonDown\|IsGamepadButtonDown()]] | boolean | Determines whether a particular button is pressed on a gamepad. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#IsKeyDown\|IsKeyDown()]] | boolean | Returns whether the given [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|key]] is currently held down. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#IsMouseButtonPressed\|IsMouseButtonPressed()]] | boolean | Returns whether the given mouse button is currently held down. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#IsNavigationGamepad\|IsNavigationGamepad()]] | boolean | Returns `true` if the specified gamepad is allowed to control navigation and selection [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#RecenterUserHeadCFrame\|RecenterUserHeadCFrame()]] | () | Recenters the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the VR headset to the current orientation of the headset worn by the user. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#SetNavigationGamepad\|SetNavigationGamepad()]] | () | Sets whether or not the specified gamepad can move the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] navigator. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#DeviceAccelerationChanged\|DeviceAccelerationChanged]] | `acceleration` | Fires when a user moves a device that has an accelerometer. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#DeviceGravityChanged\|DeviceGravityChanged]] | `gravity` | Fires when the force of gravity changes on a device that has an enabled accelerometer. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#DeviceRotationChanged\|DeviceRotationChanged]] | `rotation`, `cframe` | Fires when a user rotates a device that has a gyroscope. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadConnected\|GamepadConnected]] | `gamepadNum` | Fires when a gamepad is connected to the client. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadDisconnected\|GamepadDisconnected]] | `gamepadNum` | Fires when a gamepad is disconnected from the client. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan\|InputBegan]] | `input`, `gameProcessedEvent` | Fires when a user begins interacting with an input device such as a mouse or gamepad. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged\|InputChanged]] | `input`, `gameProcessedEvent` | Fires when a user changes how they're interacting with an input device such as a mouse or gamepad. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputEnded\|InputEnded]] | `input`, `gameProcessedEvent` | Fires when a user stops interacting with an input device such as a mouse or gamepad. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#JumpRequest\|JumpRequest]] |  | Fires whenever the client makes a request for their character to jump. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#LastInputTypeChanged\|LastInputTypeChanged]] | `lastInputType` | Fires whenever the client's [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PointerAction\|PointerAction]] | `wheel`, `pan`, `pinch`, `gameProcessedEvent` | Fires when the user performs a specific pointer action. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TextBoxFocused\|TextBoxFocused]] | `textboxFocused` | Fires when the client focuses on a [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TextBoxFocusReleased\|TextBoxFocusReleased]] | `textboxReleased` | Fires when the client loses focus on a [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchDrag\|TouchDrag]] | `dragDirection`, `numberOfTouches`, `gameProcessedEvent` | Fires when the user drags on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnded\|TouchEnded]] | `touch`, `gameProcessedEvent` | Fires when a user releases their finger from the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchLongPress\|TouchLongPress]] | `touchPositions`, `state`, `gameProcessedEvent` | Fires when a user holds at least one finger for a short amount of time on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchMoved\|TouchMoved]] | `touch`, `gameProcessedEvent` | Fires when a user moves their finger on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchPan\|TouchPan]] | `touchPositions`, `totalTranslation`, `velocity`, `state`, `gameProcessedEvent` | Fires when the user drags at least one finger on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchPinch\|TouchPinch]] | `touchPositions`, `scale`, `velocity`, `state`, `gameProcessedEvent` | Fires when a user performs a pinch gesture on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchRotate\|TouchRotate]] | `touchPositions`, `rotation`, `velocity`, `state`, `gameProcessedEvent` | Fires when a user rotates two fingers on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchStarted\|TouchStarted]] | `touch`, `gameProcessedEvent` | Fires when a user places their finger on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchSwipe\|TouchSwipe]] | `swipeDirection`, `numberOfTouches`, `gameProcessedEvent` | Fires on a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device when a user places their finger(s) down on the screen, pans across the screen, and lifts their finger(s) off with a certain speed of movement. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchTap\|TouchTap]] | `touchPositions`, `gameProcessedEvent` | Fires when a user taps their finger on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchTapInWorld\|TouchTapInWorld]] | `position`, `processedByUI` | Fires when a user taps their finger on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] device and the tap location is in the 3D world. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#UserCFrameChanged\|UserCFrameChanged]] | `type`, `value` | **Deprecated.** Fires when the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of a specified Virtual Reality device changes. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#WindowFocused\|WindowFocused]] |  | Fires when the window of the Roblox client gains focus on the user's screen. |
| [[30 Official Roblox Docs/API Reference/Classes/UserInputService#WindowFocusReleased\|WindowFocusReleased]] |  | Fires when the window of the Roblox client loses focus on the user's screen. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AccelerometerEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes whether the user's device has an accelerometer, a component found in most mobile devices that measures acceleration (change in speed).

If the device has an enabled accelerometer, you can get its current acceleration by using the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetDeviceAcceleration|GetDeviceAcceleration()]] method or track when the device's acceleration changes through the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#DeviceAccelerationChanged|DeviceAccelerationChanged]] event.

*Code samples for this member (`UserInputService-DeviceGravityChanged`) are published on the source page; their code is not part of the open-source repo.*

### GamepadEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes whether the user's device has an available gamepad. If `true`, you can use gamepad‑related methods such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetConnectedGamepads|GetConnectedGamepads()]].

For seamless cross-platform compatibility on mixed-input devices, see [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] which more accurately reflects which input (mouse/keyboard, touch, gamepad, etc.) the player is likely using as the **primary** input.

### GyroscopeEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes whether the user's device has a gyroscope, a component found in most mobile devices that detects orientation and rotational speed.

If the device has a gyroscope, you can incorporate it into your experience using the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetDeviceRotation|GetDeviceRotation()]] method or track when the device's rotation changes through the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#DeviceRotationChanged|DeviceRotationChanged]] event.

### KeyboardEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes whether the user's device has a keyboard available. If `true`, you can use key‑related methods such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#IsKeyDown|IsKeyDown()]] or [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetKeysPressed|GetKeysPressed()]].

For seamless cross-platform compatibility on mixed-input devices, see [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] which more accurately reflects which input (mouse/keyboard, touch, gamepad, etc.) the player is likely using as the **primary** input.

### ModalEnabled

> [!warning] Deprecated
> This item has been superseded by `Class.GuiService.TouchControlsEnabled`
> which should be used in all new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `Deprecated`

The `ModalEnabled` property determines whether character controls are hidden on [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] devices. By default, this property is `false` and controls are visible.

This property will only work when used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] running for the player whose character controls are to be hidden.

Even if mobile controls are hidden for a player on a touch‑enabled device, other events such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|InputBegan]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchSwipe|TouchSwipe]] can still be used to process other forms of input.

### MouseBehavior

**Type:** [[30 Official Roblox Docs/API Reference/Enums/MouseBehavior|MouseBehavior]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

This property sets how the user's mouse behaves based on the [[30 Official Roblox Docs/API Reference/Enums/MouseBehavior|Enum.MouseBehavior]] enum. It can be set to three values:

- [[30 Official Roblox Docs/API Reference/Enums/MouseBehavior|Enum.MouseBehavior.Default]] — The mouse moves freely around the user's screen.
- [[30 Official Roblox Docs/API Reference/Enums/MouseBehavior|Enum.MouseBehavior.LockCenter]] — The mouse is locked and cannot move from the center of the user's screen.
- [[30 Official Roblox Docs/API Reference/Enums/MouseBehavior|Enum.MouseBehavior.LockCurrentPosition]] — The mouse is locked and cannot move from its current position on the user's screen at the time of locking.

The value of this property does not affect the sensitivity of events tracking mouse movement. For example, [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetMouseDelta|GetMouseDelta]] returns the same [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] screen position in pixels regardless of whether the mouse is locked or able to move freely around the user's screen. As a result, default scripts like those controlling the camera are not impacted by this property.

This property is overridden if a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] with [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Modal|Modal]] enabled is [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Visible|Visible]] unless the player's right mouse button is down.

Note that if the mouse is locked, [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged|InputChanged]] will still fire when the player moves the mouse and will pass in the delta that the mouse attempted to move by. Additionally, if the player is kicked from the experience, the mouse will be forcefully unlocked.

### MouseDeltaSensitivity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Input · **Tags:** `NotReplicated`

This property determines the sensitivity of the user's [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]]. It can be used to adjust the sensitivity of events tracking mouse movement, such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetMouseDelta|GetMouseDelta()]].

This property does not affect the movement of the mouse icon, nor the camera sensitivity that the user has selected for their client.

This property has a maximum value of `10` and a minimum value of `0`. When sensitivity is `0`, events that track the mouse's movement will still fire but all parameters and properties indicating the change in mouse position will return `0`.

### MouseEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes whether the user's device has a mouse available. If `true`, you can use mouse‑related methods such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetMouseLocation|GetMouseLocation()]].

For seamless cross-platform compatibility on mixed-input devices, see [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] which more accurately reflects which input (mouse/keyboard, touch, gamepad, etc.) the player is likely using as the **primary** input.

### MouseIcon

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

This property determines the content ID of the image for the user's mouse icon. If blank, a default arrow pointer is used. While the cursor hovers over certain UI objects such as an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], or [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]], this image will be overridden and temporarily ignored.

To hide the cursor entirely, do **not** use a transparent image; instead, set [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIconEnabled|MouseIconEnabled]] to `false`.

*Code samples for this member (`UserInputService-MouseIcon`) are published on the source page; their code is not part of the open-source repo.*

### MouseIconContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

This property determines the content ID of the image for the user's mouse icon. If blank, a default arrow pointer is used. While the cursor hovers over certain UI objects such as an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], or [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]], this image will be overridden and temporarily ignored. Only asset URIs are supported for this property.

To hide the cursor entirely, do **not** use a transparent image; instead, set [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIconEnabled|MouseIconEnabled]] to `false`.

*Code samples for this member (`UserInputService-MouseIcon`) are published on the source page; their code is not part of the open-source repo.*

### MouseIconEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

This property determines whether the mouse icon is visible. To detect when this property changes, you must listen to when the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseEnabled|MouseEnabled]] property changes.

### OnScreenKeyboardPosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes the position of the on-screen keyboard in pixels. The keyboard's position is [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2.new(0, 0)]] when it is not visible.

See also [[30 Official Roblox Docs/API Reference/Classes/UserInputService#OnScreenKeyboardVisible|OnScreenKeyboardVisible]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#OnScreenKeyboardSize|OnScreenKeyboardSize]].

### OnScreenKeyboardSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes the size of the on-screen keyboard in pixels. The keyboard's size is [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2.new(0, 0)]] when it is not visible.

See also [[30 Official Roblox Docs/API Reference/Classes/UserInputService#OnScreenKeyboardVisible|OnScreenKeyboardVisible]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#OnScreenKeyboardPosition|OnScreenKeyboardPosition]].

### OnScreenKeyboardVisible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes whether an on-screen keyboard is currently visible on the user's screen.

See also [[30 Official Roblox Docs/API Reference/Classes/UserInputService#OnScreenKeyboardSize|OnScreenKeyboardSize]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#OnScreenKeyboardPosition|OnScreenKeyboardPosition]].

### PreferredInput

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PreferredInput|PreferredInput]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This read-only property lets you query the **primary** input type a player is likely using, based on anticipated user behavior, to ensure UI elements like on‑screen buttons and menus work elegantly across devices. For example, a touch‑enabled device assumes touch is the default input and that touch buttons may appear for actions, but if a player connects an additional bluetooth keyboard/mouse or gamepad, you can assume they want to switch to that as the primary input type and possibly use touch as a backup input for on‑screen UI.

The value of `PreferredInput` changes based on built‑in device inputs and the player's most recent interaction with a connected gamepad or keyboard/mouse. Examples include:

| Real-World Scenario | `PreferredInput` |
| --- | --- |
| Player is using a phone with no other connected input devices; no possibility of an input type change. | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|Touch]] |
| Player is using a mobile device with a bluetooth keyboard & mouse connected, but no gamepad is connected. | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|KeyboardAndMouse]] |
| Player is using a tablet with a bluetooth gamepad connected, but no keyboard or mouse is connected. | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|Gamepad]] |
| Player is using an Xbox or PlayStation with a bluetooth keyboard & mouse connected and has most recently interacted with the keyboard or mouse. | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|KeyboardAndMouse]] |
| Player is on a Windows or Mac PC with a gamepad connected and has most recently interacted with the gamepad. | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|Gamepad]] |

*Code samples for this member (`UserInputService-PreferredInput`) are published on the source page; their code is not part of the open-source repo.*

### TouchEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes whether the user's device has a touch screen available. If `true`, you can use touch‑related events such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchStarted|TouchStarted]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchMoved|TouchMoved]].

For seamless cross-platform compatibility on mixed-input devices, see [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] which more accurately reflects which input (mouse/keyboard, touch, gamepad, etc.) the player is likely using as the **primary** input.

### TouchScreenEnabled

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

Read-only. Whether the user's device has a touch screen. Defaults to `false`; the engine sets it to `true` on devices with a physical touch screen.

Unlike [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]], which reports `false` on some touch-capable desktop hardware (such as a Windows laptop with a touch screen) to avoid switching those devices to mobile-style controls, `TouchScreenEnabled` reflects the device's true touch capability.

### UserHeadCFrame

> [!warning] Deprecated
> This item has been superseded by `Class.UserInputService:GetUserCFrame()`
> which should be used in all new work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

The UserHeadCFrame used to describe the orientation and position of a user's head, if they are actively using a virtual reality headset.

### VREnabled

> [!warning] Deprecated
> This property has been superseded by `Class.VRService.VREnabled` which
> should be used in all new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes whether the user is using a virtual reality (VR) device. If `true`, you can use VR‑related properties, methods, and events in [[30 Official Roblox Docs/API Reference/Classes/VRService|VRService]].

## Methods

### CreateVirtualInput

```lua
UserInputService:CreateVirtualInput(): Object
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method creates a [[30 Official Roblox Docs/API Reference/Classes/VirtualInput|VirtualInput]] object for simulating mouse, keyboard, and pointer input as if it were performed by a real user. It is intended for testing and automation workflows that need to simulate user interaction inside a running experience. Simulated input is restricted to the experience's own UI elements and cannot interact with arbitrary or system-level GUI.

Always check that the returned value is not `nil` before calling any methods on it.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] | A new [[30 Official Roblox Docs/API Reference/Classes/VirtualInput\|VirtualInput]] object, or `nil` if the feature is not available. |

### GamepadSupports

```lua
UserInputService:GamepadSupports(gamepadNum: UserInputType, gamepadKeyCode: KeyCode): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns whether the given [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] gamepad supports a button corresponding with the given [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gamepadNum` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] of the gamepad. |
| `gamepadKeyCode` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] of the button in question. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the given gamepad supports a button corresponding with the given [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]]. |

### GetConnectedGamepads

```lua
UserInputService:GetConnectedGamepads(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns an array of [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] gamepads currently connected. If no gamepads are connected, the array will be empty.

Alternatively to detecting all gamepads, the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] property can be used to more accurately reflect which input (mouse/keyboard, touch, gamepad, etc.) the player is likely using as the **primary** input.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputTypes]] corresponding with the gamepads connected to the user's device. |

### GetDeviceAcceleration

```lua
UserInputService:GetDeviceAcceleration(): InputObject
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns an [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]] that describes the device's current acceleration. For this to function, the user's device must have an enabled accelerometer as queried through the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#AccelerometerEnabled|AccelerometerEnabled]] property.

To track when the device's acceleration changes, use the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#DeviceAccelerationChanged|DeviceAccelerationChanged]] event.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] describing the device's current acceleration, with [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position\|Position]] representing the acceleration force on each local device axis. |

*Code samples for this member (`UserInputService-GetDeviceAcceleration`) are published on the source page; their code is not part of the open-source repo.*

### GetDeviceGravity

```lua
UserInputService:GetDeviceGravity(): InputObject
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns an [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]] describing the device's current gravity vector. The vector is determined by the device's orientation relative to the real-world force of gravity. For example:

- [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3.new(0, 0, -9.81)]] if the device is perfectly upright (portrait)
- [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3.new(9.81, 0, 0)]] if the left side of the device is pointing down
- [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3.new(0, -9.81, 0)]] if the back of the device is pointing down

Gravity is only tracked for devices with an enabled gyroscope as queried through [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GyroscopeEnabled|GyroscopeEnabled]].

To track when the device's gravity changes, use the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#DeviceGravityChanged|DeviceGravityChanged]] event.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] describing the device's current gravity vector, with [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position\|Position]] representing the force of gravity on each local device axis. |

*Code samples for this member (`UserInputService-GetDeviceGravity`) are published on the source page; their code is not part of the open-source repo.*

### GetDeviceRotation

```lua
UserInputService:GetDeviceRotation(): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns an [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]] and a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] describing the device's current rotation vector.

Device rotation is only tracked for devices with an enabled gyroscope as queried through [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GyroscopeEnabled|GyroscopeEnabled]].

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing two properties: The delta describing the amount of rotation that last happened, and the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the device's current rotation relative to its default reference frame. |

*Code samples for this member (`UserInputService-GetDeviceRotation`) are published on the source page; their code is not part of the open-source repo.*

### GetFocusedTextBox

```lua
UserInputService:GetFocusedTextBox(): TextBox
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns the [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] the client is currently focused on. A [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] can be manually selected by the user, or selection can be forced using the [[30 Official Roblox Docs/API Reference/Classes/TextBox#CaptureFocus|TextBox:CaptureFocus()]] method. If no [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] is selected, this method will return `nil`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] | The currently focused [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]], or `nil` if no [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] is focused. |

### GetGamepadConnected

```lua
UserInputService:GetGamepadConnected(gamepadNum: UserInputType): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns whether a gamepad with the given [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] is connected.

Alternatively to detecting a specific gamepad by [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]], the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] property can be used to more accurately reflect which input (mouse/keyboard, touch, gamepad, etc.) the player is likely using as the **primary** input.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gamepadNum` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] of the gamepad in question. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether a gamepad associated with [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] is connected. |

### GetGamepadState

```lua
UserInputService:GetGamepadState(gamepadNum: UserInputType): List<InputObject>
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns an array of [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObjects]] for all available inputs on the given [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] gamepad, representing each input's last input state.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gamepadNum` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] corresponding with the gamepad in question. |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObjects]] representing the current state of all available inputs for the given gamepad. |

### GetImageForKeyCode

```lua
UserInputService:GetImageForKeyCode(keyCode: KeyCode): ContentId
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method takes the requested [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] and returns the associated image for the currently connected gamepad device (limited to Xbox, PlayStation, and Windows). This means that if the connected controller is an Xbox One controller, the user sees Xbox assets. Similarly, if the connected device is a PlayStation controller, the user sees PlayStation assets. If you want to use custom assets, see [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetStringForKeyCode|GetStringForKeyCode()]].

For most use cases, consider using [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel|InputActionLabel]] instead. It is a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that automatically displays the correct key icon for an [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] and updates when the player switches input devices or rebinds the action, without any scripting. `GetImageForKeyCode()` remains useful for advanced or fully custom interfaces where you need direct access to the underlying image asset.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keyCode` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] for which to fetch the associated image. |

**Returns**

| Type | Description |
| --- | --- |
| ContentId | The returned image asset ID. |

*Code samples for this member (`UserInputService-GetImageForKeyCode`) are published on the source page; their code is not part of the open-source repo.*

### GetKeysPressed

```lua
UserInputService:GetKeysPressed(): List<InputObject>
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns an array of [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObjects]] associated with the keys currently being pressed down. The array can be iterated through to determine which keys are currently being pressed, using the [[30 Official Roblox Docs/API Reference/Classes/InputObject#KeyCode|InputObject.KeyCode]] names or values.

To check if a specific key is being pressed, use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#IsKeyDown|IsKeyDown()]].

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObjects]] associated with the keys currently being pressed. |

### GetLastInputType

```lua
UserInputService:GetLastInputType(): UserInputType
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns the [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] associated with the user's most recent input. For example, if the user's previous input had been pressing the <kbd>A</kbd> key, the returned [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] value would be [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Keyboard]].

For seamless cross-platform compatibility on mixed-input devices, see [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] which more accurately reflects which input (mouse/keyboard, touch, gamepad, etc.) the player is likely using as the **primary** input. `GetLastInputType()` remains for advanced workflows or control schemes that rely on detecting and responding to the player's specific most recent [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]].

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] | The [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] associated with the user's most recent input. |

*Code samples for this member (`UserInputService-GetLastInputType`) are published on the source page; their code is not part of the open-source repo.*

### GetMouseButtonsPressed

```lua
UserInputService:GetMouseButtonsPressed(): List<InputObject>
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns an array of [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObjects]] associated with the mouse buttons currently being held down. The array can be iterated through to determine which buttons are currently being held, using the [[30 Official Roblox Docs/API Reference/Classes/InputObject#KeyCode|InputObject.KeyCode]] names or values.

Mouse buttons that are tracked by this method include `MouseButton1` (left), `MouseButton2` (right), and `MouseButton3` (middle).

If the user is not pressing any mouse button down when the method is called, it will return an empty array.

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObjects]] corresponding to the mouse buttons currently being currently held down. |

*Code samples for this member (`UserInputService-GetMouseButtonsPressed`) are published on the source page; their code is not part of the open-source repo.*

### GetMouseDelta

```lua
UserInputService:GetMouseDelta(): Vector2
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns the change, in pixels, of the position of the player's [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] in the last rendered frame, only if the mouse has been locked using the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseBehavior|MouseBehavior]] property; otherwise the returned [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] values will be `0`.

The sensitivity of the mouse, determined in the client's settings and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseDeltaSensitivity|MouseDeltaSensitivity]], will influence the result.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Change in movement of the mouse. |

*Code samples for this member (`UserInputService-GetMouseDelta`) are published on the source page; their code is not part of the open-source repo.*

### GetMouseLocation

```lua
UserInputService:GetMouseLocation(): Vector2
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] representing the current screen location of the player's [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] in pixels relative to the top‑left corner. This does not account for the [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|Enum.ScreenInsets]]; to get the top‑left and bottom‑right insets, call [[30 Official Roblox Docs/API Reference/Classes/GuiService#GetGuiInset|GuiService:GetGuiInset()]].

If the location of the mouse pointer is offscreen or the player's device does not have a mouse, the returned value will be undetermined.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] representing the current screen location of the mouse, in pixels. |

### GetNavigationGamepads

```lua
UserInputService:GetNavigationGamepads(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns an array of gamepads that are connected and enabled for [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] navigation, but does not influence navigation controls. This list is in descending order of priority, meaning it can be iterated over to determine which gamepad should have navigation control.

See also [[30 Official Roblox Docs/API Reference/Classes/UserInputService#SetNavigationGamepad|SetNavigationGamepad()]], [[30 Official Roblox Docs/API Reference/Classes/UserInputService#IsNavigationGamepad|IsNavigationGamepad()]], and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetConnectedGamepads|GetConnectedGamepads()]].

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputTypes]] that can be used for navigation, in descending order of priority. |

### GetStringForKeyCode

```lua
UserInputService:GetStringForKeyCode(keyCode: KeyCode, format: KeyCodeStringFormat = Default): string
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns a string representing a key the user should press in order to input a given [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]], keeping in mind their keyboard layout. For key codes that require some modifier to be held, this method returns the key to be pressed in addition to the modifier. See the examples below for further explanation.

For most use cases, consider using [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel|InputActionLabel]] instead. It is a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that automatically displays the correct key text or icon for an [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] and updates when the player switches input devices or rebinds the action, without any scripting. `GetStringForKeyCode()` remains useful for advanced or fully custom interfaces where you need the raw display string.

When using Roblox with a non‑QWERTY keyboard layout, key codes are mapped to equivalent QWERTY positions. For example, pressing <kbd>A</kbd> on an AZERTY keyboard results in [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Q]], potentially leading to mismatched information on experience UI elements. This method solves the issue by providing the actual key to be pressed while using non‑QWERTY keyboard layouts.

| KeyCode | QWERTY Return | AZERTY Return |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Q]] | `Q` | `A` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.W]] | `W` | `Z` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Equals]] | `=` | `=` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.At]] | `2` because `@` is typed with <kbd>Shift</kbd><kbd>2</kbd> | `É` |

#### Abbreviated Format

When `format` is set to [[30 Official Roblox Docs/API Reference/Enums/KeyCodeStringFormat|Enum.KeyCodeStringFormat.Abbreviated]], the method returns shortened key names suitable for compact UI elements, for example `"LCtrl"` instead of `"LeftControl"`, `"Bksp"` instead of `"Backspace"`, or `"Esc"` instead of `"Escape"`. If no abbreviation exists for the given key code, the default string is returned.

#### Gamepad Usage

`GetStringForKeyCode()` returns the string mapping for the [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] for the most recently connected gamepad. If the connected controller is not supported, the method returns the default string conversion for the requested key code.

The following example shows how you can map custom assets for [[30 Official Roblox Docs/API Reference/Enums/KeyCode|ButtonA]]:

```
local UserInputService = game:GetService("UserInputService")

local imageLabel = script.Parent
local key = Enum.KeyCode.ButtonA

local mappings = {
	ButtonA = "rbxasset://BUTTON_A_ASSET", -- Replace with the desired ButtonA asset
	ButtonCross = "rbxasset://BUTTON_CROSS_ASSET"  -- Replace with the desired ButtonCross asset
}

local mappedKey = UserInputService:GetStringForKeyCode(key)
local image = mappings[mappedKey]

imageLabel.Image = image
```

#### Gamepad Mappings

The directional pad key codes do not have any differences based on device. [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.ButtonSelect]] has slightly different behavior in some cases. Use both PlayStation mappings to ensure users see the correct buttons.

| KeyCode | PlayStation Return Value | Xbox Return Value |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonA]] | `ButtonCross` | `ButtonA` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonB]] | `ButtonCircle` | `ButtonB` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonX]] | `ButtonSquare` | `ButtonX` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonY]] | `ButtonTriangle` | `ButtonY` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonL1]] | `ButtonL1` | `ButtonLB` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonL2]] | `ButtonL2` | `ButtonLT` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonL3]] | `ButtonL3` | `ButtonLS` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonR1]] | `ButtonR1` | `ButtonRB` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonR2]] | `ButtonR2` | `ButtonRT` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonR3]] | `ButtonR3` | `ButtonRS` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonStart]] | `ButtonOptions` | `ButtonStart` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonSelect]] | `ButtonTouchpad` and `ButtonShare` | `ButtonSelect` |

#### Legacy System Images

When using a [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] that may be better represented as an image, such as for an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] in a user interface, you can use the following legacy icons. However, it's recommended that you use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetImageForKeyCode|GetImageForKeyCode()]] as a more modern, cross‑platform method to retrieve Xbox and PlayStation controller icons.

| KeyCode | Asset ID |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonX]] | `rbxasset://textures/ui/Controls/xboxX.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonY]] | `rbxasset://textures/ui/Controls/xboxY.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonA]] | `rbxasset://textures/ui/Controls/xboxA.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonB]] | `rbxasset://textures/ui/Controls/xboxB.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.DPadLeft]] | `rbxasset://textures/ui/Controls/dpadLeft.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.DPadRight]] | `rbxasset://textures/ui/Controls/dpadRight.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.DPadUp]] | `rbxasset://textures/ui/Controls/dpadUp.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.DPadDown]] | `rbxasset://textures/ui/Controls/dpadDown.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonSelect]] | `rbxasset://textures/ui/Controls/xboxView.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonStart]] | `rbxasset://textures/ui/Controls/xboxmenu.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonL1]] | `rbxasset://textures/ui/Controls/xboxLB.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonR1]] | `rbxasset://textures/ui/Controls/xboxRB.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonL2]] | `rbxasset://textures/ui/Controls/xboxLT.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonR2]] | `rbxasset://textures/ui/Controls/xboxRT.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonL3]] | `rbxasset://textures/ui/Controls/xboxLS.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonR3]] | `rbxasset://textures/ui/Controls/xboxRS.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Thumbstick1]] | `rbxasset://textures/ui/Controls/xboxLSDirectional.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Thumbstick2]] | `rbxasset://textures/ui/Controls/xboxRSDirectional.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Backspace]] | `rbxasset://textures/ui/Controls/backspace.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Return]] | `rbxasset://textures/ui/Controls/return.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.LeftShift]] | `rbxasset://textures/ui/Controls/shift.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.RightShift]] | `rbxasset://textures/ui/Controls/shift.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Tab]] | `rbxasset://textures/ui/Controls/tab.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Quote]] | `rbxasset://textures/ui/Controls/apostrophe.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Comma]] | `rbxasset://textures/ui/Controls/comma.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Backquote]] | `rbxasset://textures/ui/Controls/graveaccent.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Period]] | `rbxasset://textures/ui/Controls/period.png` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Space]] | `rbxasset://textures/ui/Controls/spacebar.png` |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keyCode` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] to get the display string for. |
| `format` | [[30 Official Roblox Docs/API Reference/Enums/KeyCodeStringFormat\|KeyCodeStringFormat]] | `Default` | An [[30 Official Roblox Docs/API Reference/Enums/KeyCodeStringFormat\|Enum.KeyCodeStringFormat]] value that controls the format of the returned string. Defaults to [[30 Official Roblox Docs/API Reference/Enums/KeyCodeStringFormat\|Enum.KeyCodeStringFormat.Default]]. Pass [[30 Official Roblox Docs/API Reference/Enums/KeyCodeStringFormat\|Enum.KeyCodeStringFormat.Abbreviated]] to get shortened labels suitable for compact UI such as `"Bksp"`, `"LCtrl"`, or `"Esc"`. |

**Returns**

| Type | Description |
| --- | --- |
| string | A string representing the key the user should press for the given key code, formatted according to the specified [[30 Official Roblox Docs/API Reference/Enums/KeyCodeStringFormat\|Enum.KeyCodeStringFormat]]. |

### GetSupportedGamepadKeyCodes

```lua
UserInputService:GetSupportedGamepadKeyCodes(gamepadNum: UserInputType): Array
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns an array of [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCodes]] that the gamepad associated with the given [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] supports. If called on a non‑connected gamepad, returns an empty array.

To determine if a specific [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] is supported, use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadSupports|GamepadSupports()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gamepadNum` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] of the gamepad. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCodes]] supported by the given gamepad. |

### GetUserCFrame

> [!warning] Deprecated
> Use `Class.VRService:GetUserCFrame()` instead.

```lua
UserInputService:GetUserCFrame(type: UserCFrame): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** Input · **Tags:** `Deprecated`

The [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetUserCFrame|UserInputService:GetUserCFrame()]] method returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] describing the position and orientation of a specified [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] virtual reality (VR) device. If the specified device is not connected, the method returns [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame.new()]].

For example, the code snippet below prints the CFrame of the user's VR headset.

```lua
local UserInputService = game:GetService("UserInputService")
local cframe = UserInputService:GetUserCFrame(Enum.UserCFrame.Head)

print(cframe)
```

By using the method, players can implement features such as re-positioning the user's in-game character corresponding to the location of a connected VR device. This can be done by changing the _CFrame_ of the user's in-game body parts to match the _CFrame_ of the specified VR device using [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] and [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] value arguments passed by the event.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/UserInputService#UserCFrameChanged|UserInputService.UserCFrameChanged]], an event which fires when the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of a VR device changes
- [[30 Official Roblox Docs/API Reference/Classes/VRService|VRService]], a service used to implement VR support

As this event only fires locally, it can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|Enum.UserCFrame]] corresponding to the VR device. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | A [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] describing the position and orientation of the specified VR device. |

*Code samples for this member (`UserInputService-UserCFrameChanged`) are published on the source page; their code is not part of the open-source repo.*

### IsGamepadButtonDown

```lua
UserInputService:IsGamepadButtonDown(gamepadNum: UserInputType, gamepadKeyCode: KeyCode): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns `true` if a particular button is pressed on a gamepad, otherwise returns `false`.

See also [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] as a way to hook gamepad and other input interactions to [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputActions]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gamepadNum` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] of the given gamepad. |
| `gamepadKeyCode` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] of the specified gamepad button. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the specified button on the given gamepad is pressed is pressed. |

### IsKeyDown

```lua
UserInputService:IsKeyDown(keyCode: KeyCode): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns `true` if a particular key is pressed on a keyboard, otherwise returns `false`.

See also [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] as a way to hook key and other input interactions to [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputActions]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keyCode` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] of the key. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the specified key is being held down. |

### IsMouseButtonPressed

```lua
UserInputService:IsMouseButtonPressed(mouseButton: UserInputType): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns `true` if a particular mouse button is pressed, otherwise returns `false`.

See also [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] as a way to hook mouse button and other input interactions to [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputActions]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `mouseButton` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] of the mouse button. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the given mouse button is currently held down. |

### IsNavigationGamepad

```lua
UserInputService:IsNavigationGamepad(gamepadEnum: UserInputType): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns `true` if the specified gamepad is allowed to control navigation and selection [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]].

Use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#SetNavigationGamepad|SetNavigationGamepad()]] to set a navigation gamepad, or [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetNavigationGamepads|GetNavigationGamepads()]] to get a list of all navigation gamepads.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gamepadEnum` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] of the specified gamepad. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the specified gamepad is a navigation gamepad. |

### RecenterUserHeadCFrame

```lua
UserInputService:RecenterUserHeadCFrame(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method recenters the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the VR headset to the current orientation of the headset worn by the user. This means that the headset's current orientation is set to [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#new|CFrame.new()]].

This method behaves identically to the [[30 Official Roblox Docs/API Reference/Classes/VRService|VRService]] method [[30 Official Roblox Docs/API Reference/Classes/VRService#RecenterUserHeadCFrame|RecenterUserHeadCFrame()]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetNavigationGamepad

```lua
UserInputService:SetNavigationGamepad(gamepadEnum: UserInputType, enabled: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method sets whether the specified gamepad can move the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] navigator.

Use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#IsNavigationGamepad|IsNavigationGamepad()]] to check if a specified gamepad is a set to be a navigation gamepad, or [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetNavigationGamepads|GetNavigationGamepads()]] to retrieve a list of all navigation gamepads.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gamepadEnum` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] of the specified gamepad. |
| `enabled` | boolean |  | Whether the specified gamepad can move the GUI navigator. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### DeviceAccelerationChanged

```lua
UserInputService.DeviceAccelerationChanged(acceleration: InputObject)
```

**Capabilities:** Input

This event fires when a user moves a device that has an accelerometer, a component found in most mobile devices that measures acceleration (change in speed). To determine whether a user's device has an accelerometer enabled, use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#AccelerometerEnabled|AccelerometerEnabled]].

This event can be used along with [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetDeviceAcceleration|GetDeviceAcceleration()]] to determine the current movement of a user's device.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `acceleration` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]], with a [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputType\|UserInputType]] of [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Accelerometer]] and [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position\|Position]] that shows the force of gravity on each local device axis. |

*Code samples for this member (`UserInputService-DeviceAccelerationChanged`) are published on the source page; their code is not part of the open-source repo.*

### DeviceGravityChanged

```lua
UserInputService.DeviceGravityChanged(gravity: InputObject)
```

**Capabilities:** Input

This event fires when the device's gravity [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] changes on a device that has an accelerometer. To determine whether a user's device has an accelerometer enabled, use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#AccelerometerEnabled|AccelerometerEnabled]].

A device's gravity vector represent the force of gravity on each of the device's **X**, **Y**, and **Z** axes. While gravity never changes, the force it exerts on each axis changes when the device rotates and changes orientation. The force value exerted on each axis is a unit vector ranging from `-1` to `1`.

If the device has an enabled accelerometer, you can use the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetDeviceGravity|GetDeviceGravity()]] method to get the current force of gravity on the user's device.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gravity` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] with a [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position\|Position]] property that shows the force of gravity on each local device axis. This position can be used as a direction to determine the direction of gravity relative to the device. |

*Code samples for this member (`UserInputService-DeviceGravityChanged`) are published on the source page; their code is not part of the open-source repo.*

### DeviceRotationChanged

```lua
UserInputService.DeviceRotationChanged(rotation: InputObject, cframe: CFrame)
```

**Capabilities:** Input

This event fires when a user rotates a device that has a gyroscope, a component found in most mobile devices that detects orientation and rotational speed. To check if a user's device has an enabled gyroscope, use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GyroscopeEnabled|GyroscopeEnabled]].

To query the current device rotation, use the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetDeviceRotation|GetDeviceRotation()]] method.

Note that this event only fires when the Roblox client window is in focus. Inputs will not be captured when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rotation` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] providing info about the device's rotation. [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position\|Position]] represents the new rotation a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] positional value and [[30 Official Roblox Docs/API Reference/Classes/InputObject#Delta\|Delta]] represents the change in rotation in a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] positional value. |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] representing the device's current orientation. |

### GamepadConnected

```lua
UserInputService.GamepadConnected(gamepadNum: UserInputType)
```

**Capabilities:** Input

This event fires when a gamepad is connected to the client. You can also use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetConnectedGamepads|GetConnectedGamepads()]] to find the correct gamepad to use.

Alternatively, you can detect value changes to the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] property which more accurately reflects which input (mouse/keyboard, touch, gamepad, etc.) the player is likely using as the **primary** input.

See also [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadDisconnected|GamepadDisconnected]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gamepadNum` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] of the connected gamepad. |

### GamepadDisconnected

```lua
UserInputService.GamepadDisconnected(gamepadNum: UserInputType)
```

**Capabilities:** Input

This event fires when a gamepad is disconnected from the client.

Alternatively, you can detect value changes to the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] property which more accurately reflects which input (mouse/keyboard, touch, gamepad, etc.) the player is likely using as the **primary** input.

See also [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadConnected|GamepadConnected]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gamepadNum` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The[[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] of the disconnected gamepad. |

### InputBegan

```lua
UserInputService.InputBegan(input: InputObject, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when a user begins interacting with an input device such as a mouse or gamepad, such as when they first interact with a gamepad button, although it does not capture mouse wheel movements. Can be used along with [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged|InputChanged]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputEnded|InputEnded]] to track when user input begins, changes, and ends.

See also [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] as a way to hook input device interactions to [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputActions]].

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] instance containing information about the user's input. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### InputChanged

```lua
UserInputService.InputChanged(input: InputObject, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when a user changes how they're interacting with an input device such as a mouse or gamepad. Can be used along with [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|InputBegan]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputEnded|InputEnded]] to track when user input begins, changes, and ends.

See also [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] as a way to hook input device interactions to [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputActions]].

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] instance containing information about the user's input. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. To ignore events that are automatically handled by Roblox like scrolling in a [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame\|ScrollingFrame]], check that `gameProcessedEvent` is `false`. |

### InputEnded

```lua
UserInputService.InputEnded(input: InputObject, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when a user stops interacting with an input device such as a mouse or gamepad, such as when they release a gamepad button. Can be used along with [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|InputBegan]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged|InputChanged]] to track when user input begins, changes, and ends.

See also [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] as a way to hook input device interactions to [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputActions]].

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] instance containing information about the user input. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### JumpRequest

```lua
UserInputService.JumpRequest()
```

**Capabilities:** Input

This event fires when there is a jump request from the client, for example when the client presses the spacebar or jump button on mobile. Default behavior is to set the player's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Jump|Humanoid.Jump]] property to `true` which makes the player's character jump.

Since this event fires multiple times for a single jump request, using a [[30 Official Roblox Docs/Scripting/Debounce patterns|debounce]] is recommended. This event does not fire if [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] is set to nil.

*Code samples for this member (`UserInputService-JumpRequest`) are published on the source page; their code is not part of the open-source repo.*

### LastInputTypeChanged

```lua
UserInputService.LastInputTypeChanged(lastInputType: UserInputType)
```

**Capabilities:** Input

This event fires whenever the client's [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] is changed.

To get the value of the last input type, regardless of whether it has changed, use the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetLastInputType|GetLastInputType()]] method.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `lastInputType` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | A [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] indicating the last input type. |

### PointerAction

```lua
UserInputService.PointerAction(wheel: float, pan: Vector2, pinch: float, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when the user performs a specific pointer action (`wheel`, `pan`, `pitch`).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `wheel` | float |  | The mouse scroll wheel delta. Positive values indicate scrolling up and negative values indicate scrolling down. |
| `pan` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] representing the trackpad pan movement delta in pixels. Touch pan is handled separately via [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchPan\|UserInputService.TouchPan]]. |
| `pinch` | float |  | The pinch-to-zoom gesture delta from a trackpad. Touch pinch is handled separately via [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchPinch\|UserInputService.TouchPinch]]. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. |

### TextBoxFocused

```lua
UserInputService.TextBoxFocused(textboxFocused: TextBox)
```

**Capabilities:** Input

This event fires when the client gains focus on a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], typically when a user clicks/taps it to begin inputting text. Also fires if the [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] is focused using [[30 Official Roblox Docs/API Reference/Classes/TextBox#CaptureFocus|TextBox:CaptureFocus()]]. Can be used alongside [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TextBoxFocusReleased|TextBoxFocusReleased]] to track when a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] loses focus.

See also [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetFocusedTextBox|GetFocusedTextBox()]], [[30 Official Roblox Docs/API Reference/Classes/TextBox#Focused|TextBox.Focused]], and [[30 Official Roblox Docs/API Reference/Classes/TextBox#FocusLost|TextBox.FocusLost]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `textboxFocused` | [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] |  | The [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] that gained focus. |

*Code samples for this member (`UserInputService-TextBoxFocused`) are published on the source page; their code is not part of the open-source repo.*

### TextBoxFocusReleased

```lua
UserInputService.TextBoxFocusReleased(textboxReleased: TextBox)
```

**Capabilities:** Input

This event fires when the client loses focus on a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], typically when a user stops text entry by pressing <kbd>Enter</kbd> or clicking/touching elsewhere on the screen. Can be used alongside [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TextBoxFocused|TextBoxFocused]] to track when a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] gains focus.

See also [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetFocusedTextBox|GetFocusedTextBox()]], [[30 Official Roblox Docs/API Reference/Classes/TextBox#Focused|TextBox.Focused]], and [[30 Official Roblox Docs/API Reference/Classes/TextBox#FocusLost|TextBox.FocusLost]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `textboxReleased` | [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] |  | The [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] that lost focus. |

*Code samples for this member (`UserInputService-TextBoxFocused`) are published on the source page; their code is not part of the open-source repo.*

### TouchDrag

```lua
UserInputService.TouchDrag(dragDirection: SwipeDirection, numberOfTouches: int, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when the user drags on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device. Use this event to detect the start of a deliberate directional gesture (for example, sliding an element left or right to reveal contextual actions) before the user commits to a direction; for detecting a completed swipe or fling gesture, use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchSwipe|TouchSwipe]] instead.

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `dragDirection` | [[30 Official Roblox Docs/API Reference/Enums/SwipeDirection\|SwipeDirection]] |  | The predominant drag direction for the event ([[30 Official Roblox Docs/API Reference/Enums/SwipeDirection\|Up]], [[30 Official Roblox Docs/API Reference/Enums/SwipeDirection\|Down]], [[30 Official Roblox Docs/API Reference/Enums/SwipeDirection\|Left]], or [[30 Official Roblox Docs/API Reference/Enums/SwipeDirection\|Right]]). |
| `numberOfTouches` | int |  | Currently only supports one touch for a value of `1`. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### TouchEnded

```lua
UserInputService.TouchEnded(touch: InputObject, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when a user releases their finger from the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device. Can be paired with [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchStarted|TouchStarted]] to determine when a user starts and stops touching the screen.

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touch` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] instance containing information about the user's input. This is the same object throughout the lifetime of the touch, so comparing [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObjects]] when they are touch objects is valid to determine if it's the same finger. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### TouchLongPress

```lua
UserInputService.TouchLongPress(touchPositions: Array, state: UserInputState, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when a user holds at least one finger for a short amount of time on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device.

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchPositions` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] objects indicating the position of the fingers involved in the gesture. |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|UserInputState]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] of the gesture. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### TouchMoved

```lua
UserInputService.TouchMoved(touch: InputObject, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when a user moves their finger on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device, useful for tracking whether a user is moving their finger on the screen and where they're moving it. Can be paired with [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchStarted|TouchStarted]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnded|TouchEnded]] to determine when a user starts touching the screen, how their finger moves while touching it, and when the they stop touching the screen.

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touch` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] instance containing information about the user's input. Note that its [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position\|Position]] is a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] but only includes **X** and **Y** coordinates (**Z** is always `0`). |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### TouchPan

```lua
UserInputService.TouchPan(touchPositions: Array, totalTranslation: Vector2, velocity: Vector2, state: UserInputState, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when the user drags at least one finger on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device.

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchPositions` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2s]] indicating the positions of the touches involved in the gesture. |
| `totalTranslation` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The size of the pan gesture from start to end, in pixels. |
| `velocity` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The speed of the pan gesture in pixels per second. |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|UserInputState]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] of the gesture. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### TouchPinch

```lua
UserInputService.TouchPinch(touchPositions: Array, scale: float, velocity: float, state: UserInputState, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when a user performs a pinch gesture on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device.

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchPositions` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2s]] indicating the screen position, in pixels, of the fingers involved in the pinch gesture. |
| `scale` | float |  | The magnitude of the pinch from start to finish (in pixels) divided by the starting pinch positions. |
| `velocity` | float |  | The speed of the pinch gesture in pixels per second. |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|UserInputState]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] of the gesture. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### TouchRotate

```lua
UserInputService.TouchRotate(touchPositions: Array, rotation: float, velocity: float, state: UserInputState, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when a user rotates two fingers on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device.

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchPositions` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2s]] indicating the positions of the fingers involved in the gesture. |
| `rotation` | float |  | The number of degree the gesture has rotated since the start of the gesture. |
| `velocity` | float |  | The change in rotation (in degrees) divided by the duration of the change (in seconds). |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|UserInputState]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] of the gesture. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### TouchStarted

```lua
UserInputService.TouchStarted(touch: InputObject, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when a user places their finger on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device. Can be paired with [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnded|TouchEnded]] to determine when a user starts and stops touching the screen.

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touch` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] instance, which contains information about the user's input. This is the same object throughout the lifetime of the touch, so comparing [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObjects]] when they are touch objects is valid to determine if it's the same finger. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### TouchSwipe

```lua
UserInputService.TouchSwipe(swipeDirection: SwipeDirection, numberOfTouches: int, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires on a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device when a user places their finger(s) down on the screen, pans across the screen, and lifts their finger(s) off with a certain speed of movement.

For more precise tracking of touch input movement, use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchMoved|TouchMoved]].

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `swipeDirection` | [[30 Official Roblox Docs/API Reference/Enums/SwipeDirection\|SwipeDirection]] |  | An [[30 Official Roblox Docs/API Reference/Enums/SwipeDirection\|Enum.SwipeDirection]] indicating the direction the user swiped. |
| `numberOfTouches` | int |  | Number of touches involved in the swipe gesture. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### TouchTap

```lua
UserInputService.TouchTap(touchPositions: Array, gameProcessedEvent: boolean)
```

**Capabilities:** Input

This event fires when a user taps their finger on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device, regardless of whether the user taps in the 3D world or on a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] element. If you're looking for an event that only fires when the user taps in the 3D world, use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchTapInWorld|TouchTapInWorld]].

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchPositions` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] objects indicating the position of the fingers involved in the tap gesture. |
| `gameProcessedEvent` | boolean |  | Indicates whether the engine internally observed this input and acted on it. Generally this refers to UI processing, so if a button was touched or clicked from this input, `gameProcessedEvent` will be `true`. |

### TouchTapInWorld

```lua
UserInputService.TouchTapInWorld(position: Vector2, processedByUI: boolean)
```

**Capabilities:** Input

This event fires when a user taps their finger on the screen of a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device and the tap location is in the 3D world rather than on a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] element.

Note that this event only fires when the Roblox client window is in focus. It will not fire when the window is minimized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] indicating the position of the tap. |
| `processedByUI` | boolean |  | Whether the user tapped a UI element. |

### UserCFrameChanged

> [!warning] Deprecated
> Use `Class.VRService.UserCFrameChanged` instead.

```lua
UserInputService.UserCFrameChanged(type: UserCFrame, value: CFrame)
```

**Capabilities:** Input · **Tags:** `Deprecated`

The UserCFrameChanged event fires when the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of a VR device changes.

This event can be used to track the movement of a connected VR device.

Using the event, you can implement features such as moving the user's in-game character limbs as the user moves their VR device. This can be done by changing the CFrame of the user's in-game limbs to match the CFrame changes of the VR device using the [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] enum and _CFrame_ value arguments passed by the event.

To retrieve the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of a connected VR device, use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetUserCFrame|UserInputService:GetUserCFrame()]].

As the event fires locally, it can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

See also:

- [[30 Official Roblox Docs/API Reference/Classes/VRService|VRService]], used to implement support, including an identical event [[30 Official Roblox Docs/API Reference/Classes/VRService|VRService.UserHeadCFrameChanged]]
- [[30 Official Roblox Docs/API Reference/Classes/Camera#HeadLocked|Camera.HeadLocked]], when this property is `true` the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] will automatically track the head motion of a player using a VR device
- [[30 Official Roblox Docs/API Reference/Classes/Camera#GetRenderCFrame|Camera:GetRenderCFrame()]], a method which retrieves the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] is being orientated at, including the impact of VR devices

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] |  | A [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|Enum.UserCFrame]] value indicating which body part moved. |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] value indicating the updated CFrame of the body part that moved. |

*Code samples for this member (`UserInputService-UserCFrameChanged`) are published on the source page; their code is not part of the open-source repo.*

### WindowFocused

```lua
UserInputService.WindowFocused()
```

**Capabilities:** Input

This event fires when the window of the Roblox client gains focus, typically when it is maximized or actively opened by the user. Can be used alongside [[30 Official Roblox Docs/API Reference/Classes/UserInputService#WindowFocusReleased|WindowFocusReleased]] to track when the client loses focus on a user's screen.

### WindowFocusReleased

```lua
UserInputService.WindowFocusReleased()
```

**Capabilities:** Input

This event fires when the window of the Roblox client loses focus, typically when it is minimized by the user. Can be used alongside [[30 Official Roblox Docs/API Reference/Classes/UserInputService#WindowFocused|WindowFocused]] to track when the client gains focus on a user's screen.

*Code samples for this member (`UserInputService-Window-Focus-Client`, `UserInputService-Window-Focus-Server`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [UserInputService](https://create.roblox.com/docs/reference/engine/classes/UserInputService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
