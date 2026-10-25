---
area: "07 AI and Combat"
cluster: "AI"
title: "Steering Behaviors and Boids for NPC Groups"
tags: [roblox, community-knowledge, ai, steering, boids, crowds, npc-movement]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.red3d.com/cwr/steer/
  - https://www.red3d.com/cwr/boids/
  - https://ics-websites.science.uu.nl/docs/vakken/mcrws/papers_new/Reynolds%20-%201999%20-%20Steering%20behaviors%20for%20autonomous%20characters.pdf
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid#Move
---
# Steering Behaviors and Boids for NPC Groups

PathfindingService answers "which way through the level", but not "how do 30 zombies chase one player without stacking into a single blob". Craig Reynolds' steering behaviors (GDC 1999) and his earlier boids flocking model are still the standard answer. They split movement into three layers: **action selection** (your state machine decides "chase"), **steering** (compute a desired velocity), and **locomotion** (Humanoid or mover constraint makes the body follow). This note gives Luau versions of the behaviors that matter for Roblox NPCs.

## The core idea

Each behavior returns a **steering vector** (desired velocity minus current velocity). You weight and add them, clamp to a max force, and feed the result to locomotion. Behaviors are cheap: a few vector ops per NPC.

```lua
local MAX_SPEED = 16

local function seek(pos: Vector3, vel: Vector3, target: Vector3): Vector3
	local desired = (target - pos)
	if desired.Magnitude < 1e-3 then return Vector3.zero end
	return desired.Unit * MAX_SPEED - vel
end

local function arrive(pos, vel, target, slowRadius: number): Vector3
	local offset = target - pos
	local dist = offset.Magnitude
	if dist < 1e-3 then return -vel end
	local speed = MAX_SPEED * math.min(dist / slowRadius, 1)
	return offset.Unit * speed - vel
end

local function flee(pos, vel, threat): Vector3
	return -seek(pos, vel, threat)
end
```

**Pursue** is seek toward where the target will be: `target + targetVel * (dist / MAX_SPEED)`, with the look-ahead capped (for example 1 s) so NPCs do not overshoot when the player turns.

## Boids: separation, alignment, cohesion

For groups, each NPC looks at neighbours within a radius:

- **Separation:** steer away from neighbours, weighted by 1/distance. This is the one that prevents stacking; it is the most valuable behavior for hordes.
- **Alignment:** steer toward the neighbours' average heading (packs, birds, fish).
- **Cohesion:** steer toward the neighbours' average position (keeps a pack together).

Typical horde weights: separation 1.5, seek target 1.0, alignment 0.3, cohesion 0.2. Zombies want strong separation and little cohesion; wolves or birds want more alignment and cohesion.

## Finding neighbours cheaply

Never loop all-vs-all past ~30 agents. Bucket NPCs into a **spatial hash** each tick (cell size = neighbour radius, key `x // cell .. "," .. z // cell`) and check only the 9 cells around each agent. This is O(n) and fits in a server tick for hundreds of agents.

## Feeding Roblox locomotion

- **Humanoid NPCs:** `humanoid:Move(direction)` each tick (the Humanoid `Move` method walks in a world direction) instead of `MoveTo` per waypoint; set `WalkSpeed` from the steering magnitude.
- **Non-Humanoid NPCs (cheaper):** an `AlignOrientation` plus `LinearVelocity` on the root part, or CFrame updates on anchored models for very large crowds rendered client-side.
- Combine with pathfinding: compute a path occasionally, then **seek the next waypoint** with steering added for separation. The NPC follows the path but spreads around others.

## Obstacle avoidance

One short raycast ahead (length = speed x 0.5 s) per NPC per tick; if it hits, add a steering force along the hit normal projected onto the ground plane. Use a `RaycastParams` that excludes NPCs, and stagger rays across ticks if you have many agents.

## Pitfalls

- Forgetting to clamp the summed force: agents jitter or rocket off.
- Running steering every frame for every NPC on the server. 10-15 Hz with interpolation is usually enough; see the tick budget notes.
- Pure seek with no separation: everyone converges into one point and Humanoids start climbing each other.
- Using Y in the math for ground units. Flatten vectors (`Vector3.new(v.X, 0, v.Z)`) before steering.

## Related
[[AI - Hub]] - [[NPC Crowds, Animation LOD and Server Budgets]] - [[Scalable NPC Horde Lab]] - [[Enemy AI Pathing Loop with PathfindingService]]
