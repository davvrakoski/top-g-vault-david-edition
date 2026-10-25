---
title: "UserInputState"
description: "This enum describes the state of an input that is currently or was recently performed."
api_type: enum
aliases: ["Enum.UserInputState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UserInputState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*This enum describes the state of an input that is currently or was recently performed.*

## Description

The `UserInputState` enum describes the state of an input that is currently or was recently performed. It is used by the [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputState|InputObject.UserInputState]] property of the same name, as well as various [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] events.

Depending on the [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]], input may follow states differently:

- Simple button and key presses generally follow a simple `Begin` to `End` flow. Analog gamepad trigger buttons are similar to button presses but will use `Change` as the trigger pressure changes.
- Mouse movement generally follows `Begin` (mouse-over) to `Change` (mouse movement) to `End` (mouse-leave).
- Touch input behaves somewhat similarly to mouse movement. `Begin` and `End` occur when the user starts or ends touching the screen, respectively. The same [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]] is used for the same touch point.
- Gamepad thumbstick controls will cause `Change` to occur each frame the position changes.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Begin` | 0 | Occurs when an [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] starts to interact with the experience. For example, a mouse button down, a key down, or when the player begins touching the screen. |
| `Change` | 1 | Occurs each frame an [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] has already begun interacting with the experience and part of its state is changing. For example, movement of the mouse position, a gamepad thumbstick movement, an analog gamepad trigger button change, or screen touch point change. |
| `End` | 2 | Occurs when an [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] finishes interacting with the experience. For example, a mouse button up, a key up, or when the player stops touching the screen. |
| `Cancel` | 3 | A special circumstance state that indicates this input is no longer relevant, particularly with [[30 Official Roblox Docs/API Reference/Classes/ContextActionService\|ContextActionService]]. For example, binding two action-handling functions will cause the first to `Cancel` if an input was already in-progress when the second was bound. |
| `None` | 4 | A state that should never be seen in an experience; essentially just marks the end of the enum. |

---
*Source: [UserInputState](https://create.roblox.com/docs/reference/engine/enums/UserInputState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
