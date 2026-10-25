---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Pathfinding Cost - Request Budgets, Path Caching and Shared Routes"
tags: [roblox, community-knowledge, optimization, pathfinding, npc, ai, server]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/characters/pathfinding
  - https://create.roblox.com/docs/reference/engine/classes/PathfindingService
  - https://devforum.roblox.com/t/pathfinding-question/3595428
  - https://devforum.roblox.com/t/how-to-optimize-npcs/3166282
  - https://devforum.roblox.com/t/computeasync-pathfinding-starts-lagging-after-creating-enough-paths/4677784
---
# Speed - Pathfinding Cost - Request Budgets, Path Caching and Shared Routes

`Path:ComputeAsync` is cheap once and expensive at scale. A horde of 60 zombies each recomputing every half second is 120 path searches per second on the server, most of them returning almost the same route as last time. DevForum threads keep landing on the same advice: compute less often, share results, and do not pathfind when a straight line works. This note turns that into a budget and a cache you can drop into an NPC system. For the chase loop itself see [[Enemy AI Pathing Loop with PathfindingService]].

## Step 1: avoid the search entirely

Before calling `ComputeAsync`, try in order:

1. **Direct line**: one `workspace:Raycast` (or a `Blockcast` at agent width) from NPC to target. Clear means `Humanoid:MoveTo(target)` with no path.
2. **Still valid path**: the target has moved less than N studs (for example 6) since the last compute and the path has not fired `Blocked` ahead of the agent. Keep following it.
3. **Cached path**: another NPC already computed a path between the same start cell and goal cell recently.
4. Only then, queue a new compute.

## Step 2: a server-wide request budget

Never call `ComputeAsync` directly from each NPC. Route requests through one queue that limits how many are in flight and how many start per second, and prioritises NPCs near players.

```lua
local MAX_IN_FLIGHT, MAX_PER_SEC = 4, 30
local queue, inFlight, startedThisSec = {}, 0, 0

task.spawn(function()
	while true do task.wait(1); startedThisSec = 0 end
end)

RunService.Heartbeat:Connect(function()
	while inFlight < MAX_IN_FLIGHT and startedThisSec < MAX_PER_SEC and #queue > 0 do
		local req = table.remove(queue, 1) -- sort by priority when enqueuing
		inFlight += 1; startedThisSec += 1
		task.spawn(function()
			local ok = pcall(req.path.ComputeAsync, req.path, req.from, req.to)
			inFlight -= 1
			req.done(ok and req.path.Status == Enum.PathStatus.Success)
		end)
	end
end)
```

The numbers are starting points; tune them while watching server heartbeat in a full horde test.

## Step 3: cache by cell

Quantise start and goal to a coarse grid (for example 8 studs) and key the cache by both cells. Store the waypoint positions (not the Path object) with a time stamp.

```lua
local CELL, TTL = 8, 5 -- studs, seconds
local cache = {}
local function key(a: Vector3, b: Vector3)
	local function c(v) return `{v.X // CELL},{v.Z // CELL}` end
	return c(a) .. "|" .. c(b)
end
```

- On a hit younger than `TTL`, give the NPC the cached waypoints and skip the search.
- Invalidate entries near anything that moves (doors, destructible walls) when it changes; a simple approach is a global "map version" number included in the key.
- Keep agent sizes separate: different `AgentRadius`/`AgentHeight` need different cache tables.

## Step 4: share routes in groups

Ten zombies chasing the same player from the same room do not need ten paths. Elect a leader per group: it pathfinds, followers walk to the leader's waypoint list with small lateral offsets, or to the leader itself when close. For very large hordes heading to one goal, a flow field computes once for everyone; see [[Flow Fields for Large Hordes]].

## Step 5: precompute what never changes

Patrol routes, routes between fixed points of interest, and shop-to-spawn walks can be computed once at server start (spread over a few seconds) and stored. Runtime searches are then only for chasing.

## Known issue to watch (2026)

A June 2026 DevForum report describes NPCs that recompute every 0.5 s starting to stall after about a minute, even in an empty place. The poster's own timing pointed at the `MoveTo` / `MoveToFinished` waypoint loop rather than `ComputeAsync`, and the thread ended without a confirmed cause (unverified). If you see this, time both parts separately with `os.clock()` before redesigning.

## Pitfalls

- Recomputing on a fixed timer even when the target has not moved.
- Ignoring `Path.Status`: `NoPath` results should back off (for example 2 s) instead of retrying next frame.
- Path searches for NPCs no player can see: idle them or use cheap patrols.
- Streaming: on the server everything is present, but paths can be blocked by parts that appear later; handle `Blocked` as the docs recommend.

## Related
[[Optimization - Hub]] · [[Enemy AI Pathing Loop with PathfindingService]] · [[Designing Levels for NPC Navigation - Costs, Modifiers and Links]] · [[Scalable NPC Update Scheduler]]
