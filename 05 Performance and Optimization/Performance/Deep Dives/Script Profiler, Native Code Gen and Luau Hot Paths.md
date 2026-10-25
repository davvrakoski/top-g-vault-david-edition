---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Script Profiler, Native Code Gen and Luau Hot Paths"
tags: [deep-dive, roblox, script-profiler, native-codegen, luau, optimization, cpu]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Script Profiler, Native Code Gen and Luau Hot Paths

**Why this matters:** when the MicroProfiler says "scripts are the problem", you need to know *which function* and *why it is slow*, and most Luau slowness comes from a handful of patterns (engine calls in loops, per-frame allocation, doing work too often) that are cheap to fix once you can see them.
This note covers the Script Profiler workflow, a micro-benchmark harness, the hot-path rules that actually matter in Luau, frame-budgeted work spreading, and when native code generation (`--!native`, `@native`) is worth it.

Start from [[MicroProfiler Reading Guide]] to confirm the bottleneck is script time, not physics or rendering.

---

## 1. Script Profiler in the Developer Console

From the Roblox Script Profiler docs:

- Developer Console (`F9`) > **ScriptProfiler**. Choose **Client** (LocalScripts and client-RunContext Scripts) or **Server** (server Scripts).
- Options: frequency **1 kHz** (default) or **10 kHz** (more precise, more overhead); session length 1, 5, 10 minutes or manual; optional live polling.
- It records **CPU time** of Luau functions, method calls and property accesses. **Sleeping or waiting threads are not recorded**, so a function that yields for 5 seconds but computes for 1 ms shows 1 ms.
- Views: **Callgraph** (tree grouped by frame task, for example `Heartbeat/<your function>`; hover for file and line) and **Functions** (flat list). Units in ms or %, with optional averaging (per second/minute).
- **Export** to JSON to keep before/after sessions.
- Natively compiled functions are marked in the profiler; if a `@native` function is not marked, something de-optimised it.

Workflow: record 1 minute of the worst realistic gameplay, open **Functions**, sort by time, take the top three, and read their code with the rules below in mind.

---

## 2. Measure with a micro-benchmark, not intuition

Before "optimising" a function, time it in isolation:

```luau
--!strict
-- Run in a Studio server or command bar. Results vary by machine; compare A vs B
-- on the same machine in the same session.
local function bench(label: string, iterations: number, fn: () -> ())
	for _ = 1, math.min(1000, iterations) do
		fn() -- warm-up
	end
	local start = os.clock()
	for _ = 1, iterations do
		fn()
	end
	local elapsed = os.clock() - start
	print(("%-28s %8.3f us/iter"):format(label, elapsed / iterations * 1e6))
end

local part = Instance.new("Part")
local cachedPosition = part.Position

bench("read part.Position", 200000, function()
	local _ = part.Position
end)
bench("read cached local", 200000, function()
	local _ = cachedPosition
end)
```

`os.clock()` is the high-resolution CPU-time clock intended for benchmarking. Always compare alternatives on the same machine, and remember a function called 10 times a frame is not worth a 20% micro-gain; one called 10,000 times a frame is.

---

## 3. Hot-path rules that matter in Luau

### 3.1 Engine calls are expensive; Luau math is cheap

Reading or writing an Instance property, calling an Instance method (`FindFirstChild`, `GetChildren`, `GetAttribute`), or firing a signal crosses from Luau into the engine. Inside a loop over hundreds of objects per frame, that bridge cost dominates.

```luau
-- Slow: three engine reads per NPC per frame, plus a lookup.
for _, npc in npcs do
	local root = npc:FindFirstChild("HumanoidRootPart")
	if root and (root.Position - target.Position).Magnitude < root.Size.X * 10 then
		-- ...
	end
end

-- Faster: resolve references once (on spawn), read each property once per frame,
-- keep constants in Luau.
for _, entry in npcEntries do -- entry = { root = BasePart, range = number }
	local offset = entry.root.Position - targetPosition -- targetPosition read once outside
	if offset.Magnitude < entry.range then
		-- ...
	end
end
```

### 3.2 Vector3 math is allocation-free; CFrame math is not

In Roblox's Luau, `Vector3` is a native value type: creating and combining Vector3s does not allocate garbage. `CFrame` is a heap object; each `CFrame * CFrame` allocates. In hot loops, do positional math with Vector3 and build a CFrame only when you finally assign one.

Prefer `offset:Dot(offset) < range * range` over `offset.Magnitude < range` when you only compare distances; it skips a square root.

### 3.3 Do not allocate per frame

Every table, closure and string created in a per-frame path becomes garbage, and the `GC` label grows in the MicroProfiler.

```luau
-- Allocates a new table every frame:
RunService.Heartbeat:Connect(function()
	local nearby = {}
	-- fill nearby...
end)

-- Reuses one table:
local nearby: { Model } = table.create(64)
RunService.Heartbeat:Connect(function()
	table.clear(nearby) -- keeps capacity, no new allocation
	-- fill nearby...
end)
```

Also avoid: `GetChildren()`/`GetDescendants()`/`GetTagged()` every frame (each returns a fresh array; maintain your own set via events instead), building strings with `..` for debug text every frame, and creating closures inside loops.

### 3.4 Pre-size tables you fill in bulk

`table.create(n)` pre-allocates the array part, avoiding repeated growth when you know the size.

### 3.5 Localising globals: mostly unnecessary now

Luau already optimises access to builtins like `math.sqrt` and `table.insert` (imports and fast calls), so `local sqrt = math.sqrt` rarely matters. Caching **services** and **instances** in locals still matters, because those are engine lookups.

### 3.6 Do it less often

The biggest wins are rarely micro-optimisations:

| Work | Often fine at |
| --- | --- |
| Player input, camera | Every frame |
| Nearby NPC AI decisions | 5-10 Hz |
| Distant NPC AI | 1-2 Hz or sleep |
| Leaderboard UI refresh | 1 Hz or on change |
| Proximity checks for prompts/quests | 4-5 Hz |

Use a fixed-rate scheduler and spread entities across ticks ([[Fixed-Rate Scheduler]]). Use spatial structures instead of all-pairs checks ([[Spatial Hash for Nearby Queries]]).

---

## 4. Spreading big jobs across frames

A job that takes 40 ms causes a visible hitch. The same job split into 2 ms slices over 20 frames is invisible.

```luau
--!strict
local RunService = game:GetService("RunService")

local FRAME_BUDGET = 0.002 -- seconds of work per frame for this queue
local jobs: { () -> () } = {}

local WorkQueue = {}

function WorkQueue.push(job: () -> ())
	table.insert(jobs, job)
end

RunService.Heartbeat:Connect(function()
	if #jobs == 0 then
		return
	end
	debug.profilebegin("WorkQueue")
	local start = os.clock()
	local i = 1
	while i <= #jobs and os.clock() - start < FRAME_BUDGET do
		local ok, err = pcall(jobs[i])
		if not ok then
			warn("[WorkQueue] job failed:", err)
		end
		i += 1
	end
	-- Remove completed jobs in one move (keeps FIFO order).
	local n = #jobs
	table.move(jobs, i, n, 1) -- shift jobs[i..n] down to jobs[1..n-i+1]
	for k = n - i + 2, n do
		jobs[k] = nil -- clear the now-duplicated tail
	end
	debug.profileend()
end)

return WorkQueue
```

Use it for procedural generation chunks, mass cloning at round start, rebuilding large UI lists, and save serialisation. Each job must be small (well under the budget) for the budget to mean anything. The `table.move` step shifts the remaining jobs to the front and clears the tail, avoiding `table.remove(jobs, 1)` in a loop (which is O(n) per removal).

---

## 5. Native code generation

From the Roblox native code generation docs:

- Add `--!native` at the top of a script to compile its functions to machine code when profitable, or `@native` before individual functions. Behaviour is identical; only speed changes. The documentation describes it for **server-side scripts**.
- Best for **heavy computation inside Luau**: math on numbers, vectors and especially `buffer`s; procedural generation; pathfinding helpers; physics-like simulation; compression/packing ([[Buffers and Bit Packing for Network Payloads]]).
- Only **functions** are compiled; top-level code that runs once gains little.
- **Type annotations help**: native code specialises on declared types, and Roblox specifically recommends annotating `Vector3` parameters (`function f(v: Vector3)`), otherwise the compiler assumes a table and adds checks. Passing wrong types to typed functions can de-optimise.
- De-optimisers to avoid: `getfenv`/`setfenv`, builtins called with non-numeric arguments, mismatched argument types. Breakpoints disable native execution for those functions.
- Costs: compile time at server startup, extra memory, and a **game-wide limit on native code size**. Past the limit, remaining code runs interpreted. `debug.dumpcodesize()` (Studio command bar, server view) reports what is compiled and how close you are to the limit.
- Internal limits on very large functions (instruction and block counts) produce Output errors; split huge functions.

Example: a terrain noise sampler that benefits:

```luau
--!strict
@native
local function fractalNoise(x: number, z: number, octaves: number, seed: number): number
	local total, amplitude, frequency, maxValue = 0, 1, 1 / 64, 0
	for _ = 1, octaves do
		total += math.noise(x * frequency, z * frequency, seed) * amplitude
		maxValue += amplitude
		amplitude *= 0.5
		frequency *= 2
	end
	return total / maxValue
end
```

Policy: do **not** put `--!native` on every script "just in case". Mark only the functions the Script Profiler shows as hot, measure with and without, and keep the change if it is a clear win. Combine with Parallel Luau when the work is also independent per entity ([[Parallel Luau Actors - A Worked Example]]).

---

## 6. A worked triage

Symptom: server heartbeat drops from 60 to 40 when 120 NPCs are active.

1. MicroProfiler (server dump): wide script label `NpcController` under `Heartbeat`.
2. Script Profiler (server, 1 minute): `updateNpc` 61% of script time; inside it `FindFirstChild` and `GetAttribute` calls dominate, plus `CFrame` construction.
3. Fixes: cache root parts and config at spawn; replace attribute reads with Luau fields; Vector3 math; run decisions at 10 Hz with entities spread across ticks; distant NPCs at 1 Hz.
4. Result recorded: `updateNpc` time per second down 80%, heartbeat back at 60 with 120 NPCs. Native was tried on the math helper and gave a further small gain, kept.

Write this kind of entry in the performance log every time ([[Performance Log Template]]).

---

## Common mistakes

- Optimising code the profilers did not flag.
- Benchmarking in different sessions or machines and comparing the numbers.
- Reading Instance properties and calling `FindFirstChild` inside per-frame loops.
- Building new tables, closures or strings every frame.
- Calling `GetDescendants()`/`GetTagged()` every frame.
- `table.remove(t, 1)` in a loop over a long queue.
- Applying `--!native` everywhere and hitting the native code size limit.
- Untyped `Vector3` parameters in native functions.
- Running everything at 60 Hz because it is the default.

## Checklist

- [ ] MicroProfiler confirms script time is the bottleneck.
- [ ] Script Profiler session recorded and exported before changes.
- [ ] Top functions reviewed for engine calls in loops, allocation and frequency.
- [ ] Large jobs run through a frame-budgeted queue.
- [ ] Native code only on measured hot functions, with typed parameters; `debug.dumpcodesize()` checked.
- [ ] After-session recorded; improvement written to the performance log.

**Related:** [[Performance - Hub]] · [[Performance and Profiling]] · [[Fixed-Rate Scheduler]] · [[Spatial Hash for Nearby Queries]] · [[Performance Engineering Operating System]]
