---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Weak Tables and Instance Caches in Luau"
tags: [roblox, community-knowledge, optimization, luau, memory, garbage-collection]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://luau.org/library
  - https://www.lua.org/manual/5.1/manual.html#2.10.2
  - https://devforum.roblox.com/t/understanding-mode/3117498
  - https://devforum.roblox.com/t/how-to-tell-if-object-has-been-garbage-collected/2302267
  - https://devforum.roblox.com/t/374954
---
# Weak Tables and Instance Caches in Luau

Most Roblox memory leaks are not engine bugs; they are tables that remember things forever. A `cooldowns[player]` entry after the player left, a `cache[model]` entry after the model was destroyed, a lookup from parts to NPC objects that outlives the round. Weak tables let the garbage collector drop entries whose keys or values nobody else uses. They are a safety net for caches, not a replacement for cleanup.

## How weak tables work

A table becomes weak when its metatable has a `__mode` field (Lua 5.1 manual, which Luau follows here):

| `__mode` | Weak part | Entry is removed when |
| --- | --- | --- |
| `"k"` | keys | the key object is no longer referenced elsewhere |
| `"v"` | values | the value object is no longer referenced elsewhere |
| `"kv"` | both | either side is unreferenced |

Only collectable objects (tables, functions, userdata such as Instances, threads) can disappear. Strings, numbers and booleans are never removed. Luau also accepts an `"s"` flag that lets a weak table shrink after collection (DevForum "Understanding __mode", 3117498).

## The Instance catch

Instances are userdata, so they work as weak keys and values. But a **live Instance is referenced by the DataModel**: anything parented under `game` stays reachable, so a weak table will not drop it. Only after the Instance is destroyed (or parented to nil) and your other references are gone can the entry vanish. A DevForum post in "Understanding __mode" demonstrates exactly this: a Folder disappeared from a weak table after being unparented, but not while it was still under `workspace`.

There is also no promise about **when** collection happens; the forum threads (2302267) stress that entries can linger until the collector runs under memory pressure. Never use "is it still in the weak table" as game logic.

## Good uses

```lua
-- 1) Metadata keyed by instances, cleaned up automatically after Destroy.
local npcData = setmetatable({}, { __mode = "k" })
npcData[model] = { spawnTime = os.clock(), lootTier = 2 }

-- 2) A memo cache whose values can be rebuilt on demand.
local pathCache = setmetatable({}, { __mode = "v" })
local function getPath(key: string, build: () -> any)
    local p = pathCache[key]
    if p == nil then
        p = build()
        pathCache[key] = p
    end
    return p
end
```

Case 1 is the most useful: it stops a forgotten `npcData[model] = nil` from leaking a table per dead NPC.

## Bad uses

- **Player data keyed by Player with `"k"`:** the Player object stays referenced while connections or other tables hold it. Clean it explicitly in `PlayerRemoving`. Many teams key by `UserId` (a number), which a weak table cannot clean at all, so explicit cleanup is mandatory there.
- **Weak tables holding RBXScriptConnections:** a dropped connection object does not disconnect the signal. Disconnect, or use a cleanup library (Trove, Maid, Janitor).
- **Relying on it to free memory quickly:** collection timing is not controlled by you.

## Measuring

- `collectgarbage("count")` returns the Luau heap size in kilobytes. In Roblox, only `"count"` is allowed; other options such as `"collect"` error (DevForum 374954 and later threads).
- In the Developer Console memory view, watch `LuauHeap` (see the memory categories note) over a 20-minute session with players joining and leaving. Steady growth after rounds reset points at tables that remember too much.
- The `__gc` metamethod is not available in Luau, so there is no finalizer hook.

## Checklist for every module that stores per-object data

- [ ] What removes the entry? (Destroying, PlayerRemoving, round end)
- [ ] If nothing explicit does, is the table weak on the right side?
- [ ] Are connections stored with the data disconnected on cleanup?
- [ ] Keys are objects, not strings built from names (`model.Name` collides and never collects)

## Related
[[Optimization - Hub]] · [[Memory Leaks and Lifecycle Management]] · [[Developer Console Memory Categories Explained]] · [[Signals, Promises and Cleanup Libraries - Community Picks]]
