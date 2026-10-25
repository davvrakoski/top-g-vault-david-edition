---
title: "ValueCurve"
description: "A sorted list of time-value pairs that define a curve. Used to animate any type of value."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ValueCurve"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A sorted list of time-value pairs that define a curve. Used to animate any type of value.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An instance representing a 1D value curve encoded via a sorted list of [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey|ValueCurveKeys]]. The shape of the interpolation curve between two keys is determined by the [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey#Interpolation|ValueCurveKey.Interpolation]] type.

Not all value types (for example, strings and other non-numerical types) may perform [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Linear]] or [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Cubic]] interpolation. These types will revert to [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode|Constant]] interpolation if necessary.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ValueCurve#Length\|Length]] | int | Number of keys in the value curve. |
| [[30 Official Roblox Docs/API Reference/Classes/ValueCurve#ValueType\|ValueType]] | string | Read-only value indicating the type held in this curve. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ValueCurve#GetKeyAtIndex\|GetKeyAtIndex()]] | [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]] | Returns a copy of a key at a given index. |
| [[30 Official Roblox Docs/API Reference/Classes/ValueCurve#GetKeyIndicesAtTime\|GetKeyIndicesAtTime()]] | Array | Returns the index of the last and first key of a period of time. |
| [[30 Official Roblox Docs/API Reference/Classes/ValueCurve#GetKeys\|GetKeys()]] | Array | Returns a copy of all the keys in the ValueCurve as a Luau array of [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKeys]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ValueCurve#GetValueAtTime\|GetValueAtTime()]] | Variant? | Samples the value curve at a given time passed as argument. |
| [[30 Official Roblox Docs/API Reference/Classes/ValueCurve#InsertKey\|InsertKey()]] | Array | Adds the key passed as an argument to this curve. If a key at the same time is found, it will be replaced. |
| [[30 Official Roblox Docs/API Reference/Classes/ValueCurve#InsertKeyValue\|InsertKeyValue()]] | Array | Creates a key for the given value and inserts it at the given time. If a key at the same time is found, it will be replaced. |
| [[30 Official Roblox Docs/API Reference/Classes/ValueCurve#RemoveKeyAtIndex\|RemoveKeyAtIndex()]] | int | Removes a given number of keys starting from a given index. |
| [[30 Official Roblox Docs/API Reference/Classes/ValueCurve#SetKeys\|SetKeys()]] | int | Resets this curve's keys using the [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]] array passed as an argument. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Length

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

Number of keys in the value curve.

### ValueType

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

Read-only value indicating the type held in this curve, or the string `"Nil"` if there are no keys.

## Methods

### GetKeyAtIndex

```lua
ValueCurve:GetKeyAtIndex(index: int): ValueCurveKey
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns a copy of a key at a given index.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | The index in the existing set of keys held by this [[30 Official Roblox Docs/API Reference/Classes/ValueCurve\|ValueCurve]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]] | A copy of the [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]] stored at the given `index`. |

### GetKeyIndicesAtTime

```lua
ValueCurve:GetKeyIndicesAtTime(time: float): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

The first item in the returned array is the index of the last key with time less than or equal to `time` (or the lesser of either `1` or the curve length if no key was found). The second item in the returned array is the index of the first key with time greater than or equal to `time` (or the curve length if no key was found satisfying the inequality).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | A time during the animation. Inputs will be clamped between `0` and the time of the last key held by this [[30 Official Roblox Docs/API Reference/Classes/ValueCurve\|ValueCurve]]. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of two indices bracketing `time`: the index of the last key at or before `time`, and the index of the first key at or after `time`. |

### GetKeys

```lua
ValueCurve:GetKeys(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns a copy of all the keys in the [[30 Official Roblox Docs/API Reference/Classes/ValueCurve|ValueCurve]] as a Luau array of [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey|ValueCurveKeys]].

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKeys]]. |

### GetValueAtTime

```lua
ValueCurve:GetValueAtTime(time: float): Variant?
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Samples the value curve at a given time passed as argument.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | Time at which to sample the curve. |

**Returns**

| Type | Description |
| --- | --- |
| Variant? | Value of the curve at the requested `time`. |

### InsertKey

```lua
ValueCurve:InsertKey(key: ValueCurveKey): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Adds the key passed as an argument to this curve. If a key at the same time is found, it will be replaced. In the returned array, the first value is `true` if a key was added or `false` if a previous key was replaced; the second value is the index at which the marker was added.

If there are not yet any keys, then the key may be added. If keys exist, the type of the value must match those of existing keys; otherwise a message is printed and `{false, -1}` is returned.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]] to insert. |

**Returns**

| Type | Description |
| --- | --- |
| Array | (see description) |

### InsertKeyValue

```lua
ValueCurve:InsertKeyValue(time: float, value: Variant, Interpolation: KeyInterpolationMode): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Creates a [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey|ValueCurveKey]] from the given arguments and inserts it in this curve. If a key at the same time is found, it will be replaced. In the returned array, the first value is `true` if a key was added or `false` if a previous key was replaced; the second value is the index at which the marker was added.

If there are not yet any keys, then the key may be added. If keys exist, the type of the value must match those of existing keys; otherwise a message is printed and `{false, -1}` is returned.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | Time at which to insert the new [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]]. - type: number |
| `value` | Variant |  | Value of the inserted [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]]. - type: any |
| `Interpolation` | [[30 Official Roblox Docs/API Reference/Enums/KeyInterpolationMode\|KeyInterpolationMode]] |  | Interpolation mode of the inserted [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKey]]. - type: KeyInterpolationMode |

**Returns**

| Type | Description |
| --- | --- |
| Array | (see description) |

### RemoveKeyAtIndex

```lua
ValueCurve:RemoveKeyAtIndex(startingIndex: int, count: int = 1): int
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
ValueCurve:SetKeys(keys: Array): int
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Resets this curve's keys using the [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey|ValueCurveKey]] array passed as an argument. Keys in the `keys` array are sorted in ascending time order before insertion, and keys at duplicated times are removed in a stable manner.

Returns the number of keys actually inserted. Keys previously stored in this curve are removed before the keys passed as arguments are added.

The keys must all contain values of the same type. And that type must match any existing keys. Otherwise a message is printed, the keys are not added, and `0` is returned.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keys` | Array |  | Array of [[30 Official Roblox Docs/API Reference/Datatypes/ValueCurveKey\|ValueCurveKeys]]. |

**Returns**

| Type | Description |
| --- | --- |
| int | Number of keys inserted. |

---
*Source: [ValueCurve](https://create.roblox.com/docs/reference/engine/classes/ValueCurve) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
