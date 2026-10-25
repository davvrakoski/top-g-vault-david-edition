---
title: "utf8"
description: "This library provides basic support for `UTF-8` encoding."
api_type: library
aliases: ["utf8"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/libraries/utf8"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/library]
cssclasses: [tg-a30]
---

*This library provides basic support for `UTF-8` encoding.*

## Description

This library provides basic support for `UTF-8` encoding. This library does not provide any support for Unicode other than the handling of the encoding. Any operation that needs the meaning of a character, such as character classification, is outside its scope.

Unless stated otherwise, all functions that expect a byte position as a parameter assume that the given position is either the start of a byte sequence or one plus the length of the subject string. As in the string library, negative indices count from the end of the string.

You can find a large catalog of usable `UTF-8` characters [here](https://www.w3schools.com/charsets/ref_html_utf8.asp).

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Libraries/utf8#charpattern\|charpattern]] | string | The pattern `"[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*"`, which matches exactly zero or more UTF-8 byte sequences, assuming that the subject is a valid UTF-8 string. |

### Functions

| Function | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Libraries/utf8#char\|char()]] | string | Converts zero or more codepoints to UTF-8 byte sequences. |
| [[30 Official Roblox Docs/API Reference/Libraries/utf8#codes\|codes()]] | function, string, int | Returns an iterator function that iterates over all codepoints in a given string. |
| [[30 Official Roblox Docs/API Reference/Libraries/utf8#codepoint\|codepoint()]] | Tuple<int> | Returns the codepoints (as integers) from all codepoints in a given string. |
| [[30 Official Roblox Docs/API Reference/Libraries/utf8#len\|len()]] | int | Returns the number of UTF-8 codepoints in a given string. |
| [[30 Official Roblox Docs/API Reference/Libraries/utf8#offset\|offset()]] | int? | Returns the position (in bytes) where the encoding of the `n`‑th codepoint of `s` (counting from byte position `i`) starts. |
| [[30 Official Roblox Docs/API Reference/Libraries/utf8#graphemes\|graphemes()]] | function | Returns an iterator function that iterates over the grapheme clusters of a given string. |
| [[30 Official Roblox Docs/API Reference/Libraries/utf8#nfcnormalize\|nfcnormalize()]] | string | Converts the input string to Normal Form C. |
| [[30 Official Roblox Docs/API Reference/Libraries/utf8#nfdnormalize\|nfdnormalize()]] | string | Converts the input string to Normal Form D. |

## Properties

### charpattern

**Type:** string

The pattern `"[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*"`, which matches exactly zero or more UTF-8 byte sequence, assuming that the subject is a valid UTF-8 string.

## Functions

### char

```lua
utf8.char(codepoints: Tuple<int>): string
```

Receives zero or more codepoints as integers, converts each one to its corresponding UTF-8 byte sequence and returns a string with the concatenation of all these sequences.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `codepoints` | Tuple<int> |  | Zero or more integer codepoints in the range `[0, 0x10ffff]` to encode. |

**Returns**

| Type | Description |
| --- | --- |
| string | A string containing the concatenated UTF-8 byte sequences for each codepoint. |

### codes

```lua
utf8.codes(str: string): (function, string, int)
```

Returns an iterator function so that the construction:

```lua
local str = "héllo"
for position, codepoint in utf8.codes(str) do
	print(position, codepoint)
end
```

will iterate over all codepoints in string `str`. It raises an error if it meets any invalid byte sequence.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `str` | string |  | The string to iterate over. |

**Returns**

| Type | Description |
| --- | --- |
| function | The iterator function that, on each call, returns the byte position and codepoint of the next character. |
| string | The input string (passed as the invariant state to the iterator). |
| int | The initial control value (`0`) for the iterator. |

### codepoint

```lua
utf8.codepoint(str: string, i: int = 1, j: int = i): Tuple<int>
```

Returns the codepoints (as integers) from all codepoints in the provided string (str) that start between byte positions `i` and `j` (both included). The default for `i` is `1` and for `j` is `i`. It raises an error if it meets any invalid byte sequence.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `str` | string |  | The UTF-8 encoded string to extract codepoints from. |
| `i` | int | `1` | The index of the codepoint that should be fetched from this string. |
| `j` | int | `i` | The index of the last codepoint between `i` and `j` that will be returned. If excluded, this will default to the value of `i`. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple<int> | The codepoints as integers for all characters that start between byte positions `i` and `j`. |

### len

```lua
utf8.len(s: string, i: int = 1, j: int = -1): int
```

Returns the number of UTF-8 codepoints in the string _str_ that start between positions `i` and `j` (both inclusive). The default for `i` is `1` and for `j` is `-1`. If it finds any invalid byte sequence, returns a nil value plus the position of the first invalid byte.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | string |  | The UTF-8 encoded string to measure. |
| `i` | int | `1` | The starting position. |
| `j` | int | `-1` | The ending position. |

**Returns**

| Type | Description |
| --- | --- |
| int | The number of UTF-8 codepoints in the specified range, or `nil` followed by the byte position of the first invalid byte sequence. |

### offset

```lua
utf8.offset(s: string, n: int, i: int = 1): int?
```

Returns the position (in bytes) where the encoding of the `n`‑th codepoint of `s` (counting from byte position `i`) starts. A negative `n` gets characters before position `i`. The default for `i` is `1` when `n` is non-negative and `#s + 1` otherwise, so that `utf8.offset(s, -n)` gets the offset of the `n`‑th character from the end of the string. If the specified character is neither in the subject nor right after its end, the function returns `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | string |  | The UTF-8 encoded string to search within. |
| `n` | int |  | The character offset to seek. Positive values count forward, negative values count backward, and `0` finds the start of the character at byte position `i`. |
| `i` | int | `1` | The byte position from which to start counting. Defaults to `1` when `n` is non-negative and `#s + 1` when `n` is negative. |

**Returns**

| Type | Description |
| --- | --- |
| int? | The byte position where the target codepoint begins, or `nil` if the character is not within the string. |

### graphemes

```lua
utf8.graphemes(str: string, i: number, j: number): function
```

Returns an iterator function so that

```lua
for first, last in utf8.graphemes(str) do
	local grapheme = s:sub(first, last)
	-- body
end
```

will iterate the grapheme clusters of the string.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `str` | string |  | The UTF-8 encoded string to iterate over for grapheme clusters. |
| `i` | number |  | The starting byte position within the string. Negative values count from the end. |
| `j` | number |  | The ending byte position within the string. Negative values count from the end. |

**Returns**

| Type | Description |
| --- | --- |
| function | An iterator function that returns the start and end byte positions of each grapheme cluster. |

### nfcnormalize

```lua
utf8.nfcnormalize(str: string): string
```

Converts the input string to Normal Form C, which tries to convert decomposed characters into composed characters.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `str` | string |  | The UTF-8 encoded string to normalize. |

**Returns**

| Type | Description |
| --- | --- |
| string | The NFC-normalized string with decomposed characters composed into their precomposed equivalents. |

### nfdnormalize

```lua
utf8.nfdnormalize(str: string): string
```

Converts the input string to Normal Form D, which tries to break up composed characters into decomposed characters.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `str` | string |  | The string to convert. |

**Returns**

| Type | Description |
| --- | --- |
| string | The NFD-normalized string with precomposed characters decomposed into their component parts. |

---
*Source: [utf8](https://create.roblox.com/docs/reference/engine/libraries/utf8) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
