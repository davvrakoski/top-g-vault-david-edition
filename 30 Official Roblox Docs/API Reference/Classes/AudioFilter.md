---
title: "AudioFilter"
description: "Adjusts the frequency content of audio streams."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioFilter"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Adjusts the frequency content of audio streams.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioFilter|AudioFilter]] adjusts the frequency content of audio streams. It provides one **Input** pin and one **Output** pin which can be connected to/from by [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]]. [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|AudioFilter]] uses its [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#FilterType|FilterType]], [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Gain|Gain]], and [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Q|Q]] properties to determine what to do around a particular cutoff [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency|Frequency]].

*Code samples for this API (`audio-wiring---emitter-filtering`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioFilter); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Bypass\|Bypass]] | boolean | Whether audio streams are passed-through unaffected by this effect. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#FilterType\|FilterType]] | [[30 Official Roblox Docs/API Reference/Enums/AudioFilterType\|AudioFilterType]] | The curve type of the band represented by the filter. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]] | float | The central frequency that the filter acts around. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Gain\|Gain]] | float | For peaking and shelving filters, controls volume increase or reduction. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Q\|Q]] | float | For peaking, lowpass, highpass, bandpass, and notch filters, controls the selectiveness or resonance. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#GetGainAt\|GetGainAt()]] | float | Returns the magnitude response of the filter at the given frequency. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioFilter\|AudioFilter]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Bypass

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

If `true`, audio streams are passed-through unaffected by this effect.

### FilterType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioFilterType|AudioFilterType]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

The type of frequency response curve that will be used to filter the audio signal. Each type of curve affects the frequency content of the audio in different ways.

### Frequency

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

The central frequency in hertz of the curve represented by the filter. Generally, adjusting this value up or down corresponds to a horizontal shift in the overall frequency curve. Ranges from 20 to 22000.

### Gain

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

The gain value in decibels used to determine the volume level of the curve represented by the filter. Only applies when the [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|FilterType]] is `Peak`, `LowShelf`, or `HighShelf`. Ranges from -30 to 30.

### Q

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

The quality value used to determine the slope or resonance of the curve represented by the filter. Only applies when the [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|FilterType]] is `Peak`, `Lowpass[x]dB`, `Highpass[x]dB`, `Bandpass`, or `Notch`. Ranges from 0.1 to 10.

For [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|FilterType]] values of [[30 Official Roblox Docs/API Reference/Enums/AudioFilterType|Lowpass12dB]] and [[30 Official Roblox Docs/API Reference/Enums/AudioFilterType|Highpass12dB]], a **Q** value of `sqrt(2) / 2`, or `0.707`, corresponds to a flat filter at a 12dB/octave slope.

## Methods

### GetConnectedWires

```lua
AudioFilter:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|AudioFilter]] has one "Input" pin and one "Output" pin.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pin` | string |  | An input or output pin on this instance |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] |

### GetGainAt

```lua
AudioFilter:GetGainAt(frequency: float): float
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns the gain value, in decibels, of the frequency response curve represented by the filter at the given frequency, in hertz. This can be used to sample the exact shape of the filter in key places or as a whole.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `frequency` | float |  | The frequency, in hertz, to sample. |

**Returns**

| Type | Description |
| --- | --- |
| float | The gain value, in decibels, at the given frequency. |

### GetInputPins

```lua
AudioFilter:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|AudioFilter]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioFilter:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|AudioFilter]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

## Events

### WiringChanged

```lua
AudioFilter.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|AudioFilter]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioFilter\|AudioFilter]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioFilter\|AudioFilter]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioFilter](https://create.roblox.com/docs/reference/engine/classes/AudioFilter) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
