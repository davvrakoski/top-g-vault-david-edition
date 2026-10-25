---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/physics-budget"
title: "Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions"
tags: [roblox, community, vehicles, physics, performance, microprofiler, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/physics/sleep-system
  - https://create.roblox.com/docs/physics/adaptive-timestepping
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/performance-optimization/microprofiler/tag-table
  - https://devforum.roblox.com/t/2024-h1-physics-recap/3118248
  - https://devforum.roblox.com/t/roblox-physics-or-custom-physics/2641313
---
# Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions

A constraint car can easily be 20+ constraints and 10+ assemblies. Multiply by every parked car on a city map and physics eats the frame. These are the levers, in the order that usually pays off most.

## The levers
| Lever | What to do | Source |
|---|---|---|
| **Fewer moving assemblies** | Anchor everything that does not need physics. Parked props should be anchored | Improve performance docs |
| **Fewer constraints per vehicle** | Minimize constraints and joints per assembly; a raycast car has almost none | Improve performance docs; [[Raycast Suspension Car - Spring-Damper Pattern and Pitfalls]] |
| **Cheap collision** | Box or hull fidelity for small parts; build big complex meshes' collision from invisible simple parts; precise mesh fidelity is the most expensive (filter the Explorer by `CollisionFidelity=PreciseConvexDecomposition` to find them). Non-colliding visual parts still store collision geometry, so give them box fidelity too | Improve performance docs |
| **No self-collision** | Wheels, suspension arms and body should not collide with each other: use collision groups or `NoCollisionConstraint` | Improve performance docs (ragdoll advice applies to car parts) |
| **Let parked cars sleep** | Assemblies below the sleep thresholds (linear velocity 0.33 studs/s, rotational 0.42 in the docs' table, plus low acceleration) fall asleep and cost nothing until woken | [[Sleep system]] |
| **Right stepping mode** | Adaptive (up to ~2.5x faster physics) for most games; **Fixed 240 Hz** for racing, tanks and destruction | [[Adaptive timestepping]] |
| **Stable ownership** | Avoid frequent owner changes; keep separate groups of parts far enough apart to simulate as separate islands | MicroProfiler tag reference |
| **Default part properties on suspension** | Do not make suspension parts `Massless` or change density on many of them | DevForum builder advice |

## Read the MicroProfiler before and after
Open with Ctrl+F6 (Cmd+F6) in Studio or the desktop client (some doc pages give Ctrl+Alt+F6). The scopes to watch:
| Scope | Meaning |
|---|---|
| `physicsStepped` | Total physics cost |
| `worldStep` | Each discrete step (with adaptive on it reads `worldStep - Adaptive`) |
| `LDLPGSSolver::solve` (hover) | Count of islands at 240 / 120 / 60 Hz |
| Distributed Physics Ownership | Cost of deciding owners; grows with frequent switching |
| Simulation/assemble | Rebuilding assemblies; grows when joints are created and destroyed |

Studio setting **Are Timesteps Shown** outlines parts by their simulation rate, so you can see which cars sit in the expensive 240 Hz island.

## Original Luau: park idle cars
Anchoring the chassis root while nobody is near takes the car out of the solver and hands ownership to the server (anchored parts are always server-owned). Unanchor when a player sits or comes close.

```lua
--!strict
-- Server Script: idle vehicles get anchored, active ones are released.
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")

local WAKE_RADIUS = 120     -- studs; anyone this close keeps the car live
local CHECK_EVERY = 2       -- seconds

local function anyoneNear(pos: Vector3): boolean
	for _, player in Players:GetPlayers() do
		local character = player.Character
		local root = character and character:FindFirstChild("HumanoidRootPart") :: BasePart?
		if root and (root.Position - pos).Magnitude < WAKE_RADIUS then
			return true
		end
	end
	return false
end

local function occupied(car: Model): boolean
	for _, d in car:GetDescendants() do
		if d:IsA("Seat") or d:IsA("VehicleSeat") then
			if (d :: any).Occupant then
				return true
			end
		end
	end
	return false
end

while true do
	task.wait(CHECK_EVERY)
	for _, inst in CollectionService:GetTagged("Vehicle") do
		local car = inst :: Model
		local root = car.PrimaryPart
		if not root then continue end
		local keepLive = occupied(car) or anyoneNear(root.Position)
		local slowEnough = root.AssemblyLinearVelocity.Magnitude < 0.5
		if not keepLive and slowEnough and not root.Anchored then
			root.Anchored = true
		elseif keepLive and root.Anchored then
			root.Anchored = false
		end
	end
end
```

Notes:
- Only the root is anchored; wheels hanging on constraints settle and sleep.
- After unanchoring, ownership is automatic again, so the sit handler must still assign the driver ([[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]).
- With `StreamingEnabled`, distant cars may not even exist on clients; combine both.

## Engine improvements you get for free
Roblox's 2024 H1 Physics Recap (posted for the Physics Team) lists, among others: part sleep transitions about 30-40% faster, about 0.1 ms per frame saved in StepContacts in the Racing Template, multi-threading gains in collision and solver, plus the **StepPhysics** API and physics pause / step-forward tools for debugging.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Improve performance]] · [[Assemblies]] · [[MicroProfiler]] · [[Physics, Collisions and Ragdolls]]

<!-- TDOD_GRAPH_END -->
