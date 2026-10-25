---
title: "NumberRange"
description: "Represents a range of numbers."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/NumberRange"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents a range of numbers.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]] represents a range of numbers.

`NumberRange` stores its [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange#Min|NumberRange.Min]] and [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange#Max|NumberRange.Max]] values as 32-bit floating-point numbers. Very large numbers or numbers requiring high decimal precision may lose accuracy.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange#new\|new()]] | `value` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] with the minimum and maximum set to the `value`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange#new\|new()]] | `minimum`, `maximum` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] with the provided `minimum` and `maximum`. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange#Min\|Min]] | number | The minimum value of the [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange#Max\|Max]] | number | The maximum value of the [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]]. |

## Constructors

### new

```lua
NumberRange.new(value: number): NumberRange
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]] with the minimum and maximum set to the `value`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | number |  | The number that both the minimum and maximum of the range are set to. |

### new

```lua
NumberRange.new(minimum: number, maximum: number): NumberRange
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]] with the provided `minimum` and `maximum`. The `minimum` must be less than or equal to `maximum`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `minimum` | number |  | The lower bound of the range. |
| `maximum` | number |  | The upper bound of the range. |

## Properties

### Min

**Type:** number

The minimum value of the [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]], always less than or equal to the maximum.

### Max

**Type:** number

The maximum value of the [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]], always greater than or equal to the minimum.

---
*Source: [NumberRange](https://create.roblox.com/docs/reference/engine/datatypes/NumberRange) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
