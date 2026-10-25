---
area: "01 Start Here"
cluster: "Start Here"
title: "First Patrol NPC - Waypoints with MoveTo and MoveToFinished"
tags: [roblox, community-knowledge, start-here, npc, humanoid, patrol]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/characters/pathfinding
---
# First Patrol NPC - Waypoints with MoveTo and MoveToFinished

A guard walking a loop, a shopkeeper pacing behind the counter, a villager strolling the square: a patrolling NPC is the first thing that makes a map feel alive, and it needs only one method, `Humanoid:MoveTo()`. This note builds a guard that walks a list of waypoint parts forever, and covers the two things that trip beginners: the **8-second timeout** and **stutter when players get close**.

## 1. Make the NPC

1. **Avatar** tab > **Rig Builder** > pick a block rig (R15 or R6). It appears in Workspace as a Model with a `Humanoid` and a `HumanoidRootPart`.
2. Rename it `Guard`. Make sure no part is **Anchored** (an anchored rig cannot walk).
3. Optional: set `Humanoid.WalkSpeed` to about 8 for a calm walk (the player default is 16).

## 2. Lay out waypoints

1. Create a Folder in Workspace called `GuardPath`.
2. Add small parts named `1`, `2`, `3`, `4` around the route. For each one: **Anchored** on, **CanCollide** off, **CanQuery** off, **CanTouch** off, **Transparency** 1 (keep it at 0.5 while you set things up so you can see them).
3. Keep each straight line between two waypoints free of walls. `MoveTo` walks in a straight line and does not steer around obstacles.

## 3. The script

Put a **Script** inside the `Guard` model:

```lua
local npc = script.Parent
local humanoid = npc:WaitForChild("Humanoid")
local root = npc:WaitForChild("HumanoidRootPart")
local path = workspace:WaitForChild("GuardPath")

-- the server owns the NPC's physics, so it never stutters near players
root:SetNetworkOwner(nil)

-- sort waypoints by their number names: 1, 2, 3...
local points = path:GetChildren()
table.sort(points, function(a, b)
	return tonumber(a.Name) < tonumber(b.Name)
end)

local function walkTo(target: Vector3): boolean
	humanoid:MoveTo(target)
	local reached = humanoid.MoveToFinished:Wait()
	return reached
end

while humanoid.Health > 0 do
	for _, point in points do
		local ok = walkTo(point.Position)
		if not ok then
			-- timed out or blocked: try once more, then move on
			walkTo(point.Position)
		end
		task.wait(math.random(1, 3)) -- pause and "look around"
	end
end
```

Press **Play** (or **Run** to watch without a character) and the guard loops the route.

## Why it works, and the gotchas

- **`MoveTo(position)`** tells the Humanoid to walk toward a point. **`MoveToFinished`** fires with `reached = true` when it arrives.
- **The 8-second rule:** if the goal is not reached within 8 seconds, the Humanoid stops and `MoveToFinished` fires with `false`. Long legs between waypoints at low WalkSpeed will time out. Either add more waypoints or call `MoveTo` again before 8 seconds pass (each call resets the timer).
- **Network ownership:** by default the engine can hand an unanchored NPC's physics to a nearby player's device, which looks like the NPC teleporting or jittering. `SetNetworkOwner(nil)` on the root part keeps it on the server. It must be called from a server Script.
- **Waypoint height:** if a waypoint floats 5 studs up, the NPC still walks to the spot under it on the ground; height mostly does not matter, but keep waypoints near floor level so they are easy to edit.
- **`MoveTo(position, part)`** has an optional second argument: pass a part and the NPC follows that part even if it moves. Handy for a moving platform.

## Make it nicer

- **Ping-pong route:** walk the list forward, then backward, instead of jumping from the last point to the first.
- **Walk animation:** a Rig Builder rig may stand still while it slides along. The simple fix is a server Script that loads a walk and an idle animation on the Humanoid's `Animator` and swaps between them in `Humanoid.Running` (it passes the current speed; above about 0.1 means walking). See [[Animation Will Not Play - Troubleshooting Checklist]] if nothing plays.
- **Doors and stairs on the route:** once the path is not a straight line, switch to `PathfindingService` (see [[Enemy AI Pathing Loop with PathfindingService]]).

## Checklist

- [ ] Rig unanchored, has Humanoid and HumanoidRootPart
- [ ] Waypoints anchored, non-colliding, invisible, numbered
- [ ] `SetNetworkOwner(nil)` in a server Script
- [ ] No leg longer than about 8 seconds of walking at the NPC's WalkSpeed
- [ ] Clear straight lines between points

## Related
[[00 START HERE - Top G Vault]] · [[NPC Movement - MoveTo Timeout and Pathfinding Stutter]] · [[Enemy AI Pathing Loop with PathfindingService]] · [[Network Ownership and Physics Replication]] · [[Starter - First Chasing Enemy - Nearest Player, Touch Damage and a Leash]]
