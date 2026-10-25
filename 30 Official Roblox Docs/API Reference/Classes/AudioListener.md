---
title: "AudioListener"
description: "Records an audio stream from its surrounding `AudioEmitters` in the 3D world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioListener"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Records an audio stream from its surrounding [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] in the 3D world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] records an audio stream from its surrounding [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] in the 3D world. It provides a single **Output** pin which can be connected to other pins via [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]]. If the parent is an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]], or [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], the parent's world [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] will be used for listening. If the parent is not one of these classes, the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] effectively hears nothing.

*Code samples for this API (`audio-wiring---camera-listener`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioListener); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#AcousticSimulationEnabled\|AcousticSimulationEnabled]] | boolean | Determines whether acoustic simulation should be used for this [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#AngleAttenuation\|AngleAttenuation]] | BinaryString | Represents how the perceived volume of the emitted sound changes based on the angle between a [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] and the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector\|LookVector]] associated with the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#AudioInteractionGroup\|AudioInteractionGroup]] | string | Controls which [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitters]] are audible to this [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#DistanceAttenuation\|DistanceAttenuation]] | BinaryString | Represents how the perceived volume of emitted sounds change as the distance between [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitters]] and the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] increases. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#PositionInstance\|PositionInstance]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] whose position and orientation is used as the listener's position if [[30 Official Roblox Docs/API Reference/Classes/AudioListener#PositionType\|PositionType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ListenerPositionType\|Enum.ListenerPositionType.Instance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#PositionType\|PositionType]] | [[30 Official Roblox Docs/API Reference/Enums/ListenerPositionType\|ListenerPositionType]] | Determines how the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] determines its 3D location. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#SimulationFidelity\|SimulationFidelity]] | [[30 Official Roblox Docs/API Reference/Enums/AudioSimulationFidelity\|AudioSimulationFidelity]] | **Deprecated.** Controls how detailed the audio simulation should be for this [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#GetAngleAttenuation\|GetAngleAttenuation()]] | Dictionary | Gets the angle attenuation curve that the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] is using, or an empty table if it's using the default curve. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#GetAudibilityFor\|GetAudibilityFor()]] | float | Calculates how audible an [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] is for this listener |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#GetDistanceAttenuation\|GetDistanceAttenuation()]] | Dictionary | Gets the distance attenuation curve that the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] is using, or an empty table if it's using the default curve. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#GetInteractingEmitters\|GetInteractingEmitters()]] | List<[[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]]> | Lists all [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitters]] that this listener is capable of hearing. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#SetAngleAttenuation\|SetAngleAttenuation()]] | () | Sets the angle attenuation curve that the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] should use, or uses a constant curve of volume `1` if none is provided. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#SetDistanceAttenuation\|SetDistanceAttenuation()]] | () | Sets the distance attenuation curve that the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] should use, or uses an inverse rolloff curve if none is provided. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioListener#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AcousticSimulationEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Simulation · **Loaded/Saved:** true/true · **Capabilities:** Audio

Determines whether sound being heard by this [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] shoud automatically implement features of acoustic simulation, such as occlusion (being muffled through walls), diffraction (bending around corners), and reverberation (echoing off of walls), when being sourced from an [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]]. Note that the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] also needs its [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#AcousticSimulationEnabled|AcousticSimulationEnabled]] property set to `true` for the effects to occur.

### AngleAttenuation

**Type:** BinaryString

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Listening · **Loaded/Saved:** true/true · **Capabilities:** Audio

Represents a volume-over-angle curve that affects how loudly a [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] will hear the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]], based on the angle between them and the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|LookVector]] associated with the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]].

This property is internal and can't be accessed by scripts; it exists to support replication. See [[30 Official Roblox Docs/API Reference/Classes/AudioListener#SetAngleAttenuation|SetAngleAttenuation()]] for usage details.

### AudioInteractionGroup

**Type:** string

**Thread safety:** ReadSafe · **Category:** Interactions · **Loaded/Saved:** true/true · **Capabilities:** Audio

Controls which [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] are audible to this [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]]. Emitters that share an interaction group can be heard by this Listener.

### DistanceAttenuation

**Type:** BinaryString

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Listening · **Loaded/Saved:** true/true · **Capabilities:** Audio

Represents a volume-over-distance curve that affects how loudly the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] hears any [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]], based on the distance between them.

This property is internal and can't be accessed by scripts; it exists to support replication. See [[30 Official Roblox Docs/API Reference/Classes/AudioListener#SetDistanceAttenuation|SetDistanceAttenuation()]] for usage details.

### PositionInstance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Listening · **Loaded/Saved:** true/true · **Capabilities:** Audio

This property is only functional when [[30 Official Roblox Docs/API Reference/Classes/AudioListener#PositionType|PositionType]] is set to [[30 Official Roblox Docs/API Reference/Enums/ListenerPositionType|Enum.ListenerPositionType.Instance]]. In that scenario, this property determines which [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] will be used to determine the position of the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] when hearing spatial audio from [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]].

If set to an instance without a position or `nil`, the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] will not hear anything.

### PositionType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ListenerPositionType|ListenerPositionType]]

**Thread safety:** ReadSafe · **Category:** Listening · **Loaded/Saved:** true/true · **Capabilities:** Audio

The method by which the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] determines its 3D location (the point from which any nearby [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] can be heard). Defaults to [[30 Official Roblox Docs/API Reference/Enums/ListenerPositionType|Enum.ListenerPositionType.Parent]].

### SimulationFidelity

> [!warning] Deprecated
> This member is deprecated.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioSimulationFidelity|AudioSimulationFidelity]]

**Thread safety:** ReadSafe · **Category:** Simulation · **Loaded/Saved:** true/true · **Capabilities:** Audio · **Tags:** `Deprecated`

Controls how detailed the audio simulation should be for this [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]], similar to [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|MeshPart.CollisionFidelity]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity|MeshPart.RenderFidelity]].

[[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListeners]] and [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] which disagree on the necessary level of detail will use the less-detailed option.

## Methods

### GetAngleAttenuation

```lua
AudioListener:GetAngleAttenuation(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `CustomLuaState`

Returns a table mapping angle to volume. Keys are numbers between `0` and `180` (inclusive), while values are numbers between `0` and `1` (inclusive) describing how volume attenuates depending on direction. This method returns an empty table if the default angle attenuation curve is being used.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | Table mapping angle to volume, as described above. |

### GetAudibilityFor

```lua
AudioListener:GetAudibilityFor(emitter: AudioEmitter): float
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Calculates how audible an [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] is for this listener. The resulting volume, ranging from `0` to `1`, accounts for distance and angle attenuation on both the emitter and listener. Use this to drive game logic that depends on perceived loudness, such as proximity UI indicators or mechanics that scale with how clearly a sound source is heard.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `emitter` | [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] |  | The [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] whose audibility should be calculated relative to this listener. |

**Returns**

| Type | Description |
| --- | --- |
| float | A number between 0 and 1 representing the combined volume after distance and angle attenuation from both the emitter and listener. |

### GetConnectedWires

```lua
AudioListener:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] has one "Output" pin.

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
AudioListener:GetDistanceAttenuation(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `CustomLuaState`

Returns a table mapping distance to volume. Keys are numbers greater than or equal to 0, while values are numbers between 0 and 1 (inclusive) describing how volume attenuates over distance. This method returns an empty table if the default distance attenuation curve is being used.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A table mapping distance keys to volume values, or an empty table if the default curve is being used. |

### GetInputPins

```lua
AudioListener:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetInteractingEmitters

```lua
AudioListener:GetInteractingEmitters(): List<AudioEmitter>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] that share an [[30 Official Roblox Docs/API Reference/Classes/AudioListener#AudioInteractionGroup|AudioInteractionGroup]] with the listener.

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitters]] that share an [[30 Official Roblox Docs/API Reference/Classes/AudioListener#AudioInteractionGroup\|AudioInteractionGroup]] with this listener. |

### GetOutputPins

```lua
AudioListener:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### SetAngleAttenuation

```lua
AudioListener:SetAngleAttenuation(curve: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `CustomLuaState`

Sets a volume-over-angle curve that affects how loudly a [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] will hear the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]], based on the angle between them and the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|LookVector]] associated with the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]].

The curve is represented by a table mapping angle keys to volume values. Keys are expected to be unique numbers between `0` and `180` (inclusive), while values are expected to be numbers between `0` and `1` (inclusive). Tables containing up to 400 key-value pairs are supported.

The volume of a [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] from the perspective of the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] at an angle `a` is determined by linearly interpolating between the volume levels for the points on the curve whose angle values are directly above and below `a`. If there is either no point below `a` or no point above `a`, the volume level of the other point is chosen. Essentially, the curve is a sequence of points connected by straight lines, and beyond its left and right endpoints the curve extends outward at their respective volume levels.

This volume will be multiplied with the volumes from all other attenuation curves (including the ones on the sending [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]]) to obtain the final audibility.

If the table is empty or `nil`, the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] defaults to using an angle attenuation curve with the constant volume value of `1`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `curve` | Dictionary |  | A table mapping angle keys (0 to 180) to volume values (0 to 1), or an empty/nil table to use the default constant volume of 1. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`audio-wiring---directional-listener`) are published on the source page; their code is not part of the open-source repo.*

### SetDistanceAttenuation

```lua
AudioListener:SetDistanceAttenuation(curve: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `CustomLuaState`

Sets a volume-over-distance curve that affects how loudly the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] will hear any [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]], based on the distance between them. This is useful when you want a particular listener to have an extended or shortened hearing range — for example, a character with enhanced hearing — without modifying the emitting [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] or separating emitters and listeners into different interaction groups.

The curve is represented by a table mapping distance keys to volume values. Keys are expected to be unique numbers greater than or equal to 0, while values are expected to be numbers between 0 and 1 (inclusive). Tables containing up to 400 key-value pairs are supported.

The volume of a [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] from the perspective of the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] at a distance `d` is determined by linearly interpolating between the volume levels for the points on the curve whose distance values are directly above and below `d`. If there is either no point below `d` or no point above `d`, the volume level of the other point is chosen. Essentially, the curve is a sequence of points connected by straight lines, and beyond its left and right endpoints the curve extends outward infinitely at their respective volume levels.

This volume will be multiplied with the volumes from all other attenuation curves (including the ones on the sending [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]]) to obtain the final audibility.

If the table is empty or `nil`, the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] defaults to applying a constant volume of 1 everywhere.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `curve` | Dictionary |  | A table mapping distance keys (greater than or equal to 0) to volume values (0 to 1), or an empty/nil table to use the default constant volume of 1 everywhere. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### WiringChanged

```lua
AudioListener.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioListener](https://create.roblox.com/docs/reference/engine/classes/AudioListener) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
