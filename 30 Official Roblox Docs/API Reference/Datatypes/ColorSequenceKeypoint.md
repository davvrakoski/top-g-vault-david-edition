---
title: "ColorSequenceKeypoint"
description: "A color and time value that represents a keypoint in a `ColorSequence`."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/ColorSequenceKeypoint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A color and time value that represents a keypoint in a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]].*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint|ColorSequenceKeypoint]] data type represents a single keypoint in a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]. Each keypoint has a time position between `0` and `1` and a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value that defines the color at that point in the sequence. Properties that use a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]], such as [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color|ParticleEmitter.Color]], [[30 Official Roblox Docs/API Reference/Classes/Beam#Color|Beam.Color]], and [[30 Official Roblox Docs/API Reference/Classes/Trail#Color|Trail.Color]], interpolate linearly between consecutive keypoints in RGB color space.

```lua
local keypoints = {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255)),
}
local colorSequence = ColorSequence.new(keypoints)
```

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint#new\|new()]] | `time`, `color` | Returns a ColorSequenceKeypoint from the given time and color. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint#Time\|Time]] | number | The relative time at which the keypoint is located. |
| [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint#Value\|Value]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The Color3 value of the keypoint. |

## Constructors

### new

```lua
ColorSequenceKeypoint.new(time: number, color: Color3): ColorSequenceKeypoint
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint|ColorSequenceKeypoint]] with the given `time` and `color`. The `time` parameter should be a number between 0 and 1, where 0 represents the beginning of the sequence and 1 represents the end. The `color` parameter is a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] whose components must each be between 0 and 1.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | number |  | The position of the keypoint along the sequence, a number between 0 and 1. |
| `color` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | The color value at this keypoint. |

## Properties

### Time

**Type:** number

The relative time at which this keypoint is positioned within the parent [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]], expressed as a number from 0 to 1 where 0 is the beginning of the sequence and 1 is the end. Within a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]], the first keypoint must have a time of 0 and the last keypoint must have a time of 1; any intermediate keypoints must be in ascending time order. The engine linearly interpolates colors between consecutive keypoints in RGB color space based on their time positions. Defaults to 0.

### Value

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

The [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] color value at this keypoint's position in the sequence. When the engine evaluates a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]], it linearly interpolates between adjacent keypoints' color values in RGB color space based on time. Each component of the color (red, green, blue) must be between 0 and 1. Defaults to (0, 0, 0) (black).

---
*Source: [ColorSequenceKeypoint](https://create.roblox.com/docs/reference/engine/datatypes/ColorSequenceKeypoint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
