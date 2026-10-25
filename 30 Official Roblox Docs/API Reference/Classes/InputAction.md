---
title: "InputAction"
description: "Defines a gameplay action mechanic. These actions are then mapped to hardware inputs using `InputBinding`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/InputAction"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Defines a gameplay action mechanic. These actions are then mapped to hardware inputs using [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`InputAction` defines a gameplay action mechanic such as "Jump," "Sprint," or "Shoot." These actions are then mapped to hardware inputs using [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]]. An `InputAction` will check for its first ancestor type of [[30 Official Roblox Docs/API Reference/Classes/InputContext|InputContext]] and register itself to that context (if there is no ancestor context, it will be registered to a default context).

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#BoolState\|BoolState]] | boolean | Non-scriptable read-only property useful for debugging [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Bool]] input actions. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#Direction1DState\|Direction1DState]] | float | Non-scriptable read-only property useful for debugging [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Direction1D]] input actions. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#Direction2DState\|Direction2DState]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Non-scriptable read-only property useful for debugging [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Direction2D]] input actions. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#Direction3DState\|Direction3DState]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Non-scriptable read-only property useful for debugging [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Direction3D]] input actions. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#DisplayName\|DisplayName]] | string | Localized display name for this action. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#Enabled\|Enabled]] | boolean | Determines if the `InputAction` is enabled or not. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding\|PreferredBinding]] | [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBinding]] | The [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBinding]] best matching the player's current input device. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type\|Type]] | [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|InputActionType]] | Specifies what type of input value the action is expecting. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#ViewportPositionState\|ViewportPositionState]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Non-scriptable read-only property useful for debugging [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|ViewportPosition]] input actions. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#Fire\|Fire()]] | () | **Deprecated.** Updates the `InputAction` to the given state and fires the appropriate signals. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#GetState\|GetState()]] | Variant | Returns the current state of the [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#Pressed\|Pressed]] |  | Fires only when the [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type\|InputAction.Type]] is set to [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Bool]] on a state transition from `false` to `true`. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#Released\|Released]] |  | Fires only when the [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type\|InputAction.Type]] is set to [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Bool]] on a state transition from `true` to `false`. |
| [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] | `value` | Fires for all [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Enum.InputActionType]] types whenever the state changes, except if the state attempts to transition to the same state. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BoolState

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

A non-scriptable read-only property only visible in Studio, primarily useful for debugging while testing an `InputAction` with [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] of [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]].

### Direction1DState

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

A non-scriptable read-only property only visible in Studio, primarily useful for debugging while testing an `InputAction` with [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] of [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction1D]].

### Direction2DState

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

A non-scriptable read-only property only visible in Studio, primarily useful for debugging while testing an `InputAction` with [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] of [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]].

### Direction3DState

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

A non-scriptable read-only property only visible in Studio, primarily useful for debugging while testing an `InputAction` with [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] of [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]].

### DisplayName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true · **Capabilities:** Input

A custom string used to show a localized display name for this action in UI elements such as a controls help menu.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Determines if the `InputAction` is enabled or not. The action state will be reset if this property is toggled to `false`.

### PreferredBinding

**Type:** [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

A read-only reference to the [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] child that matches the player's current input device using [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|UserInputService.PreferredInput]].

### Type

**Type:** [[30 Official Roblox Docs/API Reference/Enums/InputActionType|InputActionType]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies what type of input value the action is expecting. See [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Enum.InputActionType]] for more details.

### ViewportPositionState

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

A non-scriptable read-only property only visible in Studio, primarily useful for debugging while testing an `InputAction` with [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] of [[30 Official Roblox Docs/API Reference/Enums/InputActionType|ViewportPosition]].

## Methods

### Fire

> [!warning] Deprecated
> Use `Class.InputBinding:Fire()` with a `Enum.InputBindingType|Scriptable`
> binding instead.

```lua
InputAction:Fire(state: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input · **Tags:** `Deprecated`

Updates the `InputAction` to the given state and fires the appropriate signals. This method is most useful for script‑triggered "input" where the passed `state` should trigger events like [[30 Official Roblox Docs/API Reference/Classes/InputAction#Pressed|Pressed]] or [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] regardless of whether the player triggered that state through normal inputs.

This method will only accept a `state` parameter that matches the [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] and attempting to call it with a mismatched type will cause an error, for example passing a state of `0.5` when the [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]].

Note that this method follows the conditions of [[30 Official Roblox Docs/API Reference/Classes/InputAction#Pressed|Pressed]], [[30 Official Roblox Docs/API Reference/Classes/InputAction#Released|Released]], and [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]]. For example, if you make multiple consecutive calls to `Fire()` with a state of `true`, [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] will only fire on the first state change and the subsequent calls to `Fire()` will do nothing.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | Variant |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetState

```lua
InputAction:GetState(): Variant
```

**Thread safety:** Safe · **Capabilities:** Input

Returns the current state of the [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]], for example `true` for an action with [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] set to [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]].

**Returns**

| Type | Description |
| --- | --- |
| Variant | The current state of [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]. |

## Events

### Pressed

```lua
InputAction.Pressed()
```

**Capabilities:** Input

This event fires only when the [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is set to [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]], and only when the state transitions from `false` to `true`.

### Released

```lua
InputAction.Released()
```

**Capabilities:** Input

This event fires only when the [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is set to [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]], and only when the state transitions from `true` to `false`.

### StateChanged

```lua
InputAction.StateChanged(value: Variant)
```

**Capabilities:** Input

This event fires for all [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Enum.InputActionType]] types whenever the state changes, except if the state attempts to transition to the same state.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | Variant |  | The new state of the [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]. |

---
*Source: [InputAction](https://create.roblox.com/docs/reference/engine/classes/InputAction) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
