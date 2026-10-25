---
title: "AudioSpeechToText"
description: "Converts spoken audio into text."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioSpeechToText"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Converts spoken audio into text.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]] is used to convert speech audio into text. This class provides a single **Input** pin that can be connected to other pins via [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]].

Roblox uses the following formula to throttle requests for this API based on the number of players in your experience: `max requests per minute per experience = 1 + (5 * number_of_concurrent_users)`. You can purchase additional usage using [[30 Official Roblox Docs/Cloud Services/Extended Services|Extended Services]].

For more information, see [[30 Official Roblox Docs/Audio/Audio objects#Speech-to-text|Speech-to-text]].

*Code samples for this API (`audio-wiring---speech-to-text`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/AudioSpeechToText); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText#Enabled\|Enabled]] | boolean | Whether the [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText\|AudioSpeechToText]] object is enabled for processing input audio into text. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText#Text\|Text]] | string | The text resulting from the conversion of speech audio. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText#VoiceDetected\|VoiceDetected]] | boolean | Whether the [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText\|AudioSpeechToText]] object is detecting speech in the incoming audio signal. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText\|AudioSpeechToText]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

Whether the [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]] object is enabled for processing input audio into text.

### Text

**Type:** string

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio

The text resulting from the conversion of speech audio.

### VoiceDetected

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/true · **Capabilities:** Audio · **Tags:** `ReadOnly`, `NotReplicated`

Whether the [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]] object is detecting speech in the incoming audio signal. [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]] records the speech audio until it ceases or until a maximum amount of 10 seconds has been recorded. Then it converts the recorded audio into text.

## Methods

### GetConnectedWires

```lua
AudioSpeechToText:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]] has one "Input" pin.

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
AudioSpeechToText:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioSpeechToText:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio

Gets the list of pins that a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

## Events

### WiringChanged

```lua
AudioSpeechToText.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText\|AudioSpeechToText]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText\|AudioSpeechToText]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioSpeechToText](https://create.roblox.com/docs/reference/engine/classes/AudioSpeechToText) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
