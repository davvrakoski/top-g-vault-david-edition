---
title: "Random"
description: "Generates pseudorandom numbers and directions."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Random"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Generates pseudorandom numbers and directions.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Random|Random]] data type generates pseudorandom numbers and directions.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Random#new\|new()]] | `seed` | Returns a new pseudorandom generator using an optional seed. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Random#NextInteger\|NextInteger()]] | number | Returns a pseudorandom integer uniformly distributed over `[min, max]`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Random#NextNumber\|NextNumber()]] | number | Returns a pseudorandom number uniformly distributed over `[0, 1]`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Random#NextNumber\|NextNumber()]] | number | Returns a pseudorandom number uniformly distributed over `[min, max]`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Random#Shuffle\|Shuffle()]] | () | Uniformly shuffles a table in-place. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Random#NextUnitVector\|NextUnitVector()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns a unit vector with a pseudorandom direction. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Random#Clone\|Clone()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Random\|Random]] | Returns a new Random object with the same state as the original. |

## Constructors

### new

```lua
Random.new(seed: number): Random
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Random|Random]] object. If you don't provide the seed parameter, [[30 Official Roblox Docs/API Reference/Datatypes/Random|Random]] uses a seed from an internal entropy source.

If you provide a seed, it should be within the range [-9007199254740991, 9007199254740991], and [[30 Official Roblox Docs/API Reference/Datatypes/Random|Random]] will round it down to the nearest integer. So seeds of 0, 0.99, and [[30 Official Roblox Docs/API Reference/Libraries/math#random|math.random()]] all produce identical generators. If you need to generate a seed and store it for later retrieval, use [[30 Official Roblox Docs/API Reference/Libraries/math#random|math.random(max)]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `seed` | number |  | An optional number that initializes the pseudorandom number generator's internal state, truncated toward zero to a whole number. Should be within the range [-9007199254740991, 9007199254740991]; values outside this range are clamped to 0. |

*Code samples for this member (`generating-random-seed`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### NextInteger

```lua
Random:NextInteger(min: number, max: number): number
```

Returns a pseudorandom integer uniformly distributed over `[min, max]`, inclusive of both endpoints. If `min` is greater than `max`, the two values are swapped so the call still succeeds. Both arguments are truncated toward zero to whole numbers before sampling.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `min` | number |  | The minimum integer value of the range (inclusive). Truncated toward zero to a whole number. |
| `max` | number |  | The maximum integer value of the range (inclusive). Truncated toward zero to a whole number. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### NextNumber

```lua
Random:NextNumber(): number
```

Returns a uniform pseudorandom real number in the range of 0 to 1, inclusive.

**Returns**

| Type | Description |
| --- | --- |
| number | A pseudorandom number uniformly distributed over [0, 1]. |

### NextNumber

```lua
Random:NextNumber(min: number, max: number): number
```

Returns a uniform pseudorandom real number in the range of `min` to `max`, inclusive.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `min` | number |  | The minimum value of the range (inclusive). |
| `max` | number |  | The maximum value of the range (inclusive). |

**Returns**

| Type | Description |
| --- | --- |
| number | A pseudorandom number uniformly distributed over [min, max]. |

### Shuffle

```lua
Random:Shuffle(tb: table): ()
```

Uniformly shuffles the array part of `tb` in-place using `NextInteger` to pick indices. If there are any `nil` "holes" in the array part of the table, `Shuffle` throws an error, since shuffling could change the length.

The hash part of `tb` is ignored. No metamethods of `tb` are invoked.

The shuffle is defined to be a Fisher-Yates shuffle so the number of `NextInteger` calls is guaranteed to be consistent between engine versions for a given size of table.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tb` | table |  | The table whose array part is shuffled in-place. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### NextUnitVector

```lua
Random:NextUnitVector(): Vector3
```

Returns a unit vector with a pseudorandom direction. Vectors returned from this function are uniformly distributed over the unit sphere.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A unit vector with a pseudorandom direction. |

### Clone

```lua
Random:Clone(): Random
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Random|Random]] object whose internal state is copied from the original. After cloning, both the original and the clone produce the same sequence of pseudorandom values going forward, but they advance independently — consuming a value from one does not affect the other.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Random\|Random]] | A new Random object with the same internal state as the original. |

---
*Source: [Random](https://create.roblox.com/docs/reference/engine/datatypes/Random) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
