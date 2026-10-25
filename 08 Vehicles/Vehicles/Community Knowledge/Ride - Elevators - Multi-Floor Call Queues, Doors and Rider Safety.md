---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Elevators - Multi-Floor Call Queues, Doors and Rider Safety"
tags: [roblox, community-knowledge, vehicles, elevator, state-machine]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/physics/create-elevators
  - https://devforum.roblox.com/t/making-an-elevator/3986001
  - https://devforum.roblox.com/t/plugin-voidinteract-v200-custom-elevators-draggable-props-connected-systems/4918652
  - https://create.roblox.com/docs/reference/engine/classes/PrismaticConstraint
---
# Ride - Elevators - Multi-Floor Call Queues, Doors and Rider Safety

The official "Create elevators" tutorial shows the physics: a platform on a `PrismaticConstraint` servo, moved between two positions by a prompt. The DevForum "Making An Elevator" thread says the hard part starts when you have buttons for more than two floors: queueing presses and deciding which floor goes next. This note is that missing logic, plus doors and safety for players.

## Movement layer (short)
- Platform on a `PrismaticConstraint` with `ActuatorType = Servo`. Floors are a list of `TargetPosition` values (studs along the shaft).
- `Speed` 8-14 studs/s feels like a building elevator, `ServoMaxForce` high enough for the car plus a full load, `LinearResponsiveness` moderate so it eases in.
- Server owns the car (`SetNetworkOwner(nil)`), so all riders see the same motion. For CFrame-moved cars, use the riding-moving-vehicles note so standing players are carried.

## The call queue (the "collective control" rule)
Real elevators serve calls in the current travel direction first, then reverse. That is the classic SCAN behaviour and it stops the car bouncing between the two most recent presses.

```lua
local calls = {} -- [floor] = true
local dir = 0    -- 1 up, -1 down, 0 idle
local function closestAhead(current, d)
	local best
	for f in calls do
		if d == 1 and f > current and (not best or f < best) then best = f end
		if d == -1 and f < current and (not best or f > best) then best = f end
	end
	return best
end

local function nextFloor(current)
	if dir == 0 then dir = 1 end
	local f = closestAhead(current, dir)
	if not f then -- nothing ahead: reverse
		dir = -dir
		f = closestAhead(current, dir)
	end
	if not f then dir = 0 end -- no calls at all: idle
	return f
end
```
- A call for the floor the car is already parked at just reopens the doors; do not add it to `calls`.
- Duplicate presses do nothing (the table key already exists).
- A floor is removed from `calls` when the car arrives there.
- Hall buttons can be split into up and down calls in tall buildings; small games are fine with one call per floor.

## State machine
`Idle -> DoorsClosing -> Moving -> Arriving -> DoorsOpen (hold 3 s) -> DoorsClosing ...`
- Only accept `Moving` after doors report closed. The VoidInteract plugin's feature list describes the same rules: queue requests, reopen closing doors when blocked, wait for doors before travel.
- Door obstruction: a thin non-colliding sensor part in the doorway; if `workspace:GetPartsInPart(sensor)` finds a character while closing, reopen.
- Doors themselves can be `PrismaticConstraint` servos too, or tweened if anchored.

## Rider safety and exploits
- Players fall through fast floors when the car moves down faster than they can follow. Keep downward speed under about 15 studs/s or carry riders on the client.
- Let the server decide moves. Buttons are `ClickDetector`s or `ProximityPrompt`s handled server side; add a 0.3 s per-player debounce so spam clickers do not flood the queue.
- If the car is blocked (something stuck under it), the servo stops short: detect `CurrentPosition` not reaching the target within a timeout, then reverse to the previous floor.

## UX details that players notice
- Floor display inside and on every hall panel (`SurfaceGui` + floor attribute on the car).
- Ding sound and arrow lights on arrival.
- Lit call buttons stay on until served.

## Checklist
- [ ] Calls served in travel direction, then reverse
- [ ] No movement with doors open
- [ ] Obstruction reopens doors
- [ ] Riders do not clip through on the way down
- [ ] Server-only control, button debounce

## Related
[[Vehicles - Hub]] - [[Create elevators]] - [[Recipe - Moving Platform with PrismaticConstraint]] - [[Riding Moving Vehicles - Keeping Standing Players Onboard]]
