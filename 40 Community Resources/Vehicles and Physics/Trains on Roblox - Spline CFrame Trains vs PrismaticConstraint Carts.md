---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/trains"
title: "Trains on Roblox - Spline CFrame Trains vs PrismaticConstraint Carts"
tags: [roblox, community, vehicles, trains, splines, bezier, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/how-would-you-handle-a-train-system/3363135
  - https://devforum.roblox.com/t/train-move-system-dead-rails/3619607
---
# Trains on Roblox - Spline CFrame Trains vs PrismaticConstraint Carts

## Two families
| | **Spline / CFrame train** | **Physics cart (PrismaticConstraint)** |
|---|---|---|
| How | Train position = distance along a curve; you set its CFrame each frame | A "mover" part slides on a PrismaticConstraint motor; the rest is welded to it |
| Best for | Metro lines, scenic trains, NPC routes, fast travel | Player-driven carts, endless-track games (Dead Rails style) |
| Cost | Very cheap; no solver work | Normal physics cost |
| Derailing | Impossible | Possible if the constraint setup is wrong |
| Riders | Need help to stay on (see below) | Ride naturally on physics, but jitter at high speed |

## Spline trains (from "How would you handle a train system?", 2025)
Tomi1231's reply is the clearest recipe:
- **Weld** the train model, **anchor only the root**, and move the root's CFrame (optionally with `workspace:BulkMoveTo()`); `PivotTo` on unwelded models performs poorly.
- Use **splines (Bezier curves)**. Their length can only be approximated by sampling, so **precompute** it.
- Store the train's **distance** along the track and add `speed * dt` each frame; change `speed` to slow down for curves and stations (stopping on an exact spot needs extra code).
- **Never move each wagon on its own**: they drift apart over time. Compute every wagon from the lead car's distance.
- Another DevForum train thread warned that tweening node to node jitters (tweens take the shortest path), which is why splines win.

## Original Luau: one Bezier segment with arc-length lookup
Server Script. Each car is a welded Model with an anchored `PrimaryPart`.

```lua
--!strict
local RunService = game:GetService("RunService")

local P0 = Vector3.new(0, 5, 0)
local P1 = Vector3.new(200, 5, 0)
local P2 = Vector3.new(300, 5, 150)
local P3 = Vector3.new(300, 5, 400)

local SAMPLES = 256
local SPEED = 40          -- studs/s
local CAR_GAP = 22        -- studs between car centers

local function bezier(t: number): Vector3
	local u = 1 - t
	return P0 * (u * u * u) + P1 * (3 * u * u * t) + P2 * (3 * u * t * t) + P3 * (t * t * t)
end

-- Arc-length table: cumulative distance at each sample.
local points: { Vector3 } = { bezier(0) }
local distances: { number } = { 0 }
for i = 1, SAMPLES do
	local p = bezier(i / SAMPLES)
	distances[i + 1] = distances[i] + (p - points[i]).Magnitude
	points[i + 1] = p
end
local TRACK_LENGTH = distances[#distances]

local function pointAt(d: number): Vector3
	d = math.clamp(d, 0, TRACK_LENGTH)
	local lo, hi = 1, #distances
	while hi - lo > 1 do              -- binary search for the sample pair
		local mid = (lo + hi) // 2
		if distances[mid] < d then lo = mid else hi = mid end
	end
	local span = distances[hi] - distances[lo]
	local alpha = if span > 0 then (d - distances[lo]) / span else 0
	return points[lo]:Lerp(points[hi], alpha)
end

local function cframeAt(d: number): CFrame
	local here = pointAt(d)
	local ahead = pointAt(d + 1)
	if (ahead - here).Magnitude < 1e-3 then
		ahead = here + (here - pointAt(d - 1))
	end
	return CFrame.lookAt(here, ahead)
end

local cars = (workspace:WaitForChild("Train") :: Folder):GetChildren()
table.sort(cars, function(a, b) return a.Name < b.Name end)   -- Car1, Car2, ...

local headDistance = 0
RunService.Heartbeat:Connect(function(dt)
	headDistance += SPEED * dt
	if headDistance > TRACK_LENGTH then
		headDistance = 0                 -- loop for the demo; real lines chain segments
	end
	local parts: { BasePart } = {}
	local frames: { CFrame } = {}
	for i, car in cars do
		local root = (car :: Model).PrimaryPart :: BasePart
		table.insert(parts, root)
		table.insert(frames, cframeAt(headDistance - (i - 1) * CAR_GAP))
	end
	workspace:BulkMoveTo(parts, frames, Enum.BulkMoveMode.FireCFrameChanged)
end)
```

For a full line, chain segments end to end, keep one arc-length table per segment, and sum their lengths. Moving it on the **server** keeps every client in sync; moving it on each **client** from a shared start time (`workspace:GetServerTimeNow()`) is smoother and costs the server nothing.

## Physics carts (from "Train Move System [Dead Rails]", 2025)
Nanaisky shared a template place (no license named, **link only**):
- The cart rides a **PrismaticConstraint** with a Motor actuator; the VehicleSeat throttle sets its speed, and a HingeConstraint motor spins the wheels from the cart's velocity.
- Rails spawn ahead automatically: a downward ray finds the current rail's hitbox; when it is the last one, the next rail is placed at a small angle (0.25 degrees).
- A reply suggested a dedicated "Mover" part owning the prismatic, everything else welded to it, `MotorMaxAcceleration` around 10-20, `MotorMaxForce` at infinity, and network ownership for the driver.
- Reported issues: a short jolt when the driver leaves (ownership handover), and **standing players jitter** at high speed.

## Players riding trains
Both families need the rider fix in [[Riding Moving Vehicles - Keeping Standing Players Onboard]]. CFrame-moved anchored trains do not carry characters at all by default.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Prismatic]] · [[Kenney - Train Kit]] · [[NPC Traffic - Community Approaches and the City People Cars Demo]] · [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]

<!-- TDOD_GRAPH_END -->
