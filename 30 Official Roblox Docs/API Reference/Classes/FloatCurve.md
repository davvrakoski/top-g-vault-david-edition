---
title: "FloatCurve"
description: "A sorted list of time-value pairs that define a curve. Used to animate a single numerical value."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/FloatCurve"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A sorted list of time-value pairs that define a curve. Used to animate a single numerical value.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An instance representing a 1D float curve encoded via a sorted list of [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey|FloatCurveKeys]]. The shape of the interpolation curve between two keys is determined by the [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey#Interpolation|FloatCurveKey.Interpolation]] type.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve#Length\|Length]] | int | Number of keys in the float curve. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve#GetKeyAtIndex\|GetKeyAtIndex()]] | [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]] | Returns a copy of a key at a given index. |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve#GetKeyIndicesAtTime\|GetKeyIndicesAtTime()]] | Array | Returns the index of the last and first key of a period of time. |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve#GetKeys\|GetKeys()]] | Array | Returns a copy of all the keys in the FloatCurve as a Luau array of [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKeys]]. |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve#GetValueAtTime\|GetValueAtTime()]] | float? | Samples the float curve at a given time passed as argument. |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve#InsertKey\|InsertKey()]] | Array | Adds the key passed as an argument to this curve. If a key at the same time is found, it will be replaced. |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve#RemoveKeyAtIndex\|RemoveKeyAtIndex()]] | int | Removes a given number of keys starting from a given index. |
| [[30 Official Roblox Docs/API Reference/Classes/FloatCurve#SetKeys\|SetKeys()]] | int | Resets this curve's keys using the [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]] array passed as an argument. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Length

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

Number of keys in the float curve.

## Methods

### GetKeyAtIndex

```lua
FloatCurve:GetKeyAtIndex(index: int): FloatCurveKey
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns a copy of a key at a given index.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | One-based index of the key to retrieve. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]] | Copy of the [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]] stored at `index`. |

### GetKeyIndicesAtTime

```lua
FloatCurve:GetKeyIndicesAtTime(time: float): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

The first item in the returned array is the index of the last key with time less than or equal to `time` (or the lesser of either 1 or the curve length if no key was found). The second item in the returned array is the index of the first key with time greater than or equal to `time` (or the curve length if no key was found satisfying the inequality).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | Time value to locate within the curve's sorted keys. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of two one-based indices that bracket `time`: the last key at or before `time` and the first key at or after it. |

### GetKeys

```lua
FloatCurve:GetKeys(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns a copy of all the keys in the FloatCurve as a Luau array of [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey|FloatCurveKeys]].

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKeys]]. |

### GetValueAtTime

```lua
FloatCurve:GetValueAtTime(time: float): float?
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Samples the float curve at a given time passed as argument.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | Time at which to sample the curve. |

**Returns**

| Type | Description |
| --- | --- |
| float? | Value of the curve at the requested `time`. |

### InsertKey

```lua
FloatCurve:InsertKey(key: FloatCurveKey): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Adds the key passed as an argument to this curve. If a key at the same time is found, it will be replaced. In the returned array, the first value is `true` if a key was added or `false` if a previous key was replaced; the second value is the index at which the marker was added.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKey]] to insert. |

**Returns**

| Type | Description |
| --- | --- |
| Array | (see description) . |

### RemoveKeyAtIndex

```lua
FloatCurve:RemoveKeyAtIndex(startingIndex: int, count: int = 1): int
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Removes a given number (`count`) of keys starting from the `startingIndex` index and returns the number of keys that were removed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `startingIndex` | int |  | Starting index from which to remove keys. |
| `count` | int | `1` | Number of keys to remove. |

**Returns**

| Type | Description |
| --- | --- |
| int | Number of keys removed. |

### SetKeys

```lua
FloatCurve:SetKeys(keys: Array): int
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Resets this curve's keys using the [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey|FloatCurveKey]] array passed as an argument. Keys in the `keys` array are sorted in ascending time order before insertion, and keys at duplicated times are removed in a stable manner.

Returns the number of keys actually inserted. Keys previously stored in this curve are removed before the keys passed as arguments are added.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keys` | Array |  | Array of [[30 Official Roblox Docs/API Reference/Datatypes/FloatCurveKey\|FloatCurveKeys]]. |

**Returns**

| Type | Description |
| --- | --- |
| int | Number of keys inserted. |

---
*Source: [FloatCurve](https://create.roblox.com/docs/reference/engine/classes/FloatCurve) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
