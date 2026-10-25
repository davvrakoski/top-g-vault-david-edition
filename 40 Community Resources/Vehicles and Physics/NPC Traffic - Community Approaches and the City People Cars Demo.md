---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/npc-traffic"
title: "NPC Traffic - Community Approaches and the City People Cars Demo"
tags: [roblox, community, vehicles, traffic, npc, ai, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/ai-traffic-system/1448682
  - https://devforum.roblox.com/t/2580856
  - https://devforum.roblox.com/t/2598366
  - https://www.roblox.com/games/6300375759/City-People-Cars
  - https://create.roblox.com/docs/workspace/streaming/slim
  - https://builtbybit.com/resources/npc-traffic-system-v1-nx.62371/
---
# NPC Traffic - Community Approaches and the City People Cars Demo

The vault's design note for road graphs and traffic is [[Traffic, NPC Vehicles and Road Graphs]]. This one collects what DevForum builders actually shipped, and the official demo you can open.

## Reference place: City People Cars (Roblox)
- A Roblox technical demo where **cars and NPCs follow roads and sidewalks**: https://www.roblox.com/games/6300375759/City-People-Cars
- In a 2023 thread a builder recommended opening it to see how Roblox did it, while noting it is a little buggy.
- The SLIM streaming docs also link a **City People Cars SLIM Template** with SLIM-enabled world models.
- License: a Roblox demo, no open license stated: **study only**.

## Approaches people use
| Approach | Who / where | Pros | Cons |
|---|---|---|---|
| **Intersection-to-intersection with Bezier turns, moved by TweenService** | BuiIdTheBuilder's system in "AI Traffic System" (2021-22) | No pathfinding; cheap; random turn choice at each junction | Orientation can snap on curves; needs a rewrite for scale (the author said so) |
| **Node graph with connections** | xChris_vC in the same thread | Flexible, supports lanes and rules | You build the graph tooling |
| **Steering behaviors** (wander, avoidance) on real cars | Suggested by jaipack17; xChris_vC built pursuing cars on Roblox's endorsed vehicles | Lifelike, reacts to players | Months of work, physics cost |
| **PathfindingService + PathfindingModifiers** | "Calculating Street Paths" (2023): mark non-road areas with a modifier cost of `math.huge` | Built-in, handles any map | Was routing through buildings and empty plots until modifiers were added; car turning circles ignored |
| **Waypoint parts at road bends + raycasts for braking** | "NPC Cars in Roblox studio" | Easy to place by hand | Manual; does not scale to big cities |

One reply also suggested treating the **car itself as the NPC** instead of seating an NPC that drives it. That avoids Humanoid cost entirely.

## Intersection rules
BuiIdTheBuilder gave each car a random ID on spawn so the intersection script could tell a specific car to go; a table holds the order at a four-way stop. Original Luau for that idea:

```lua
--!strict
-- One per intersection (server). Cars call request() on arrival and release() on exit.
local Intersection = {}
Intersection.__index = Intersection

export type Intersection = typeof(setmetatable({} :: { queue: { string }, holder: string? }, Intersection))

function Intersection.new(): Intersection
	return setmetatable({ queue = {}, holder = nil }, Intersection)
end

function Intersection.request(self: Intersection, carId: string): boolean
	if self.holder == carId then
		return true
	end
	if not table.find(self.queue, carId) then
		table.insert(self.queue, carId)          -- first come, first served
	end
	if self.holder == nil and self.queue[1] == carId then
		self.holder = table.remove(self.queue, 1)
		return true
	end
	return false                                 -- wait and ask again next step
end

function Intersection.release(self: Intersection, carId: string)
	if self.holder == carId then
		self.holder = nil
	end
end

return Intersection
```

Traffic lights are the same idea with the holder replaced by "which direction is green".

## Performance rules of thumb
- Move ambient cars **kinematically** (CFrame / BulkMoveTo along curves), not with physics, and only near players.
- Switch a car to real physics only when a player hits it or it must react.
- Despawn or freeze cars outside the streaming radius; let the server own the plan and clients render it.
- Reuse car models from a pool instead of `Clone` / `Destroy` every few seconds.

## Paid option (link only)
"NPC Traffic System V1 | NX" on BuiltByBit (about $4.79) advertises cars following customizable part paths over turns and slopes. Its listing says both "open source" and "closed source & obfuscated", so check the actual license before buying.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Traffic, NPC Vehicles and Road Graphs]] · [[PathfindingModifier]] · [[Trains on Roblox - Spline CFrame Trains vs PrismaticConstraint Carts]] · [[Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions]]

<!-- TDOD_GRAPH_END -->
