---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Seat Entry with ProximityPrompt - No More Accidental Sits"
tags: [roblox, community-knowledge, vehicles, seats, proximityprompt, ux]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
---
# Seat Entry with ProximityPrompt - No More Accidental Sits

By default, touching a `Seat` or `VehicleSeat` welds the character in. Players get sucked into cars they walk past, trolls drive other people's cars, and on mobile there is no clear "get in" action. Every polished vehicle game replaces touch-to-sit with a deliberate prompt. The pattern is small and robust.

## The pattern
1. Set every seat's `Disabled = true`. The docs: a disabled seat will not weld a character on collision.
2. Add one `ProximityPrompt` per door (or per seat) with clear text.
3. On `Triggered` (server), validate, enable the seat, call `Seat:Sit(humanoid)`, then disable again so nobody else can touch-sit.

```lua
-- Server Script inside the car model
local prompt: ProximityPrompt = script.Parent.DriverDoor.EnterPrompt
local seat: VehicleSeat = script.Parent.DriveSeat
prompt.ActionText = "Drive"
prompt.ObjectText = script.Parent.Name
prompt.HoldDuration = 0.25
prompt.MaxActivationDistance = 8
prompt.RequiresLineOfSight = false

prompt.Triggered:Connect(function(player)
	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 or humanoid.SeatPart then return end
	if seat.Occupant then return end
	if not canUseCar(player, script.Parent) then return end -- owner / team / locked

	seat.Disabled = false
	seat:Sit(humanoid)
	task.defer(function()
		seat.Disabled = true -- seated player stays; new touches are ignored
	end)
end)

seat:GetPropertyChangedSignal("Occupant"):Connect(function()
	prompt.Enabled = seat.Occupant == nil
end)
```
Test that disabling after sitting does not eject the occupant in your setup; if it does, keep the seat enabled while occupied and disable it again when `Occupant` becomes nil.

## Prompt settings that help
| Property | Suggestion |
|---|---|
| `HoldDuration` | 0.2-0.4 s: stops accidental entry while running past |
| `MaxActivationDistance` | 6-10 studs from the door part |
| `KeyboardKeyCode` / `GamepadKeyCode` | E / ButtonX are the common defaults; keep one key for all doors |
| `Exclusivity` | `OnePerButton` so only the nearest door shows |
| `UIOffset` | Nudge the prompt off the door handle so it does not hide the car |

Use separate prompts for "Drive" and "Passenger"; one prompt that picks the nearest seat confuses players.

## Exiting
- Jump exits by default. Many games add an explicit exit action (same key as entry) that the client requests and the server performs by setting `humanoid.Sit = false` and pivoting the character to a safe exit point beside the door.
- Pick the exit point with a spatial query so the player is not placed inside a wall or under another car; try the other side if blocked.
- Clear velocity on exit to avoid the "launched out of the car" jolt (see the ownership recipes).

## Locking and ownership
Store `OwnerUserId` and `Locked` as attributes on the car. `canUseCar` checks them on the server; the client can grey out the prompt text ("Locked") but the server is what refuses.

## Related
[[Vehicles - Hub]] · [[Vehicle Enter - Exit, Seats and Camera]] · [[VehicleSeat Property Reference - Inputs, Limits and Debugging]] · [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]] · [[ProximityPrompt]]
