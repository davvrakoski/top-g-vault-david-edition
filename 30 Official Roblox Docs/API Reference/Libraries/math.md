---
title: "math"
description: "A library of math functions."
api_type: library
aliases: ["math"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/libraries/math"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/library]
cssclasses: [tg-a30]
---

*A library of math functions.*

## Description

This library is an interface to the standard C math library, providing all of its functions inside the [[30 Official Roblox Docs/API Reference/Libraries/math|math]] table.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Libraries/math#e\|e]] | number | The value of Euler's number, e. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#huge\|huge]] | number | Returns a value larger than or equal to any other numerical value (about 2<sup>1024</sup>). |
| [[30 Official Roblox Docs/API Reference/Libraries/math#nan\|nan]] | number | A NaN value, as defined by the IEEE 754 standard. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#phi\|phi]] | number | The value of the golden ratio. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#pi\|pi]] | number | The value of pi. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#sqrt2\|sqrt2]] | number | The value of the square root of 2. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#tau\|tau]] | number | The value of tau, which is defined as `2 * math.pi`. |

### Functions

| Function | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Libraries/math#abs\|abs()]] | number | Returns the absolute value of `x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#acos\|acos()]] | number | Returns the arc cosine of `x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#asin\|asin()]] | number | Returns the arc sine of `x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#atan\|atan()]] | number | Returns the arc tangent of `x` in radians. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#atan2\|atan2()]] | number | Returns the arc tangent of `y`/`x` (in radians) while using the signs of both parameters to find the quadrant of the result. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#ceil\|ceil()]] | int | Returns the smallest integer larger than or equal to `x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#clamp\|clamp()]] | number | Returns a number between `min` and `max`, inclusive. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#cos\|cos()]] | number | Returns the cosine of `x`, assumed to be in radians. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#cosh\|cosh()]] | number | Returns the hyperbolic cosine of `x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#deg\|deg()]] | number | Returns the angle `x` (given in radians) in degrees. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#exp\|exp()]] | number | Returns the value `e`^`x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#floor\|floor()]] | int | Returns the largest integer smaller than or equal to `x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#fmod\|fmod()]] | number | Returns the remainder of the division of `x` by `y` that rounds the quotient towards zero. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#frexp\|frexp()]] | number, int | Returns `m` and `e` such that `x` = `m`\*`2`^`e`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#isfinite\|isfinite()]] | boolean | Returns true if `x` is a finite number. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#isinf\|isinf()]] | boolean | Returns true if `x` is positive or negative infinity and false otherwise. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#isnan\|isnan()]] | boolean | Returns true if `x` is not a number (NaN) and false otherwise. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#ldexp\|ldexp()]] | number | Returns `x`\*`2`^`e` (`e` should be an integer). |
| [[30 Official Roblox Docs/API Reference/Libraries/math#lerp\|lerp()]] | number | Returns the linear interpolation between `a` and `b`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#log\|log()]] | number | Returns the logarithm of `x` using the given base. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#log10\|log10()]] | number | Returns the base-10 logarithm of `x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#map\|map()]] | number | Returns the value of `x` mapped from one range to another. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#max\|max()]] | number | Returns the maximum value among the numbers passed to the function. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#min\|min()]] | number | Returns the minimum value among the numbers passed to the function. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#modf\|modf()]] | number, number | Returns two numbers: the integral part of `x` and the fractional part of `x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#noise\|noise()]] | number | Returns a Perlin noise value. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#pow\|pow()]] | number | Returns `x`^`y`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#rad\|rad()]] | number | Returns the angle `x` (given in degrees) in radians. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#random\|random()]] | number | Returns a random number within the range provided. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#randomseed\|randomseed()]] | () | Sets `x` as the seed for the pseudo-random generator. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#round\|round()]] | number | Returns the integer with the smallest difference between it and the given number. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#sign\|sign()]] | int | Returns `-1` if `x` is less than `0`, `0` if `x` equals `0`, or `1` if `x` is greater than `0`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#sin\|sin()]] | number | Returns the sine of `x`, assumed to be in radians. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#sinh\|sinh()]] | number | Returns the hyperbolic sine of `x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#sqrt\|sqrt()]] | number | Returns the square root of `x`. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#tan\|tan()]] | number | Returns the tangent of `x`, assumed to be in radians. |
| [[30 Official Roblox Docs/API Reference/Libraries/math#tanh\|tanh()]] | number | Returns the hyperbolic tangent of `x`. |

## Properties

### e

**Type:** number

The value of Euler's number, e.

### huge

**Type:** number

Returns a value larger than or equal to any other numerical value (about 2<sup>1024</sup>). Dividing a positive number by zero yields this same value.

### nan

**Type:** number

A NaN value, as defined by the IEEE 754 standard. Comparing directly to `math.nan` will always return false; use [[30 Official Roblox Docs/API Reference/Libraries/math#isnan|math.isnan()]] instead.

### phi

**Type:** number

The value of the golden ratio.

### pi

**Type:** number

The value of pi.

### sqrt2

**Type:** number

The value of the square root of 2.

### tau

**Type:** number

The value of tau, which is defined as `2 * math.pi`.

## Functions

### abs

```lua
math.abs(x: number): number
```

Returns the absolute value of `x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to return the absolute value of. |

**Returns**

| Type | Description |
| --- | --- |
| number | The absolute value of `x`. |

### acos

```lua
math.acos(x: number): number
```

Returns the arc cosine of `x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The cosine value, between `-1` and `1`. |

**Returns**

| Type | Description |
| --- | --- |
| number | The angle in radians whose cosine is `x`, in the range `[0, pi]`. |

### asin

```lua
math.asin(x: number): number
```

Returns the arc sine of `x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The sine value, between `-1` and `1`. |

**Returns**

| Type | Description |
| --- | --- |
| number | The angle in radians whose sine is `x`, in the range `[-pi/2, pi/2]`. |

### atan

```lua
math.atan(x: number): number
```

Returns the arc tangent of `x` in radians.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The value to compute the arc tangent of. |

**Returns**

| Type | Description |
| --- | --- |
| number | The arc tangent of `x` in radians, in the range `[-pi/2, pi/2]`. |

### atan2

```lua
math.atan2(y: number, x: number): number
```

Returns the arc tangent of `y`/`x` (in radians) while using the signs of both parameters to find the quadrant of the result. It also handles correctly the case of `x` being zero.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | number |  | The **Y** coordinate. |
| `x` | number |  | The **X** coordinate. |

**Returns**

| Type | Description |
| --- | --- |
| number | The arc tangent of `y`/`x` in radians, in the range `[-pi, pi]`. |

### ceil

```lua
math.ceil(x: number): int
```

Returns the smallest integer larger than or equal to `x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to round up. |

**Returns**

| Type | Description |
| --- | --- |
| int | The smallest integer greater than or equal to `x`. |

### clamp

```lua
math.clamp(x: number, min: number, max: number): number
```

Returns a number between `min` and `max`, inclusive.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to clamp. |
| `min` | number |  | The minimum value of the range. |
| `max` | number |  | The maximum value of the range; must be greater than or equal to `min`. |

**Returns**

| Type | Description |
| --- | --- |
| number | `x` constrained to the range `[`min`, `max`]`. |

### cos

```lua
math.cos(x: number): number
```

Returns the cosine of `x`, assumed to be in radians.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The angle in radians. |

**Returns**

| Type | Description |
| --- | --- |
| number | The cosine of `x`. |

### cosh

```lua
math.cosh(x: number): number
```

Returns the hyperbolic cosine of `x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to compute the hyperbolic cosine of. |

**Returns**

| Type | Description |
| --- | --- |
| number | The hyperbolic cosine of `x`. |

### deg

```lua
math.deg(x: number): number
```

Returns the angle `x` (given in radians) in degrees.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The angle in radians to convert. |

**Returns**

| Type | Description |
| --- | --- |
| number | The angle `x` converted to degrees. |

### exp

```lua
math.exp(x: number): number
```

Returns the value `e`^`x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The exponent. |

**Returns**

| Type | Description |
| --- | --- |
| number | The value of `e` raised to the power `x`. |

### floor

```lua
math.floor(x: number): int
```

Returns the largest integer smaller than or equal to `x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to round down. |

**Returns**

| Type | Description |
| --- | --- |
| int | The largest integer less than or equal to `x`. |

### fmod

```lua
math.fmod(x: number, y: number): number
```

Returns the remainder of the division of `x` by `y` that rounds the quotient towards zero.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The dividend. |
| `y` | number |  | The divisor. |

**Returns**

| Type | Description |
| --- | --- |
| number | The remainder of the division of `x` by `y`. |

### frexp

```lua
math.frexp(x: number): (number, int)
```

Returns `m` and `e` such that `x` = `m`\*`2`^`e`. `e` is an integer and the absolute value of `m` is in the range of `0.5` to `1` (inclusive of `0.5` but exclusive of `1`), or zero when `x` is zero.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to decompose into mantissa and exponent. |

**Returns**

| Type | Description |
| --- | --- |
| number | The mantissa `m`, a value whose absolute value is in `[0.5, 1)` or zero. |
| int | The exponent `e` such that `x = m * 2^e`. |

### isfinite

```lua
math.isfinite(x: number): boolean
```

Returns true if `x` is a finite number, meaning it is neither NaN nor positive or negative infinity (±[[30 Official Roblox Docs/API Reference/Libraries/math#huge|math.huge]]).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to test. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if `x` is neither NaN nor infinity, false otherwise. |

### isinf

```lua
math.isinf(x: number): boolean
```

Returns true if `x` is positive or negative infinity (±[[30 Official Roblox Docs/API Reference/Libraries/math#huge|math.huge]]) and false otherwise.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to test. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if `x` is positive or negative infinity, false otherwise. |

### isnan

```lua
math.isnan(x: number): boolean
```

Returns true if `x` is not a number (NaN) and false otherwise.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to test. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if `x` is NaN, false otherwise. |

### ldexp

```lua
math.ldexp(x: number, e: int): number
```

Returns `x`\*`2`^`e` (`e` should be an integer).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The mantissa value. |
| `e` | int |  | The integer exponent. |

**Returns**

| Type | Description |
| --- | --- |
| number | The value `x * 2^e`. |

### lerp

```lua
math.lerp(a: number, b: number, t: number): number
```

Returns the linear interpolation between `a` and `b` based on the factor `t`.

This function uses the formula `a`+`(b-a)`\*`t`. `t` is typically between `0` and `1` but values outside this range are acceptable.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | number |  | The starting value. |
| `b` | number |  | The ending value. |
| `t` | number |  | The interpolation factor, typically between `0` and `1`. |

**Returns**

| Type | Description |
| --- | --- |
| number | The interpolated value between `a` and `b`. |

### log

```lua
math.log(x: number, base: number = 2.7182818): number
```

Returns the logarithm of `x` using the given base, or the mathematical constant `e` if no base is provided (natural logarithm).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to compute the logarithm of. |
| `base` | number | `2.7182818` | The base of the logarithm, the constant `e` by default. |

**Returns**

| Type | Description |
| --- | --- |
| number | The logarithm of `x` in the given base. |

### log10

```lua
math.log10(x: number): number
```

Returns the base-10 logarithm of `x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to compute the base-10 logarithm of. |

**Returns**

| Type | Description |
| --- | --- |
| number | The base-10 logarithm of `x`. |

### map

```lua
math.map(x: number, inmin: number, inmax: number, outmin: number, outmax: number): number
```

Returns a value that represents `x` mapped linearly from the input range (`inmin` to `inmax`) to the output range (`outmin` to `outmax`). This is achieved by determining the relative position of `x` within the input range and applying that ratio to the output range.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to be mapped. |
| `inmin` | number |  | The lower bound of the input range. |
| `inmax` | number |  | The upper bound of the input range. |
| `outmin` | number |  | The lower bound of the output range. |
| `outmax` | number |  | The upper bound of the output range. |

**Returns**

| Type | Description |
| --- | --- |
| number | The value of `x` mapped to the output range. |

### max

```lua
math.max(x: number, ...: number): number
```

Returns the maximum value among the numbers passed to the function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The first number to compare. |
| `...` | number |  | Additional numbers to compare. |

**Returns**

| Type | Description |
| --- | --- |
| number | The largest value among all arguments. |

### min

```lua
math.min(x: number, ...: number): number
```

Returns the minimum value among the numbers passed to the function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The first number to compare. |
| `...` | number |  | Additional numbers to compare. |

**Returns**

| Type | Description |
| --- | --- |
| number | The smallest value among all arguments. |

### modf

```lua
math.modf(x: number): (number, number)
```

Returns two numbers: the integral part of `x` and the fractional part of `x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to split into integral and fractional parts. |

**Returns**

| Type | Description |
| --- | --- |
| number | The integral part of `x`. |
| number | The fractional part of `x`. |

### noise

```lua
math.noise(x: number, y: number = 0, z: number = 0): number
```

Returns a Perlin noise value. The returned value is most often between the range of `-1` to `1` (inclusive) but sometimes may be outside that range; if the interval is critical to you, use `Library.math.clamp(noise, -1, 1)` on the output.

If you leave arguments out, they will be interpreted as zero, so `Library.math.noise(1.158)` is equivalent to `Library.math.noise(1.158, 0, 0)` and `Library.math.noise(1.158, 5.723)` is equivalent to `Library.math.noise(1.158, 5.723, 0)`.

Note that this function uses a Perlin noise algorithm to assign fixed values to coordinates. For example, `Library.math.noise(1.158, 5.723)` will always return `0.48397532105446` and `Library.math.noise(1.158, 6)` will always return `0.15315161645412`.

If `x`, `y`, and `z` are all integers, the return value will be `0`. For fractional values of `x`, `y`, and `z`, the return value will gradually fluctuate between `-0.5` and `0.5`. For coordinates that are close to each other, the return values will also be close to each other.

The noise repeats with a period of `256` on each axis, so `Library.math.noise(x, y, z)` and `Library.math.noise(x + 256, y, z)` return identical values.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The **X** coordinate of the sample point. |
| `y` | number | `0` | The **Y** coordinate of the sample point. |
| `z` | number | `0` | The **Z** coordinate of the sample point. |

**Returns**

| Type | Description |
| --- | --- |
| number | A Perlin noise value, typically between `-1` and `1`. |

### pow

```lua
math.pow(x: number, y: number): number
```

Returns `x`^`y` (you can also use the expression `x`^`y` to compute this value).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The base value. |
| `y` | number |  | The exponent value. |

**Returns**

| Type | Description |
| --- | --- |
| number | The value `x` raised to the power `y`. |

### rad

```lua
math.rad(x: number): number
```

Returns the angle `x` (given in degrees) in radians.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The angle in degrees to convert. |

**Returns**

| Type | Description |
| --- | --- |
| number | The angle `x` converted to radians. |

### random

```lua
math.random(m: number = 0, n: number = 1): number
```

When called without arguments, returns a uniform pseudo-random real number in the range of `0` to `1` (inclusive of `0` but exclusive of `1`).

When called with an integer number `m`, returns a uniform pseudo-random integer in the range of `1` to `m`, inclusive.

When called with two integer numbers `m` and `n`, returns a uniform pseudo-random integer in the range of `m` to `n`, inclusive.

Internally, this uses a 32-bit PCG (Permuted Congruential Generator) which achieves excellent statistical performance and makes its output hard to predict.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `m` | number | `0` | When used alone, the upper bound of the integer range (lower bound is `1`). When used with `n`, the lower bound. |
| `n` | number | `1` | The upper bound of the integer range. |

**Returns**

| Type | Description |
| --- | --- |
| number | A pseudo-random number within the specified range. |

### randomseed

```lua
math.randomseed(x: number): ()
```

Sets `x` as the seed for the pseudo-random generator: equal seeds produce equal sequences of numbers.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The seed value for the pseudo-random number generator. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### round

```lua
math.round(x: number): number
```

Returns the integer with the smallest difference between it and the given number. For example, the value `5.8` returns `6`.

For values like `0.5` that are equidistant to two integers, the value with the greater difference between it and zero is chosen. In other words, the function "rounds away from zero" such that `0.5` rounds to `1` and `-0.5` rounds to `-1`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The value to be rounded. |

**Returns**

| Type | Description |
| --- | --- |
| number | The nearest integer to `x`, rounding away from zero for midpoints. |

### sign

```lua
math.sign(x: number): int
```

Returns `-1` if `x` is less than `0`, `0` if `x` equals `0`, or `1` if `x` is greater than `0`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to determine the sign of. |

**Returns**

| Type | Description |
| --- | --- |
| int | `-1` if `x` is negative, `0` if `x` is zero, or `1` if `x` is positive. |

### sin

```lua
math.sin(x: number): number
```

Returns the sine of `x`, assumed to be in radians.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The angle in radians. |

**Returns**

| Type | Description |
| --- | --- |
| number | The sine of `x`. |

### sinh

```lua
math.sinh(x: number): number
```

Returns the hyperbolic sine of `x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to compute the hyperbolic sine of. |

**Returns**

| Type | Description |
| --- | --- |
| number | The hyperbolic sine of `x`. |

### sqrt

```lua
math.sqrt(x: number): number
```

Returns the square root of `x`. You can also use the expression `x`^`0.5` to compute this value.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to compute the square root of. |

**Returns**

| Type | Description |
| --- | --- |
| number | The square root of `x`. |

### tan

```lua
math.tan(x: number): number
```

Returns the tangent of `x`, assumed to be in radians.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The angle in radians. |

**Returns**

| Type | Description |
| --- | --- |
| number | The tangent of `x`. |

### tanh

```lua
math.tanh(x: number): number
```

Returns the hyperbolic tangent of `x`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | number |  | The number to compute the hyperbolic tangent of. |

**Returns**

| Type | Description |
| --- | --- |
| number | The hyperbolic tangent of `x`. |

---
*Source: [math](https://create.roblox.com/docs/reference/engine/libraries/math) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
