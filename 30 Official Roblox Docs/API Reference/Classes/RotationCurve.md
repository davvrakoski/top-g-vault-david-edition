---
title: "RotationCurve"
description: "Represents a sequence of rotations and the interpolation curve between them."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RotationCurve"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a sequence of rotations and the interpolation curve between them.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

This class holds a sorted list of [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey|RotationCurveKeys]] that represent a sequence of rotations. The shape of the interpolation curve between two keys is determined by the [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey#Interpolation|RotationCurveKey.Interpolation]] type.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RotationCurve#Length\|Length]] | int | Number of rotation keys in this curve. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RotationCurve#GetKeyAtIndex\|GetKeyAtIndex()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]] | Returns a copy of a key at a given index. |
| [[30 Official Roblox Docs/API Reference/Classes/RotationCurve#GetKeyIndicesAtTime\|GetKeyIndicesAtTime()]] | Array | Returns the index of the last and first key of a period of time. |
| [[30 Official Roblox Docs/API Reference/Classes/RotationCurve#GetKeys\|GetKeys()]] | Array | Returns a copy of all the keys in the rotation curve as a Luau array of [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKeys]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RotationCurve#GetValueAtTime\|GetValueAtTime()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]? | Samples the rotation curve at a given time and returns the corresponding rotation as a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RotationCurve#InsertKey\|InsertKey()]] | Array | Adds the key passed as an argument to this curve. If a key at the same time is found, it will be replaced. |
| [[30 Official Roblox Docs/API Reference/Classes/RotationCurve#RemoveKeyAtIndex\|RemoveKeyAtIndex()]] | int | Removes a given number of keys starting from a given index. |
| [[30 Official Roblox Docs/API Reference/Classes/RotationCurve#SetKeys\|SetKeys()]] | int | Resets this curve's keys using the [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]] array passed as an argument. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Length

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

Number of rotation keys in this curve.

## Methods

### GetKeyAtIndex

```lua
RotationCurve:GetKeyAtIndex(index: int): RotationCurveKey
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns a copy of a key at a given index.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | Index of the key to return. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]] | Copy of the [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]] stored at `index`. |

### GetKeyIndicesAtTime

```lua
RotationCurve:GetKeyIndicesAtTime(time: float): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

The first item in the returned array is the index of the last key with time less than or equal to `time` (or the lesser of either 1 or the curve length if no key was found). The second item in the returned array is the index of the first key with time greater than or equal to `time` (or the curve length if no key was found satisfying the inequality).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | Time to look up within the curve. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Array with the indices of the keys that bracket `time`. |

### GetKeys

```lua
RotationCurve:GetKeys(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns a copy of all the keys in the rotation curve as a Luau array of [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey|RotationCurveKeys]].

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKeys]]. |

### GetValueAtTime

```lua
RotationCurve:GetValueAtTime(time: float): CFrame?
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Samples the rotation curve at a given time and returns the corresponding rotation as a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. Empty rotation curves are evaluated as [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#identity|CFrame.identity]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | Time at which to sample the curve. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]? | Value of the curve at the requested `time`. |

### InsertKey

```lua
RotationCurve:InsertKey(key: RotationCurveKey): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Adds the key passed as an argument to this curve. If a key at the same time is found, it will be replaced. In the returned array, the first value is `true` if a key was added or `false` if a previous key was replaced; the second value is the index at which the marker was added.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKey]] to insert. |

**Returns**

| Type | Description |
| --- | --- |
| Array | (see description) . |

### RemoveKeyAtIndex

```lua
RotationCurve:RemoveKeyAtIndex(startingIndex: int, count: int = 1): int
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
RotationCurve:SetKeys(keys: Array): int
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Resets this curve's keys using the [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey|RotationCurveKey]] array passed as an argument. Keys in the `keys` array are sorted in ascending time order before insertion, and keys at duplicated times are removed in a stable manner.

Returns the number of keys actually inserted. Keys previously stored in this curve are removed before the keys passed as arguments are added.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keys` | Array |  | Array of [[30 Official Roblox Docs/API Reference/Datatypes/RotationCurveKey\|RotationCurveKeys]]. |

**Returns**

| Type | Description |
| --- | --- |
| int | Number of keys inserted. |

---
*Source: [RotationCurve](https://create.roblox.com/docs/reference/engine/classes/RotationCurve) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
