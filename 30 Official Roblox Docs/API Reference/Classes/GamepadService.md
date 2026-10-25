---
title: "GamepadService"
description: "The GamepadService is internally responsible for handling inputs from various controllers, such as Xbox One or PlayStation DualShock controllers."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GamepadService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The GamepadService is internally responsible for handling inputs from various controllers, such as Xbox One or PlayStation DualShock controllers.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

The GamepadService is internally responsible for handling inputs from various controllers, such as Xbox One or PlayStation DualShock controllers. It also handles APIs used with the gamepad virtual cursor. You can enable the gamepad cursor for your experience by setting [[30 Official Roblox Docs/API Reference/Enums/VirtualCursorMode|Enum.VirtualCursorMode]] under [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] to `Enabled`.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GamepadService#GamepadCursorEnabled\|GamepadCursorEnabled]] | boolean | The state of the gamepad virtual cursor. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GamepadService#DisableGamepadCursor\|DisableGamepadCursor()]] | () | Disables the gamepad cursor, if currently enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/GamepadService#EnableGamepadCursor\|EnableGamepadCursor()]] | () | Enables the gamepad cursor or updates its position. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### GamepadCursorEnabled

**Type:** boolean

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

This boolean is a read only variable that maintains the state of the gamepad virtual cursor. You can read this property but not write to it.

*Code samples for this member (`GamepadService-GamepadCursorEnabled`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### DisableGamepadCursor

```lua
GamepadService:DisableGamepadCursor(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This function disables the gamepad cursor, if it's currently enabled.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`GamepadService-DisableGamepadCursor`) are published on the source page; their code is not part of the open-source repo.*

### EnableGamepadCursor

```lua
GamepadService:EnableGamepadCursor(guiObject: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This function enables the gamepad cursor if it's currently disabled. If the cursor is already enabled, calling the API updates the cursor's position. The function accepts a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] parameter, but there are some invalid cases. Please note that in order to set the cursor to the default position, `nil` must be passed in as a parameter. Providing no argument will result in an error.

| Input GuiObject | Cursor Starting Position |
| --- | --- |
| `Nil` | Default position |
| Not a GuiObject | Cursor does not appear, errors |
| Not a child of BasePlayerGui | Cursor does not appear, errors |
| GuiObject has Visible 2 set to false or any parent visible set to false | Default position with warning |
| Child of ScreenGui 1 with Enabled 1 set to false | Default position with warning |
| Child of BillboardGui 4 or SurfaceGui | Default position with warning |
| GuiObject outside the viewport (Or, any part of the gui object that is off screen) | Default position with warning |
| Child of ScrollingFrame with clipping set to false: GuiObject outside of scrolling frame (Object child of scrolling frame and not visible on screen) | Default position with warning |
| Child of ScrollingFrame with clipping set to true: GuiObject outside scrolling frame window but inside viewport | GuiObject moves into the scrolling frame and starts the cursor centered over the object |
| GuiObject inside the frame and visible | Cursor starts centered on the GuiObject |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `guiObject` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | A [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] to center the virtual cursor on when enabled, or `nil` to use the default cursor position. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`GamepadService-EnableGamepadCursor`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [GamepadService](https://create.roblox.com/docs/reference/engine/classes/GamepadService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
