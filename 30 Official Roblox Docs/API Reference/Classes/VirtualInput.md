---
title: "VirtualInput"
description: "Simulates mouse, keyboard, and pointer input as if it were performed by a real player."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VirtualInput"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Simulates mouse, keyboard, and pointer input as if it were performed by a real player.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/VirtualInput|VirtualInput]] simulates mouse, keyboard, and pointer input as if it were performed by a real player. It is intended for **testing purposes only** and can only be obtained by calling [[30 Official Roblox Docs/API Reference/Classes/UserInputService#CreateVirtualInput|UserInputService:CreateVirtualInput()]].

All input methods throw a runtime error if the simulated input would interact with Roblox's built-in UI ([[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]]), such as the top bar, chat window, or escape menu. This prevents automation tests from accidentally interfering with system UI that players depend on.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VirtualInput#SendKey\|SendKey()]] | () | Injects a keyboard key press or release event. |
| [[30 Official Roblox Docs/API Reference/Classes/VirtualInput#SendMouseButton\|SendMouseButton()]] | () | Injects a mouse button press or release event at the specified screen position. |
| [[30 Official Roblox Docs/API Reference/Classes/VirtualInput#SendMouseDelta\|SendMouseDelta()]] | () | Injects a relative mouse movement event. Only works while the player's cursor is locked. |
| [[30 Official Roblox Docs/API Reference/Classes/VirtualInput#SendMousePosition\|SendMousePosition()]] | () | Moves the virtual mouse cursor to the specified absolute screen position. |
| [[30 Official Roblox Docs/API Reference/Classes/VirtualInput#SendPointerAction\|SendPointerAction()]] | () | Injects a scroll wheel, trackpad pan, or pinch gesture event at the specified screen position. |
| [[30 Official Roblox Docs/API Reference/Classes/VirtualInput#SendTextInput\|SendTextInput()]] | () | Injects a text input event as if the specified string was typed on a keyboard. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### SendKey

```lua
VirtualInput:SendKey(isPressed: boolean, keyCode: KeyCode, isRepeatedKey: boolean = False): ()
```

**Thread safety:** Unsafe

This method injects a keyboard key press or release event, processed identically to a real hardware key event.

This method throws a runtime error if [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] has keyboard focus, which includes a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] inside [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] being focused, a [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element selected for keyboard or gamepad navigation, or the in-game escape menu being open. It also throws if the requested key is permanently bound to a Roblox core action (for example, the
<kbd>Escape</kbd> key).

#### isRepeatedKey

Set `isRepeatedKey` to `true` only when simulating the OS auto-repeat behavior that occurs while a player physically holds a key down which fires a stream of repeated events after the initial key press. This is meaningful only for text-manipulation keys: [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Backspace]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Delete]], and the arrow keys ([[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Left]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Right]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Up]], and [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Down]]). Passing `true` for any other key throws a runtime error.

For example, to simulate holding <kbd>Backspace</kbd> to delete multiple characters, call:

- `SendKey(true, Enum.KeyCode.Backspace, false)` for the initial press
- `SendKey(true, Enum.KeyCode.Backspace, true)` in a loop for each repeated event
- `SendKey(false, Enum.KeyCode.Backspace, false)` for the release

Do **not** pass `isRepeatedKey` as `true` for the initial press or the release. For any key that does not involve text editing (game action keys, modifier keys, function keys, etc.), always pass `false`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `isPressed` | boolean |  | Whether to simulate a key press (`true`) or a key release (`false`). |
| `keyCode` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] of the key to inject. |
| `isRepeatedKey` | boolean | `False` | Whether this is an auto-repeat event, as occurs when a key is held down. Only valid for text-manipulation keys such as [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Backspace]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Delete]], and the arrow keys. Defaults to `false`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SendMouseButton

```lua
VirtualInput:SendMouseButton(position: Vector2, button: UserInputType, isDown: boolean, repeatCount: int = 0): ()
```

**Thread safety:** Unsafe

This method injects a mouse button press or release event at the given screen-space position, processed identically to a real hardware mouse event.

Only [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType.MouseButton1]], [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType.MouseButton2]], and [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType.MouseButton3]] are supported; passing any other value throws a runtime error.

This method throws a runtime error if the specified position overlaps an interactive [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element such as a button or an active overlay in the top bar, chat window, or escape menu. It also throws if the specified button is already in the requested state, for example pressing a button that is already pressed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The screen-space position in pixels at which to inject the event. |
| `button` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The mouse button to use. Supported values are [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType.MouseButton1]], [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType.MouseButton2]], and [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType.MouseButton3]]. |
| `isDown` | boolean |  | Whether to simulate a button press (`true`) or a button release (`false`). |
| `repeatCount` | int | `0` | The consecutive-click count for multi-click detection, such as a double- or triple-click. Defaults to `0`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SendMouseDelta

```lua
VirtualInput:SendMouseDelta(positionDelta: Vector2): ()
```

**Thread safety:** Unsafe

This method injects a relative mouse movement event, representing how far the mouse moved rather than where it is on screen. This is intended for use while the player's cursor is locked, such as in first-person camera mode.

This method throws a runtime error when the cursor is not locked. To move the cursor to an absolute screen position instead, use [[30 Official Roblox Docs/API Reference/Classes/VirtualInput#SendMousePosition|SendMousePosition()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `positionDelta` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The relative mouse movement in pixels along each axis. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SendMousePosition

```lua
VirtualInput:SendMousePosition(position: Vector2): ()
```

**Thread safety:** Unsafe

This method moves the virtual mouse cursor to the specified absolute screen-space position, processed identically to a real hardware mouse-move event.

This method throws a runtime error when the specified position overlaps an interactive Roblox UI element (such as a button or active overlay in the top bar, chat window, or escape menu).

To inject relative mouse movement while the cursor is locked, use [[30 Official Roblox Docs/API Reference/Classes/VirtualInput#SendMouseDelta|SendMouseDelta()]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The target screen-space position in pixels. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SendPointerAction

```lua
VirtualInput:SendPointerAction(position: Vector2, pointerAction: Dictionary): ()
```

**Thread safety:** Unsafe

This method injects a pointer action event at the given screen-space position. The `pointerAction` dictionary accepts the following keys:

- `Wheel` (number) — Scroll wheel delta. Positive values scroll forward, negative values scroll backward.
- `Pan` ([[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]) — Trackpad pan delta in pixels.
- `Pinch` (number) — Pinch-to-zoom delta. Positive values zoom in, negative values zoom out.

This method throws a runtime error if the specified position overlaps an interactive Roblox UI element (such as a button or active overlay in the top bar, chat window, or escape menu). If all values in `pointerAction` are zero, the call returns without injecting any event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The screen-space position in pixels at which to inject the event. |
| `pointerAction` | Dictionary |  | A dictionary describing the pointer action to inject. Accepted keys are `Wheel` (number), `Pan` ([[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]), and `Pinch` (number). At least one key must have a non-zero value. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SendTextInput

```lua
VirtualInput:SendTextInput(text: string): ()
```

**Thread safety:** Unsafe

This method injects a text input event, routing the given string directly to the focused [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] or the experience's text input handler as if the player typed it on a physical keyboard. This is useful for populating text fields without needing to simulate individual key presses.

This method throws a runtime error if [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] has keyboard focus, which includes a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] inside [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] being focused, a [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element selected for keyboard or gamepad navigation, or the in-game escape menu being open.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | string |  | The string to inject as text input. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [VirtualInput](https://create.roblox.com/docs/reference/engine/classes/VirtualInput) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
