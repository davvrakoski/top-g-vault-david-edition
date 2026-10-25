---
title: "InputBinding"
description: "Defines which hardware binding should trigger the parent `InputAction`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/InputBinding"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Defines which hardware binding should trigger the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An `InputBinding` defines which hardware binding should trigger the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]], for example a key press, gamepad button, or tap on a touch‑enabled device. There can be multiple `InputBinding` instances parented to an [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Backward\|Backward]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] for dispatching directionally "backward" inputs to the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#ClampMagnitudeToOne\|ClampMagnitudeToOne]] | boolean | Specifies how the binding normalizes composite directional input to a maximum magnitude of `1`. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#DisplayImage\|DisplayImage]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Custom image asset to display for this binding. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#DisplayName\|DisplayName]] | string | Custom display text for this binding. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] for dispatching directionally "down" inputs to the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Forward\|Forward]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] for dispatching directionally "forward" inputs to the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode\|KeyCode]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Specifies the [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] which triggers the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] for dispatching directionally "left" inputs to the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#PointerIndex\|PointerIndex]] | int |  |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#PressedThreshold\|PressedThreshold]] | float | Numerical value above which to fire an [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] with a [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type\|Type]] of [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Bool]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#PrimaryModifier\|PrimaryModifier]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Specifies a primary [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] that must be pressed for the binding to activate. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#ReleasedThreshold\|ReleasedThreshold]] | float | Numerical value below which to fire an [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] with a [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type\|Type]] of [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Bool]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#ResponseCurve\|ResponseCurve]] | float | Numerical value to configure scaling for more precise thumbstick aiming. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] for dispatching directionally "right" inputs to the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Scale\|Scale]] | float | Scalar multiplier applied uniformly to all components of a directional [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]'s output. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#SecondaryModifier\|SecondaryModifier]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Specifies a secondary [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] that must be pressed for the binding to activate. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Type\|Type]] | [[30 Official Roblox Docs/API Reference/Enums/InputBindingType\|InputBindingType]] | Determines whether this binding is triggered by hardware input or programmatically via [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Fire\|Fire()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#UIButton\|UIButton]] | [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] | Connects a [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] to a boolean action. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#UIModifier\|UIModifier]] | [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] | Specifies a [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] that must be active for the binding to activate. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] for dispatching directionally "up" inputs to the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]]. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Vector2Scale\|Vector2Scale]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Per-component scale applied to the output of a [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Direction2D]] action. |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Vector3Scale\|Vector3Scale]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Per-component scale applied to the output of a [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Direction3D]] action. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Fire\|Fire()]] | () | Programmatically updates the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] state through this binding. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Backward

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Composite Directions · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] for dispatching directionally "backward" inputs to [[30 Official Roblox Docs/API Reference/Classes/InputAction#GetState|GetState()]] and the [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] event of the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]]. Only applies when the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]], in which case the dispatched value will be a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with its [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Z|Z]] component between `0` and `1`.

### ClampMagnitudeToOne

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Composite Directions · **Loaded/Saved:** true/true · **Capabilities:** Input

Determines whether the binding normalizes the combined composite directional vector to a maximum magnitude of `1` only if it exceeds that length. This prevents diagonal composite inputs (for example [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up|Up]] and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right|Right]] pressed simultaneously) from producing a magnitude greater than `1`, ensuring consistent movement speed regardless of the keys held. Default is `true`.

This property only applies when the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction1D]], [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]], or [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]].

Set this to `false` when input axes should remain independent of one another, such as 3D freecam movement, or when combining inputs whose raw values can exceed `1` (for example mouse wheel velocity) and you want to handle scaling yourself.

### DisplayImage

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true · **Capabilities:** Input

A custom [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] image asset that represents this binding visually (for example a gamepad button image or a stylized key graphic).

When empty (the default), no custom image is provided. Developers can use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetImageForKeyCode|UserInputService:GetImageForKeyCode()]] to obtain a platform-appropriate image. Use this together with [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding|InputAction.PreferredBinding]] to build keybinding UI that automatically reflects the player's active input device without manually resolving which binding image to display.

### DisplayName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true · **Capabilities:** Input

A custom string that overrides the display name shown for this binding in UI elements such as key prompts (for example "FIGHT" instead of the default key name "F").

When empty (the default), no custom name is provided. Developers can use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetStringForKeyCode|UserInputService:GetStringForKeyCode()]] to obtain the platform-appropriate key name. Use this together with [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding|InputAction.PreferredBinding]] to build keybinding UI that automatically reflects the player's active input device without manually resolving which binding name to display.

### Down

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Composite Directions · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] for dispatching directionally "down" inputs to [[30 Official Roblox Docs/API Reference/Classes/InputAction#GetState|GetState()]] and the [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] event of the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]].

When the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction1D]], the dispatched value will be a number between `0` and `-1`.

When the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]], the dispatched value will be a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] with its [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Y|Y]] component between `0` and `-1`.

When the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]], the dispatched value will be a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with its [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Y|Y]] component between `0` and `-1`.

Not applicable when the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]].

### Forward

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Composite Directions · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] for dispatching directionally "forward" inputs to [[30 Official Roblox Docs/API Reference/Classes/InputAction#GetState|GetState()]] and the [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] event of the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]]. Only applies when the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]], in which case the dispatched value will be a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with its [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Z|Z]] component between `0` and `-1`.

### KeyCode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies the [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] which triggers the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]]. The code type should match the input action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]], for example [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.E]] for an action type of [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]] or [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Thumbstick1]] for an action type of [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]]. Type mismatches will either not fire the [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] or the [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] event will receive a converted value.

### Left

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Composite Directions · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] for dispatching directionally "left" inputs to [[30 Official Roblox Docs/API Reference/Classes/InputAction#GetState|GetState()]] and the [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] event of the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]].

When the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]], the dispatched value will be a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] with its [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#X|X]] component between `0` and `-1`.

When the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]], the dispatched value will be a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with its [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#X|X]] component between `0` and `-1`.

Not applicable when the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction1D]] or [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]].

### PointerIndex

**Type:** int

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

### PressedThreshold

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Numerical value above which to fire an [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] with a [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] of [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]], for example when a gamepad trigger such as [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.ButtonL2]] exceeds `0.5` (halfway pressed). Default is `0.5`.

This property must be greater than or equal to [[30 Official Roblox Docs/API Reference/Classes/InputBinding#ReleasedThreshold|ReleasedThreshold]] or else it will be clamped to [[30 Official Roblox Docs/API Reference/Classes/InputBinding#ReleasedThreshold|ReleasedThreshold]].

### PrimaryModifier

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies a [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] that serves as a required modifier for the binding. The [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] will only trigger the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] if this input is pressed prior to [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode|KeyCode]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#UIButton|UIButton]], or composite directions.

There is no ordering requirement between [[30 Official Roblox Docs/API Reference/Classes/InputBinding#PrimaryModifier|PrimaryModifier]] and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#SecondaryModifier|SecondaryModifier]]. If both properties are set, both modifiers must be pressed to activate the binding, but the order in which they are pressed does not matter.

If set to [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Unknown]], no primary modifier is required.

### ReleasedThreshold

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Numerical value below which to fire an [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] with a [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] of [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]], for example when a gamepad trigger such as [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.ButtonL2]] falls below `0.5` (less than halfway pressed). Default is `0.2`.

This property must be less than or equal to [[30 Official Roblox Docs/API Reference/Classes/InputBinding#PressedThreshold|PressedThreshold]] or else it will be clamped to [[30 Official Roblox Docs/API Reference/Classes/InputBinding#PressedThreshold|PressedThreshold]].

### ResponseCurve

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

A numerical value to control the sensitivity of gamepad thumbstick input by applying a quadratic response curve. Commonly used for camera control to make small thumbstick inputs more precise, while ramping up quickly to allow for large movements with higher magnitude input.

Ranges between `1` to `10`, with higher values providing a more intense curve. Default is `1`, at which input is returned exactly as received.

Only applicable when the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]] and the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode|KeyCode]] is [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Thumbstick1]] or [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Thumbstick2]].

### Right

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Composite Directions · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] for dispatching directionally "right" inputs to [[30 Official Roblox Docs/API Reference/Classes/InputAction#GetState|GetState()]] and the [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] event of the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]].

When the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]], the dispatched value will be a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] with its [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#X|X]] component between `0` and `1`.

When the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]], the dispatched value will be a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with its [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#X|X]] component between `0` and `1`.

Not applicable when the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction1D]] or [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]].

### Scale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

A scalar multiplier applied uniformly to every component of the output value. Applies to [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] types [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction1D]], [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]], and [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]].

To scale individual components independently, use [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Vector2Scale|Vector2Scale]] (for [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]]) or [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Vector3Scale|Vector3Scale]] (for [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]]). When both `Scale` and a vector scale are set, both are applied.

### SecondaryModifier

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies a [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] that serves as a required modifier for the binding. The [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] will only trigger the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] if this input is pressed prior to [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode|KeyCode]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#UIButton|UIButton]], or composite directions.

There is no ordering requirement between [[30 Official Roblox Docs/API Reference/Classes/InputBinding#PrimaryModifier|PrimaryModifier]] and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#SecondaryModifier|SecondaryModifier]]. If both properties are set, both modifiers must be pressed to activate the binding, but the order in which they are pressed does not matter.

If set to [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Unknown]], no secondary modifier is required.

### Type

**Type:** [[30 Official Roblox Docs/API Reference/Enums/InputBindingType|InputBindingType]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Determines whether this `InputBinding` is triggered by hardware input ([[30 Official Roblox Docs/API Reference/Enums/InputBindingType|Automatic]]) or programmatically via [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Fire|Fire()]] ([[30 Official Roblox Docs/API Reference/Enums/InputBindingType|Scriptable]]).

When set to [[30 Official Roblox Docs/API Reference/Enums/InputBindingType|Automatic]] (default), the binding responds to physical input devices (keyboard, mouse, gamepad, touch) based on its [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode|KeyCode]] or composite direction or UI button properties.

When set to [[30 Official Roblox Docs/API Reference/Enums/InputBindingType|Scriptable]], the binding ignores hardware input and instead receives state updates exclusively through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Fire|Fire()]] method.

### UIButton

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

[[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] to connect to a boolean action.

### UIModifier

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] that must be pressed for the [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] to trigger the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]]. Behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/InputBinding#PrimaryModifier|PrimaryModifier]] and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#SecondaryModifier|SecondaryModifier]], but accepts a UI button reference rather than a [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]].

This is particularly useful for touch input where the relevant interaction is defined by where on screen the touch originates, for example a dynamic thumbstick that should only respond to touches that begin within a specific UI region.

If `nil`, no modifier is required.

### Up

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Composite Directions · **Loaded/Saved:** true/true · **Capabilities:** Input

Specifies an alternate [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] for dispatching directionally "up" inputs to [[30 Official Roblox Docs/API Reference/Classes/InputAction#GetState|GetState()]] and the [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] event of the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]].

When the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction1D]], the dispatched value will be a number between `0` and `1`.

When the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]], the dispatched value will be a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] with its [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Y|Y]] component between `0` and `1`.

When the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]], the dispatched value will be a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] with its [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Y|Y]] component between `0` and `1`.

Not applicable when the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]].

### Vector2Scale

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Amount by which each component of the output is independently linearly scaled. Only applies when the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]].

### Vector3Scale

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Amount by which each component of the output is independently linearly scaled. Only applies when the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]].

## Methods

### Fire

```lua
InputBinding:Fire(state: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

Programmatically updates the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] to the given state and fires the appropriate signals ([[30 Official Roblox Docs/API Reference/Classes/InputAction#Pressed|Pressed]], [[30 Official Roblox Docs/API Reference/Classes/InputAction#Released|Released]], [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]]).

This method can only be called on bindings with [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Type|Type]] set to [[30 Official Roblox Docs/API Reference/Enums/InputBindingType|Scriptable]]. Calling it on an [[30 Official Roblox Docs/API Reference/Enums/InputBindingType|Automatic]] binding will throw an error.

The `state` parameter must match the [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] of the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]]:

- [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]] expects a `boolean`
- [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction1D]] expects a `number`
- [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]] expects a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]
- [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]] expects a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]
- [[30 Official Roblox Docs/API Reference/Enums/InputActionType|ViewportPosition]] expects a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

Passing a mismatched type will cause an error. This method respects the same deduplication rules as hardware input, as in consecutive calls with the same state value will not re‑fire events.

The parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] must be [[30 Official Roblox Docs/API Reference/Classes/InputAction#Enabled|Enabled]] and its ancestor [[30 Official Roblox Docs/API Reference/Classes/InputContext|InputContext]] must also be [[30 Official Roblox Docs/API Reference/Classes/InputContext#Enabled|Enabled]], otherwise the call is silently ignored.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | Variant |  | The state value to apply; must match the parent action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type\|Type]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [InputBinding](https://create.roblox.com/docs/reference/engine/classes/InputBinding) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
