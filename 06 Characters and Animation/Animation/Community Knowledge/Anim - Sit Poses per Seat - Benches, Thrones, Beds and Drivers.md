---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Sit Poses per Seat - Benches, Thrones, Beds and Drivers"
tags: [roblox, community-knowledge, animation, seats, sitting, roleplay]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/animation/using
---
# Anim - Sit Poses per Seat - Benches, Thrones, Beds and Drivers

Roleplay games are full of furniture, and every seat using the same stiff default sit is a missed chance: a throne should lounge, a bed should lie down, a bar stool should perch, a motorbike should lean forward. The `Seat` / `VehicleSeat` mechanics stay the same; you only choose which pose plays after the character sits, based on data stored on the seat.

## How sitting works

- A character touching a `Seat` (or calling `seat:Sit(humanoid)`) is welded to it with a weld named `SeatWeld` and `Humanoid.Sit` becomes true.
- `Humanoid.Seated` fires with `(active, seatPart)`; `Humanoid.SeatPart` holds the current seat.
- The default `Animate` script plays its sit animation while seated. Your custom pose plays **on top** at a higher priority, so the default can stay.

## Data on the seat

Tag the seat with attributes instead of writing a script per chair:

| Attribute | Example | Meaning |
|---|---|---|
| `SitPose` | `"Lounge"`, `"Perch"`, `"LieBack"`, `"Moto"` | Which clip to play |
| `SitOffset` | `Vector3` (0, 0.3, -0.2) | Optional fine-tune of where the body ends up |

## Play the pose (LocalScript in StarterCharacterScripts)

```lua
local humanoid = script.Parent:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local Poses = require(game.ReplicatedStorage.SitPoses) -- name -> asset id

local tracks, current = {}, nil

local function trackFor(name)
	if tracks[name] then return tracks[name] end
	local a = Instance.new("Animation")
	a.AnimationId = Poses[name]
	local t = animator:LoadAnimation(a)
	t.Priority = Enum.AnimationPriority.Action
	t.Looped = true
	tracks[name] = t
	return t
end

humanoid.Seated:Connect(function(active, seat)
	if current then current:Stop(0.2); current = nil end
	if active and seat then
		local name = seat:GetAttribute("SitPose")
		if name and Poses[name] then
			current = trackFor(name)
			current:Play(0.25)
		end
	end
end)
```

Because the track plays on the local character's `Animator`, other players see it too.

## Offsets: fix the seat, not the clip

Each clip assumes the hips sit at a certain height. If a pose floats above a low sofa or sinks into a throne, move the **seat part** (or set its `SitOffset` and apply it to the `SeatWeld`'s `C0` on the server once the weld exists) rather than baking an offset into the clip. One clip then works on many pieces of furniture.

## Pose ideas

- **Perch** (bar stool): feet on the rung, hands on knees.
- **Lounge** (throne, sofa): lean back, one arm on the armrest; add a slow breathing loop.
- **LieBack** (bed, sun lounger): the seat part lies along the bed; the clip rotates the torso to lie flat.
- **Moto / Bike**: lean forward, hands on grips. Combine with IK for handlebars that steer.
- **Driver**: hands on the wheel at 10 and 2; for steering, blend `SteerLeft`/`SteerRight` tracks by the `VehicleSeat.Steer` value.

## Players should be able to leave

Jumping exits a seat. If your pose hides the jump (lying in bed), still make sure jump works, or add a "Get up" `ProximityPrompt`. Also stop the pose when the character dies or the seat is destroyed (`Seated` fires with `active = false` in normal exits).

## Pitfalls

- Pose keys the full body but seat is tilted: the character looks twisted. Keep seat parts level unless the pose expects tilt.
- Accidental sits from walking into seats: see the ProximityPrompt seat entry note in Vehicles.
- Large avatars clip through armrests; give thrones wide seats or scale-check in an avatar edge-case pass.

## Related
[[Animation - Hub]] · [[Seat Entry with ProximityPrompt - No More Accidental Sits]] · [[Char - Mounts and Riding Animals]] · [[Animator Priorities, Weights and Blending Done Right]]
