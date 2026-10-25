---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Luau GC Pressure - What Allocates and How to Cut It"
tags: [roblox, community-knowledge, performance, luau, garbage-collection, memory]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://luau.org/performance
  - https://rfcs.luau.org/function-table-clear.html
  - https://devforum.roblox.com/t/empty-tables-consuming-memory/3790550
  - https://devforum.roblox.com/t/auto-clear-table/1921063
  - https://create.roblox.com/docs/studio/optimization/memory-usage
---
# Luau GC Pressure - What Allocates and How to Cut It

Luau's garbage collector rarely causes a single dramatic freeze, but code that allocates heavily every frame pays for it twice: once to build the garbage and again in collector work that the engine interleaves with your scripts. On phones this shows up as a steady few milliseconds of script time that never goes away. The fix is not "avoid tables"; it is knowing which lines allocate in hot paths (per-frame loops, per-bullet code, per-NPC updates) and changing just those.

## How the Luau collector works (luau.org Performance page)

- It is **incremental**: it never stops to scan the whole heap at once.
- Code that allocates performs **GC assists**, so the more you allocate, the more collection work lands inside your own script time.
- The runtime estimates allocation rate and paces the collector toward a heap size target relative to live data. With steady allocation, Roblox can do much of the work outside script execution, but a high allocation rate still means more total GC work.

## What allocates

| Code | Allocates? | Note |
| --- | --- | --- |
| `Vector3` math (`a + b`, `v * 2`) | No | Native vector type; the luau.org page says this cuts GC pressure |
| Number math, comparisons | No | |
| `{}` or `{x = 1}` table literal | Yes | New table each time it runs |
| `function() ... end` inside a loop or function | Usually | New closure per run, unless it has no upvalues or only module-level constant upvalues (then the compiler caches it) |
| Closure capturing a variable that is later reassigned | Yes, extra | Mutable upvalues need a separate object |
| `str .. other` | Yes | New string each time; repeated `..` in a loop builds many intermediates |
| `string.format`, `tostring` | Yes | New string |
| `CFrame` math | Yes | CFrame is userdata, unlike Vector3 |
| `table.pack(...)`, `{...}` | Yes | |
| `pcall(function() ... end)` in a hot loop | Yes | The closure; pass a function reference plus arguments instead |

## Fixes that matter in hot paths

```lua
-- 1) Reuse scratch tables instead of building new ones each frame.
local scratch = table.create(64)
local function collectTargets(enemies)
    table.clear(scratch)            -- keeps capacity, no new table
    for _, e in enemies do
        if e.alive then scratch[#scratch + 1] = e end
    end
    return scratch                  -- caller must not keep it past this frame
end

-- 2) Hoist closures out of loops.
local function byDistance(a, b) return a.dist < b.dist end
table.sort(list, byDistance)        -- instead of table.sort(list, function(a, b) ... end)

-- 3) pcall without a new closure.
local ok, err = pcall(doWork, arg1, arg2)

-- 4) Build long strings with a buffer table once, not with .. in a loop.
local parts = table.create(#rows)
for i, row in rows do parts[i] = row.name end
local text = table.concat(parts, "\n")
```

- `table.clear` (implemented per the Luau RFC) empties a table but keeps its allocated capacity, which makes reuse cheap. A DevForum thread (3790550) notes the flip side: a cleared big table still holds its memory until the table itself is collected.
- `table.create(n)` preallocates arrays when the size is known; for object-like tables, write all fields in one literal (`{a = 1, b = 2}`) so Luau can use its template optimization.
- Keep using `obj:Method()`; the luau.org page says caching methods in locals is not productive, and deep `__index` chains are slower than a flat class table.

## Measuring before you change anything

1. **Developer Console > Memory > LuauHeap** over a few minutes: a sawtooth (rise, drop) is normal GC; a rising floor is a leak, not GC pressure.
2. **MicroProfiler**: look for GC work appearing inside your script labels in busy frames.
3. **`collectgarbage("count")`** in a quick test harness: run a function 10,000 times and compare KB before and after to see how much it allocates per call (the only option Roblox allows is `"count"`).
4. Fix the top allocator, measure again. Most code is not hot; do not rewrite cold paths.

## Pitfalls

- Reusing a scratch table that a caller stored: return copies (or document "valid until next call").
- Pooling every small table can cost more than allocating; reuse only in measured hot paths.
- Converting Vector3 math to separate numbers for "speed" is no longer needed and hurts readability.
- `task.spawn`/`task.defer` create threads; spawning one per bullet per frame is a hidden allocator.

## Related
[[Performance - Hub]] · [[Script Profiler, Native Code Gen and Luau Hot Paths]] · [[Developer Console Memory Categories Explained]] · [[Weak Tables and Instance Caches in Luau]]
