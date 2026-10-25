---
title: "AudioReverb"
description: "Reverberates audio streams."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioReverb"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Reverberates audio streams.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioReverb|AudioReverb]] reverberates audio streams, modeling the natural echoes of a room or enclosed space. It provides one **Input** pin and one **Output** pin which can be connected to/from by [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#Bypass\|Bypass]] | boolean | Whether audio streams are passed-through unaffected by this effect. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#DecayRatio\|DecayRatio]] | float | Controls how quickly high frequency sound decays compared to the overall reverb. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#DecayTime\|DecayTime]] | float | Controls how long it takes for the reverb to dissipate. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#Density\|Density]] | float | Controls how many reflections are generated. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#Diffusion\|Diffusion]] | float | Controls how smooth and reflective the simulated surfaces are. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#DryLevel\|DryLevel]] | float | Gain level determining how loud the original, unaltered audio stream will be. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#EarlyDelayTime\|EarlyDelayTime]] | float | Controls the amount of time before reverberation begins . |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#HighCutFrequency\|HighCutFrequency]] | float | Frequency above which sound is filtered out of the reverb. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#LateDelayTime\|LateDelayTime]] | float | Time, following early delays, before diffuse reverberations begin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#LowShelfFrequency\|LowShelfFrequency]] | float | Frequency below which audio can be boosted or reduced in the reverb. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#LowShelfGain\|LowShelfGain]] | float | Controls the presence of low frequency content in the reverb. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#ReferenceFrequency\|ReferenceFrequency]] | float | Frequency that separates low frequency decay speeds from high frequency decay speeds. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#WetLevel\|WetLevel]] | float | Gain level determining how loud the reverberated stream will be. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioReverb\|AudioReverb]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Bypass

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

If `true`, audio streams are passed-through unaffected by this effect.

### DecayRatio

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

A ratio of high frequency decay time to total decay time, where high frequencies are determined to be anything above [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#ReferenceFrequency|ReferenceFrequency]], in hertz. Ranges from 0.1 to 1.

### DecayTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Time, in seconds, that it will take for the reverb to fully decay. Ranges from 0.1 to 20.

### Density

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

A number controlling how many reflections are generated. Ranges from 0.1 to 1.

### Diffusion

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

A number controlling how smooth and reflective the reverb's simulated surfaces are. Ranges from 0.1 to 1.

### DryLevel

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Gain level, in decibels, determining how loud the original, unaltered audio stream will be. Ranges from -80 to 20.

### EarlyDelayTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Time, in seconds, before any reverberation begins. Ranges from 0 to 0.3.

### HighCutFrequency

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Frequency, in hertz, which acts as a cutoff for a low-pass filter. Any audio that has a higher frequency than this is excluded from the reverb. Ranges from 20 to 20,000.

### LateDelayTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Time in seconds, following early delays, before diffuse reverberations begin. Ranges from 0 to 0.1.

### LowShelfFrequency

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Frequency, in hertz, below which audio can be boosted or reduced in the reverb via [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#LowShelfGain|LowShelfGain]]. Ranges from 20 to 20,000.

### LowShelfGain

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Gain level, in decibels, that controls the presence of low frequency content in the reverb. Ranges from -36 to 12.

### ReferenceFrequency

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Frequency, in hertz, that separates low frequency decay speeds from high frequency decay speeds. This is used by [[30 Official Roblox Docs/API Reference/Classes/AudioReverb#DecayRatio|DecayRatio]] to determine whether low or high frequencies decay faster. Ranges from 20 to 20,000.

### WetLevel

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Gain level, in decibels, determining how loud the reverberated stream will be. Ranges from -80 to 20.

## Methods

### GetConnectedWires

```lua
AudioReverb:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioReverb|AudioReverb]] has one "Input" pin and one "Output" pin.

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
AudioReverb:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioReverb|AudioReverb]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioReverb:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioReverb|AudioReverb]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

## Events

### WiringChanged

```lua
AudioReverb.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioReverb|AudioReverb]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioReverb\|AudioReverb]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioReverb\|AudioReverb]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioReverb](https://create.roblox.com/docs/reference/engine/classes/AudioReverb) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
