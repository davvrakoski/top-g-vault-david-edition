---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "Snapshot Interpolation - Render Delay, Buffers and Extrapolation Limits"
tags: [roblox, community-knowledge, networking, interpolation, custom-replication, netcode]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://gafferongames.com/post/snapshot_interpolation/
  - https://gabrielgambetta.com/entity-interpolation.html
  - https://create.roblox.com/docs/reference/engine/classes/Workspace#GetServerTimeNow
  - https://create.roblox.com/docs/reference/engine/classes/UnreliableRemoteEvent
---
# Snapshot Interpolation - Render Delay, Buffers and Extrapolation Limits

Roblox smooths replicated physics for you, but the moment you replicate state yourself (server-side NPC positions sent over an UnreliableRemoteEvent, a custom projectile, a boss arena rotation), the client receives a few discrete samples per second and must draw something in between. Drawing the newest sample makes movement jerk; guessing ahead makes things clip through walls. **Snapshot interpolation** is the standard answer: render remote objects slightly in the past, between two samples you already have. Glenn Fiedler's "Snapshot Interpolation" article (Gaffer on Games) and Gabriel Gambetta's "Entity Interpolation" are the two classic write-ups; this note turns them into Roblox terms.

## The idea in three lines

1. The server stamps each sample with its time (`workspace:GetServerTimeNow()`).
2. The client keeps a short buffer of samples per entity.
3. Each frame, the client renders at `renderTime = GetServerTimeNow() - delay` and blends between the two samples that bracket `renderTime`.

Because `GetServerTimeNow()` is the client's best estimate of server time, no clock exchange is needed.

## Choosing the delay (Fiedler's numbers)

Fiedler's rule: buffer enough to survive **two lost packets in a row**, roughly **3 x the send interval**, plus a margin for jitter. His measured results:

| Send rate | Delay that looked clean |
| --- | --- |
| 10 per second | ~350 ms |
| 30 per second | ~150 ms |
| 60 per second | ~85 ms |

On Roblox you rarely want to send custom state at 60 Hz (the network budget and the ~500 remote calls per second per client limit both bite), so 10-20 Hz with 150-300 ms delay is typical for NPCs and props. Players will not notice an NPC being 200 ms in the past; they do notice jitter.

## Minimal client buffer

```lua
local RunService = game:GetService("RunService")
local INTERP_DELAY = 0.2
local MAX_SAMPLES = 8

local buffers: {[number]: {{t: number, cf: CFrame}}} = {}

local function push(id: number, t: number, cf: CFrame)
	local buf = buffers[id] or {}
	buffers[id] = buf
	if #buf > 0 and t <= buf[#buf].t then return end -- drop late/out-of-order samples
	table.insert(buf, { t = t, cf = cf })
	if #buf > MAX_SAMPLES then table.remove(buf, 1) end
end

local function sample(id: number): CFrame?
	local buf = buffers[id]
	if not buf or #buf == 0 then return nil end
	local rt = workspace:GetServerTimeNow() - INTERP_DELAY
	for i = #buf - 1, 1, -1 do
		local a, b = buf[i], buf[i + 1]
		if a.t <= rt then
			local alpha = math.clamp((rt - a.t) / (b.t - a.t), 0, 1)
			return a.cf:Lerp(b.cf, alpha)
		end
	end
	return buf[1].cf -- renderTime is older than the buffer: hold the oldest
end
```

Call `sample` from `RunService.RenderStepped` (or `PreRender`) for entities on screen and apply with `PivotTo` or `BulkMoveTo`. Unreliable remotes are unordered, which is why `push` drops samples older than the newest.

## When samples run out: extrapolation, carefully

If `renderTime` is newer than the newest sample (a burst of loss), you can hold the last pose or extrapolate with the last velocity. Fiedler found extrapolation poor for things that collide: objects go through floors and snap back. He considered it workable only for mostly linear movers (planes, boats) over short windows (50-250 ms). Practical Roblox rule: extrapolate at most ~100-150 ms, then freeze, and blend back when data resumes.

## Better curves

Linear blending shows small velocity kinks at each sample. Fiedler's fix was Hermite interpolation using position **and** velocity per sample, which removed visible artifacts at 10 Hz for a small bandwidth increase. Rotation: `CFrame:Lerp` already does a slerp-style blend, which Fiedler found sufficient without sending angular velocity.

## Bandwidth discipline

Unreliable remote payloads over 1000 bytes are dropped (docs). Pack samples with buffers and quantize positions ([[Buffers and Bit Packing for Network Payloads]]), send only entities near each player ([[Net - Interest Management - Choosing Which Entities Each Player Receives]]), and send at a fixed rate rather than every Heartbeat.

## What not to interpolate this way

- **The local player's own character or abilities**: that needs prediction, not delay ([[Net - Predicting Movement Abilities - Dashes, Double Jumps and Server Checks]]).
- Things Roblox already replicates as physics. Double-smoothing adds lag.
- Hit detection: if the server checks hits against current positions while clients see the past, add lag compensation or generous hitboxes ([[Latency, Prediction and Reconciliation]]).

## Related
[[Networking Security - Hub]] · [[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]] · [[Frame-Rate Independent Smoothing - Exponential Decay and Springs]] · [[Net - Custom Entity Replication - Server Data, Client Models]]
