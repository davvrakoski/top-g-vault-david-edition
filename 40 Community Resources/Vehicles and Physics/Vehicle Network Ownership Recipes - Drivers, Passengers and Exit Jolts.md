---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/vehicle-network-ownership-recipes"
title: "Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts"
tags: [roblox, community, vehicles, network-ownership, physics, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/performance-optimization/microprofiler/tag-table
  - https://devforum.roblox.com/t/train-move-system-dead-rails/3619607
  - https://devforum.roblox.com/t/exploit-prevention-with-vehicles/203654
  - https://devforum.roblox.com/t/how-do-you-make-a-car/1675381
---
# Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts

The machine that **owns** an assembly simulates it. A car only feels responsive when the driver's own client owns it. The basics are in [[Network ownership]] and [[Network Ownership and Physics Replication]]; this note is the vehicle-specific edge cases the community keeps hitting.

## Facts from the official docs
- The engine hands unanchored parts to nearby clients automatically, based on distance and the client's hardware.
- The server always owns **anchored** parts. Anchor a lone assembly and its ownership goes to the server; unanchor it and it goes back to automatic.
- Set ownership on the server with `BasePart:SetNetworkOwner(player)`; `SetNetworkOwnershipAuto()` gives it back to the engine.
- Use `SetNetworkOwner(nil)` (server) sparingly: it makes physics jittery for clients.
- Give **loose parts riding on the vehicle** to the same client as the vehicle.
- Studio can outline parts by owner (network ownership in the viewport's **visualization options** menu) to check your setup.
- MicroProfiler: the **Distributed Physics Ownership** tag gets expensive when many parts switch owner often.

## Recipe 1: ownership follows the driver seat only
Passengers sitting down should not steal the car. Only the driver seat changes ownership.

```lua
--!strict
-- Server Script inside the vehicle model
local Players = game:GetService("Players")

local car = script.Parent :: Model
local driverSeat = car:WaitForChild("DriverSeat") :: VehicleSeat
local root = car.PrimaryPart :: BasePart

local function giveTo(player: Player?)
	local ok, why = root:CanSetNetworkOwnership()
	if not ok then
		warn("Can't set ownership on", car:GetFullName(), why)
		return
	end
	if player then
		root:SetNetworkOwner(player)
	else
		root:SetNetworkOwnershipAuto()
	end
end

driverSeat:GetPropertyChangedSignal("Occupant"):Connect(function()
	local humanoid = driverSeat.Occupant
	local player = humanoid and Players:GetPlayerFromCharacter(humanoid.Parent)
	giveTo(player)
end)
```

`CanSetNetworkOwnership` fails when the assembly is anchored or welded to an anchored part, which is the usual reason this "does nothing".

## Recipe 2: a second seat or a trailer
In the Dead Rails train thread one builder argued that sitting already gives the driver ownership through the SeatWeld; another answered that seating alone does not move ownership of the **whole** assembly, and the original poster agreed it matters as soon as a second seat is filled. Be explicit:
- One owner per connected mechanism. Trailers and towed cars joined by constraints should get the **same** owner as the tow vehicle.
- If two players drive linked vehicles, only one of them can own the linked set. Pick the lead driver.

## Recipe 3: the exit jolt
Several threads report a short freeze or teleport when the driver gets out. In the Dead Rails thread the author put it down to ping during the ownership handover and found no full fix. Ways to soften it:
- Brake to a stop (or let the car coast to sleep) **before** releasing ownership on exit, if the design allows.
- Delay `SetNetworkOwnershipAuto()` by about a second after the driver leaves, so the old owner finishes simulating its last motion.
- Do not bounce ownership back and forth (for example on every passenger change); each switch costs time.

## Recipe 4: when other players' crashes look wrong
A reply about A-Chassis pointed out that since each car runs on its own driver's client, car-to-car collisions look odd: each client sees the other car slightly in the past. Options: accept it (most hangout games do), use arcade bumping that does not rely on exact contact, or move to server authority ([[Server Authority Vehicles - Prediction, BindToSimulation and Input Attributes]]).

## Recipe 5: security trade-off
The 2018 "Exploit Prevention with Vehicles?" thread sums it up:
| | Server owns | Driver owns |
|---|---|---|
| Security | Safer | Driver can teleport or fling with the car |
| Server cost | Higher | Lower |
| Input delay | Round trip on every input | None |
Give ownership only while someone is driving, and check the car on the server: [[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Vehicle jitters - wrong player controls physics]] · [[Network ownership]] · [[Network Ownership and Physics Replication]] · [[Vehicle Enter - Exit, Seats and Camera]]

<!-- TDOD_GRAPH_END -->
