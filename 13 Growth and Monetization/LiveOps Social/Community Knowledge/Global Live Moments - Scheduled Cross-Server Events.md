---
area: "13 Growth and Monetization"
cluster: "LiveOps Social"
title: "Global Live Moments - Scheduled Cross-Server Events"
tags: [roblox, community-knowledge, liveops, events, messagingservice, configs, servers]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/MessagingService
  - https://create.roblox.com/docs/production/configs
  - https://create.roblox.com/docs/production/promotion/experience-events
  - https://create.roblox.com/docs/production/game-design/liveops-essentials
---
# Global Live Moments - Scheduled Cross-Server Events

A "live moment" is something that happens in **every server at the same time**: a meteor shower at 18:00 UTC, a boss spawn every hour on the hour, a developer-hosted "double luck" hour announced in Discord. These moments create urgency, give players a reason to be online together, and are perfect for Experience Events (players can tap **Notify Me** and get a notification when it starts). The trick is making hundreds of servers agree on timing reliably.

## Two tools, two jobs

| Need | Use | Why |
|---|---|---|
| Things on a **known schedule** | server clock math (`os.time()` UTC) | No messages needed; every server computes the same answer |
| Things **you trigger live** | Experience configs (`ConfigService`) or `MessagingService` | Push a change to all running servers |

### Scheduled: compute, don't broadcast

```lua
-- Own example: hourly boss at minute 0, 10-minute window
local PERIOD, DURATION = 3600, 600

local function bossState(now: number)
	local start = now - (now % PERIOD)
	local live = (now - start) < DURATION
	local nextStart = live and start or start + PERIOD
	return live, nextStart
end
```

Every server agrees because `os.time()` is UTC on all servers. Show a countdown ("Boss in 12:40") so players stay.

### Live triggers: configs first, MessagingService second

- **ConfigService**: set a key like `live_event = {"id":"meteor","endsAt":1793491200}` on Creator Hub and publish (Roblox says publishing reaches players in roughly 15 s to 1 min). Servers listen to `snapshot.UpdateAvailable`, call `Refresh()`, then read the key. Late-starting servers also see it, which a message would miss.
- **MessagingService**: instant pub/sub between servers. Roblox documents it as **best effort, not guaranteed**, with 1 kB messages and per-server/per-topic rate limits (e.g. messages received per topic: 40 + 80 x servers per minute). Fine for "start now" pings from an admin command, but always store the event state somewhere durable (config or DataStore) so new servers and missed messages recover.

```lua
-- Own example: admin command broadcasts, receivers trust only the end time
local MessagingService = game:GetService("MessagingService")

MessagingService:SubscribeAsync("LiveEvent", function(msg)
	local data = msg.Data -- { id = "luck2x", endsAt = 1793491200 }
	if type(data) == "table" and data.endsAt > os.time() then
		startEventLocally(data.id, data.endsAt)
	end
end)
```

Send absolute **end times**, never "lasts 10 minutes": messages arrive at different moments.

## Design tips

- **Predictable rhythm** beats random surprise for building habits (same time daily/weekly). Mix in occasional surprise drops for social buzz.
- **Time zones:** rotate slots or run the same moment twice a day so different regions get it.
- **Server fill:** events in empty servers feel dead; consider a "join event server" button that teleports to fuller servers.
- **Economy:** a global 2x hour doubles the faucet for everyone online; budget it like any other source.
- Pair big moments with an **Experience Event** entry and an update announcement so players outside the game hear about it.

## Pitfalls

- Using `wait(3600)` loops per server: they drift and restart at different times.
- Granting rewards from a message payload without server-side checks.
- Forgetting servers that start mid-event (read state on startup).

## Related
[[LiveOps Social - Hub]] - [[LiveOps Calendar and Update Cadence Planner]] - [[LiveOps, Events and Content Rotation]] - [[Update Cadence and Server Restarts Without Losing Players]]
