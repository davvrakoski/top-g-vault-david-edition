---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/sharedtable-actor-benchmarks"
title: "SharedTable and Actor Count - Community Benchmarks"
tags: [roblox, community, "cluster/performance-and-security", parallel-luau, actors, benchmarks]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/sharedtable-best-practices/2574316
  - https://devforum.roblox.com/t/are-frozen-sharedtable-reads-faster-than-standard-sharedtable-reads/4762719
  - https://devforum.roblox.com/t/how-do-you-know-how-many-actors-you-should-use-parralel-luau/2698675
  - https://create.roblox.com/docs/reference/engine/datatypes/SharedTable
---
# SharedTable and Actor Count - Community Benchmarks

The vault's worked Actor example covers *how* to use Parallel Luau. This note collects what developers **measured** when they tried it: SharedTable costs and how many Actors to create. These are individual benchmarks, not official numbers. They give you a sense of scale; measure your own game before deciding.

## SharedTable is much slower than a plain table

| Finding | Who / when | Notes |
|---|---|---|
| SharedTable access about **10 to 20x slower** than a regular table; `SharedTable.update` about **90x slower** | chess123mate, Nov 2023 | Command Bar test. Under real multi-thread contention it may be worse. |
| Reads about **10x slower** than normal table reads, roughly on par with Instance property reads | ArticulatedReality, Jul 2026 | Their claim. The benchmark they posted didn't time plain tables. |
| **Frozen** (`SharedTable.cloneAndFreeze`) reads vs normal SharedTable reads: about 1.4 to 2.0e-7 s per read either way | ArticulatedReality, Jul 2026 | The difference was a few ns, and both the author and GrandiusOptimizus judged it **noise**. Don't freeze just for read speed. |
| Single writes about 0.003 to 0.01 ms; batching into a local table and **overwriting once** was up to nearly 325% faster at 16 writes per frame | CompilerError, Sep 2023 | The gain shrank as the cloned table grew larger. |

### What to do with that

- **Minimise SharedTable traffic.** Read it once into locals at the start of a parallel job, and write results once at the end.
- **Write in the serial phase.** Collect changes in a local table while desynchronized, then apply them after `task.synchronize()`.
- **Prefer one flat table over nested tables.** Tomi1231 said merging task parameters into fewer tables "seemed to help a lot."
- **Use plain data in Actor messages** where possible. A job that needs constant cross-Actor sharing may not parallelise well at all (chess123mate).

## How many Actors?

From the *How do you know how many Actors you should use?* thread (Nov 2023, no staff reply):

- **A few entities:** one Actor per entity is fine. The docs encourage using Actors freely.
- **Many entities:** chess123mate suggested roughly **16 to 64 Actors**, with work spread across them. Each Actor is assigned to one of about 16 VMs, and an assignment can't be undone, so more Actors make it less likely one VM gets stuck with most of the work.
- Four Actors per player has no particular benefit.
- Memory: each extra VM costs memory. In chess123mate's tests, script cloning methods (copy-paste, `:Clone()`, ModuleScripts) used similar memory.
- **Client caveat:** Tomi1231 (Sep 2023) said client-side parallel Luau had recently been limited to **3 threads**, and advised against parallel Luau unless benchmarks show a benefit. Check this against current engine behaviour before relying on it.

## A quick benchmark harness (original)

```lua
--!optimize 2
-- Command Bar / server script: compare plain vs SharedTable reads on your hardware.
local N = 1_000_000
local plain = { value = 1 }
local shared = SharedTable.new({ value = 1 })

local t0 = os.clock()
local s = 0
for _ = 1, N do s += plain.value end
local tPlain = os.clock() - t0

t0 = os.clock()
for _ = 1, N do s += shared.value end
local tShared = os.clock() - t0

print(("plain %.2f ns/read | SharedTable %.2f ns/read | ratio %.1fx"):format(
	tPlain / N * 1e9, tShared / N * 1e9, tShared / tPlain))
```

## Credits

DevForum: CompilerError and Tomi1231 (*SharedTable Best Practices*, 2023); ArticulatedReality, GrandiusOptimizus, Happya (*Are Frozen SharedTable Reads Faster...*, 2026); Userneem, chess123mate, NOVEIGMA (*How do you know how many Actors you should use?*, 2023). Roblox Creator Hub *SharedTable* reference (CC BY 4.0). The harness is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Parallel Luau Actors - A Worked Example]] · [[Parallel Luau — When It Helps and When It Hurts]] · [[SharedTable]] · [[Parallel Luau]] · [[Script Profiler, Native Code Gen and Luau Hot Paths]]

<!-- TDOD_GRAPH_END -->
