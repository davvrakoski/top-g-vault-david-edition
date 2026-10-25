---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Server Heartbeat, Ping and Bandwidth Monitoring"
tags: [deep-dive, roblox, server-performance, heartbeat, ping, bandwidth, telemetry]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Server Heartbeat, Ping and Bandwidth Monitoring

**Why this matters:** a struggling server does not show low FPS on anyone's screen; it shows up as rubber-banding, delayed hits, laggy doors and "this game lags" reviews, so you have to measure it deliberately, on live servers, all the time.
This note explains the server metrics Roblox exposes, how to read them, a telemetry module that turns them into per-minute summaries with percentiles, and how to wire those numbers into load shedding and release checks.

---

## 1. The metrics and where they come from

| Metric | Source | What "bad" looks like |
| --- | --- | --- |
| **Server heartbeat** (steps per second) | Dev Console > **Server Jobs** > Heartbeat > *Steps Per Sec*; `RunService.Heartbeat` delta time in code | Persistently below 60. Roblox caps server heartbeat at **60 FPS** for all games, so lower values indicate a problem. |
| **Heartbeat time** | `Stats.HeartbeatTime` (total time to update all scheduler jobs, **seconds**; the old `HeartbeatTimeMs` is deprecated) | Approaching or above 16.7 ms |
| **Physics step time** | `Stats.PhysicsStepTime` (the old `PhysicsStepTimeMs` is deprecated) | A large share of the heartbeat budget |
| **Player ping** | `Player:GetNetworkPing()` (round-trip, **seconds**, network only) | High for everyone at once = server problem; high for one player = their connection |
| **Bandwidth** | `Stats.DataSendKbps`, `Stats.DataReceiveKbps` (roughly KB per second sent/received by this instance) | Climbs with players faster than expected; spikes |
| **Server memory** | Dev Console Memory (Server); `Stats:GetTotalMemoryUsageMb()` | Approaching 50% of the documented allowance ([[Developer Console Memory Categories Explained]]) |
| **Fleet view** | Creator Dashboard **Performance** dashboard: server heartbeat, CPU core utilisation, memory, client FPS, crash rates | Changes that line up with a release |

Roblox's guidance links server heartbeat directly to latency: the longer the server takes per frame, the longer it takes to process network data, so ping rises for everyone.

---

## 2. Read the numbers correctly

- **Average heartbeat hides spikes.** A server that averages 58 Hz but freezes for 400 ms every 10 seconds feels terrible. Track the **worst frame** and the **95th percentile** of frame time, not just the mean.
- **Ping from `GetNetworkPing` is network-only.** Roblox describes it as isolated round-trip latency that does not include data processing, so a slow server can feel laggier than ping suggests. Use it to separate "my connection" from "the server".
- **Bandwidth per player** is `DataSendKbps / #players`. A sudden rise usually means something started replicating every frame (attributes, unanchored parts, a remote fired in a loop).
- **CPU is shared per server and grows with players.** If heartbeat stays low after optimisation, Roblox offers **Extended Services for Compute**, which more than doubles per-player server CPU for a fee; Roblox notes most games see no benefit, and recommends reducing server work first. Typical candidates: heavy server physics or extensive use of server authority.

---

## 3. A telemetry module for live servers

```luau
--!strict
-- ServerScriptService/Services/ServerTelemetry.luau
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local WINDOW_SECONDS = 60
local MAX_SAMPLES = 4000 -- 60 s at 60 Hz plus headroom

local frameTimes: { number } = table.create(MAX_SAMPLES)
local frameCount = 0
local windowStart = os.clock()

local listeners: { (summary: Summary) -> () } = {}

export type Summary = {
	players: number,
	avgHz: number,
	p95FrameMs: number,
	worstFrameMs: number,
	heartbeatTimeMs: number,
	physicsStepMs: number,
	sendKbps: number,
	recvKbps: number,
	pingMedianMs: number,
	pingP90Ms: number,
	memoryMb: number,
}

local function percentile(sorted: { number }, p: number): number
	if #sorted == 0 then
		return 0
	end
	local index = math.clamp(math.ceil(#sorted * p), 1, #sorted)
	return sorted[index]
end

local function summarise(): Summary
	local count = math.min(frameCount, MAX_SAMPLES)
	local sorted = table.create(count)
	local total = 0
	for i = 1, count do
		sorted[i] = frameTimes[i]
		total += frameTimes[i]
	end
	table.sort(sorted)

	local pings = {}
	for _, player in Players:GetPlayers() do
		local ok, ping = pcall(function()
			return player:GetNetworkPing()
		end)
		if ok then
			table.insert(pings, ping * 1000)
		end
	end
	table.sort(pings)

	return {
		players = #Players:GetPlayers(),
		avgHz = if total > 0 then count / total else 0,
		p95FrameMs = percentile(sorted, 0.95) * 1000,
		worstFrameMs = (sorted[count] or 0) * 1000,
		heartbeatTimeMs = Stats.HeartbeatTime * 1000, -- HeartbeatTime is in seconds
		physicsStepMs = Stats.PhysicsStepTime * 1000, -- docs give no unit; assumed seconds like HeartbeatTime, check once in Studio
		sendKbps = Stats.DataSendKbps,
		recvKbps = Stats.DataReceiveKbps,
		pingMedianMs = percentile(pings, 0.5),
		pingP90Ms = percentile(pings, 0.9),
		memoryMb = Stats:GetTotalMemoryUsageMb(),
	}
end

local ServerTelemetry = {}

function ServerTelemetry.OnSummary(fn: (summary: Summary) -> ())
	table.insert(listeners, fn)
end

function ServerTelemetry.Start()
	RunService.Heartbeat:Connect(function(dt)
		frameCount += 1
		if frameCount <= MAX_SAMPLES then
			frameTimes[frameCount] = dt
		end
		if os.clock() - windowStart >= WINDOW_SECONDS then
			local summary = summarise()
			frameCount = 0
			windowStart = os.clock()
			for _, fn in listeners do
				task.spawn(fn, summary)
			end
		end
	end)

	ServerTelemetry.OnSummary(function(s)
		print(("[Telemetry] p=%d hz=%.1f p95=%.1fms worst=%.0fms hb=%.1fms phys=%.1fms send=%.0fKB/s recv=%.0fKB/s ping50=%.0f ping90=%.0f mem=%.0fMB"):format(
			s.players, s.avgHz, s.p95FrameMs, s.worstFrameMs, s.heartbeatTimeMs, s.physicsStepMs,
			s.sendKbps, s.recvKbps, s.pingMedianMs, s.pingP90Ms, s.memoryMb))
	end)
end

return ServerTelemetry
```

Notes:

- The Heartbeat callback does almost nothing per frame (one store, one comparison), so measuring does not distort what it measures. All sorting happens once a minute.
- Print lines are a start; ship the summary to your logging or analytics pipeline so you can chart it across the fleet ([[Observability and Debug Logging]], [[Errors, Observability and Incident Response]]).
- Tag summaries with `game.PlaceVersion` so you can compare releases.

---

## 4. From numbers to action: load shedding

Telemetry is only useful if something reacts. Feed the summary into a simple degradation ladder ([[Server Load Shedding]]):

```luau
local level = 0
ServerTelemetry.OnSummary(function(s)
	local stressed = s.avgHz < 50 or s.p95FrameMs > 28
	local healthy = s.avgHz > 58 and s.p95FrameMs < 20
	if stressed and level < 3 then
		level += 1
	elseif healthy and level > 0 then
		level -= 1
	end
	workspace:SetAttribute("LoadLevel", level) -- systems read this and adapt
end)
```

Example responses by level:

| Level | Response |
| --- | --- |
| 1 | Distant NPC AI from 5 Hz to 2 Hz; fewer ambient spawns |
| 2 | Cap active NPCs lower; stop server-side cosmetic physics; lower snapshot rate |
| 3 | Pause non-essential spawners; log an alert with the summary |

Move one level per minute and require sustained health to step back down, so the server does not oscillate.

---

## 5. Finding the cause when numbers go bad

1. **Server MicroProfiler dump** (Dev Console > MicroProfiler > Server, up to 60 frames) during the bad period ([[MicroProfiler Reading Guide]]).
2. **Server Script Profiler** for one minute if script labels are wide ([[Script Profiler, Native Code Gen and Luau Hot Paths]]).
3. **Network**: a MicroProfiler dump from the desktop client or Studio with **Network** set to Low/High, then in the web view **X-Ray > Network**: received traffic on top, sent below, coloured by type (physics blue, data green, assets red); right-click a bar for the network events window. Network data is only in dumps, not the live overlay.
4. Compare with the previous release using the same telemetry window.

Common root causes by signature:

| Signature | Likely cause |
| --- | --- |
| Heartbeat drops as player count rises, physics step high | Too many unanchored parts, ragdolls, vehicles; network ownership churn |
| Periodic worst-frame spikes every N seconds | Autosave serialisation, wave spawning, big table rebuilds |
| Send KB/s high, heartbeat fine | Replicating too much: attributes every frame, moving server-owned parts, chatty remotes |
| Ping high for all, heartbeat low | Server overloaded; fix CPU first |
| Memory climbs all session | Leak; see [[Memory grows over time]] |

---

## 6. Release gate

Before and after each release, compare a typical full server:

- [ ] Average heartbeat at or near 60, p95 frame under your threshold (for example 20 ms).
- [ ] Worst frame per minute under your spike threshold (for example 100 ms).
- [ ] Bandwidth per player within budget (set your own, for example tens of KB/s, and keep it stable release to release).
- [ ] Median ping unchanged from the previous release in the same regions.
- [ ] Server memory trend flat over an hour.
- [ ] Performance dashboard crash rate and heartbeat unchanged a few hours after release.

Add these to your [[Pre-Release Gate]] and log the numbers in your performance log.

---

## Common mistakes

- Only looking at client FPS; server problems show up as lag, not frame rate.
- Tracking averages without p95 and worst frame.
- Heavy work inside the measurement callback.
- Treating `GetNetworkPing` as total latency including server processing.
- No version tag on telemetry, so releases cannot be compared.
- Buying more compute before removing unnecessary server work.
- Load shedding that flips levels every few seconds.
- Logging every frame instead of one summary per window.

## Checklist

- [ ] Telemetry module running on every live server, one summary per minute.
- [ ] Summaries include players, heartbeat average, p95, worst, physics, bandwidth, ping, memory, place version.
- [ ] Summaries shipped to a log or analytics pipeline and charted.
- [ ] Load-shedding ladder reads the summaries with hysteresis.
- [ ] Server MicroProfiler and Script Profiler procedure documented for incidents.
- [ ] Release gate compares before and after on full servers.

**Related:** [[Performance - Hub]] · [[Server Load Shedding]] · [[Performance Audit Procedure]] · [[Observability and Debug Logging]] · [[Performance Engineering Operating System]]

> Updated 2026-10-25: replaced deprecated `Stats.HeartbeatTimeMs` / `Stats.PhysicsStepTimeMs` with `Stats.HeartbeatTime` / `Stats.PhysicsStepTime` (HeartbeatTime is in seconds, so the code multiplies by 1000) (source: https://create.roblox.com/docs/reference/engine/classes/Stats)
