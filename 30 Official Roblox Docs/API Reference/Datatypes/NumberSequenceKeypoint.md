---
title: "NumberSequenceKeypoint"
description: "Represents keypoint within a `NumberSequence` with a particular time, value, and envelope size."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/NumberSequenceKeypoint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents keypoint within a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] with a particular time, value, and envelope size.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoint]] data type represents keypoints within a NumberSequence with a particular time, value, and envelope size.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint#new\|new()]] | `time`, `value` | Returns a keypoint with the specified time and value. |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint#new\|new()]] | `time`, `value`, `envelope` | Returns a keypoint with the specified time, value, and envelope. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint#Envelope\|Envelope]] | number | The amount of variance allowed from the value. |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint#Time\|Time]] | number | The relative time at which the keypoint is positioned. |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint#Value\|Value]] | number | The base value of the keypoint. |

## Constructors

### new

```lua
NumberSequenceKeypoint.new(time: number, value: number): NumberSequenceKeypoint
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoint]] with the given `time` and `value`, with [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint#Envelope|Envelope]] defaulting to 0 (no random variance). The `time` parameter should be a number between 0 and 1, and `value` can be any number.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | number |  | The relative time position of the keypoint within the sequence, expressed as a number from 0 to 1. |
| `value` | number |  | The base numeric value at this keypoint's time position. |

### new

```lua
NumberSequenceKeypoint.new(time: number, value: number, envelope: number): NumberSequenceKeypoint
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoint]] with the given `time`, `value`, and `envelope`. The `envelope` parameter must be a non-negative number that defines the amount of random variance applied to `value` at runtime; the actual output for this keypoint is chosen randomly within [value − envelope, value + envelope].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | number |  | The relative time position of the keypoint within the sequence, expressed as a number from 0 to 1. |
| `value` | number |  | The base numeric value at this keypoint's time position. |
| `envelope` | number |  | The amount of random variance that can be applied to the value at runtime; must be non-negative. |

## Properties

### Envelope

**Type:** number

The amount of variance allowed from the value. For example, a value of 0.5 with an envelope of 0.1 could compute to between 0.4 and 0.6 at runtime. The most common use case for this property is to randomize the size of particles (within the envelope) from a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]].

### Time

**Type:** number

The relative time at which this keypoint is positioned within the parent [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]], expressed as a number from 0 to 1 where 0 is the beginning of the sequence and 1 is the end. Within a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]], the first keypoint must have a time of 0 and the last keypoint must have a time of 1; any intermediate keypoints must be in ascending time order. The engine linearly interpolates values and envelopes between consecutive keypoints based on their time positions. Defaults to 0.

### Value

**Type:** number

The base numeric value at this keypoint's position in the sequence. When the engine evaluates a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]], it linearly interpolates between adjacent keypoints' values based on time. If [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint#Envelope|Envelope]] is greater than 0, the actual output at runtime may vary randomly within the range [Value − Envelope, Value + Envelope]. Defaults to 0.

---
*Source: [NumberSequenceKeypoint](https://create.roblox.com/docs/reference/engine/datatypes/NumberSequenceKeypoint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
