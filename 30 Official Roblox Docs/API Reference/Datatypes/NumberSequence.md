---
title: "NumberSequence"
description: "A series of floats across a period of time."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/NumberSequence"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A series of floats across a period of time.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] data type represents a series of number values from `0` to `1`. The number values are expressed using the [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoint]] type. This type is used in properties such as [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Size|ParticleEmitter.Size]] and [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency|Beam.Transparency]] to define a numerical change over time.

#### Equality

Two [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] objects are equivalent only if the values of their [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoint]] are equivalent, even if both would result in similar graphs.

#### Evaluation

The [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] type does not have a built-in method for getting the value at a certain time/point because keypoints can have random envelopes. However, assuming the envelope values of your keypoints are all `0`, you can use the following function to evaluate at a specific time.

```lua
local function evalNumberSequence(sequence: NumberSequence, time: number)
    -- If time is 0 or 1, return the first or last value respectively
    if time == 0 then
        return sequence.Keypoints[1].Value
    elseif time == 1 then
        return sequence.Keypoints[#sequence.Keypoints].Value
    end

    -- Otherwise, step through each sequential pair of keypoints
    for i = 1, #sequence.Keypoints - 1 do
        local currKeypoint = sequence.Keypoints[i]
        local nextKeypoint = sequence.Keypoints[i + 1]
        if time >= currKeypoint.Time and time < nextKeypoint.Time then
            -- Calculate how far alpha lies between the points
            local alpha = (time - currKeypoint.Time) / (nextKeypoint.Time - currKeypoint.Time)
            -- Return the value between the points using alpha
            return currKeypoint.Value + (nextKeypoint.Value - currKeypoint.Value) * alpha
        end
    end
end

local numberSequence = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.5, 1),
    NumberSequenceKeypoint.new(1, 0),
}

print(evalNumberSequence(numberSequence, 0.65))  --> 0.7
```

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence#new\|new()]] | `n` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] with the start and end values set to the provided `n`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence#new\|new()]] | `n0`, `n1` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] of two keypoints with `n0` as the start value and `n1` as the end value. |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence#new\|new()]] | `Keypoints` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] from an array of [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint\|NumberSequenceKeypoints]]. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence#Keypoints\|Keypoints]] | Array | An array of [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint\|NumberSequenceKeypoint]] values in ascending order. |

## Constructors

### new

```lua
NumberSequence.new(n: number): NumberSequence
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] with the start and end values set to the provided `n`.

```lua
local numberSequence = NumberSequence.new(n)
-- Equivalent to
local numberSequence = NumberSequence.new{
    NumberSequenceKeypoint.new(0, n),
    NumberSequenceKeypoint.new(1, n)
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `n` | number |  | The constant value used for both the start and end keypoints of the sequence. |

### new

```lua
NumberSequence.new(n0: number, n1: number): NumberSequence
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] of two keypoints with `n0` as the start value and `n1` as the end value.

```lua
local numberSequence = NumberSequence.new(n0, n1)
-- Equivalent to
local numberSequence = NumberSequence.new{
    NumberSequenceKeypoint.new(0, n0),
    NumberSequenceKeypoint.new(1, n1)
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `n0` | number |  | The value at the start of the sequence (time 0). |
| `n1` | number |  | The value at the end of the sequence (time 1). |

### new

```lua
NumberSequence.new(Keypoints: Array): NumberSequence
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] from an array of [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoints]]. The keypoints must be provided in a non-descending time value order. At least two keypoints must be provided, and they must have a time value of `0` (first) and `1` (last).

```lua
local numberSequence = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.5, 0.5, 0.25),
    NumberSequenceKeypoint.new(1, 1)
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Keypoints` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint\|NumberSequenceKeypoints]] ordered by non-descending time, starting at time 0 and ending at time 1, with a maximum of 20 keypoints. |

## Properties

### Keypoints

**Type:** Array

An array containing [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoint]] values for the [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]].

---
*Source: [NumberSequence](https://create.roblox.com/docs/reference/engine/datatypes/NumberSequence) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
