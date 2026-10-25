---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/npc-moveto-timeout-stutter"
title: "NPC Movement - MoveTo Timeout and Pathfinding Stutter"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/how-to-fix-humanoidmoveto-stopping-at-8-seconds/3133806
  - https://devforum.roblox.com/t/pathfinding-npc-stuttering/3019460
  - https://devforum.roblox.com/t/npc-pathfinding-stutters/1549344
cssclasses: [tg-a40]
---

# NPC Movement - MoveTo Timeout and Pathfinding Stutter

Two NPC problems show up constantly in tower defense, horror and zombie game threads.

## Problem 1: "My NPC stops after 8 seconds"

`Humanoid:MoveTo()` has a **built-in 8-second timeout**: if the goal isn't reached in time, `MoveToFinished` fires with `false` and the humanoid stops. @dthecoolest pointed to the docs; it is by design. Calling `MoveTo` again resets the timer.

Fixes people use:
- Add intermediate waypoints so no leg takes 8 s (works, but tedious, as the poster noted).
- **Re-issue `MoveTo` while walking** until you're close enough (own version below).

```lua
-- Own helper: walk to a point, refreshing MoveTo so the 8 s timeout never hits
local function walkTo(humanoid: Humanoid, root: BasePart, goal: Vector3, reach: number?): boolean
	local reachDist = reach or 3
	local startTime = os.clock()
	while (root.Position - goal).Magnitude > reachDist do
		if humanoid.Health <= 0 or os.clock() - startTime > 60 then
			return false -- dead or genuinely stuck
		end
		humanoid:MoveTo(goal)
		task.wait(0.5) -- refresh well under 8 s
	end
	return true
end
```

Compare positions on the horizontal plane if your goal points sit on the floor and the root is ~3 studs up.

## Problem 2: "My pathfinding NPC stutters, especially near players"

The usual cause is **network ownership**. An unanchored NPC near a player can be handed to that player's client for physics; every ownership handoff causes a hitch, and the server keeps sending commands to a body it no longer simulates.

- Fix: on the server, `npc.HumanoidRootPart:SetNetworkOwner(nil)` after spawning (server owns it).
- It **fails on anchored parts** or parts welded to anchored ones (the 2024 poster's case, who anchored the root for a jumpscare). Unanchor before moving, or skip the call while anchored.
- Don't block on `MoveToFinished:Wait()` per waypoint for long paths; that pause between waypoints also reads as stutter. Move on to the next waypoint when close enough.

```lua
local function prepareNpc(npc: Model)
	local root = npc:WaitForChild("HumanoidRootPart") :: BasePart
	if not root.Anchored then
		root:SetNetworkOwner(nil)
	end
end
```

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Enemy AI Pathing Loop with PathfindingService]] · [[Pathfinding Engineering]] · [[Network Ownership and Physics Replication]] · [[AI gets stuck or loops]]

<!-- TDOD_GRAPH_END -->
