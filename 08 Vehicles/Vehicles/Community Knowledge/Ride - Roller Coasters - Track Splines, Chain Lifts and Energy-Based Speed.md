---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Roller Coasters - Track Splines, Chain Lifts and Energy-Based Speed"
tags: [roblox, community-knowledge, vehicles, roller-coaster, splines, theme-park]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/making-a-roller-coaster/1643743
  - https://devforum.roblox.com/t/3d-pathssplines/4163015
  - https://www.creation.dev/learn/spline-curve-library-roblox-path-creation
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/datatypes/CFrame
---
# Ride - Roller Coasters - Track Splines, Chain Lifts and Energy-Based Speed

Theme park and tycoon games need coasters that run the same way every time, look smooth at speed and do not throw players into the sky. The "Making a Roller Coaster" DevForum thread sums up the trap: tweening between waypoints looks "choppy, floaty". The approach that works is a **spline track with CFrame-moved cars and speed from energy**, not tweens and not free physics.

## Track
- Author the track as control points (Attachments in a folder, in order). Build a Catmull-Rom or Bezier spline through them, then precompute an arc-length table so you can look up `position(d)` and `tangent(d)` by distance (the Spline library article stresses arc-length parametrization for constant speed). Roblox has no native 3D spline or rail constraint; the "3D Paths/splines" feature request thread asks for one.
- Store **banking** (roll angle) per control point and interpolate it. Without banking, turns look flat and fake.
- Generate the visible rails and supports from the same spline so the cars always match.

## Speed from energy, not a fixed number
Real coasters are gravity rides: speed comes from height. Use conservation of energy with a bit of friction:

```lua
-- per step, d = distance along track
local h0 = topHeight -- height where speed was set (e.g. lift crest)
local function speedAt(y, v0)
	local g = workspace.Gravity * GRAVITY_SCALE -- 0.3-0.5 feels right
	local v2 = v0 * v0 + 2 * g * (h0 - y)
	return math.sqrt(math.max(v2, MIN_SPEED * MIN_SPEED))
end
```
- Subtract a small friction loss over distance so the train slows across the ride.
- Add `MIN_SPEED` so the train never stalls on a hill you designed badly (or allow rollbacks on purpose).

## Track sections
| Section | Rule |
|---|---|
| Station | Speed 0, restraints lock, dispatch timer |
| Chain lift | Fixed slow speed (6-10 studs/s) ignoring gravity, clack loop sound |
| Launch | Accelerate to target speed over 2-3 s |
| Free run | Energy-based speed |
| Brake run | Decelerate to 6 studs/s, then station speed |

Each section is just a range of distances with a rule; the speed function checks which range the head car is in.

## Cars
- Each car sits at `headDistance - i * carSpacing`. Orient with front and rear wheel points plus the interpolated bank roll: `CFrame.lookAt(rear, front)` then rotate by roll around the look vector.
- Move the train with `PivotTo` per car on every client from a shared server start time (`workspace:GetServerTimeNow()`), so the ride is smooth and identical for everyone. The server only needs the dispatch time.
- Seats welded into anchored cars; riders become part of a CFrame-moved model. Disable jumping (`Seat` occupants, set `Humanoid.JumpPower` 0 or block the jump state) during the ride.

## Thrill extras
- Camera: optional ride camera locked to the car with slight lag, plus FOV kick on drops.
- Airtime: when vertical acceleration goes below gravity, lift the rider camera slightly.
- Ratings for tycoons: compute max speed, max drop, number of inversions (count where the car's up vector points below horizontal) and turn them into excitement score.

## Pitfalls
- Physics coasters with wheels on rails derail and cost CPU; the thread's welding-to-a-moving-part tip is the same idea as CFrame cars.
- Too-tight curves at high speed look like snapping; enforce a minimum radius in the editor.

## Related
[[Vehicles - Hub]] - [[Ride - Train Signals, Track Switches and Multi-Car Consists]] - [[Kenney - Coaster Kit]] - [[Trains on Roblox - Spline CFrame Trains vs PrismaticConstraint Carts]]
