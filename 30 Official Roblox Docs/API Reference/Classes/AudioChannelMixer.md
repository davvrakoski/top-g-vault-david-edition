---
title: "AudioChannelMixer"
description: "Combines multiple audio streams into a single, multichannel audio stream."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioChannelMixer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Combines multiple audio streams into a single, multichannel audio stream.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer|AudioChannelMixer]] mixes multiple audio streams into a single, multichannel stream. It provides one combined **Input** pin, one **Output** pin, as well as the following secondary input pins, all of which can be connected to/from by [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]]: **Left**, **Right**, **Center**, **SurroundLeft**, **SurroundRight**, **Sub**, **BackLeft**, **BackRight**, **TopLeft**, **TopRight**, **TopBackLeft**, and **TopBackRight**.

*(image in the full Top G Vault)*

*Code samples for this API (`audio-wiring---splitting-mixing`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioChannelMixer); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer#Layout\|Layout]] | [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout\|AudioChannelLayout]] | Controls the output channel layout to be mixed to. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer\|AudioChannelMixer]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Layout

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|AudioChannelLayout]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Controls the output channel layout to be mixed to. The **Input** pin of [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer|AudioChannelMixer]] is always forwarded "as-is" to **Output**, but depending on the value of `Layout`:

- For [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Mono]], the **Center** pin consumes audio streams.
- For [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Stereo]], the **Left** and **Right** pins consume audio streams.
- For [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Quad]], the **Left**, **Right**, **BackLeft**, and **BackRight** pins consume audio streams.
- [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Surround_5]] is the same as `Quad`, plus **Center** consumes an audio stream.
- [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Surround_5_1]] is the same as `Surround_5`, plus **Sub** consumes an audio stream.
- [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Surround_7_1]] is the same as `Surround_5_1`, plus **SurroundLeft** and **SurroundRight** consume audio streams.
- For [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Surround_7_1_4]], all secondary input pins consume audio streams.

## Methods

### GetConnectedWires

```lua
AudioChannelMixer:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. For [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer|AudioChannelMixer]], this can be one "Output" pin or a number of input pins - see [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer#GetInputPins|AudioChannelMixer.GetInputPins]] for a full list.

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
AudioChannelMixer:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer|AudioChannelMixer]], these are:

- `"Input"`
- `"Left"`
- `"Right"`
- `"Center"`
- `"SurroundLeft"`
- `"SurroundRight"`
- `"BackLeft"`
- `"BackRight"`
- `"Sub"`
- `"TopLeft"`
- `"TopRight"`
- `"TopBackLeft"`
- `"TopBackRight"`

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioChannelMixer:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer|AudioChannelMixer]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

## Events

### WiringChanged

```lua
AudioChannelMixer.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer|AudioChannelMixer]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer\|AudioChannelMixer]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer\|AudioChannelMixer]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioChannelMixer](https://create.roblox.com/docs/reference/engine/classes/AudioChannelMixer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
