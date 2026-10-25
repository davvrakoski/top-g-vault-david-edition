---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
title: "Seeded Weather Schedules - Same Weather and Forecast on Every Server"
tags: [roblox, community-knowledge, weather, determinism, live-ops, forecast]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/datatypes/DateTime
---
# Seeded Weather Schedules - Same Weather and Forecast on Every Server

Most weather systems roll a random state on each server, so one server has rain while another is sunny, and nobody can predict what comes next. A **seeded schedule** computes the weather from the clock instead: the weather for any time slot is a pure function of (seed, slot number). Every server, and every client, gets the same answer without any messaging. That unlocks a forecast UI, "the whole game gets a blood moon at 8 pm" events, and fishing or farming games where players plan around weather, all with zero network traffic.

## The core idea

1. Pick a slot length (for example 10 minutes of real time).
2. Slot number = `floor(unixTime / slotLength)`.
3. Weather for a slot = a weighted pick using `Random.new(SEED + slotNumber)`.

`Random.new(seed)` gives the same sequence for the same seed on every machine, so the result is identical everywhere.

## Avoiding jumpy weather: a short Markov chain

Independent picks per slot can jump from blizzard to clear to blizzard. Real weather has memory, so use transition weights (from the previous state), and anchor the chain once per day so you never iterate far:

```lua
local SLOT = 600 -- seconds
local SEED = 48213

-- arrays, not dictionaries: iteration order must be identical everywhere
local Transitions = {
	Clear  = { { "Clear", 6 }, { "Cloudy", 3 }, { "Fog", 1 } },
	Cloudy = { { "Clear", 3 }, { "Cloudy", 3 }, { "Rain", 3 }, { "Fog", 1 } },
	Rain   = { { "Rain", 4 }, { "Storm", 2 }, { "Cloudy", 3 } },
	Storm  = { { "Rain", 5 }, { "Storm", 2 }, { "Cloudy", 1 } },
	Fog    = { { "Fog", 3 }, { "Clear", 3 }, { "Cloudy", 2 } },
}

local function pick(weights, rng: Random): string
	local total = 0
	for _, entry in ipairs(weights) do total += entry[2] end
	local roll = rng:NextNumber() * total
	for _, entry in ipairs(weights) do
		roll -= entry[2]
		if roll <= 0 then return entry[1] end
	end
	return weights[#weights][1]
end

local function weatherAt(unixTime: number): string
	local slot = math.floor(unixTime / SLOT)
	local slotsPerDay = 86400 // SLOT
	local dayStart = slot - slot % slotsPerDay
	local state = "Clear" -- every day starts from a known state
	for s = dayStart + 1, slot do
		state = pick(Transitions[state], Random.new(SEED + s))
	end
	return state
end
```

Why arrays: iterating a Luau dictionary has no guaranteed order, so a dictionary of weights could give different picks on different machines from the same random roll. At most 144 iterations per call (one day of 10-minute slots) is trivial; cache the current slot's result anyway.

## Which clock

- Server: `os.time()` or `DateTime.now().UnixTimestamp` (UTC seconds).
- Client: `workspace:GetServerTimeNow()` is synced to the server's clock, so clients can compute the same weather and the forecast themselves.

## Transitions inside a slot

Blend the last 60-90 s of each slot toward the next slot's state (you can compute it in advance). Feed the blend into your visual director and gameplay multipliers; the day-night and weather transitions deep dive covers the blending side.

## Forecast UI

Because future slots are computable, a forecast is a loop: `weatherAt(now + k * SLOT)` for k = 1..6. Show icons with times ("Rain at 14:20"). It is guaranteed to be right, which players love, and it makes weather a planning mechanic.

## Scheduled specials

Override the chain for planned events: a table of `{ startUnix, endUnix, state = "BloodMoon" }` checked before the chain. All servers flip at the same second, which pairs with the vault note on synchronized global live events.

## Pitfalls

- **Changing the seed or weights changes the past and future** for everyone. That is fine for a weekly rotation, but bump the seed at a known time, not mid-day.
- **Private servers** may want local control: allow an override attribute that takes priority over the schedule.
- **Exploiters can read the forecast too.** That is acceptable for weather; do not use the same trick for loot or rare spawns you want to be unpredictable.
- **Streaming and local zones:** caves and interiors should ignore the sky state visually, but gameplay effects (like storm hearing) may still apply outdoors only.

## Related
[[Weather - Hub]] · [[Day-Night Cycle and Weather Transitions in Practice]] · [[Production Weather State Machine]] · [[Synchronized Global Live Events - Server Time and Scheduled Starts]] · [[FX - Weather That Changes Gameplay - Wet Grip, Visibility, Hearing and Wind Drift]]
