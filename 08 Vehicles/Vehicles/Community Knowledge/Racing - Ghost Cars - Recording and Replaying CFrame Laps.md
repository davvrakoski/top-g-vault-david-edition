---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Ghost Cars - Recording and Replaying CFrame Laps"
tags: [roblox, community-knowledge, vehicles, racing, replay, ghost]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/how-would-i-make-a-replay-system-like-in-rocket-league/355908
  - https://devforum.roblox.com/t/how-can-i-make-a-replay-system-run-at-a-fixed-60fps/3583932
  - https://devforum.roblox.com/t/replaycore-a-modern-open-source-replay-system-for-roblox/4803450
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Racing - Ghost Cars - Recording and Replaying CFrame Laps

A ghost car (your best lap, a friend's lap, or the world record driven as a see-through car) is the single best feature for time-trial retention: it gives players a target they can see. On Roblox it is cheap, because you do not replay physics, you replay **positions**. DevForum advice for vehicle replays agrees: only record the root part of the vehicle, never every part.

## What to record

- One sample = time since lap start + chassis `CFrame` (position + rotation).
- Optional: steer value (to turn the ghost's front wheels) and a "boosting" bit for VFX.
- Rate: 10-20 samples per second is plenty. Interpolation fills the gaps. A thread on fixed-rate replays records on a fixed step (e.g. inside `RunService.PreSimulation`) with timestamps so playback is not tied to the recorder's frame rate.

## Recording on the client, keeping it light

```lua
local RunService = game:GetService("RunService")
local SAMPLE_DT = 1 / 15

local samples = {}
local acc, t = 0, 0
local conn = RunService.PreSimulation:Connect(function(dt)
	t += dt
	acc += dt
	if acc < SAMPLE_DT then return end
	acc -= SAMPLE_DT
	local cf = chassis.CFrame
	local rx, ry, rz = cf:ToOrientation()
	table.insert(samples, {
		math.floor(t * 1000),                       -- ms
		math.floor(cf.X * 20), math.floor(cf.Y * 20), math.floor(cf.Z * 20), -- 0.05 stud
		math.floor(rx * 1000), math.floor(ry * 1000), math.floor(rz * 1000), -- mrad
	})
end)
```

Quantising to integers makes the JSON roughly half the size of raw floats and is invisible at playback. A 60 s lap at 15 Hz is about 900 samples of 7 integers: tens of KB as JSON, far under the 4 MB data store value limit, so one key per track per player is fine.

## Who records: client or server?

- **Client recording** is smooth and free for the server, but the client could send a fake lap. Accept it only when the *server's own* lap timer agrees within a small tolerance (e.g. 0.3 s) and the server saw every gate.
- **Server recording** (sampling the chassis on the server at 10 Hz) is trustworthy but slightly jerkier due to replication. Good choice for world-record ghosts.
- A common compromise: client recording for personal bests, server recording for anything shown on a public leaderboard.

## Playback

The ghost is a cloned car model: every part `Anchored = true`, `CanCollide = false`, `CanQuery = false`, `CanTouch = false`, transparency 0.5-0.7, maybe a `Highlight` for readability. Run it on the client only; other players never need to see your ghost.

```lua
local function sampleAt(samples, timeMs)
	-- binary search would be better for long laps; linear cursor is fine if time only moves forward
	local i = cursor
	while samples[i + 1] and samples[i + 1][1] <= timeMs do i += 1 end
	cursor = i
	local a, b = samples[i], samples[i + 1] or samples[i]
	local span = math.max(b[1] - a[1], 1)
	local alpha = math.clamp((timeMs - a[1]) / span, 0, 1)
	local cfA = CFrame.new(a[2]/20, a[3]/20, a[4]/20) * CFrame.fromOrientation(a[5]/1000, a[6]/1000, a[7]/1000)
	local cfB = CFrame.new(b[2]/20, b[3]/20, b[4]/20) * CFrame.fromOrientation(b[5]/1000, b[6]/1000, b[7]/1000)
	return cfA:Lerp(cfB, alpha)
end
```

Move the whole ghost with one `PivotTo` per frame in `RenderStepped`. If you show 5+ ghosts at once, collect their root parts and CFrames into arrays and call `workspace:BulkMoveTo(parts, cframes, Enum.BulkMoveMode.FireCFrameChanged)` once. Because ghost parts are anchored, each part needs its own CFrame: cache every part's offset from the root once (`root.CFrame:ToObjectSpace(part.CFrame)`) and pass `ghostCF * offset` for each. Reset `cursor = 1` whenever a new lap starts.

## Design rules

- Start the ghost the moment the player crosses the start line, not at the countdown, so both laps share time zero.
- Fade the ghost when it overlaps the player's camera (distance < 8 studs) so it never blocks the view.
- Offer "PB ghost", "friend ghost" and "WR ghost"; let the player turn ghosts off.
- Show a live delta ("-0.84") by comparing the player's progress to the ghost's at the same time.

## Libraries

ReplayCore (DevForum, 2025-26) is an open-source general replay system that lists racing among its goals; check its license on the thread before bundling (unverified at time of writing). Treat it as "link only" until confirmed.

## Related
[[Vehicles - Hub]] · [[Racing - Time Trial Leaderboards with OrderedDataStore]] · [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]] · [[Leaderboard Blueprint]]
