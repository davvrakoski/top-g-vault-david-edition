---
title: "AudioGate"
description: "Mutes audio streams that fall below a certain volume threshold."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioGate"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Mutes audio streams that fall below a certain volume threshold.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioGate|AudioGate]] behaves like a noise gate, muting audio streams when their volume drops below a specified [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Threshold|Threshold]]. It is useful for removing background noise from microphone input or cleaning up audio tracks. It provides one **Input** pin and one **Output** pin which can be connected to/from by [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Attack\|Attack]] | float | Controls how long it takes for the gate to open when the signal level rises above the [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Threshold\|Threshold]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Bypass\|Bypass]] | boolean | Whether audio streams are passed-through unaffected by this effect. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Release\|Release]] | float | Controls how long it takes for the gate to close when the signal level drops below the [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Threshold\|Threshold]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Threshold\|Threshold]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | The gain value(s) around which the gate opens and closes. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioGate#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioGate#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioGate#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioGate#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioGate\|AudioGate]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Attack

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

The duration, in seconds, over which the gate will unmute the audio stream when the signal level rises above the [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Threshold|Threshold]]. Ranges from 0.001 to 5.

### Bypass

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

If `true`, audio streams are passed-through unaffected by this effect.

### Release

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

The duration, in seconds, over which the gate will mute the audio stream when the signal level drops below the [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Threshold|Threshold]]. Ranges from 0.001 to 5.

### Threshold

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

The gain value(s), in decibels, at which the gate will transition from being closed (i.e. muted) to being open (i.e. unmuted).

[[30 Official Roblox Docs/API Reference/Classes/AudioGate#Threshold|AudioGate.Threshold]] is a [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]] with a "low" and a "high" threshold. The gate starts out muted - when the input stream's volume rises above the "high" threshold, the gate will unmute the audio stream over the course of [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Attack|Attack]] seconds. If the input stream's volume then dips below the "low" threshold, the gate will mute the audio stream over the course of [[30 Official Roblox Docs/API Reference/Classes/AudioGate#Release|Release]] seconds. The two "low" and "high" thresholds create a hysteresis region to prevent the gate from opening and closing very rapidly.

Ranges from -80 to 30, and defaults to -36 (low) and -24 (high).

## Methods

### GetConnectedWires

```lua
AudioGate:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioGate|AudioGate]] has one "Input" pin and one "Output" pin.

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
AudioGate:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioGate|AudioGate]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioGate:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioGate|AudioGate]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

## Events

### WiringChanged

```lua
AudioGate.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioGate|AudioGate]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioGate\|AudioGate]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioGate\|AudioGate]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioGate](https://create.roblox.com/docs/reference/engine/classes/AudioGate) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
