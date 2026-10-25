---
title: "AudioCompressor"
description: "Adjusts the dynamic range of input streams."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioCompressor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Adjusts the dynamic range of input streams.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioCompressor|AudioCompressor]] adjusts the dynamic range of audio streams. Any momentary bursts of loudness will be clamped down according to the compressor's properties.

[[30 Official Roblox Docs/API Reference/Classes/AudioCompressor|AudioCompressor]] provides **Input** and **Sidechain** pins that can be targeted by [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]], and an **Output** pin that can be used by [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]].

*Code samples for this API (`audio-wiring---sidechain-compression`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioCompressor); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Attack\|Attack]] | float | Controls how quickly the compressor will clamp down on volume after it surpasses [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Threshold\|Threshold]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Bypass\|Bypass]] | boolean | Whether audio streams are passed-through unaffected by this effect. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#MakeupGain\|MakeupGain]] | float | A gain value to be applied after compression. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Ratio\|Ratio]] | float | Ratio of input volume to output volume, to be applied when surpassing [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Threshold\|Threshold]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Release\|Release]] | float | Controls how quickly the compressor will unclamp after the stream volume dips back below [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Threshold\|Threshold]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Threshold\|Threshold]] | float | Gain value at which the compressor will start to modify the input stream. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor\|AudioCompressor]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Attack

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Time, in seconds, denoting how quickly the compressor will clamp down on volume after it surpasses [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Threshold|Threshold]]. Ranges from 0.0001 to 0.5.

### Bypass

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

If `true`, audio streams are passed-through unaffected by this effect.

### MakeupGain

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Gain value to be applied after compression, in decibels. After limiting the dynamic range, the resulting stream may be very quiet and this property can be used to compensate. Ranges from -30 to 30.

### Ratio

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Ratio of input volume to output volume, to be applied when surpassing [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Threshold|Threshold]]. For example, a value of 2 will cut the amount by which the input stream exceeds the threshold in half whenever the input stream does so. Ranges from 1 to 50.

### Release

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Time, in seconds, denoting how quickly the compressor will unclamp after its stream volume dips back below [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Threshold|Threshold]]. Ranges from 0.01 to 5.

### Threshold

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Gain value at which the compressor will start to modify the input stream, in decibels, with a range of -60 to 0. When the input stream's volume surpasses [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Threshold|Threshold]], the compressor will take [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Attack|Attack]] seconds to kick in. When the input stream's volume recedes below [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Threshold|Threshold]], the compressor will take [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor#Release|Release]] seconds to stop acting.

If any [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] are connected to the **Sidechain** pin of the compressor, this threshold analyzes those streams instead of the **Input** streams; this can be used to duck the volume of one stream in response to another.

## Methods

### GetConnectedWires

```lua
AudioCompressor:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor|AudioCompressor]] has one "Input" pin, one "Sidechain" pin, and one "Output" pin.

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
AudioCompressor:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor|AudioCompressor]], these are:

- `Input`
- `Sidechain`

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioCompressor:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor|AudioCompressor]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

## Events

### WiringChanged

```lua
AudioCompressor.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor|AudioCompressor]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor\|AudioCompressor]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor\|AudioCompressor]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioCompressor](https://create.roblox.com/docs/reference/engine/classes/AudioCompressor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
