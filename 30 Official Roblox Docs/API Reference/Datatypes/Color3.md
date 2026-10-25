---
title: "Color3"
description: "A color value comprised of red, green, and blue components."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Color3"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A color value comprised of red, green, and blue components.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] data type describes a color using red, green, and blue components in the range of 0 to 1. Unlike the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] data type which describes named colors, [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] is used for precise coloring of objects on screen through properties like [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|BasePart.Color]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|GuiObject.BackgroundColor3]].

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#new\|new()]] | `red`, `green`, `blue` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] with the given red, green, and blue values. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#fromRGB\|fromRGB()]] | `red`, `green`, `blue` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] from given components within the range of 0 to 255. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#fromHSV\|fromHSV()]] | `hue`, `saturation`, `value` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] from the given hue, saturation, and value components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#fromHex\|fromHex()]] | `hex` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] from a given hex value. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#R\|R]] | number | The red value of the color. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#G\|G]] | number | The green value of the color. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#B\|B]] | number | The blue value of the color. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#Lerp\|Lerp()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] interpolated between two colors. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#ToHSV\|ToHSV()]] | number, number, number | Returns the hue, saturation, and value of a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#ToHex\|ToHex()]] | string | Returns the hex code of a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |

### Functions

| Function | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3#toHSV\|toHSV()]] | number, number, number | **Deprecated.** Returns the hue, saturation, and value of a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |

## Constructors

### new

```lua
Color3.new(red: number = 0, green: number = 0, blue: number = 0): Color3
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] with the given red, green, and blue values. The parameters should be within the range of 0 to 1.

```lua
local red = Color3.new(1, 0, 0)
local green = Color3.new(0, 1, 0)
local blue = Color3.new(0, 0, 1)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | number | `0` | The red component of the color, from 0 to 1. |
| `green` | number | `0` | The green component of the color, from 0 to 1. |
| `blue` | number | `0` | The blue component of the color, from 0 to 1. |

### fromRGB

```lua
Color3.fromRGB(red: number = 0, green: number = 0, blue: number = 0): Color3
```

Creates a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] with the given red, green, and blue components. Unlike most other [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] functions, the parameters for this function should be within the range of 0 to 255.

```lua
local red = Color3.fromRGB(255, 0, 0)
local green = Color3.fromRGB(0, 255, 0)
local blue = Color3.fromRGB(0, 0, 255)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | number | `0` | The red component of the color, from 0 to 255. |
| `green` | number | `0` | The green component of the color, from 0 to 255. |
| `blue` | number | `0` | The blue component of the color, from 0 to 255. |

### fromHSV

```lua
Color3.fromHSV(hue: number, saturation: number, value: number): Color3
```

Creates a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] with the given hue, saturation, and value. The parameters should be within the range of 0 to 1.

```lua
local red = Color3.fromHSV(1, 1, 1)
local green = Color3.fromHSV(0.3333333, 1, 1)
local white = Color3.fromHSV(0, 0, 1)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `hue` | number |  | The hue of the color, from 0 to 1. |
| `saturation` | number |  | The saturation of the color, from 0 to 1. |
| `value` | number |  | The value (brightness) of the color, from 0 to 1. |

### fromHex

```lua
Color3.fromHex(hex: string): Color3
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] from a six- or three-character hexadecimal format, case insensitive. A preceding hashtag (`#`) is ignored, if present. This function interprets the given string as a typical web hex color in the format `RRGGBB` or `RGB` (shorthand for `RRGGBB`). For example, `#FFAA00` produces an orange color and is the same as `#FA0`.

```lua
local red = Color3.fromHex("FF0000")
local magenta = Color3.fromHex("ec008c")
local black = Color3.fromHex("000")
local white = Color3.fromHex("#FFF")
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `hex` | string |  | A three- or six-character hexadecimal color string, optionally prefixed with `#`. |

## Properties

### R

**Type:** number

The red value of the color.

### G

**Type:** number

The green value of the color.

### B

**Type:** number

The blue value of the color.

## Methods

### Lerp

```lua
Color3:Lerp(color: Color3, alpha: number): Color3
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] interpolated between two colors. The `alpha` value should be within the range of 0 to 1.

```lua
local white = Color3.new(1, 1, 1)
local black = Color3.new(0, 0, 0)

local gray10 = white:Lerp(black, 0.1)
print(gray10)  --> 0.9, 0.9, 0.9

local gray50 = white:Lerp(black, 0.5)
print(gray50)  --> 0.5, 0.5, 0.5

local gray85 = white:Lerp(black, 0.85)
print(gray85)  --> 0.15, 0.15, 0.15
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | The color to interpolate toward. |
| `alpha` | number |  | An interpolation value between 0 and 1, where 0 returns this color and 1 returns the target color. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  |

### ToHSV

```lua
Color3:ToHSV(): (number, number, number)
```

Returns the hue, saturation, and value of a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]. This function is the inverse operation of the [[30 Official Roblox Docs/API Reference/Datatypes/Color3#fromHSV|Color3.fromHSV()]] constructor.

```lua
local red = Color3.fromRGB(255, 0, 0)
local green = Color3.fromRGB(0, 255, 0)

local redH, redS, redV = red:ToHSV()
print(redH, redS, redV)  --> 1 1 1

local greenH, greenS, greenV = green:ToHSV()
print(greenH, greenS, greenV)  --> 0.3333333 1 1
```

**Returns**

| Type | Description |
| --- | --- |
| number |  |
| number |  |
| number |  |

### ToHex

```lua
Color3:ToHex(): string
```

Converts the color to a six-character hexadecimal string representing the color in the format `RRGGBB`. It is not prefixed with an octothorpe (`#`).

The returned string can be provided to [[30 Official Roblox Docs/API Reference/Datatypes/Color3#fromHex|Color3.fromHex()]] to produce the original color.

```lua
local red = Color3.fromRGB(255, 0, 0)
local magenta = Color3.fromRGB(236, 0, 140)

local redHex = red:ToHex()
print(redHex)  --> ff0000

local magentaHex = magenta:ToHex()
print(magentaHex)  --> ec008c
```

**Returns**

| Type | Description |
| --- | --- |
| string |  |

## Functions

### toHSV

> [!warning] Deprecated
> This function is functionally equivalent to `Datatype.Color3:ToHSV()`.

```lua
Color3.toHSV(color: Color3): (number, number, number)
```

Returns the hue, saturation, and value of a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]. This function is the inverse operation of the [[30 Official Roblox Docs/API Reference/Datatypes/Color3#fromHSV|Color3.fromHSV()]] constructor.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | The Color3 to convert to HSV. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |
| number |  |
| number |  |

---
*Source: [Color3](https://create.roblox.com/docs/reference/engine/datatypes/Color3) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
