---
title: "HapticService"
description: "Provides haptic feedback to controllers and devices."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HapticService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides haptic feedback to controllers and devices.*

> [!warning] Deprecated
> This service has been superseded by `Class.HapticEffect`, a newer instance
> that supports multiple haptic effect types, looped effects, and customizable
> haptics.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`HapticService` allows scripts to query vibration support and set motor intensities on gamepad controllers, VR controllers, and mobile devices. Use [[30 Official Roblox Docs/API Reference/Classes/HapticService#IsVibrationSupported|IsVibrationSupported()]] and [[30 Official Roblox Docs/API Reference/Classes/HapticService#IsMotorSupported|IsMotorSupported()]] to check device capabilities, then [[30 Official Roblox Docs/API Reference/Classes/HapticService#SetMotor|SetMotor()]] to drive a specific [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor|Enum.VibrationMotor]] on a given [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]]. Motor output is scaled by the user's haptic intensity preference in their Roblox settings.

As this service is client-side only, it can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] required by a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]].

This service has been superseded by [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]], which supports waveform-based effects, looping, spatial attenuation, and preset effect types. For new work, use [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] instead.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HapticService#GetMotor\|GetMotor()]] | Tuple | Returns the current vibration value set to the specified [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputType\|UserInputType]] and [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor\|Enum.VibrationMotor]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HapticService#IsMotorSupported\|IsMotorSupported()]] | boolean | Returns `true` if the specified motor is available to be used with the specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HapticService#IsVibrationSupported\|IsVibrationSupported()]] | boolean | Returns `true` if the specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] supports haptic feedback. |
| [[30 Official Roblox Docs/API Reference/Classes/HapticService#SetMotor\|SetMotor()]] | () | Sets the vibration intensity of the specified [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputType\|UserInputType]] and [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor\|Enum.VibrationMotor]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetMotor

```lua
HapticService:GetMotor(inputType: UserInputType, vibrationMotor: VibrationMotor): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Input

Returns the current vibration value set to the specified [[30 Official Roblox Docs/API Reference/Classes/InputObject#UserInputType|UserInputType]] and [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor|Enum.VibrationMotor]]. This will not return anything if [[30 Official Roblox Docs/API Reference/Classes/HapticService#SetMotor|SetMotor()]] has not been called prior.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `inputType` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]]. |
| `vibrationMotor` | [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor\|VibrationMotor]] |  | The specified [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor\|Enum.VibrationMotor]]. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The current vibration value set to the specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] and [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor\|Enum.VibrationMotor]] or `nil` if [[30 Official Roblox Docs/API Reference/Classes/HapticService#SetMotor\|SetMotor()]] has not been called prior. |

### IsMotorSupported

```lua
HapticService:IsMotorSupported(inputType: UserInputType, vibrationMotor: VibrationMotor): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Input

Returns `true` if the specified motor is available to be used with the specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `inputType` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The specific [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] being checked for [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor\|Enum.VibrationMotor]] support. |
| `vibrationMotor` | [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor\|VibrationMotor]] |  | The specified [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor\|Enum.VibrationMotor]] checked to see if it supports the specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]]. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Boolean of `true` if the specified motor is available to be used with the specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]], `false` if not. |

### IsVibrationSupported

```lua
HapticService:IsVibrationSupported(inputType: UserInputType): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Input

Returns `true` if the specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] supports haptic feedback.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `inputType` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] checked to see if it supports haptic feedback. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Boolean of `true` if the specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] supports haptic feedback. |

### SetMotor

```lua
HapticService:SetMotor(inputType: UserInputType, vibrationMotor: VibrationMotor, vibrationValues: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

Sets the vibration intensity of the specified `inputType` and `vibrationMotor`. Note that almost all usage cases specify [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType.Gamepad1]] for `inputType` which is internally mapped to the device's respective hardware.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `inputType` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]]. |
| `vibrationMotor` | [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor\|VibrationMotor]] |  | The specified [[30 Official Roblox Docs/API Reference/Enums/VibrationMotor\|Enum.VibrationMotor]]. |
| `vibrationValues` | Tuple |  | How intensely the motor should vibrate. Only uses the first value in the tuple, which should be a number. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`HapticService-SetMotor1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [HapticService](https://create.roblox.com/docs/reference/engine/classes/HapticService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
