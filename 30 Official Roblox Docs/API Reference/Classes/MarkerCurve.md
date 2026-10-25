---
title: "MarkerCurve"
description: "Represents a list of strings markers in chronological order."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MarkerCurve"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a list of strings markers in chronological order.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The MarkerCurve instance lets you place markers as string values at certain times on a timeline. The string at each marker cannot exceed 64 characters and must only contain printable characters.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MarkerCurve#Length\|Length]] | int | Returns the number of markers in the MarkerCurve. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MarkerCurve#GetMarkerAtIndex\|GetMarkerAtIndex()]] | Dictionary | Returns the time and string value of the marker at the provided index. |
| [[30 Official Roblox Docs/API Reference/Classes/MarkerCurve#GetMarkers\|GetMarkers()]] | Array | Returns the time and string value of all markers in the MarkerCurve. |
| [[30 Official Roblox Docs/API Reference/Classes/MarkerCurve#InsertMarkerAtTime\|InsertMarkerAtTime()]] | Array | Inserts a marker with the provided string value at the provided time. |
| [[30 Official Roblox Docs/API Reference/Classes/MarkerCurve#RemoveMarkerAtIndex\|RemoveMarkerAtIndex()]] | int | Remove several markers in the MarkerCurve starting at the provided index. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Length

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Animation · **Tags:** `ReadOnly`, `NotReplicated`

Returns the number of markers in the MarkerCurve.

## Methods

### GetMarkerAtIndex

```lua
MarkerCurve:GetMarkerAtIndex(index: int): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the time and string value of the marker at the provided index.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | One-based index of the marker to retrieve, ordered chronologically. Must be within range or the call throws. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A table containing the time and value of the marker at the provided index. |

### GetMarkers

```lua
MarkerCurve:GetMarkers(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the time and string value of all markers in the MarkerCurve.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of tables containing the time and value of all markers in the MarkerCurve. |

### InsertMarkerAtTime

```lua
MarkerCurve:InsertMarkerAtTime(time: float, marker: string): Array
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Inserts a marker with the provided string value at the provided time. The provided string cannot exceed 64 characters and must only contain printable characters.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | float |  | Time at which the marker should be added. |
| `marker` | string |  | String value associated with this marker. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A table containing a boolean and a number. The boolean is `true` if the call adds a new marker and `false` if it modifies an existing marker at the provided time. The number is the index of the added marker. |

### RemoveMarkerAtIndex

```lua
MarkerCurve:RemoveMarkerAtIndex(startingIndex: int, count: int = 1): int
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Remove several markers in the MarkerCurve starting at the provided index.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `startingIndex` | int |  | Index of the first marker to be removed in the MarkerCurve. |
| `count` | int | `1` | How many markers to remove starting from the startingIndex. |

**Returns**

| Type | Description |
| --- | --- |
| int | How many markers were actually removed (can be less than count if the MarkerCurve was too few markers). |

---
*Source: [MarkerCurve](https://create.roblox.com/docs/reference/engine/classes/MarkerCurve) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
