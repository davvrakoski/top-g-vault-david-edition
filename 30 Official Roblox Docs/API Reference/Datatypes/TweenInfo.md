---
title: "TweenInfo"
description: "Stores parameters for `Tweens`."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/TweenInfo"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Stores parameters for [[30 Official Roblox Docs/API Reference/Classes/Tween|Tweens]].*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] data type stores parameters for [[30 Official Roblox Docs/API Reference/Classes/TweenService#Create|TweenService:Create()]] to specify the behavior of the tween. The properties of a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] cannot be written to after its creation.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#new\|new()]] | `time`, `easingStyle`, `easingDirection`, `repeatCount`, `reverses`, `delayTime` | Creates a new [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] from the provided parameters. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#EasingDirection\|EasingDirection]] | [[30 Official Roblox Docs/API Reference/Enums/EasingDirection\|EasingDirection]] | The direction in which the tween executes. |
| [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#Time\|Time]] | number | Duration of the tween, in seconds. |
| [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#DelayTime\|DelayTime]] | number | Time of delay until the tween begins, in seconds. |
| [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#RepeatCount\|RepeatCount]] | number | Number of times the tween repeats. |
| [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#EasingStyle\|EasingStyle]] | [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|EasingStyle]] | The style in which the tween executes. |
| [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#Reverses\|Reverses]] | bool | Whether or not the tween interpolates in reverse tween once the initial tween completes. |

## Constructors

### new

```lua
TweenInfo.new(time: number = 1, easingStyle: EasingStyle = Enum.EasingStyle.Quad, easingDirection: EasingDirection = Enum.EasingDirection.Out, repeatCount: number = 0, reverses: bool = False, delayTime: number = 0): TweenInfo
```

Creates a new [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] from the provided parameters. This constructor raises an error if `easingStyle` is [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Bezier]] or [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Spring]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | number | `1` | Duration for the tween, in seconds. |
| `easingStyle` | [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|EasingStyle]] | `Enum.EasingStyle.Quad` | Easing style for the tween. |
| `easingDirection` | [[30 Official Roblox Docs/API Reference/Enums/EasingDirection\|EasingDirection]] | `Enum.EasingDirection.Out` | The direction in which the tween executes. |
| `repeatCount` | number | `0` | Number of times the tween should repeat. `-1` repeats indefinitely. |
| `reverses` | bool | `False` | Whether the tween should reverse to the starting values once it reaches its targets. |
| `delayTime` | number | `0` | Time of delay until the tween begins, in seconds. |

## Properties

### EasingDirection

**Type:** [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|EasingDirection]]

The direction in which the tween executes.

### Time

**Type:** number

Duration of the tween, in seconds.

### DelayTime

**Type:** number

Time of delay until the tween begins, in seconds.

### RepeatCount

**Type:** number

Number of times the tween repeats. `-1` indicates indefinite repetition.

### EasingStyle

**Type:** [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|EasingStyle]]

The style in which the tween executes.

### Reverses

**Type:** bool

Whether or not the tween interpolates in reverse tween once the initial tween completes.

---
*Source: [TweenInfo](https://create.roblox.com/docs/reference/engine/datatypes/TweenInfo) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
