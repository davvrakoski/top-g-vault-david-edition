---
title: "buffer"
description: "A library of buffer functions."
api_type: library
aliases: ["buffer"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/libraries/buffer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/library]
cssclasses: [tg-a30]
---

*A library of buffer functions.*

## Description

A buffer is an object that represents a fixed-size mutable block of memory. The buffer library provides functions for creation and manipulation of buffer objects, providing all its functions inside the global [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]] variable.

Buffer is intended to be used a low-level binary data storage structure, replacing the uses of [[30 Official Roblox Docs/API Reference/Libraries/string#pack|string.pack()]] and [[30 Official Roblox Docs/API Reference/Libraries/string#unpack|string.unpack()]]. Use cases include reading and writing existing binary formats, working with data in a more compact form, serialization to custom binary formats, and general work with native memory types like fixed-length integers and floats.

When passed through Roblox APIs, including sending a buffer through custom events, the identity of the buffer object is not preserved and the target will receive a copy. Similar to other limitations, the same buffer object cannot be used from multiple [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] scripts (Parallel Luau).

Many of the functions accept an offset in bytes from the start of the buffer. Offset of `0` from the start of the buffer memory block accesses the first byte. All offsets, counts and sizes should be non-negative integer numbers. If the bytes that are accessed by any read or write operation are outside the buffer memory, an error is thrown.

The `read` and `write` methods that work with integers and floats use [little-endian](https://en.wikipedia.org/wiki/Endianness) encoding.

## Summary

### Functions

| Function | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#create\|create()]] | buffer | Creates a buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#fromstring\|fromstring()]] | buffer | Creates a buffer from a string. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#tostring\|tostring()]] | string | Converts a buffer to a string. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#len\|len()]] | number | Returns the size of the buffer in bytes. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#readbits\|readbits()]] | number | Reads a range of bits into an unsigned integer from the buffer based on a specific `bitCount` integer from `0` to `32`, inclusive. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#readi8\|readi8()]] | number | Reads an 8-bit signed integer from the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#readu8\|readu8()]] | number | Reads an 8-bit unsigned integer from the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#readi16\|readi16()]] | number | Reads a 16-bit signed integer from the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#readu16\|readu16()]] | number | Reads a 16-bit unsigned integer from the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#readi32\|readi32()]] | number | Reads a 32-bit signed integer from the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#readu32\|readu32()]] | number | Reads a 32-bit unsigned integer from the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#readf32\|readf32()]] | number | Reads a 32-bit floating-point value from the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#readf64\|readf64()]] | number | Reads a 64-bit floating-point value from the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#writebits\|writebits()]] | () | Writes data to the buffer based on a specific `bitCount` integer from `0` to `32`, inclusive. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#writei8\|writei8()]] | () | Writes an 8-bit signed integer to the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#writeu8\|writeu8()]] | () | Writes an 8-bit unsigned integer to the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#writei16\|writei16()]] | () | Writes a 16-bit signed integer to the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#writeu16\|writeu16()]] | () | Writes a 16-bit unsigned integer to the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#writei32\|writei32()]] | () | Writes a 32-bit signed integer to the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#writeu32\|writeu32()]] | () | Writes a 32-bit unsigned integer to the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#writef32\|writef32()]] | () | Writes a 32-bit floating-point value to the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#writef64\|writef64()]] | () | Writes a 64-bit floating-point value to the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#readstring\|readstring()]] | string | Reads a string from the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#writestring\|writestring()]] | () | Writes a string to the buffer. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#copy\|copy()]] | () | Copies bytes between buffers. |
| [[30 Official Roblox Docs/API Reference/Libraries/buffer#fill\|fill()]] | () | Sets a region of the buffer memory to some 8-bit unsigned integer value. |

## Functions

### create

```lua
buffer.create(size: number): buffer
```

Creates a buffer of the requested size with all bytes initialized to `0`. Size limit is 1 GiB, or 1,073,741,824 bytes. Keep in mind that larger buffers might fail to allocate if device is running low on memory.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | number |  | Size of the buffer in bytes. Must be a positive integer. |

**Returns**

| Type | Description |
| --- | --- |
| buffer |  |

### fromstring

```lua
buffer.fromstring(str: string): buffer
```

Creates a buffer initialized to the contents of the string. The size of the buffer equals the length of the string.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `str` | string |  | The string whose bytes initialize the new buffer. |

**Returns**

| Type | Description |
| --- | --- |
| buffer |  |

### tostring

```lua
buffer.tostring(b: buffer): string
```

Returns the buffer data as a string.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to convert. |

**Returns**

| Type | Description |
| --- | --- |
| string |  |

### len

```lua
buffer.len(b: buffer): number
```

Returns the size of the buffer in bytes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to get the size of. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### readbits

```lua
buffer.readbits(b: buffer, bitOffset: number, bitCount: number): number
```

Reads a range of bits into an unsigned integer from the buffer based on a specific `bitCount` integer from `0` to `32`, inclusive. For example:

- `buffer.readbits(b, 0, 8)` is equivalent to `Library.buffer.readu8(b, 0)`.
- `buffer.readbits(b, 0, 16)` is equivalent to `Library.buffer.readu16(b, 0)`.
- `buffer.readbits(b, 0, 32)` is equivalent to `Library.buffer.readu32(b, 0)`.
- `buffer.readbits(b, 0, 24)` reads 24 bits from the buffer.

Note that `0` bit width is supported only to not error in generalized cases where bit count is dynamic, and reading 0 bits returns `0`. Also note that, since the max size of the buffer is 1 GB, `bitOffset` cannot be handled as a 32‑bit integer number like byte offset in other buffer functions.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to read from. |
| `bitOffset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `bitCount` | number |  | Integer bit count to read. Error is thrown if this value is not in range of `0` to `32`, inclusive. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### readi8

```lua
buffer.readi8(b: buffer, offset: number): number
```

Reads the data from the buffer by reinterpreting bytes at the offset as an 8-bit signed integer and converting it into a number.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to read from. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### readu8

```lua
buffer.readu8(b: buffer, offset: number): number
```

Reads the data from the buffer by reinterpreting bytes at the offset as an 8-bit unsigned integer and converting it into a number.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to read from. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### readi16

```lua
buffer.readi16(b: buffer, offset: number): number
```

Reads the data from the buffer by reinterpreting bytes at the offset as a 16-bit signed integer and converting it into a number.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to read from. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### readu16

```lua
buffer.readu16(b: buffer, offset: number): number
```

Reads the data from the buffer by reinterpreting bytes at the offset as a 16-bit unsigned integer and converting it into a number.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to read from. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### readi32

```lua
buffer.readi32(b: buffer, offset: number): number
```

Reads the data from the buffer by reinterpreting bytes at the offset as a 32-bit signed integer and converting it into a number.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to read from. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### readu32

```lua
buffer.readu32(b: buffer, offset: number): number
```

Reads the data from the buffer by reinterpreting bytes at the offset as a 32-bit unsigned integer and converting it into a number.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to read from. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### readf32

```lua
buffer.readf32(b: buffer, offset: number): number
```

Reads the data from the buffer by reinterpreting bytes at the offset as a 32-bit floating-point value and converting it into a number. If the floating-point value matches any bit patterns that represent `NaN` (not a number), the returned value may be converted to a different quiet `NaN` representation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to read from. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### readf64

```lua
buffer.readf64(b: buffer, offset: number): number
```

Reads the data from the buffer by reinterpreting bytes at the offset as a 64-bit floating-point value and converting it into a number. If the floating-point value matches any bit patterns that represent `NaN` (not a number), the returned value may be converted to a different quiet `NaN` representation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to read from. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### writebits

```lua
buffer.writebits(b: buffer, bitOffset: number, bitCount: number, value: number): ()
```

Writes data to the buffer based on a specific `bitCount` integer from `0` to `32`, inclusive. `value` is treated as an unsigned 32‑bit number and only `bitCount` least significant bits are written.

Note that `0` bit width is supported only to not error in generalized cases where bit count is dynamic, and writing 0 bits has no effect. Also note that, since the max size of the buffer is 1 GB, `bitOffset` cannot be handled as a 32‑bit integer number like byte offset in other buffer functions.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to write to. |
| `bitOffset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `bitCount` | number |  | Integer bit count to write. Error is thrown if this value is not in range of `0` to `32`, inclusive. |
| `value` | number |  | Unsigned 32‑bit number. Only `bitCount` least significant bits are written. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### writei8

```lua
buffer.writei8(b: buffer, offset: number, value: number): ()
```

Writes data to the buffer by converting the number into an 8-bit signed integer and writing a single byte.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to write to. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `value` | number |  | An integer number in range [-128, 127]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### writeu8

```lua
buffer.writeu8(b: buffer, offset: number, value: number): ()
```

Writes data to the buffer by converting the number into an 8-bit unsigned integer and writing a single byte.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to write to. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `value` | number |  | An integer number in range [0, 255]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### writei16

```lua
buffer.writei16(b: buffer, offset: number, value: number): ()
```

Writes data to the buffer by converting the number into a 16-bit signed integer and reinterpreting it as individual bytes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to write to. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `value` | number |  | An integer number in range [-32,768, 32,767]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### writeu16

```lua
buffer.writeu16(b: buffer, offset: number, value: number): ()
```

Writes data to the buffer by converting the number into a 16-bit unsigned integer and reinterpreting it as individual bytes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to write to. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `value` | number |  | An integer number in range [0, 65,535]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### writei32

```lua
buffer.writei32(b: buffer, offset: number, value: number): ()
```

Writes data to the buffer by converting the number into a 32-bit signed integer and reinterpreting it as individual bytes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to write to. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `value` | number |  | An integer number in range [-2,147,483,648, 2,147,483,647]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### writeu32

```lua
buffer.writeu32(b: buffer, offset: number, value: number): ()
```

Writes data to the buffer by converting the number into a 32-bit unsigned integer and reinterpreting it as individual bytes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to write to. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `value` | number |  | An integer number in range [0, 4,294,967,295]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### writef32

```lua
buffer.writef32(b: buffer, offset: number, value: number): ()
```

Writes data to the buffer by converting the number into a 32-bit floating-point value and reinterpreting it as individual bytes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to write to. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `value` | number |  | A single-precision floating-point number. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### writef64

```lua
buffer.writef64(b: buffer, offset: number, value: number): ()
```

Writes data to the buffer by converting the number into a 64-bit floating-point value and reinterpreting it as individual bytes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to write to. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `value` | number |  | A double-precision floating-point number. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### readstring

```lua
buffer.readstring(b: buffer, offset: number, count: number): string
```

Reads a string of length `count` from the buffer at the specified `offset`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to read from. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `count` | number |  | Length to read. |

**Returns**

| Type | Description |
| --- | --- |
| string |  |

### writestring

```lua
buffer.writestring(b: buffer, offset: number, value: string, count: number?): ()
```

Writes data from a string into the buffer at the specified `offset`. If an optional `count` is specified, only `count` bytes are taken from the string.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | The buffer to write to. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `value` | string |  | Data to write. |
| `count` | number? |  | Number of bytes to take from the string. This value cannot be larger than the string length. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### copy

```lua
buffer.copy(target: buffer, targetOffset: number, source: buffer, sourceOffset: number? = 0, count: number?): ()
```

Copies `count` bytes from `source` starting at offset `sourceOffset` into the `target` at `targetOffset`.

It's possible for `source` and `target` to be the same. Copying an overlapping region inside the same buffer acts as if the source region is copied into a temporary buffer and then that buffer is copied over to the target.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | buffer |  | Buffer to copy data into. |
| `targetOffset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `source` | buffer |  | Buffer to take the data from. |
| `sourceOffset` | number? | `0` | Offset from the beginning of the buffer memory, starting from `0`. |
| `count` | number? |  | Number of bytes to copy. If omitted, the whole `source` data starting from `sourceOffset` is taken. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### fill

```lua
buffer.fill(b: buffer, offset: number, value: number, count: number?): ()
```

Sets `count` bytes in the buffer starting at the specified `offset` to `value`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `b` | buffer |  | Buffer to write the data into. |
| `offset` | number |  | Offset from the beginning of the buffer memory, starting from `0`. |
| `value` | number |  | An integer number in range [0, 255]. |
| `count` | number? |  | Number of bytes to write. If omitted, all bytes after the specified offset are set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [buffer](https://create.roblox.com/docs/reference/engine/libraries/buffer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
