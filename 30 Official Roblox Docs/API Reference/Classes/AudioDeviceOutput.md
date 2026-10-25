---
title: "AudioDeviceOutput"
description: "Accepts audio streams to be rendered out to physical hardware devices such as speakers or headphones."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioDeviceOutput"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Accepts audio streams to be rendered out to physical hardware devices such as speakers or headphones.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] accepts audio streams to be rendered out to physical hardware devices such as speakers or headphones. It provides a single **Input** pin that can be targeted by [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]]. Any audio streams wired to an [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] are heard.

*Code samples for this API (`audio-wiring---device-output`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioDeviceOutput); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput#Player\|Player]] | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | A [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who is intended to hear the connected audio streams. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput\|AudioDeviceOutput]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Player

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

An optional [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] who is intended to hear the connected audio streams. If left unspecified, the streams wired to this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] are heard by everyone.

## Methods

### GetConnectedWires

```lua
AudioDeviceOutput:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] has one "Input" pin.

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
AudioDeviceOutput:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioDeviceOutput:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

## Events

### WiringChanged

```lua
AudioDeviceOutput.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput\|AudioDeviceOutput]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput\|AudioDeviceOutput]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioDeviceOutput](https://create.roblox.com/docs/reference/engine/classes/AudioDeviceOutput) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
