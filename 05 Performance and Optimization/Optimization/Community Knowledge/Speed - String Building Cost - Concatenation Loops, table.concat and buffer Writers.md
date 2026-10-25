---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - String Building Cost - Concatenation Loops, table.concat and buffer Writers"
tags: [roblox, community-knowledge, optimization, luau, strings, garbage-collection]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://luau.org/performance
  - https://create.roblox.com/docs/luau/strings
  - https://create.roblox.com/docs/reference/engine/libraries/buffer
  - https://create.roblox.com/docs/reference/engine/libraries/table
---
# Speed - String Building Cost - Concatenation Loops, table.concat and buffer Writers

Strings in Luau are immutable and interned: every `a .. b` makes a brand-new string and copies both sides into it. That is fine for a label, but building a big string piece by piece in a loop (a save-file export, a debug dump, a chat log, a serialized map) copies the growing result again on every step. The cost grows with the square of the final length and produces a burst of garbage. This note shows the three ways to build strings and when each is right.

## Why the loop is quadratic

Appending a 20-byte piece 5,000 times with `s = s .. piece`:

- Step 1 copies 20 bytes, step 2 copies 40, step 5,000 copies 100,000.
- Total bytes copied is about 20 x 5,000^2 / 2 = 250 MB for a 100 KB result.
- Every intermediate string is garbage that the incremental GC must later sweep.

The same 100 KB built with `table.concat` copies each piece about twice (into the table slot reference, then once into the final string).

## Method 1: `..` and interpolation (small, fixed strings)

```lua
label.Text = `Coins: {coins}  Level: {level}`
```

Perfect for a handful of parts. A chain `a .. b .. c` in one expression compiles to a single multi-operand concat instruction, and an interpolated string becomes one formatting call, so a one-line expression is not quadratic. Only repeated appends to the same variable across loop iterations are.

## Method 2: `table.concat` (variable-length text)

```lua
local parts = table.create(#entries)
for i, e in entries do
	parts[i] = `{e.name}={e.value}`
end
local text = table.concat(parts, "\n")
```

- Pre-size with `table.create` when you know the count (Luau guide recommends it for array tables filled in bulk).
- Use the separator argument instead of inserting separator strings.
- Reuse the `parts` table with `table.clear(parts)` if you build every frame, to avoid re-allocating it.

## Method 3: a buffer writer (large or binary output)

When the result is big (tens of KB or more) or you are writing a compact format, write bytes into a buffer and convert once.

```lua
local function newWriter(capacity: number)
	return { b = buffer.create(capacity), n = 0 }
end

local function writeString(w, s: string)
	local len = #s
	if w.n + len > buffer.len(w.b) then
		local bigger = buffer.create(math.max(buffer.len(w.b) * 2, w.n + len))
		buffer.copy(bigger, 0, w.b, 0, w.n)
		w.b = bigger
	end
	buffer.writestring(w.b, w.n, s)
	w.n += len
end

local function finish(w): string
	return buffer.readstring(w.b, 0, w.n)
end
```

Doubling the capacity keeps total copying linear. `buffer.tostring` returns the whole buffer, so use `readstring` with the written length when the buffer is larger than the content.

## Choosing

| Situation | Use |
|---|---|
| UI text, log line, one expression | interpolation or `..` |
| Building N lines in a loop | `table.concat` |
| Large export, binary format, very hot path | buffer writer |
| Text sent to a TextLabel every frame | none: only rebuild when the value changed |

## Measuring

Wrap each version in `debug.profilebegin("build")` / `debug.profileend()` and compare in the MicroProfiler, or time 1,000 runs with `os.clock()` in Studio. Watch the LuauHeap line in the Developer Console for the GC spike the loop version creates.

## Pitfalls

- `string.rep` and `string.format` are already efficient; do not hand-roll them.
- `HttpService:JSONEncode` builds its string natively; do not replace it with a Luau serializer for speed without measuring.
- Very long strings in DataStores still count against the 4,194,304-character value limit, however you build them.

## Related
[[Optimization - Hub]] · [[Luau String Interpolation and Formatting Recipes]] · [[Luau GC Pressure - What Allocates and How to Cut It]] · [[Speed - Table vs buffer for Big In-Memory Data - Grids, Maps and Caches]]
