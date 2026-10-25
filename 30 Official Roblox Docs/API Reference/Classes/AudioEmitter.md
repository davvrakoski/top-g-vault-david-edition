---
title: "AudioEmitter"
description: "Emits audio streams into the world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioEmitter"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Emits audio streams into the world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] emits audio streams into the world. It provides a single **Input** pin that can be connected to by one or more [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]]. Any streams wired to an [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] get broadcasted into the world from the emitter's parent's position. If the parent is an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]], or [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], the parent's world-position will be used. If the parent is not one of these classes, the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] is effectively silent.

[[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] are heard by [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListeners]] in order to implement 3D spatialization.

*Code samples for this API (`audio-wiring---multi-emission`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioEmitter); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#AcousticSimulationEnabled\|AcousticSimulationEnabled]] | boolean | Determines whether acoustic simulation should be used for this [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#AngleAttenuation\|AngleAttenuation]] | BinaryString | Represents how the perceived volume of the emitted sound changes based on the angle between a [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] and the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector\|LookVector]] associated with the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#AudioInteractionGroup\|AudioInteractionGroup]] | string | Controls which [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListeners]] are capable of hearing this [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuation\|DistanceAttenuation]] | BinaryString | Represents how the perceived volume of the emitted sound changes as the distance between a [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] and the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] increases. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationBounds\|DistanceAttenuationBounds]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | The minimum and maximum distance range used by the selected [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationMode\|DistanceAttenuationMode]] preset. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationMode\|DistanceAttenuationMode]] | [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode\|DistanceAttenuationMode]] | Determines how the volume of this [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] attenuates over distance. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#PositionInstance\|PositionInstance]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] whose position and orientation is used as the emitter's position if [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#PositionType\|PositionType]] is set to [[30 Official Roblox Docs/API Reference/Enums/EmitterPositionType\|Enum.EmitterPositionType.Instance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#PositionType\|PositionType]] | [[30 Official Roblox Docs/API Reference/Enums/EmitterPositionType\|EmitterPositionType]] | Determines how the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] determines its 3D location. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#SimulationFidelity\|SimulationFidelity]] | [[30 Official Roblox Docs/API Reference/Enums/AudioSimulationFidelity\|AudioSimulationFidelity]] | **Deprecated.** Controls how detailed the audio simulation should be for this [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#GetAngleAttenuation\|GetAngleAttenuation()]] | Dictionary | Gets the angle attenuation curve that the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] is using, or an empty table if it's using the default curve. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#GetAudibilityFor\|GetAudibilityFor()]] | float | Calculates how audible this emitter is for a particular [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#GetDistanceAttenuation\|GetDistanceAttenuation()]] | Dictionary | Gets the distance attenuation curve that the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] is using, or an empty table if it's using the default curve. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#GetInteractingListeners\|GetInteractingListeners()]] | List<[[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]> | Lists all [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListeners]] that are capable of hearing this emitter. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#SetAngleAttenuation\|SetAngleAttenuation()]] | () | Sets the angle attenuation curve that the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] should use, or uses a constant curve of volume `1` if none is provided. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#SetDistanceAttenuation\|SetDistanceAttenuation()]] | () | Sets the distance attenuation curve that the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] should use, or uses an inverse rolloff curve if none is provided. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AcousticSimulationEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Simulation · **Loaded/Saved:** true/true · **Capabilities:** Audio

Determines whether sound from this [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] shoud automatically implement features of acoustic simulation, such as occlusion (being muffled through walls), diffraction (bending around corners), and reverberation (echoing off of walls), when being heard by an [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]]. Note that the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] also needs its [[30 Official Roblox Docs/API Reference/Classes/AudioListener#AcousticSimulationEnabled|AcousticSimulationEnabled]] property set to `true` for the effects to occur.

### AngleAttenuation

**Type:** BinaryString

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Audio

Represents a volume-over-angle curve that affects how loudly a [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] will hear the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]], based on the angle between them and the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|LookVector]] associated with the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]].

This property is internal and can't be accessed by scripts; it exists to support replication. See [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#SetAngleAttenuation|SetAngleAttenuation()]] for usage details.

### AudioInteractionGroup

**Type:** string

**Thread safety:** ReadSafe · **Category:** Interactions · **Loaded/Saved:** true/true · **Capabilities:** Audio

If an [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] and an [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] share an interaction group, then the listener is capable of hearing the emitter.

### DistanceAttenuation

**Type:** BinaryString

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Audio

Represents a volume-over-distance curve that affects how loudly a [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] will hear the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]], based on the distance between them.

This property is internal and can't be accessed by scripts; it exists to support replication. See [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#SetDistanceAttenuation|SetDistanceAttenuation()]] for usage details.

### DistanceAttenuationBounds

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Audio

Specifies the [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]] that defines the minimum and maximum distances for the distance attenuation preset selected by [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationMode|DistanceAttenuationMode]]. The emitter is at full volume when a [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] is within the minimum distance and fully attenuated at or beyond the maximum distance. The attenuation curve between these bounds is determined by the chosen [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode|Enum.DistanceAttenuationMode]].

Defaults to a [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]] of `[4, 10000]`. This property is only used when [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationMode|DistanceAttenuationMode]] is set to a preset other than [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode|Enum.DistanceAttenuationMode.Custom]].

### DistanceAttenuationMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode|DistanceAttenuationMode]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Audio

Determines which formula is used to roll off the perceived volume of this [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] as the distance from a [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] increases, via [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode|Enum.DistanceAttenuationMode]].

When set to any value other than [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode|Enum.DistanceAttenuationMode.Custom]], [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationBounds|DistanceAttenuationBounds]] defines the minimum and maximum distances for the rolloff, and the custom curve set by [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#SetDistanceAttenuation|SetDistanceAttenuation()]] is ignored. Defaults to [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode|Enum.DistanceAttenuationMode.Custom]].

### PositionInstance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Audio

This property is only functional when [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#PositionType|PositionType]] is set to [[30 Official Roblox Docs/API Reference/Enums/EmitterPositionType|Enum.EmitterPositionType.Instance]]. In that scenario, this property determines which [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] will be used to determine the position of spatial audio emitted by the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] to be heard by [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListeners]].

If set to an instance without a position or `nil`, the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] will not be heard.

### PositionType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/EmitterPositionType|EmitterPositionType]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Audio

The method by which the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] determines its 3D location (the point from which audio can be heard by any nearby [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListeners]]). Defaults to [[30 Official Roblox Docs/API Reference/Enums/EmitterPositionType|Enum.EmitterPositionType.Parent]].

### SimulationFidelity

> [!warning] Deprecated
> This member is deprecated.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioSimulationFidelity|AudioSimulationFidelity]]

**Thread safety:** ReadSafe · **Category:** Simulation · **Loaded/Saved:** true/true · **Capabilities:** Audio · **Tags:** `Deprecated`

Controls how detailed the audio simulation should be for this [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]], similar to [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|MeshPart.CollisionFidelity]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity|MeshPart.RenderFidelity]].

[[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] and [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListeners]] which disagree on the necessary level of detail will use the less-detailed option.

## Methods

### GetAngleAttenuation

```lua
AudioEmitter:GetAngleAttenuation(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `CustomLuaState`

Returns a table mapping angle to volume. Keys are numbers between `0` and `180` (inclusive), while values are numbers between `0` and `1` (inclusive) describing how volume attenuates depending on direction. This method returns an empty table if the default angle attenuation curve is being used.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | Table mapping angle to volume, as described above. |

### GetAudibilityFor

```lua
AudioEmitter:GetAudibilityFor(listener: AudioListener): float
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Calculates how audible this emitter is for a particular [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]]. The resulting volume, ranging from `0` to `1`, accounts for distance and angle attenuation on both the emitter and listener.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `listener` | [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] |  | The [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] to calculate audibility for. |

**Returns**

| Type | Description |
| --- | --- |
| float | A number between `0` and `1` representing the combined volume after distance and angle attenuation. |

### GetConnectedWires

```lua
AudioEmitter:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] has one "Input" pin.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pin` | string |  | An input or output pin on this instance |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] |

### GetDistanceAttenuation

```lua
AudioEmitter:GetDistanceAttenuation(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `CustomLuaState`

Returns a table mapping distance to volume. Keys are numbers greater than or equal to 0, while values are numbers between 0 and 1 (inclusive) describing how volume attenuates over distance. This method returns an empty table if the default distance attenuation curve is being used.

Note that this method always returns the custom curve set by [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#SetDistanceAttenuation|SetDistanceAttenuation()]], regardless of the current [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationMode|DistanceAttenuationMode]] setting. When a preset mode is active, the custom curve is not used for attenuation and this return value may not reflect the active rolloff behavior.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A table mapping distance to volume, as described above. |

### GetInputPins

```lua
AudioEmitter:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetInteractingListeners

```lua
AudioEmitter:GetInteractingListeners(): List<AudioListener>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListeners]] that share an [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#AudioInteractionGroup|AudioInteractionGroup]] with the emitter.

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListeners]]. |

### GetOutputPins

```lua
AudioEmitter:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### SetAngleAttenuation

```lua
AudioEmitter:SetAngleAttenuation(curve: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `CustomLuaState`

Sets a volume-over-angle curve that affects how loudly a [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] will hear the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]], based on the angle between them and the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|LookVector]] associated with the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]]. Use this to model directional audio sources — for example, making an avatar's voice project more strongly in front of them, or having a monster's growl serve as a gameplay cue that it is facing the player.

The curve is represented by a table mapping angle keys to volume values. Keys are expected to be unique numbers between `0` and `180` (inclusive), while values are expected to be numbers between `0` and `1` (inclusive). Tables containing up to 400 key-value pairs are supported.

The volume of the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] from the perspective of a [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] at an angle `a` is determined by linearly interpolating between the volume levels for the points on the curve whose angle values are directly above and below `a`. If there is either no point below `a` or no point above `a`, the volume level of the other point is chosen. Essentially, the curve is a sequence of points connected by straight lines, and beyond its left and right endpoints the curve extends outward at their respective volume levels.

This volume will be multiplied with the volumes from all other attenuation curves (including the ones on the receiving [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]]) to obtain the final audibility.

If the table is empty or `nil`, the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] defaults to using an angle attenuation curve with the constant volume value of `1`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `curve` | Dictionary |  | A table mapping angle to volume. Keys are numbers between `0` and `180`, values are numbers between `0` and `1`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetDistanceAttenuation

```lua
AudioEmitter:SetDistanceAttenuation(curve: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `CustomLuaState`

Sets a volume-over-distance curve that affects how loudly a [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] will hear the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]], based on the distance between them. This curve is only used for attenuation when [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationMode|DistanceAttenuationMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode|Enum.DistanceAttenuationMode.Custom]].

The curve is represented by a table mapping distance keys to volume values. Keys are expected to be unique numbers greater than or equal to 0, while values are expected to be numbers between 0 and 1 (inclusive). Tables containing up to 400 key-value pairs are supported.

The volume of the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] from the perspective of a [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] at a distance `d` is determined by linearly interpolating between the volume levels for the points on the curve whose distance values are directly above and below `d`. If there is either no point below `d` or no point above `d`, the volume level of the other point is chosen. Essentially, the curve is a sequence of points connected by straight lines, and beyond its left and right endpoints the curve extends outward infinitely at their respective volume levels.

This volume will be multiplied with the volumes from all other attenuation curves (including the ones on the receiving [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]]) to obtain the final audibility.

If the table is empty or `nil`, the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] defaults to using a distance attenuation curve determined by the inverse-square law.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `curve` | Dictionary |  | A table mapping distance to volume. Keys are numbers greater than or equal to `0`, values are numbers between `0` and `1`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`audio-wiring---custom-distance-attenuation`) are published on the source page; their code is not part of the open-source repo.*

## Events

### WiringChanged

```lua
AudioEmitter.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioEmitter](https://create.roblox.com/docs/reference/engine/classes/AudioEmitter) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
