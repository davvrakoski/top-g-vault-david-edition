---
title: "HapticEffect"
description: "An object that provides waveform-based haptic feedback (vibrations and rumbles) on supported controllers and mobile devices."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HapticEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that provides waveform-based haptic feedback (vibrations and rumbles) on supported controllers and mobile devices.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Modern controllers and devices have motors built‑in to provide haptic feedback. Adding rumbles and vibrations can provide subtle feedback that is hard to convey through visuals or audio.

Roblox supports haptics for the following devices:

- Android and iOS phones supporting haptics including most iPhone, Pixel, and Samsung Galaxy devices
- PlayStation gamepads
- Xbox gamepads
- Quest Touch controller

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Looped\|Looped]] | boolean | Whether the haptic effect loops continuously. |
| [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Along with [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Radius\|Radius]], specifies the impact position relative to the input device and, effectively, how broadly that impact effects nearby motors. |
| [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Radius\|Radius]] | float | Along with [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Position\|Position]], specifies the impact radius relative to the input device and, effectively, how broadly that impact effects nearby motors. |
| [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Type\|Type]] | [[30 Official Roblox Docs/API Reference/Enums/HapticEffectType\|HapticEffectType]] | [[30 Official Roblox Docs/API Reference/Enums/HapticEffectType\|Enum.HapticEffectType]] describing the haptic type. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Play\|Play()]] | () | Plays the haptic effect. |
| [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#SetWaveformKeys\|SetWaveformKeys()]] | () | Defines a custom waveform as a table and applies it to the haptic.<br><br>This method takes in an array of [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Stop\|Stop()]] | () | Stops the haptic effect. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Ended\|Ended]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/HapticEffect\|HapticEffect]] has completed playback and stopped. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Looped

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

Whether the haptic effect loops continuously.

*Code samples for this member (`HapticEffect-Looped`) are published on the source page; their code is not part of the open-source repo.*

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

Along with [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Radius|Radius]], specifies the impact position relative to the input device and, effectively, how broadly that impact effects nearby motors. Note that some gamepads do not have both "small" and "large" motors, and that "gamepad large left/right" is not supported on PC.

*(image in the full Top G Vault)*

*Code samples for this member (`HapticEffect-Position`) are published on the source page; their code is not part of the open-source repo.*

### Radius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

Along with [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Position|Position]], specifies the impact radius relative to the input device and, effectively, how broadly that impact effects nearby motors. Note that some gamepads do not have both "small" and "large" motors, and that "gamepad large left/right" is not supported on PC.

*(image in the full Top G Vault)*

*Code samples for this member (`HapticEffect-Radius`) are published on the source page; their code is not part of the open-source repo.*

### Type

**Type:** [[30 Official Roblox Docs/API Reference/Enums/HapticEffectType|HapticEffectType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

The haptic type, such as [[30 Official Roblox Docs/API Reference/Enums/HapticEffectType|Enum.HapticEffectType.GameplayCollision]] for a large immediate rumble that dies down quickly. The [[30 Official Roblox Docs/API Reference/Enums/HapticEffectType|Enum.HapticEffectType.Custom]] value lets you specify a haptic with custom waveform keys defined through [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#SetWaveformKeys|SetWaveformKeys()]].

## Methods

### Play

```lua
HapticEffect:Play(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

Plays the haptic effect.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`HapticEffect-Play`) are published on the source page; their code is not part of the open-source repo.*

### SetWaveformKeys

```lua
HapticEffect:SetWaveformKeys(keys: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method lets you define a custom waveform as a table and apply it to the haptic. It takes an array of [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey|FloatCurveKey]] objects, each constructed with three arguments: **time** in milliseconds, **value** ranging from `0` (no haptic) to `1` (full intensity), and an [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Enum.KeyInterpolationMode]] that controls how the curve interpolates. between keys.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keys` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]] objects defining the custom haptic waveform, where each key specifies a time in milliseconds, an intensity value from 0 (no haptic) to 1 (full intensity), and an [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|Enum.KeyInterpolationMode]] for interpolation between keys. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`HapticEffect-SetWaveformKeys`) are published on the source page; their code is not part of the open-source repo.*

### Stop

```lua
HapticEffect:Stop(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

Stops the haptic effect.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`HapticEffect-Stop`) are published on the source page; their code is not part of the open-source repo.*

## Events

### Ended

```lua
HapticEffect.Ended()
```

**Capabilities:** Input

Fires when the [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] has completed playback and stopped. Note this event will **not** fire for haptics with [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Looped|Looped]] set to `true` since they continue playing upon reaching the end. This event will also **not** fire when the haptic is stopped before playback has completed.

This event is often used to destroy an [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] when it has completed playback.

---
*Source: [HapticEffect](https://create.roblox.com/docs/reference/engine/classes/HapticEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
