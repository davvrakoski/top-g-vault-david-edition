---
title: "InputObject"
description: "An object created when an input begins that describes a particular user input."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/InputObject"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object created when an input begins that describes a particular user input.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

An `InputObject` represents a single user input, such as mouse movement, touches, key presses and more. It is created when an input begins.

The properties of this object vary according the [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputType|UserInputType]]. Each kind of input will undergo various changes to its [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputState|UserInputState]]. During the lifetime of an input, other properties which further describe the input may change, such as [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position|Position]] and [[30 Official Roblox Docs/API Reference/Classes/InputObject#Delta|Delta]]. Keyboard and gamepad button presses will have the [[30 Official Roblox Docs/API Reference/Classes/InputObject#KeyCode|KeyCode]] property set.

Once created at the beginning of an input, the same object persists and is updated until the input ends. As a result, you can track the object's changes using the [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] event as the user changes the input in question. You can also place these objects into a list of active inputs track and interact with the object after it's creation by an event such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|UserInputService.InputBegan]]. This is mostly useful for touch events, as each touch point will have a separate `InputObject`.

See also [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] whose events and functions often use `InputObject`, and [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] whose events related to user input use `InputObject`.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputObject#Delta\|Delta]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] describing the delta between input movements. |
| [[30 Official Roblox Docs/API Reference/Classes/InputObject#KeyCode\|KeyCode]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Contains an Enum that describes the kind of input used. |
| [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] describing the positional value of this input. |
| [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputState\|UserInputState]] | [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|UserInputState]] | Describes the state of an input being performed, following a specific flow depending on the [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputType\|UserInputType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputType\|UserInputType]] | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] | Describes the kind of input being performed (mouse, keyboard, gamepad, touch, etc.). |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputObject#IsModifierKeyDown\|IsModifierKeyDown()]] | boolean | Returns whether the passed in modifier key is down. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Delta

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] describing the delta (change) between input movements.

This is useful when used with the input's [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position|Position]] to track the position and movement of the user's input, such as when you're creating custom movement or camera scripts. Consider tracking input object changes using the [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Object.Changed]] event or when user input changes via events such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged|UserInputService.InputChanged]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputChanged|GuiObject.InputChanged]].

Note that an [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]] corresponding to [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType.MouseButton1]] (left click) and [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType.MouseButton2]] (right click) supplied from an [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|InputBegan]] callback will not have its [[30 Official Roblox Docs/API Reference/Classes/InputObject#Delta|Delta]] or [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position|Position]] updated once created, except for when the mouse input ends. In order to get updated deltas for mouse inputs, you must instead reference an [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]] from an [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged|InputChanged]] callback, or call [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetMouseDelta|GetMouseDelta()]]. However, any [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObjects]] corresponding to touch inputs will have their delta and position updated every frame throughout their lifetime.

### KeyCode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input

Contains a [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] enum that describes what kind of input was used. For types of input like keyboard, this describes what key was pressed. For inputs like the mouse, this provides no additional information.

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] describing the positional value of this input.

For mouse and touch input, this is the screen position of the mouse/touch, described in the **X** and **Y** components. The inset applied to GUI elements (such as from the top bar) is accounted for in the position. For the mouse wheel input, the **Z** component describes whether the wheel was moved forward (positive number), backwards (negative number), or not at all (`0`).

Note that an [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]] corresponding to [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType.MouseButton1]] (left click) and [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType.MouseButton2]] (right click) supplied from an [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|InputBegan]] callback will not have its [[30 Official Roblox Docs/API Reference/Classes/InputObject#Delta|Delta]] or [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position|Position]] updated once created, except for when the mouse input ends. In order to get updated positions for mouse inputs, you must instead reference an [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]] from an [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged|InputChanged]] callback, or call [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetMouseLocation|GetMouseLocation()]]. However, any [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObjects]] corresponding to touch inputs will have their delta and position updated every frame throughout their lifetime.

### UserInputState

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UserInputState|UserInputState]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Capabilities:** Input

This property describes the state of an input being performed, following a specific flow depending on the [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputType|UserInputType]]. It uses the enum of the same name, [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState]].

### UserInputType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UserInputType|UserInputType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input

This property describes the kind of input this [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]] represents, such as mouse, keyboard, touch, or gamepad input. It uses the enum of the same name, [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]].

## Methods

### IsModifierKeyDown

```lua
InputObject:IsModifierKeyDown(modifierKey: ModifierKey): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Input

Returns `true` if the passed in `modifierKey` such as [[30 Official Roblox Docs/API Reference/Enums/ModifierKey|Shift]] is being held down.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `modifierKey` | [[30 Official Roblox Docs/API Reference/Enums/ModifierKey\|ModifierKey]] |  | The [[30 Official Roblox Docs/API Reference/Enums/ModifierKey\|Enum.ModifierKey]] to check. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the passed in `modifierKey` is being held down; `false` otherwise. |

---
*Source: [InputObject](https://create.roblox.com/docs/reference/engine/classes/InputObject) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
