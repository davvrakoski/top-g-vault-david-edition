---
title: "AudioPitchShifter"
description: "Adjusts the perceived pitch of audio streams."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioPitchShifter"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Adjusts the perceived pitch of audio streams.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter|AudioPitchShifter]] adjusts the perceived pitch of audio streams. It provides one **Input** pin and one **Output** pin which can be connected to/from by [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]]. [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter|AudioPitchShifter]] performs its modifications in the frequency domain and may introduce artifacts with extreme pitch changes.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter#Bypass\|Bypass]] | boolean | Whether audio streams are passed-through unaffected by this effect. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter#Pitch\|Pitch]] | float | Pitch modification to be multiplied by the pitch of the input stream. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter#WindowSize\|WindowSize]] | [[30 Official Roblox Docs/API Reference/Enums/AudioWindowSize\|AudioWindowSize]] | Controls how much audio will be buffered and shifted at once. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter\|AudioPitchShifter]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Bypass

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

If `true`, audio streams are passed-through unaffected by this effect.

### Pitch

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Pitch modification to be multiplied by the pitch of the input stream. Ranges from 0.5 to 2.

### WindowSize

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioWindowSize|AudioWindowSize]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Controls how much audio will be buffered and shifted at once. Larger windows result in higher-quality pitch shifting, but introduce more latency.

## Methods

### GetConnectedWires

```lua
AudioPitchShifter:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter|AudioPitchShifter]] has one "Input" pin and one "Output" pin.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pin` | string |  | An input or output pin on this instance |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] |

### GetInputPins

```lua
AudioPitchShifter:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter|AudioPitchShifter]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioPitchShifter:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter|AudioPitchShifter]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

## Events

### WiringChanged

```lua
AudioPitchShifter.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter|AudioPitchShifter]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter\|AudioPitchShifter]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter\|AudioPitchShifter]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioPitchShifter](https://create.roblox.com/docs/reference/engine/classes/AudioPitchShifter) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
