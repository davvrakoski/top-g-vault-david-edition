---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/while-true-vs-runservice"
title: "while true vs RunService Events - Community Answer"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/while-true-vs-runservice/3920429
cssclasses: [tg-a40]
---

# while true vs RunService Events - Community Answer

"Is `while true do task.wait() end` the same as `Heartbeat:Connect`?" The Sep 2025 thread answers it well.

## The differences

- **Timing:** `Heartbeat` fires every frame after physics and passes `dt` (time since last frame). Also available: `PreSimulation` (before physics) and `PreRender` (client only, before rendering) (@FroDev1002).
- **Mechanism:** @Denneisk explains that a connection is the engine calling your listener as part of firing the event, while `task.wait` hands your thread to the scheduler, which must sort and resume it. Same visible result, different cost and path.
- **Threads:** @index_self: an event connection reuses its thread if the previous call didn't yield or error. A loop that `task.spawn`s each tick makes a new thread every time.
- **Errors:** an error inside a `while` loop kills the loop. An error in a connected handler kills only that call; the next frame still fires.

## Which to use

| Use | When |
|---|---|
| `RunService.Heartbeat` / `PreSimulation` | Per-frame, `dt`-dependent logic: movement, smoothing, camera (client `PreRender`) |
| `while true do ... task.wait(n) end` | Time-based work every few seconds: autosave, round timer, spawn waves |
| An event (`Changed`, `GetAttributeChangedSignal`, custom signal) | Anything that only matters when something changes (best default) |

## Own example: a throttled Heartbeat for "every 0.2 s" work

```lua
local RunService = game:GetService("RunService")

local INTERVAL = 0.2
local accumulator = 0

RunService.Heartbeat:Connect(function(dt)
	accumulator += dt
	if accumulator < INTERVAL then
		return
	end
	accumulator -= INTERVAL
	-- runs ~5 times per second, keeps frame alignment, survives errors per call
end)
```

And the long-interval loop, written safely:

```lua
task.spawn(function()
	while true do
		task.wait(60)
		local ok, err = pcall(autosaveAll) -- an error won't kill the loop
		if not ok then
			warn("[Autosave]", err)
		end
	end
end)
```

`autosaveAll` is your own function.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Events vs Polling]] · [[Coroutines vs the task Library]] · [[RunService]] · [[Script Timeout - Exhausted Allowed Execution Time]]

<!-- TDOD_GRAPH_END -->
