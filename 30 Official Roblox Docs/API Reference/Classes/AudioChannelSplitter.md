---
title: "AudioChannelSplitter"
description: "Splits an audio stream into component channels so that each can be processed independently."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioChannelSplitter"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Splits an audio stream into component channels so that each can be processed independently.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter|AudioChannelSplitter]] splits an audio stream into component channels so that each can be processed independently. It provides one **Input** pin, one combined **Output** pin, as well as the following secondary output pins, all of which can be connected to/from by [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]]: **Left**, **Right**, **Center**, **SurroundLeft**, **SurroundRight**, **Sub**, **BackLeft**, **BackRight**, **TopLeft**, **TopRight**, **TopBackLeft**, and **TopBackRight**.

*(image in the full Top G Vault)*

*Code samples for this API (`audio-wiring---splitting-mixing`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioChannelSplitter); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter#Layout\|Layout]] | [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout\|AudioChannelLayout]] | Controls the input channel layout to be split from. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter\|AudioChannelSplitter]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Layout

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|AudioChannelLayout]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Controls the input channel layout to be split from. When changed, all audio streams prior to this channel splitter's input may need to be up-mixed (widened to at least as many channels as the input requires).

The **Output** pin produces a copy of the stream wired to **Input** but, depending on the value of [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter#Layout|AudioChannelSplitter.Layout]]:

- For [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Mono]], the **Center** pin produces an audio stream.
- For [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Stereo]], the **Left** and **Right** pins produce audio streams.
- For [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Quad]], the **Left**, **Right**, **BackLeft**, and **BackRight** pins produce audio streams.
- [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Surround_5]] is the same as `Quad`, plus **Center** produces an audio stream.
- [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Surround_5_1]] is the same as `Surround_5`, plus **Sub** produces an audio stream.
- [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Surround_7_1]] is the same as `Surround_5_1`, plus **SurroundLeft** and **SurroundRight** produce audio streams.
- For [[30 Official Roblox Docs/API Reference/Enums/AudioChannelLayout|Surround_7_1_4]], all secondary output pins produce audio streams.

## Methods

### GetConnectedWires

```lua
AudioChannelSplitter:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. For [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter|AudioChannelSplitter]], this can be one "Input" pin or a number of output pins - see [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter#GetInputPins|AudioChannelSplitter.GetInputPins]] for a full list.

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
AudioChannelSplitter:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter|AudioChannelSplitter]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioChannelSplitter:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter|AudioChannelSplitter]], these are:

- `"Output"`
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

## Events

### WiringChanged

```lua
AudioChannelSplitter.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter|AudioChannelSplitter]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter\|AudioChannelSplitter]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter\|AudioChannelSplitter]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioChannelSplitter](https://create.roblox.com/docs/reference/engine/classes/AudioChannelSplitter) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
