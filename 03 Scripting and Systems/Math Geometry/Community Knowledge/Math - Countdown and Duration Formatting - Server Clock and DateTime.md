---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Countdown and Duration Formatting - Server Clock and DateTime"
tags: [roblox, community-knowledge, math, time, ui, formatting]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/datatypes/DateTime
  - https://create.roblox.com/docs/reference/engine/libraries/os
---
# Math - Countdown and Duration Formatting - Server Clock and DateTime

Round timers, shop restock countdowns, crop growth, boosts that last 15 minutes and "event starts in 2d 4h" banners all need two things: a clock every client agrees on, and a readable format. Sending the remaining seconds from the server every second is wasteful and drifts; send an **end timestamp once** and let each client compute the rest.

## Which clock

| Clock | Use for |
| --- | --- |
| `workspace:GetServerTimeNow()` | timers shared by server and clients in one server (rounds, cooldown bars) |
| `os.time()` | whole-second UTC Unix time; persistent timers saved in DataStores (boosts, daily rewards) |
| `os.clock()` | high-resolution elapsed time for benchmarks and local animation timing |
| `DateTime.now()` | formatting dates for display in the player's locale |

## Pattern: replicate an end time, not a countdown (own code)

```lua
-- server
local ROUND = 180
workspace:SetAttribute("RoundEndsAt", workspace:GetServerTimeNow() + ROUND)

-- client
RunService.Heartbeat:Connect(function()
	local endsAt = workspace:GetAttribute("RoundEndsAt")
	if not endsAt then return end
	local left = math.max(0, endsAt - workspace:GetServerTimeNow())
	label.Text = formatClock(left)
end)
```

One attribute change per round instead of one remote per second, and every client shows the same number.

## Formatters (own code)

```lua
local function formatClock(seconds: number): string -- 125.4 -> "02:05"
	local s = math.ceil(seconds)
	local h, m, sec = s // 3600, (s % 3600) // 60, s % 60
	if h > 0 then
		return string.format("%d:%02d:%02d", h, m, sec)
	end
	return string.format("%02d:%02d", m, sec)
end

local function formatLong(seconds: number): string -- 189000 -> "2d 4h"
	local s = math.floor(seconds)
	local d, h, m = s // 86400, (s % 86400) // 3600, (s % 3600) // 60
	if d > 0 then return `{d}d {h}h` end
	if h > 0 then return `{h}h {m}m` end
	if m > 0 then return `{m}m {s % 60}s` end
	return `{s}s`
end
```

- Use `math.ceil` for countdowns so "00:00" only appears when time is really up.
- Show two units at most; "2d 4h 13m 9s" is noise on a banner.
- Show tenths only under 10 seconds (`string.format("%.1f", left)`) for tension.

## Showing a real date or time

`DateTime.fromUnixTimestamp(t):FormatLocalTime("LT", locale)` formats in the viewer's time zone; `FormatUniversalTime` formats in UTC. Pass the player's `LocaleId` so "8:00 PM" vs "20:00" follows their region.

## Persistent timers

Save `expiresAt = os.time() + duration` in the player's data, never "seconds left". On join, `remaining = expiresAt - os.time()`. Boosts then keep ticking while the player is offline (decide on purpose whether that is what you want; for "playtime-only" boosts save remaining seconds on leave instead).

## Pitfalls

- `tick()` is deprecated and its timezone behaviour varies; prefer `os.time()` / `GetServerTimeNow()`.
- Client `os.time()` comes from the device clock and can be wrong; never trust it for rewards.
- Formatting every frame is fine for one label; for 100 list entries update once per second.

## Related
[[Math Geometry - Hub]] · [[Luau String Interpolation and Formatting Recipes]] · [[Synchronized Global Live Events - Server Time and Scheduled Starts]] · [[First Round Loop - Intermission, Countdown and Winners]]
