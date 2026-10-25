---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Table vs buffer for Big In-Memory Data - Grids, Maps and Caches"
tags: [roblox, community-knowledge, optimization, luau, buffer, memory, data-structures]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://luau.org/performance
  - https://create.roblox.com/docs/reference/engine/libraries/buffer
  - https://create.roblox.com/docs/luau/native-code-gen
---
# Speed - Table vs buffer for Big In-Memory Data - Grids, Maps and Caches

When a system holds a lot of numbers (a 512x512 height map, a voxel grid for a building game, a flow field for a horde, a fog-of-war mask), the container you pick decides both memory and speed. Luau tables are flexible but every slot costs a full tagged value. A `buffer` stores raw bytes with no per-element overhead. This note is about data that lives in memory; for network payloads see [[Luau buffer Library - Packing Binary Data]].

## The memory math

From the Luau performance guide: Luau stores every value with a type tag, and because it must hold 64-bit doubles and 64-bit pointers it does not use NaN boxing, so **each value costs 16 bytes**. An array-part table of N numbers is therefore about 16 x N bytes, plus table header and growth slack. Hash-part tables (string or sparse keys) cost more per entry, because each node stores a key and a value.

A buffer costs exactly the bytes you ask for (size limit 1 GiB per buffer, per the reference).

| Data: 512 x 512 = 262,144 cells | Container | Approx memory |
|---|---|---|
| height as number | array table | ~4 MB (16 B/cell) |
| height as f32 | buffer | ~1 MB |
| height as u16 (fixed point) | buffer | ~512 KB |
| walkable flag | array table of booleans | ~4 MB |
| walkable flag | buffer, 1 bit per cell | ~32 KB |
| nested `grid[x][y]` tables | 512 inner tables | ~4 MB + 512 table headers |

The table rows follow from the 16-byte rule and are approximate; measure your own with the LuauHeap view in the Developer Console.

## Speed considerations

- **Reads and writes**: `buffer.readu16(b, offset)` is a builtin call; a table index is a VM instruction. In interpreted code a table index is usually as fast or faster. Under `--!native`, buffer access is one of the things native codegen is called out as speeding up, so a hot loop over a buffer in a native function can beat tables.
- **GC**: a buffer is one object; the collector never walks its contents. A table of 262,144 numbers is also one object, but a table of tables (`grid[x][y]`) is many objects and costs GC marking time.
- **Copying and snapshotting**: `buffer.copy` moves a whole block at once; copying a table is a Luau loop.
- **Flexibility**: tables hold any type and grow freely. Buffers are fixed size (make a bigger one and `buffer.copy` to grow) and hold only numbers and raw strings.

## Indexing pattern: flat 2D grid

Always flatten. One flat array beats nested tables in both containers.

```lua
--!native
local W, H = 512, 512
local heights = buffer.create(W * H * 2) -- u16 per cell

local function idx(x: number, y: number): number
	return ((y * W) + x) * 2 -- byte offset, 0-based x,y
end

local function setHeight(x: number, y: number, h: number)
	buffer.writeu16(heights, idx(x, y), math.clamp(h * 100, 0, 65535))
end

local function getHeight(x: number, y: number): number
	return buffer.readu16(heights, idx(x, y)) / 100
end
```

## Decision guide

- **Fewer than ~10,000 entries, mixed types, or changes shape often**: table. Simpler, debuggable, fast enough.
- **Large, fixed-size, numeric, read in hot loops**: buffer, flat indexed, with typed helpers; consider `@native` on the helpers.
- **Sparse world data** (most cells empty): neither flat form; use a table keyed by chunk, each chunk a small buffer. See [[Spatial Hash for Nearby Queries]].
- **Instances** (Parts, Models): must stay in tables; a buffer cannot hold references.

## Pitfalls

- Off-by-one byte offsets: with u16 or f32 every cell is 2 or 4 bytes; forgetting the multiply silently corrupts neighbours.
- Out-of-range writes error (they do not wrap), and values out of a type's range wrap or truncate; clamp first.
- f32 loses precision on large numbers; store world positions relative to a chunk origin.
- Converting to buffers before measuring. Memory under 1 MB for a structure is rarely your problem.

## Related
[[Optimization - Hub]] · [[Luau GC Pressure - What Allocates and How to Cut It]] · [[Weak Tables and Instance Caches in Luau]] · [[Flow Fields for Large Hordes]]
