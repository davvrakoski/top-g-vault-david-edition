---
title: "AudioAnalyzer"
description: "Takes measurements from audio streams that are connected to it via one or more `Wires`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioAnalyzer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Takes measurements from audio streams that are connected to it via one or more [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer|AudioAnalyzer]] takes measurements from audio streams that are wired to it through [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]]. It provides a single **Input** pin but does not produce any output streams. Note that all audio processing is disabled on the server in order to conserve resources; Properties and methods of [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer|AudioAnalyzer]] return empty or zero results when used from server scripts.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#PeakLevel\|PeakLevel]] | float | The loudest volume observed during the last audio buffer. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#RmsLevel\|RmsLevel]] | float | The root-mean-square average volume observed during the last audio buffer. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#SpectrumEnabled\|SpectrumEnabled]] | boolean | Enables usage of [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#GetSpectrum\|GetSpectrum]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#WindowSize\|WindowSize]] | [[30 Official Roblox Docs/API Reference/Enums/AudioWindowSize\|AudioWindowSize]] | Controls the resolution and timeliness of [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#GetSpectrum\|GetSpectrum]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#GetSpectrum\|GetSpectrum()]] | Array | Returns the frequency spectrum of the last audio buffer. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer\|AudioAnalyzer]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### PeakLevel

**Type:** float

**Thread safety:** ReadSafe · **Category:** Metering · **Loaded/Saved:** false/true · **Capabilities:** Audio · **Tags:** `ReadOnly`, `NotReplicated`

The loudest volume observed during the last audio buffer. This property changes more often than the framerate and does not fire changed events. On the server, this property is always `0`.

### RmsLevel

**Type:** float

**Thread safety:** ReadSafe · **Category:** Metering · **Loaded/Saved:** false/true · **Capabilities:** Audio · **Tags:** `ReadOnly`, `NotReplicated`

The root-mean-square average volume observed during the last audio buffer. This property is generally more stable than [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#PeakLevel|PeakLevel]] but it may not capture momentary volume spikes. This property changes more often than the framerate and does not fire changed events. On the server, this property is always `0`.

### SpectrumEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Metering · **Loaded/Saved:** true/true · **Capabilities:** Audio

Enables usage of [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#GetSpectrum|GetSpectrum()]]. If `false`, [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#GetSpectrum|GetSpectrum()]] returns an empty array, but the CPU overhead of the [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer|AudioAnalyzer]] is dramatically reduced. This means that if you are only analyzing the **volume** of an audio stream, you can disable this property to improve performance.

### WindowSize

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioWindowSize|AudioWindowSize]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Controls the size of arrays returned by [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer#GetSpectrum|GetSpectrum()]]. Larger windows contain more data (so more-accurate frequency responses) but change less often.

## Methods

### GetConnectedWires

```lua
AudioAnalyzer:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer|AudioAnalyzer]] has one "Input" pin.

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
AudioAnalyzer:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer|AudioAnalyzer]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioAnalyzer:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer|AudioAnalyzer]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetSpectrum

```lua
AudioAnalyzer:GetSpectrum(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio · **Tags:** `CustomLuaState`

Returns the frequency spectrum of the last audio buffer, as an array of numbers. The elements of the array are root-mean-square volume levels, evenly spaced from 0 hertz to 24,000 hertz. If any of the analyzer's inputs come from an [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]], or this method is used from a server script, it returns an empty array.

**Returns**

| Type | Description |
| --- | --- |
| Array | A table of numbers representing the amplitude levels of various frequencies of audio within the last buffer, or an empty table if a spectrum cannot be obtained. |

## Events

### WiringChanged

```lua
AudioAnalyzer.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer|AudioAnalyzer]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer\|AudioAnalyzer]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer\|AudioAnalyzer]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioAnalyzer](https://create.roblox.com/docs/reference/engine/classes/AudioAnalyzer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
