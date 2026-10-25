---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "Synchronized Global Live Events - Server Time and Scheduled Starts"
tags: [roblox, community-knowledge, server-engineering, live-events, time-sync, liveops]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace#GetServerTimeNow
  - https://create.roblox.com/docs/reference/engine/datatypes/DateTime
  - https://create.roblox.com/docs/cloud-services/cross-server-messaging
  - https://create.roblox.com/docs/production/configs
---
# Synchronized Global Live Events - Server Time and Scheduled Starts

Big Roblox live events (a meteor hits every server at 18:00 UTC, a boss spawns every hour on the hour, a countdown to the update) only feel "live" if every server and every client agree on when they start. Trying to trigger them by broadcasting "start now" with MessagingService gives you servers that start seconds apart, and clients whose countdowns drift. The robust pattern: **schedule by absolute time, compute everything from a shared clock.**

## The clock

- **Server:** `os.time()` (whole seconds, UTC) or `DateTime.now().UnixTimestampMillis` (milliseconds). Roblox server clocks are close enough for events, though not identical across machines.
- **Client:** `workspace:GetServerTimeNow()`. The docs describe it as the client's best estimate of the server's current Unix time; it is **monotonic** (never goes backwards) and moves at the local clock rate within 0.6%. Use it for every countdown and every client-side event visual. Never use `os.time()` on the client: it is the player's device clock, which may be wrong by minutes or set deliberately.

## Schedule as data

Store the event schedule as a list of absolute UTC start times, not as "in 2 hours":

```lua
-- shared module (ReplicatedStorage)
local Schedule = {
	{ id = "meteor_2026_10_31", startsAt = 1793469600, duration = 600 }, -- 2026-10-31 18:00 UTC
}

local function activeEvent(now: number)
	for _, e in Schedule do
		if now >= e.startsAt and now < e.startsAt + e.duration then
			return e, now - e.startsAt -- event and seconds elapsed
		end
	end
	return nil
end

return { Schedule = Schedule, activeEvent = activeEvent }
```

Ship it inside the place for planned events, or load it from **Configs** (Roblox's live config service) / a DataStore so live ops can add or move events without publishing. Convert human dates with `DateTime.fromUniversalTime(2026, 10, 31, 18, 0, 0).UnixTimestamp` in a tool, not by hand.

## Server loop

Each server polls once a second (`task.wait(1)` loop or Heartbeat accumulator) and asks "which event is active and how far in?". Because the answer depends only on time, a server that **starts mid-event** joins at the right phase automatically, and a server that restarts does not replay the intro.

Drive the event as a function of elapsed time: `if elapsed >= 30 and not state.meteorSpawned then spawnMeteor() end`. Store per-server flags so each beat runs once.

## Client visuals

The server replicates only the event ID (an attribute on a folder in ReplicatedStorage). Clients compute `elapsed = workspace:GetServerTimeNow() - startsAt` each frame and play visuals, sky changes and music at the right offset. This keeps network traffic near zero and makes late joiners see the right moment.

## Hourly and daily recurring events

`local nextStart = (now // 3600 + 1) * 3600` gives the next top of the hour in UTC. Daily resets at a fixed UTC hour: `local day = (now - RESET_OFFSET) // 86400`. Store the day number in player data to grant daily rewards once.

## When to still use MessagingService

Use it for **unscheduled** events (an admin triggers a surprise). Even then, publish a start time a few seconds in the future (`startsAt = os.time() + 5`) instead of "start now", so servers that receive the message at slightly different times still start together. MessagingService delivery is best effort and can be delayed, so never make rewards depend on receiving it.

## Pitfalls

- Using `os.date("*t")` (server local time) rather than UTC functions; servers run in many regions.
- `tick()` on clients for timers: it is local and deprecated for this use.
- Forgetting servers that stay up across the event: test with a fake clock (inject `now`) so you can run the whole schedule in seconds.
- Spawning a global boss in every server at once may double server load at the same second; stagger heavy setup with a small random delay while keeping visuals synced.

## Related
[[Server Engineering - Hub]] - [[MessagingService Cross-Server Patterns and Limits]] - [[Open Cloud APIs for Live Ops - Worked Examples]] - [[Update Cadence and Server Restarts Without Losing Players]]
