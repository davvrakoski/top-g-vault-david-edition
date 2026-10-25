---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/speedometer-hud"
title: "Speedometer and Vehicle HUD - Studs to km-h and mph"
tags: [roblox, community, vehicles, ui, hud, speedometer, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/physics/units
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
  - https://devforum.roblox.com/t/studs-per-second-to-kph/930407
  - https://devforum.roblox.com/t/2497221
  - https://devforum.roblox.com/t/2508569
  - https://devforum.roblox.com/t/studify-easily-convert-studs-to-real-world-metrics/1895364
  - https://github.com/crannm/Studify
---
# Speedometer and Vehicle HUD - Studs to km-h and mph

## Get the conversion right first
Old DevForum threads disagree wildly (one assumes 20 studs per metre, another 1 stud = 10 inches). Use the official [[Roblox units]] page: **1 stud = 28 cm**.

| From studs/s | Multiply by | Example: 100 studs/s |
|---|---|---|
| m/s | 0.28 | 28 m/s |
| km/h | 1.008 | 100.8 km/h |
| mph | 0.6263 | 62.6 mph |

Handy rule: **studs per second is almost exactly km/h**. A seat `MaxSpeed` of 120 is a ~120 km/h car.

**Studify** by icrann (MIT, GitHub `crannm/Studify`, Creator Store model "Studify 1.0", 2022) is a small module for these conversions. Its thread settled on studs x 0.28 = metres. Bundle-safe under MIT with credit, but it is tiny and unmaintained, so the two constants above are usually all you need.

## Which speed to show
- `AssemblyLinearVelocity` of the car's root part is the whole car's velocity. Older posts read `Velocity` on the seat, which is deprecated.
- **Flatten** it (`* Vector3.new(1, 0, 1)`) so falling off a ramp does not spike the needle, as one thread does.
- Or project onto the car's forward axis to get a **signed** speed, so you can show "R" when reversing.

## Replace the default HUD
VehicleSeat has `HeadsUpDisplay` (on by default), a simple built-in speed bar. Turn it off and draw your own; a reply in a speedometer help thread gives exactly that advice.

## Original Luau: digital + needle speedometer
ScreenGui `Speedo` (with `ResetOnSpawn` off) containing a TextLabel `Readout` and a square ImageLabel `Needle` centered on the dial. GUI rotation always turns around the element's center, so draw the needle art from the image's middle to its top edge. LocalScript in the ScreenGui.

```lua
--!strict
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local KMH_PER_STUD = 1.008
local MPH_PER_STUD = 0.6263
local USE_MPH = false

local NEEDLE_MIN_DEG = -120   -- needle angle at 0
local NEEDLE_MAX_DEG = 120    -- needle angle at the dial's top speed
local DIAL_TOP_KMH = 200
local SMOOTHING = 12          -- higher = snappier needle

local gui = script.Parent :: ScreenGui
local readout = gui:WaitForChild("Readout") :: TextLabel
local needle = gui:WaitForChild("Needle") :: ImageLabel

local player = Players.LocalPlayer
local shown = 0

local function currentSeat(): VehicleSeat?
	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	local seat = humanoid and humanoid.SeatPart
	if seat and seat:IsA("VehicleSeat") then
		return seat
	end
	return nil
end

RunService.RenderStepped:Connect(function(dt)
	local seat = currentSeat()
	gui.Enabled = seat ~= nil
	if not seat then
		shown = 0
		return
	end
	seat.HeadsUpDisplay = false   -- local only; hides the built-in bar for this player

	local v = seat.AssemblyLinearVelocity
	local forward = v:Dot(seat.CFrame.LookVector)          -- signed, studs/s
	local flat = (v * Vector3.new(1, 0, 1)).Magnitude    -- unsigned, studs/s
	local kmh = flat * KMH_PER_STUD

	-- Frame-rate independent smoothing toward the real value.
	shown += (kmh - shown) * (1 - math.exp(-SMOOTHING * dt))

	local value = if USE_MPH then shown / KMH_PER_STUD * MPH_PER_STUD else shown
	local gear = if forward < -1 then "R" else ""
	readout.Text = string.format("%s%d %s", gear, math.round(value), if USE_MPH then "mph" else "km/h")

	local alpha = math.clamp(shown / DIAL_TOP_KMH, 0, 1)
	needle.Rotation = NEEDLE_MIN_DEG + (NEEDLE_MAX_DEG - NEEDLE_MIN_DEG) * alpha
end)
```

Notes:
- `math.exp` smoothing behaves the same at 30 or 144 FPS; a plain `lerp(…, 0.1)` does not.
- Compute the readout on the client from physics; never trust a client-reported speed for leaderboards.
- A chassis with its own root part should read that root's velocity instead of the seat's (same assembly, same number, but clearer code).

## More HUD ideas
- RPM / gear: show from your chassis's own values, not physics.
- Boost bar, lap timer and position: see [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]].
- Keep it inside the safe area and away from the touch pedals: [[Safe Areas, Thumb Zones and Console UI Navigation]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Roblox units]] · [[VehicleSeat]] · [[Mobile Vehicle Controls - Community Findings]] · [[Vehicle Enter - Exit, Seats and Camera]]

<!-- TDOD_GRAPH_END -->
