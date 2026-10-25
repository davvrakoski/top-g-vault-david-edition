---
title: "UserInputType"
description: "Describes the type of a user input event."
api_type: enum
aliases: ["Enum.UserInputType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UserInputType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the type of a user input event.*

## Description

The **UserInputType** enum describes the kind of input being performed (mouse, keyboard, gamepad, touch, etc). This enum is used by the [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputType|InputObject.UserInputType]] property of the same name, as well as various [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] events.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `MouseButton1` | 0 | The left mouse button. |
| `MouseButton2` | 1 | The right mouse button. |
| `MouseButton3` | 2 | The middle mouse button. |
| `MouseWheel` | 3 | The mouse wheel. |
| `MouseMovement` | 4 | Movement of the mouse. Fires changed events each time the player's cursor position changes and when the move enters/leaves the game window. |
| `Touch` | 7 | A tap on the screen from a mobile device. |
| `Keyboard` | 8 | Key press on a keyboard. |
| `Focus` | 9 | The client regaining focus of the Roblox window. |
| `Accelerometer` | 10 | The accelerometer of a mobile device. |
| `Gyro` | 11 | The Gyroscope of a mobile device. |
| `Gamepad1` | 12 | Input from the 1st plugged in Gamepad. |
| `Gamepad2` | 13 | Input from the 2nd plugged in Gamepad. |
| `Gamepad3` | 14 | Input from the 3rd plugged in Gamepad. |
| `Gamepad4` | 15 | Input from the 4th plugged in Gamepad. |
| `Gamepad5` | 16 | Input from the 5th plugged in Gamepad. |
| `Gamepad6` | 17 | Input from the 6th plugged in Gamepad. |
| `Gamepad7` | 18 | Input from the 7th plugged in Gamepad. |
| `Gamepad8` | 19 | Input from the 8th plugged in Gamepad. |
| `TextInput` | 20 | Input of Text into a text-based [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. Normally this is only a [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]]. |
| `InputMethod` | 21 | Text input from an input method editor (IME). [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObjects]] with this type aren't currently fired. |
| `None` | 22 | Unknown UserInputType. |

---
*Source: [UserInputType](https://create.roblox.com/docs/reference/engine/enums/UserInputType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
