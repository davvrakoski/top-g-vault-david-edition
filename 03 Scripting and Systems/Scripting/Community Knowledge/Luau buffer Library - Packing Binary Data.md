---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Luau buffer Library - Packing Binary Data"
tags: [roblox, community-knowledge, scripting, luau, buffer, networking, serialization]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/libraries/buffer
---
# Luau buffer Library - Packing Binary Data

A `buffer` is a fixed-size block of raw bytes you read and write by offset. It replaces old `string.pack` tricks and is what modern networking libraries (Blink, Zap, ByteNet and others) build on. You rarely need it for small games, but when you replicate hundreds of positions per second, save large voxel or build-mode grids, or hand-roll a compact protocol, a buffer can cut payload size several times over compared to tables of numbers.

## The facts that matter (from the official reference)

- `buffer.create(size)` makes a zeroed block. Max size is 1 GiB (1,073,741,824 bytes).
- Offsets start at **0**, not 1. Reading or writing past the end **throws an error**.
- Integer and float reads/writes are **little-endian**.
- Typed functions: `readi8/u8`, `readi16/u16`, `readi32/u32`, `readf32`, `readf64` and the matching `write*`.
- `readstring(b, offset, count)` / `writestring(b, offset, value, count?)` copy raw bytes; `buffer.tostring` / `buffer.fromstring` convert the whole block.
- `buffer.copy` and `buffer.fill` move or set ranges; `buffer.len` gives the size.
- Bit-level: `buffer.readbits(b, bitOffset, bitCount)` / `writebits` handle 0-32 bits at a bit offset, which lets you pack flags and small integers tightly.
- When a buffer goes through a RemoteEvent or other Roblox API, the receiver gets a **copy**; identity is not preserved. A buffer cannot be shared between Actor scripts (Parallel Luau).

## Choosing a number type

| Data | Type | Bytes | Range / precision |
| --- | --- | --- | --- |
| Booleans/flags | `writebits` 1 bit each | 1/8 | 8 flags per byte |
| Small enum, item id < 256 | `u8` | 1 | 0 to 255 |
| Health, ammo, id < 65,536 | `u16` | 2 | 0 to 65,535 |
| Signed offset (cm) | `i16` | 2 | -32,768 to 32,767 |
| World position axis | `f32` | 4 | ~7 significant digits |
| Timestamps, currency totals | `f64` | 8 | exact integers up to 2^53 |

Quantize when you can: a yaw angle stored as `u16` (`angle / (2*pi) * 65535`) is accurate to about 0.0055 degrees for 2 bytes instead of 8.

## Recipe: pack a list of unit snapshots

```lua
-- 2 (id) + 12 (pos) + 2 (yaw) = 16 bytes per unit
local STRIDE = 16

local function packUnits(units: {{id: number, pos: Vector3, yaw: number}}): buffer
	local b = buffer.create(2 + #units * STRIDE)
	buffer.writeu16(b, 0, #units)
	for i, u in units do
		local o = 2 + (i - 1) * STRIDE
		buffer.writeu16(b, o, u.id)
		buffer.writef32(b, o + 2, u.pos.X)
		buffer.writef32(b, o + 6, u.pos.Y)
		buffer.writef32(b, o + 10, u.pos.Z)
		local yaw = (u.yaw % (2 * math.pi)) / (2 * math.pi)
		buffer.writeu16(b, o + 14, math.floor(yaw * 65535 + 0.5))
	end
	return b
end
```

The reader mirrors it exactly. Keep the layout in one shared ModuleScript so client and server cannot drift apart, and add a version byte at offset 0 if the format will ever change (see [[Remote Protocol Versioning]]).

## Strings inside buffers

Strings have variable length, so write the length first:

```lua
local function writeStr(b: buffer, o: number, s: string): number
	buffer.writeu8(b, o, #s) -- max 255 bytes; use u16 for longer
	buffer.writestring(b, o + 1, s)
	return o + 1 + #s -- next free offset
end
```

## Pitfalls

1. **Validate on the server.** A buffer from a client can be any length with any bytes. Check `buffer.len` before every read or wrap reads in `pcall`; an out-of-range read errors and can kill your handler.
2. **f32 is not f64.** Positions far from the origin lose precision; values like money must not be stored as `f32`.
3. **Don't over-engineer.** For a few events per second, plain tables over RemoteEvents are simpler. Profile first; the community comparison [[Buffer Networking Libraries Compared - Blink, Zap, ByteNet, QuickNet, Jolt]] makes the same point.
4. **Unsigned overflow.** Writing 70,000 into a `u16` does not give you 70,000 back. Clamp before writing.

## Related
[[Scripting - Hub]] · [[Remote Protocol Versioning]] · [[Buffer Networking Libraries Compared - Blink, Zap, ByteNet, QuickNet, Jolt]] · [[Parallel Luau Actors - A Worked Example]]
