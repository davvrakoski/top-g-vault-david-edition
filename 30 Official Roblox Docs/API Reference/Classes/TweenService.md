---
title: "TweenService"
description: "Used to create `Tweens` which interpolate, or tween, the properties of instances."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TweenService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Used to create [[30 Official Roblox Docs/API Reference/Classes/Tween|Tweens]] which interpolate, or tween, the properties of instances.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

[[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService]] is used to create [[30 Official Roblox Docs/API Reference/Classes/Tween|Tweens]] which interpolate, or tween, the properties of instances. [[30 Official Roblox Docs/API Reference/Classes/Tween|Tweens]] can be used on any object with compatible property types, including:

- [[30 Official Roblox Docs/Luau/Numbers|number]]
- [[30 Official Roblox Docs/Luau/Booleans|boolean]]
- [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]
- [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]]
- [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]
- [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]
- [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]
- [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]
- [[30 Official Roblox Docs/API Reference/Datatypes/Vector2int16|Vector2int16]]
- [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]
- [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem|EnumItem]]

[[30 Official Roblox Docs/API Reference/Classes/TweenService#Create|TweenService:Create()]], the primary constructor function, takes [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] specifications about the tween and generates the [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] object which can then be used to play the tween.

Note that [[30 Official Roblox Docs/API Reference/Classes/Tween|Tweens]] can interpolate multiple properties at the same time, but they must not be interpolating the same property. If two tweens attempt to modify the same property, the initial tween will be cancelled and overwritten by the most recent tween.

*Code samples for this API (`Tween-Creation`, `Looped-Tween`, `Tween-Pausing`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/TweenService); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TweenService#Create\|Create()]] | [[30 Official Roblox Docs/API Reference/Classes/Tween\|Tween]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/Tween\|Tween]] given the object whose properties are to be tweened, a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]], and a dictionary of goal property values. |
| [[30 Official Roblox Docs/API Reference/Classes/TweenService#GetValue\|GetValue()]] | float | Calculates a new alpha given an [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|Enum.EasingStyle]] and [[30 Official Roblox Docs/API Reference/Enums/EasingDirection\|Enum.EasingDirection]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TweenService#SmoothDamp\|SmoothDamp()]] | Tuple | Smoothly interpolates a value towards a target, simulating a critically damped spring. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### Create

```lua
TweenService:Create(instance: Instance, tweenInfo: TweenInfo, propertyTable: Dictionary): Tween
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This constructor creates a new [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] from three arguments: the object to tween, the [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] specifications, and a table containing the properties to tween and values to tween to.

The `propertyTable` parameter needs to be a dictionary where the keys are the string names of the property (for example `Position`, `Transparency`, or `Color`), and the values are the property targets at the end of the tween.

The [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] created using this function is unique to the object given as the `instance` parameter. To apply the same tween to another object, call this function again with the new object.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] whose properties are to be tweened. |
| `tweenInfo` | [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] to be used. |
| `propertyTable` | Dictionary |  | A dictionary of properties, and their target values, to be tweened. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Tween\|Tween]] | The newly created [[30 Official Roblox Docs/API Reference/Classes/Tween\|Tween]] configured to interpolate the given properties toward their target values. Call [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Play\|TweenBase:Play()]] on the returned object to start the tween. |

*Code samples for this member (`Tween-Creation`, `Looped-Tween`) are published on the source page; their code is not part of the open-source repo.*

### GetValue

```lua
TweenService:GetValue(alpha: float, easingStyle: EasingStyle, easingDirection: EasingDirection): float
```

**Thread safety:** Safe · **Capabilities:** Basic

Returns a new alpha value for interpolating using the given alpha value, [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle]], and [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|Enum.EasingDirection]]. The provided `alpha` value will be clamped between `0` and `1`. This method raises an error if `easingStyle` is [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Bezier]] or [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Spring]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `alpha` | float |  | An interpolation value between `0` and `1`. |
| `easingStyle` | [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|EasingStyle]] |  | The easing style to use. |
| `easingDirection` | [[30 Official Roblox Docs/API Reference/Enums/EasingDirection\|EasingDirection]] |  | The easing direction to use. |

**Returns**

| Type | Description |
| --- | --- |
| float | A new alpha value generated from the given easing style and direction. |

### SmoothDamp

```lua
TweenService:SmoothDamp(current: Variant, target: Variant, velocity: Variant, smoothTime: float, maxSpeed: float?, dt: float?): Tuple
```

**Thread safety:** Safe · **Capabilities:** Basic

Smoothly interpolates a value towards a target, simulating a critically damped spring. Returns a tuple with `(newValue, newVelocity`). `newVelocity` needs to be fed to the next call of SmoothDamp to ensure smooth results. Supports [number](https://create.roblox.com/docs/reference/engine/datatypes/number), [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]], [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], and [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `current` | Variant |  | The current value to smooth. |
| `target` | Variant |  | The target value to reach. |
| `velocity` | Variant |  | The current velocity with which the current value should approach the target value. You shouldn't modify this value between calls yourself, it's used to store the stateful velocity. In most cases, initialize this with `0`, `Vector2.zero`, `Vector3.zero`, or `CFrame.identity` depending on the type, or if needed, with your initial velocity. |
| `smoothTime` | float |  | The duration over which the total smoothing operation should take place. Note that since this is a damped spring, there's no guarantee `current` will be exactly `target` after this time, but it will be close. Smaller values result in quicker smoothing. |
| `maxSpeed` | float? |  | The maximum speed at which the current value should approach the target value. Leaving this nil defaults to `math.huge`, meaning the velocity isn't clamped. |
| `dt` | float? |  | The rate at which the smoothing operation should be applied. If left nil, the current engine delta time will be used. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The new value and new velocity calculated from the smoothing operation. |

---
*Source: [TweenService](https://create.roblox.com/docs/reference/engine/classes/TweenService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
