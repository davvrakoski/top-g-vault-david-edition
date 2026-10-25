---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Dirty Flags and task.defer - Coalescing Many Changes into One Update"
tags: [roblox, community-knowledge, performance, optimization, task-library, batching]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/libraries/task
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/scripting/events/deferred
  - https://gameprogrammingpatterns.com/dirty-flag.html
---
# Dirty Flags and task.defer - Coalescing Many Changes into One Update

A lot of wasted frame time comes from doing the same rebuild many times when once would do. An inventory gets 12 items in one server message, and the UI rebuilds the grid 12 times. A stats table changes 5 values, and 5 `Changed` handlers each recompute the derived damage number. The fix is the classic **dirty flag** pattern (Robert Nystrom, *Game Programming Patterns*): mark "needs update" when data changes, and do the expensive work once, later. In Luau the "later" is usually `task.defer`, which queues a function to run at the end of the current resumption cycle, still inside the same frame.

## The pattern

```lua
local dirty = false

local function rebuild()
    dirty = false
    renderInventoryGrid(inventoryState)  -- the expensive part
end

local function markDirty()
    if dirty then return end   -- already queued
    dirty = true
    task.defer(rebuild)
end

-- Any number of changes in this frame trigger only one rebuild
for _, item in incomingItems do
    table.insert(inventoryState, item)
    markDirty()
end
```

Why it works:
- `task.defer` runs the callback after the currently running code yields or finishes, but **before the frame moves on**, so the player never sees a half-updated state.
- The `dirty` guard makes every call after the first a cheap boolean check.

## Choosing the delay

| Function | Runs | Use for |
|---|---|---|
| `task.defer(f)` | End of the current resumption point, same frame | UI rebuilds, derived stats, re-sorting a list |
| `task.delay(0, f)` / `task.wait()` | Next Heartbeat step | Spreading work across frames |
| `task.delay(0.25, f)` | After a debounce window | Search boxes, saving settings, network flushes |

For network sends, a slightly longer window is often better: collect changes for 0.1-0.25 s and send one remote. See [[Remote Send Rate - Batching, Deltas and When One Remote Is Not Faster]].

## Where the engine already defers

With `Workspace.SignalBehavior = Deferred`, engine events (`Changed`, `ChildAdded`, `Touched`) are also queued and fired at resumption points rather than instantly. (The docs say `Default` is currently equivalent to `Immediate` and will eventually become `Deferred`, so opt in now and test.) Two consequences:
- Several property changes on the same object no longer interleave with your handlers mid-function, which already helps batching.
- Do not assume your handler ran right after you set a property. If code depends on that order, restructure it rather than switching the place back to Immediate.

## Dirty sets for many objects

When many objects can be dirty, keep a set instead of one flag:

```lua
local dirtySet: {[Instance]: true} = {}
local queued = false

local function flush()
    queued = false
    for obj in dirtySet do
        refreshVisual(obj)
    end
    table.clear(dirtySet)   -- reuse the table, no new allocation
end

local function markObjectDirty(obj: Instance)
    dirtySet[obj] = true
    if not queued then
        queued = true
        task.defer(flush)
    end
end
```

`table.clear` keeps the table's memory for next time, which reduces garbage (see [[Luau GC Pressure - What Allocates and How to Cut It]]).

## Pitfalls

- **Handlers that keep re-triggering each other** hit the deferred-events re-entrancy limit (10 levels deep, per the "Deferred engine events" doc) and get cut off. Clear the flag first, and do not mark dirty from inside `rebuild` unless that is intentional.
- **Errors inside the flush** leave `dirty` stuck at `true` if you clear it at the end. Clear it at the start, as above.
- **Destroyed objects** in a dirty set: check `obj.Parent` (or use a weak-keyed table) before touching them.

## Related
[[Optimization - Hub]] - [[Coroutines vs the task Library]] - [[Luau GC Pressure - What Allocates and How to Cut It]] - [[Fixed-Rate Scheduler]]
