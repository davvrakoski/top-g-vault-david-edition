---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Parallel Luau Actors - A Worked Example"
tags: [deep-dive, roblox, parallel-luau, actors, sharedtable, performance]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Parallel Luau Actors - A Worked Example

**Why this matters:** when 200 NPCs each raycast to every player ten times a second, the serial Luau thread becomes the frame-time bottleneck, and Parallel Luau is the only way to use the other CPU cores.
Most tutorials stop at "put a script in an Actor and call `task.desynchronize()`"; this note builds a complete, measurable NPC line-of-sight system with a coordinator, a worker pool, SharedTables and a serial apply phase.

For the decision of *whether* to go parallel at all, read [[Parallel Luau — When It Helps and When It Hurts]] first. Rule: profile, prove the hot path is pure computation, then parallelise.

---

## 1. Facts you must design around

These come from the Roblox Parallel Luau and `Actor` reference docs:

- **Each Actor runs its own Luau VM.** ModuleScripts required inside an Actor are a **separate copy** with separate module state. A "shared" cache module is not shared across Actors.
- Scripts in the **same** Actor run serially relative to each other. You need **multiple Actors** to get parallelism. Roblox recommends more Actors than cores for load balancing (their raycast example suggests 64+ even for 4-core targets), but split by logical unit, not arbitrarily.
- In a parallel phase you can call **Safe** APIs and read **Read Safe** properties. `WorldRoot:Raycast`, `Spherecast` and `GetPartBoundsInRadius` are Safe; `BasePart.Position`/`CFrame` are Read Safe; `Instance:SetAttribute` and most property writes are **Unsafe** and need `task.synchronize()` first. Check the `thread_safety` tag on every API you call; untagged means Unsafe.
- You **cannot `require()` in a parallel phase.** Require everything at the top of the script, in serial.
- `Actor:SendMessage(topic, ...)` arguments are **copied** across VMs. Large Luau tables cost a full copy per message. A **`SharedTable`** is passed by reference and supports atomic per-element updates, so use it for bulk data.
- SharedTable keys must be strings or non-negative integers below 2^32; values must be booleans, numbers, vectors (Vector3), strings, nested SharedTables, or serializable data types. No Instances, no functions.

---

## 2. The architecture

```
          SERIAL (main VM)                         PARALLEL (worker VMs)
 Heartbeat, every 0.1 s:
 1. apply previous results  <-----------------  output SharedTable
    (SetAttribute, AI state)                          ^
 2. snapshot NPC + player positions                   |  write output[i]
    into a new input SharedTable                      |
 3. SendMessage("Sense", input, output, i..j) ---> 16 Actors, each:
                                                  BindToMessageParallel:
                                                  raycasts for NPCs i..j
```

Key idea: **the parallel phase only reads a snapshot and writes plain numbers.** All Instance mutation happens in the serial apply step on the next tick. This avoids synchronising in the middle of parallel work, which is where most of the speedup gets lost.

Results are one tick (100 ms) late. For sensing and AI decisions that is invisible; for anything that must be frame-exact (hit registration) use the per-request pattern in section 6 instead.

---

## 3. Setup in Explorer

```
ServerScriptService/
  NpcSensing/                    (Folder)
    SensingCoordinator           (Script, enabled)
      SensingWorker              (Script, Enabled = false, used as a template)
Workspace/
  Map/                           (Folder: walls, floors; anything that blocks sight)
  NPCs tagged "SensingNpc"       (Models with a PrimaryPart)
```

---

## 4. The worker (runs inside each Actor)

```luau
--!strict
-- SensingWorker (Script). Cloned into each Actor by the coordinator.
local Workspace = game:GetService("Workspace")
local SharedTableRegistry = game:GetService("SharedTableRegistry")

local SIGHT_RANGE = 120

local actor = script:GetActor()
assert(actor, "SensingWorker must run inside an Actor")

-- Serial setup: build RaycastParams once, outside the parallel callback.
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = { Workspace:WaitForChild("Map") }

actor:BindToMessageParallel("Sense", function(input: SharedTable, output: SharedTable, first: number, last: number)
	debug.profilebegin("NpcSensing.Worker")

	local npcPos = input.npcPos :: SharedTable
	local playerPos = input.playerPos :: SharedTable
	local playerId = input.playerId :: SharedTable
	local playerCount = input.playerCount :: number

	for i = first, last do
		local origin = npcPos[i] :: Vector3
		local bestDist = SIGHT_RANGE
		local bestTarget = 0

		for p = 1, playerCount do
			local target = playerPos[p] :: Vector3
			local offset = target - origin
			local dist = offset.Magnitude
			if dist < bestDist then
				-- Include-filter on Map only: a hit means a wall is in the way.
				local blocked = Workspace:Raycast(origin, offset, params)
				if not blocked then
					bestDist = dist
					bestTarget = playerId[p] :: number
				end
			end
		end

		output[i] = bestTarget -- atomic per-element write; workers own disjoint ranges
	end

	debug.profileend()
end)

-- Tell the coordinator this worker is bound and ready.
local state = SharedTableRegistry:GetSharedTable("NpcSensingState")
SharedTable.increment(state, "ready", 1)
```

Notes:

- Distance is checked **before** the raycast, so the expensive call only runs for candidates closer than the current best. Cheap rejection first is the same principle as on a single thread.
- Each worker writes only its own index range, so there is no contention on `output`.
- `debug.profilebegin` works in parallel code; the label shows up on worker threads in the MicroProfiler ([[MicroProfiler Reading Guide]]).

---

## 5. The coordinator (serial, main VM)

```luau
--!strict
-- SensingCoordinator (Script)
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SharedTableRegistry = game:GetService("SharedTableRegistry")

local NUM_WORKERS = 16
local TICK = 0.1

local template = script:WaitForChild("SensingWorker") :: Script

-- 1. Spawn the worker pool.
local state = SharedTableRegistry:GetSharedTable("NpcSensingState")
state.ready = 0

local actors: { Actor } = {}
for i = 1, NUM_WORKERS do
	local actor = Instance.new("Actor")
	actor.Name = "SensingActor" .. i
	local worker = template:Clone()
	worker.Parent = actor
	worker.Enabled = true
	actor.Parent = script.Parent
	actors[i] = actor
end

-- Wait until every worker has bound its message handler.
while (state.ready :: number) < NUM_WORKERS do
	task.wait()
end

-- 2. Tick loop.
local prevNpcs: { Model } = {}
local prevOutput: SharedTable = SharedTable.new()
local accumulator = 0

RunService.Heartbeat:Connect(function(dt)
	accumulator += dt
	if accumulator < TICK then
		return
	end
	accumulator -= TICK

	debug.profilebegin("NpcSensing.Coordinator")

	-- 2a. Apply last tick's results (serial: safe to mutate instances).
	for i, npc in prevNpcs do
		local targetId = prevOutput[i]
		if targetId ~= nil and npc.Parent then
			if npc:GetAttribute("TargetUserId") ~= targetId then
				npc:SetAttribute("TargetUserId", targetId) -- 0 means no target
			end
		end
	end

	-- 2b. Snapshot this tick's inputs.
	local npcs: { Model } = {}
	local npcPos: { Vector3 } = {}
	for _, inst in CollectionService:GetTagged("SensingNpc") do
		if inst:IsA("Model") and inst.PrimaryPart then
			table.insert(npcs, inst)
			table.insert(npcPos, inst:GetPivot().Position + Vector3.new(0, 2, 0)) -- eye height
		end
	end

	local playerPos: { Vector3 } = {}
	local playerId: { number } = {}
	for _, player in Players:GetPlayers() do
		local character = player.Character
		local root = character and character:FindFirstChild("HumanoidRootPart")
		if root and root:IsA("BasePart") then
			table.insert(playerPos, root.Position)
			table.insert(playerId, player.UserId)
		end
	end

	local input = SharedTable.new({
		npcPos = npcPos,
		playerPos = playerPos,
		playerId = playerId,
		playerCount = #playerPos,
	})
	local output = SharedTable.new()

	-- 2c. Dispatch disjoint chunks.
	local n = #npcs
	if n > 0 and #playerPos > 0 then
		local chunk = math.ceil(n / NUM_WORKERS)
		for w = 1, NUM_WORKERS do
			local first = (w - 1) * chunk + 1
			local last = math.min(w * chunk, n)
			if first <= last then
				actors[w]:SendMessage("Sense", input, output, first, last)
			end
		end
	end

	prevNpcs = npcs
	prevOutput = output

	debug.profileend()
end)
```

Design decisions explained:

- **Accumulator, not `task.wait(0.1)` loop.** It keeps the tick rate stable and runs inside a known frame step. See [[Fixed-Rate Scheduler]].
- **Results read with a nil check.** If a worker has not finished by the next tick, its entries are nil and we simply skip them. The system degrades gracefully under load instead of stalling.
- **`SetAttribute` only on change.** Every attribute write replicates to clients. Writing the same value 10 times a second for 200 NPCs is wasted bandwidth.
- **AI reads the attribute** (or a server-side table) in its own serial logic. The sensing system has no knowledge of the AI; it just publishes "who can I see".

---

## 6. Variant: per-request parallel work (hit validation)

For work triggered by events rather than ticks, connect in parallel directly. Roblox's own example validates weapon raycasts with one Actor per character:

```luau
-- Script inside an Actor that also contains the tool/character it validates.
remote.OnServerEvent:ConnectParallel(function(player: Player, origin: unknown, direction: unknown)
	if typeof(origin) ~= "Vector3" or typeof(direction) ~= "Vector3" then
		return
	end
	-- Parallel: validate with raycasts (Safe API).
	local result = workspace:Raycast(origin, direction.Unit * math.min(direction.Magnitude, 500))
	if not result then
		return
	end
	task.synchronize()
	-- Serial: apply damage, which mutates instances.
	-- (Re-check that the target still exists: another Actor may have acted first.)
end)
```

The re-check after `task.synchronize()` matters: two Actors can reach the same conclusion in the same frame, and the serial phase runs them one after another.

---

## 7. Measuring that it actually helped

1. Before: MicroProfiler on a server dump with your worst realistic NPC count. Note the serial script time for the old sensing code.
2. After: look for `NpcSensing.Worker` labels spread across **multiple** worker threads, and `NpcSensing.Coordinator` on the main thread.
3. Success means the main-thread cost dropped by more than the coordinator overhead you added. If the worker labels line up one after another on a single thread, your work is not actually running in parallel (common causes: one Actor, or Unsafe calls forcing serial execution).
4. Check that total CPU did not explode: SharedTable creation and message copies are real costs. For very large inputs, reuse SharedTables or pack data into a `buffer` (see [[Buffers and Bit Packing for Network Payloads]]).

Server core counts are not under your control, so always confirm on a live server, not just in Studio on a 16-core desktop.

---

## Common mistakes

- One Actor containing all scripts, then wondering why nothing runs in parallel.
- Calling `require` inside a `ConnectParallel` or `BindToMessageParallel` callback.
- Expecting a ModuleScript cache to be shared between Actors; each Actor has its own copy.
- Sending big Luau tables through `SendMessage` every frame (full copy each time) instead of a SharedTable.
- Calling `task.synchronize()` inside the inner loop, which serialises the whole job.
- Writing attributes or properties in parallel (Unsafe) and getting errors, or "fixing" it by synchronising for every NPC.
- Parallelising tiny jobs where messaging and SharedTable overhead exceed the work.
- Forgetting to re-validate state in the serial phase after parallel decisions.

## Checklist

- [ ] Profiled first: the hot path is pure computation over a snapshot.
- [ ] Multiple Actors, split by logical unit; worker count tuned by measurement.
- [ ] All `require` and `RaycastParams` setup done in serial at script start.
- [ ] Every API used in parallel is tagged Safe or Read Safe.
- [ ] Bulk data passed via SharedTable; workers write disjoint keys.
- [ ] Instance mutation happens only in a serial apply step, with existence re-checks.
- [ ] Workers signal readiness before the first dispatch.
- [ ] MicroProfiler shows worker labels on multiple threads and lower main-thread time.

**Related:** [[Scripting - Hub]] · [[Parallel Luau — When It Helps and When It Hurts]] · [[Performance and Profiling]] · [[Fixed-Rate Scheduler]] · [[Spatial Hash for Nearby Queries]]
