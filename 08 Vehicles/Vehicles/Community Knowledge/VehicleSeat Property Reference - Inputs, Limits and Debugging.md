---
area: "08 Vehicles"
cluster: "Vehicles"
title: "VehicleSeat Property Reference - Inputs, Limits and Debugging"
tags: [roblox, community-knowledge, vehicles, vehicleseat, input]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://devforum.roblox.com/t/mobile-buttons-for-vehicleseat/1791563
---
# VehicleSeat Property Reference - Inputs, Limits and Debugging

`VehicleSeat` is the oldest and simplest way to make something drivable: a player touches it, gets welded in, and their movement keys are forwarded to the seat. Even if you write your own chassis, most Roblox cars still use a VehicleSeat purely as an **input reader** because it already maps keyboard, gamepad and the mobile thumbstick to two numbers. Knowing exactly what each property does saves hours of "why won't it move" debugging.

## The properties that matter

| Property | Type | What it does | Practical note |
|---|---|---|---|
| `ThrottleFloat` | float, -1..1 | Forward / reverse input | Falls back to 0 unless constantly set. Read it every frame. |
| `SteerFloat` | float, -1..1 | Left (-1) / right (+1) input | Same refresh-to-zero rule. |
| `Throttle`, `Steer` | int | Old -1/0/1 versions | **Deprecated and no longer replicated.** Do not read them in new code. |
| `MaxSpeed` | float | Top speed for the built-in drive | Only used by the seat's own hinge driving. |
| `Torque` | float | How fast it reaches MaxSpeed | Same: built-in drive only. |
| `TurnSpeed` | float | Built-in turning speed | Docs warn higher is not better. |
| `HeadsUpDisplay` | bool | Shows the default speed bar | Turn off when you have your own HUD. |
| `Disabled` | bool | No auto-weld on touch, no control | Use it to stop accidental sits (see below). |
| `Occupant` | Humanoid | Who is driving | Read-only, not replicated as a property change you set. |
| `AreHingesDetected` | int | How many hinges the seat found | Read-only debugging aid. |

Method: `VehicleSeat:Sit(humanoid)` forces a character into the seat (server side).

## Built-in drive vs your own drive
The seat's built-in drive only finds motors **connected directly to the seat or through rigid connections**. If a wheel hangs off a part that is itself hinged to the seat's assembly, the seat will not see it. That is why `AreHingesDetected` exists: if it reads 0 while you expect 4, the wheels are not rigidly reachable.

Most modern chassis ignore `MaxSpeed`, `Torque` and `TurnSpeed` and instead do this:

```lua
-- LocalScript on the driver's client (the driver owns the car's physics)
local RunService = game:GetService("RunService")
local seat: VehicleSeat = script.Parent.DriveSeat
local rearLeft: HingeConstraint = script.Parent.Constraints.RearLeft

RunService.Heartbeat:Connect(function()
	local throttle = seat.ThrottleFloat
	local steer = seat.SteerFloat
	rearLeft.AngularVelocity = throttle * 40 -- rad/s, tune per wheel size
	-- steering servo: see the HingeConstraint motor note
end)
```

## Pitfalls
- **"The car moves once then stops."** Custom mobile buttons set `ThrottleFloat` on press only. It snaps back to 0, so write it every frame while the button is held (DevForum mobile-buttons thread).
- **Reading `Throttle`** from a server Script returns stale values because it is no longer replicated. Use the float versions, or send input through your own remote / attributes.
- **Accidental sits.** Any touch welds the player. Set `Disabled = true` and use a ProximityPrompt that calls `Sit()` on the server.
- **HUD overlap.** The default speed bar shows up on top of a custom speedometer if `HeadsUpDisplay` stays true.
- **Exit jumps.** The seat welds through a `SeatWeld`; jumping breaks it. Plan exits so the player is not dropped under the car.

## Checklist
- [ ] Inputs read from `ThrottleFloat` / `SteerFloat` only
- [ ] `HeadsUpDisplay` off if you have a custom HUD
- [ ] `AreHingesDetected` checked when using the built-in drive
- [ ] Seat `Disabled` until a deliberate entry action
- [ ] Network owner set to the driver on sit, reset on exit

## Related
[[Vehicles - Hub]] · [[Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat]] · [[Vehicle Enter - Exit, Seats and Camera]] · [[Mobile Vehicle Controls - Community Findings]] · [[VehicleSeat]]
