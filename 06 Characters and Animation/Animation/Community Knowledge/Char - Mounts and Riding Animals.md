---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Char - Mounts and Riding Animals"
tags: [roblox, community-knowledge, animation, mounts, riding, seats]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/physics/network-ownership
---
# Char - Mounts and Riding Animals

Horses, dragons, wolves and bikes-with-legs share one problem: two animated characters must move as one, with the rider's pose matching the mount's gait and the movement feeling responsive on the rider's own screen. Roblox has no built-in mount system, but seats, a second Humanoid and network ownership cover it.

## The pieces

| Piece | Role |
|---|---|
| Mount model with its own `Humanoid`, `Animator` and `HumanoidRootPart` | Walks, runs and jumps with its own animation set |
| A `Seat` (or `VehicleSeat`) welded to the saddle | Attaches the rider; `Seat.Occupant` tells you who rides |
| Rider "sit" animation for this mount | Replaces the default sit pose |
| `BasePart:SetNetworkOwner(player)` on the mount root | Gives the rider's client physics authority, so steering has no round-trip delay |

## Mount and dismount flow

1. Player presses a `ProximityPrompt` on the saddle.
2. Server checks ownership / distance, then `seat:Sit(humanoid)`.
3. Server calls `mountRoot:SetNetworkOwner(player)`.
4. Rider client listens to `Humanoid.Seated` / `Humanoid.SeatPart` and starts the riding control script.
5. Dismount: jump (Humanoid leaves seat on jump) or a key; server resets owner with `SetNetworkOwner(nil)` or `SetNetworkOwnershipAuto()`.

## Steering

With a `VehicleSeat`, read `Throttle` and `Steer` (or read your own input) on the rider client and drive the mount Humanoid:

```lua
-- Rider client while seated (sketch)
RunService.RenderStepped:Connect(function()
	local cam = workspace.CurrentCamera
	local throttle, steer = seat.ThrottleFloat, seat.SteerFloat
	local forward = mountRoot.CFrame.LookVector * throttle
	mountHumanoid:Move(forward, false)
	if steer ~= 0 then
		mountRoot.CFrame *= CFrame.Angles(0, -steer * 0.04, 0)
	end
end)
```

A plain `Seat` has no throttle values; read `UserInputService` or `ContextActionService` instead. For flying mounts, replace `Humanoid:Move` with `AlignPosition` + `AlignOrientation` on the root.

## Animation sync

- **Rider sit pose per gait:** play a rider track for idle, walk, gallop. Switch on the mount's speed (`mountRoot.AssemblyLinearVelocity.Magnitude`) with 0.2 s fades.
- **Bounce:** match the rider clip loop length to the mount gait loop (for example both 0.8 s at gallop) and start them together, or the rider bobs out of phase.
- **Priority:** rider tracks at `Action` so they beat the default `sit`; keep upper-body actions (swing, shoot) at `Action2` keyed only on arms/torso.
- **Override sit globally:** if every seat in the game is a mount, replace the `sit` slot in the `Animate` script instead.

## Pitfalls

- The mount Humanoid and the rider both try to stand; keep the mount's `HipHeight` correct and set `seat.CanCollide = false`.
- Massive mounts plus a rider can push `AssemblyMass` high; set rider parts `Massless = true` while seated so the mount's movement tuning stays valid.
- Exploits: client network ownership means the rider can teleport the mount. Validate speed on the server and clamp.
- `Seat.Disabled = true` blocks touch-to-sit, so random players cannot hop onto someone's horse.

## Related
[[Animation - Hub]] · [[Animator Priorities, Weights and Blending Done Right]] · [[NPC Animation at Scale - Where to Play Tracks and Animator LOD]] · [[Directional Locomotion Blending - Strafe, Speed-Matched Gaits]]
