---
title: "ColorSequence"
description: "A gradient of color values comprised of `ColorSequenceKeypoints`."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/ColorSequence"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A gradient of color values comprised of [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint|ColorSequenceKeypoints]].*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]] data type represents a gradient of color values from `0` to `1`. The color values are expressed using the [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint|ColorSequenceKeypoint]] type. This type is used in various properties of [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]], [[30 Official Roblox Docs/API Reference/Classes/Trail|Trail]], [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]], and other objects that use color gradients.

#### Equality

Two [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]] objects are equivalent only if the values of their [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint|ColorSequenceKeypoint]] are equivalent, even if both would result in similar gradients.

#### Evaluation

The [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]] type does not have a built-in method for getting the value at a certain time/point. However, you can use the following function to evaluate at a specific time.

```lua
local function evalColorSequence(sequence: ColorSequence, time: number)
    -- If time is 0 or 1, return the first or last value respectively
    if time == 0 then
        return sequence.Keypoints[1].Value
    elseif time == 1 then
        return sequence.Keypoints[#sequence.Keypoints].Value
    end

    -- Otherwise, step through each sequential pair of keypoints
    for i = 1, #sequence.Keypoints - 1 do
        local thisKeypoint = sequence.Keypoints[i]
        local nextKeypoint = sequence.Keypoints[i + 1]
        if time >= thisKeypoint.Time and time < nextKeypoint.Time then
            -- Calculate how far alpha lies between the points
            local alpha = (time - thisKeypoint.Time) / (nextKeypoint.Time - thisKeypoint.Time)
            -- Evaluate the real value between the points using alpha
            return Color3.new(
                (nextKeypoint.Value.R - thisKeypoint.Value.R) * alpha + thisKeypoint.Value.R,
                (nextKeypoint.Value.G - thisKeypoint.Value.G) * alpha + thisKeypoint.Value.G,
                (nextKeypoint.Value.B - thisKeypoint.Value.B) * alpha + thisKeypoint.Value.B
            )
        end
    end
end

local colorSequence = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 190, 200)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 0, 255))
}

print(evalColorSequence(colorSequence, 0.75))  --> 0.372549, 0.372549, 0.892157
```

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence#new\|new()]] | `c` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence\|ColorSequence]] that is entirely the specified color. |
| [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence#new\|new()]] | `c0`, `c1` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence\|ColorSequence]] with `c0` as the start value and `c1` as the end value. |
| [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence#new\|new()]] | `keypoints` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence\|ColorSequence]] from an array of [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint\|ColorSequenceKeypoints]]. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence#Keypoints\|Keypoints]] | Array | An array of [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint\|ColorSequenceKeypoint]] values in ascending order. |

## Constructors

### new

```lua
ColorSequence.new(c: Color3): ColorSequence
```

Returns a sequence of two keypoints with `c` for both the start and end values.

```lua
local colorSequence = ColorSequence.new(c)
-- Equivalent to
local colorSequence = ColorSequence.new{
    ColorSequenceKeypoint.new(0, c),
    ColorSequenceKeypoint.new(1, c)
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `c` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] value used for both the start and end of the sequence. |

### new

```lua
ColorSequence.new(c0: Color3, c1: Color3): ColorSequence
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]] with `c0` as the start value and `c1` as the end value.

```lua
local colorSequence = ColorSequence.new(c0, c1)
-- Equivalent to
local colorSequence = ColorSequence.new{
    ColorSequenceKeypoint.new(0, c0),
    ColorSequenceKeypoint.new(1, c1)
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `c0` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] value at the start of the sequence (time 0). |
| `c1` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] value at the end of the sequence (time 1). |

### new

```lua
ColorSequence.new(keypoints: Array): ColorSequence
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]] from an array of [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint|ColorSequenceKeypoints]]. The keypoints must be in a non-descending time value order. At least two keypoints must be provided, and they must have a time value of `0` (first) and `1` (last).

```lua
local red = Color3.fromRGB(255, 0, 0)
local cyan = Color3.fromRGB(0, 190, 200)
local purple = Color3.fromRGB(190, 0, 255)

local colorSequence = ColorSequence.new{
    ColorSequenceKeypoint.new(0, red),
    ColorSequenceKeypoint.new(0.5, cyan),
    ColorSequenceKeypoint.new(1, purple)
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keypoints` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint\|ColorSequenceKeypoint]] values ordered by non-descending time, starting at time 0 and ending at time 1. Must contain at least 2 and no more than 20 keypoints. |

## Properties

### Keypoints

**Type:** Array

An array containing [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint|ColorSequenceKeypoint]] values for the [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]].

---
*Source: [ColorSequence](https://create.roblox.com/docs/reference/engine/datatypes/ColorSequence) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
