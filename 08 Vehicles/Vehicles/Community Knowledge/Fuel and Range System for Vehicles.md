---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Fuel and Range System for Vehicles"
tags: [roblox, community-knowledge, vehicles, fuel, game-systems]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
---
# Fuel and Range System for Vehicles

Fuel is a cheap way to give driving games a loop (drive, earn, refuel, upgrade tank) and to stop players parking a free car on the objective forever. It also attracts exploits if the client owns the number. This note gives a server-authoritative fuel model that still feels instant on the driver's screen.

## Where the number lives
- The **server** owns fuel. Store it as an attribute on the car model: `car:SetAttribute("Fuel", 60)` and `car:SetAttribute("FuelMax", 60)`. Attributes replicate to every client and stream in with the car.
- The **driver's client** reads the attribute for the gauge and may *predict* the drain between server updates for a smooth needle, but never writes it.

## Burn model
Burning by throttle alone means a player stuck against a wall drains fuel without moving; burning by distance alone means revving in place is free. A mix works well:

```lua
-- Server, once per 0.5 s per occupied car
local IDLE_BURN = 0.02     -- units per second
local DIST_BURN = 0.004    -- units per stud travelled
local lastPos: {[Model]: Vector3} = {}

local function tickFuel(car: Model, dt: number)
	local root = car.PrimaryPart
	local seat = car:FindFirstChild("DriveSeat") :: VehicleSeat
	if not root or not seat or not seat.Occupant then
		lastPos[car] = nil
		return
	end
	local prev = lastPos[car] or root.Position
	local dist = math.min((root.Position - prev).Magnitude, 200 * dt) -- clamp teleports
	lastPos[car] = root.Position

	local burn = IDLE_BURN * dt + DIST_BURN * dist * (car:GetAttribute("BurnMult") or 1)
	local fuel = math.max((car:GetAttribute("Fuel") or 0) - burn, 0)
	car:SetAttribute("Fuel", fuel)
	car:SetAttribute("OutOfFuel", fuel <= 0)
end
```
Distance is measured on the server from the replicated position, so a client-owned car cannot lie about how far it went without also lying about where it is (which the anti-exploit checks catch).

## Running out
On the driver client, when `OutOfFuel` becomes true:
- Ramp motor torque to near zero over 1-2 s (engine sputter) instead of a hard stop.
- Keep steering and brakes working so the player can coast to the side.
- Play a cough sound and show "Out of fuel" with the nearest station marker.

## Refuelling
Use a `ProximityPrompt` on each pump with `HoldDuration` around 1-2 s:
```lua
pump.Prompt.Triggered:Connect(function(player)
	local car = getPlayersCar(player)
	if not car or (car.PrimaryPart.Position - pump.Position).Magnitude > 20 then return end
	local missing = car:GetAttribute("FuelMax") - car:GetAttribute("Fuel")
	local cost = math.ceil(missing * PRICE_PER_UNIT)
	if Currency.trySpend(player, cost) then
		car:SetAttribute("Fuel", car:GetAttribute("FuelMax"))
		car:SetAttribute("OutOfFuel", false)
	end
end)
```
Validate distance on the server; the prompt firing is not proof the car is at the pump.

## Design knobs
| Knob | Effect |
|---|---|
| Tank size per car class | Upgrade path |
| `BurnMult` attribute | Heavy trucks burn more; boost burns extra |
| Jerry can item | Rescue without towing |
| Free refuel in safe zones | Reduces frustration for new players |

Tune so a full tank lasts several minutes of normal play; running dry every 60 s feels like a tax.

## Checklist
- [ ] Fuel is a server-written attribute, client only reads
- [ ] Burn mixes idle time and distance, distance clamped per tick
- [ ] Out-of-fuel fades power, keeps steering
- [ ] Refuel validates distance and payment on the server

## Related
[[Vehicles - Hub]] · [[Vehicle Damage, Repair and Failure States]] · [[Speedometer and Vehicle HUD - Studs to km-h and mph]] · [[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]]
