---
title: "InputActionType"
description: "This enum is used by `InputAction.Type` to determine which input data type the `InputAction` will receive."
api_type: enum
aliases: ["Enum.InputActionType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/InputActionType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*This enum is used by [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|InputAction.Type]] to determine which input data type the [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] will receive.*

## Description

This enum is used by [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|InputAction.Type]] to determine which input data type the [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] will receive.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Bool` | 0 | The [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] will receive boolean values from button inputs, for example `true`/`false` on press/release from inputs such as [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonA]] or [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.E]]. This setting also exposes the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#UIButton\|UIButton]] property on child [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBindings]], allowing you to easily hook up press or release of a [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] for the action. |
| `Direction1D` | 1 | The [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] will receive numerical values, generally from analog gamepad triggers such as [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonL2]] or [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonR2]]. This setting also exposes the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]] and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]] properties on child [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBindings]], allowing for boolean inputs or "1D" inputs as composite directions for the action. |
| `Direction2D` | 2 | The [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] will receive [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] values, generally from thumbstick inputs such as [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Thumbstick1]] and [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Thumbstick2]]. This setting also exposes the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]], and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]] properties on child [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBindings]], allowing for "2D" inputs as composite directions for the action. |
| `Direction3D` | 3 | The [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] will receive [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] values from inputs assigned to the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Forward\|Forward]], and/or [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Backward\|Backward]] properties on child [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBindings]], allowing for "3D" inputs as composite directions for the action. |
| `ViewportPosition` | 4 | The [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] will receive [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] values representing the absolute pixel (**X**, **Y**) coordinates of a pointer input in the viewport. |

---
*Source: [InputActionType](https://create.roblox.com/docs/reference/engine/enums/InputActionType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
