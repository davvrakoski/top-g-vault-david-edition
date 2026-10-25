---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Vehicle Spawner and Garage System - Server Flow"
tags: [roblox, community-knowledge, vehicles, spawning, garage, datastore]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/basic-vehicle-spawning-skeleton/334807
  - https://devforum.roblox.com/t/car-spawn-system/1072608
  - https://devforum.roblox.com/t/customizable-vehicle-spawner/364741
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
---
# Vehicle Spawner and Garage System - Server Flow

Every vehicle game needs "press button, get car". Done naively (client asks, server clones, done) it lets exploiters spawn 200 cars, spawns cars inside each other, and leaks abandoned cars until the server lags. The DevForum spawning threads all end with the same advice: the server must own the whole flow. This note is that flow.

## Data model
```
ServerStorage/VehicleTemplates/<CarId>   -- templates, never in ReplicatedStorage
ReplicatedStorage/VehicleCatalog (ModuleScript) -- id, display name, price, class
workspace/Vehicles/                       -- live cars, one per player per slot
Player data: { ownedCars = {"Hatch01" = true}, equipped = "Hatch01", paint = {...} }
```
Keep templates in **ServerStorage** so clients cannot read and copy them, and so they are not replicated to everyone.

## Server spawn request
```lua
local COOLDOWN = 5
local lastSpawn: {[Player]: number} = {}
local activeCar: {[Player]: Model} = {}

spawnRemote.OnServerInvoke = function(player: Player, carId: unknown, padName: unknown)
	if typeof(carId) ~= "string" or typeof(padName) ~= "string" then return false, "bad" end
	local now = os.clock()
	if now - (lastSpawn[player] or 0) < COOLDOWN then return false, "cooldown" end
	if not PlayerData.owns(player, carId) then return false, "not owned" end

	local pad = workspace.SpawnPads:FindFirstChild(padName)
	local root = player.Character and player.Character.PrimaryPart
	if not pad or not root or (root.Position - pad.Position).Magnitude > 30 then
		return false, "too far"
	end
	if padIsBlocked(pad) then return false, "pad blocked" end

	lastSpawn[player] = now
	if activeCar[player] then activeCar[player]:Destroy() end -- one car each

	local car = ServerStorage.VehicleTemplates[carId]:Clone()
	car:PivotTo(pad.CFrame + Vector3.new(0, 3, 0))
	car:SetAttribute("OwnerUserId", player.UserId)
	applyCustomisation(car, PlayerData.get(player).paint[carId])
	car.Parent = workspace.Vehicles
	activeCar[player] = car
	return true
end
```

## Is the pad free?
Use a spatial query instead of Touched:
```lua
local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = {workspace.Vehicles}
local function padIsBlocked(pad: BasePart): boolean
	local hits = workspace:GetPartBoundsInBox(pad.CFrame + Vector3.new(0, 4, 0), Vector3.new(10, 6, 16), params)
	return #hits > 0
end
```
If blocked, either refuse, pick the next pad, or (common in roleplay games) despawn the blocking car if it is empty.

## Despawn rules
- Player leaves: destroy their car in `PlayerRemoving`.
- Empty and idle: if no seat has an `Occupant` for N minutes, despawn. Check every 30 s, not every frame.
- Fell off the map: `FallenPartsDestroyHeight` removes parts, which can leave half a car; also check the root's Y and destroy the whole model.
- Too many cars on the server: cap total, despawn the oldest empty one.

## Garage UI
- The client shows owned cars from replicated player data and a preview (a `ViewportFrame` with a locally cloned display mesh, as suggested in the customisable spawner thread; ship a light display model in ReplicatedStorage, not the full template).
- The buy button calls a separate purchase remote; ownership is granted only by the server after the Robux or currency check.
- After spawning, the server sets network ownership when the player sits, not at spawn time (see the ownership note).

## Checklist
- [ ] Templates in ServerStorage, catalog data in a shared module
- [ ] Ownership, distance, cooldown and pad checks on the server
- [ ] One active car per player (or per slot), destroyed on leave
- [ ] Idle-empty and fall-off cleanup
- [ ] Server-wide car cap tested with a full server

## Related
[[Vehicles - Hub]] · [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]] · [[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]] · [[Vehicle Customisation - Paint, Parts and Saved Loadouts]]
