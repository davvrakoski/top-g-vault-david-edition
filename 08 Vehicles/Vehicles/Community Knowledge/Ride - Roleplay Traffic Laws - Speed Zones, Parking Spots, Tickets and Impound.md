---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Roleplay Traffic Laws - Speed Zones, Parking Spots, Tickets and Impound"
tags: [roblox, community-knowledge, vehicles, roleplay, traffic, police]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/cloud-services/data-stores
---
# Ride - Roleplay Traffic Laws - Speed Zones, Parking Spots, Tickets and Impound

City roleplay games run on rules players choose to follow or break. Traffic law systems give police players something to enforce and civilians a reason to drive carefully, and they keep the map tidy: no cars abandoned across the main road. The racing police-chase note covers wanted levels; this one is the everyday layer: speed limits, parking, tickets and the impound lot.

## Speed zones
- Tag road zone parts with CollectionService (`SpeedZone`) and an attribute `Limit` (studs/s or your displayed unit).
- Check each driven car on the server every 0.5 s: find which zone contains the car's root with `workspace:GetPartBoundsInBox` or `GetPartsInPart` against zone parts (use an `OverlapParams` filter that only includes zones).
- Show the current limit on the driver's HUD next to the speedometer.
- Speeding is not an automatic fine in most RP games; it creates a **record** police can see with a radar gun tool. Automatic speed cameras are a fun optional extra: flash, photo, fine mailed to the owner.

```lua
local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = CollectionService:GetTagged("SpeedZone")
local function limitAt(cf, size)
	local zones = workspace:GetPartBoundsInBox(cf, size, params)
	local best = math.huge
	for _, z in zones do best = math.min(best, z:GetAttribute("Limit") or best) end
	return best
end
```
Remember to refresh the filter list when zones stream in or are added.

## Radar gun (police tool)
- Police aims at a car; the server raycasts from the officer to the target and reads the car's `AssemblyLinearVelocity.Magnitude` as the server sees it.
- Result shows speed, limit and plate. Officer can issue a ticket from the readout.

## Parking
- Parking spots are tagged parts with optional rules: `Allowed = "Civilian" | "Police" | "Taxi"`, `MaxMinutes`.
- A car counts as parked when it is in a spot, speed is near zero and nobody is in the driver seat for 10 s.
- Illegal parking: stopped outside a spot on a road zone, or in a wrong-type spot, for over 60 s. Mark the car with an attribute `Illegal = true` so police see a marker.
- Despawn rule for abandoned cars: no driver and owner over 200 studs away for 5 minutes -> send to impound instead of deleting, so players are not angry.

## Tickets
- A ticket is a server record: `{plate, reason, amount, officer, time, paid = false}` saved to the car owner's data.
- Pay at a city hall NPC or a phone app; unpaid tickets over a limit raise the owner's wanted level or block car spawning until paid.
- Officers earn a share of paid tickets (not issued tickets) to stop ticket spam.
- Appeals: let players dispute; a moderator or senior police role reviews. Keeps griefing officers in check.

## Impound
- Impounded car = unavailable in the garage, with a release fee and a timer, shown in the spawner UI.
- Tow truck job: a player tows the illegal car to the impound lot with the towing system and gets paid; or auto-tow after a delay if no tow players are online.

## Fairness rules
- Grace periods everywhere (spawn zones, first 30 s after spawning).
- Never fine someone automatically while they are being chased or are in a race event.
- Log every ticket and impound with officer id; limit tickets per officer per hour.

## Related
[[Vehicles - Hub]] - [[Racing - Police Chases and Wanted Levels]] - [[Trailers and Towing with BallSocketConstraint]] - [[Speedometer and Vehicle HUD - Studs to km-h and mph]]
