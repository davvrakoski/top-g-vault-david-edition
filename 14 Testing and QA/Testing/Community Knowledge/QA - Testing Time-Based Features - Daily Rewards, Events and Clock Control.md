---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA - Testing Time-Based Features - Daily Rewards, Events and Clock Control"
tags: [roblox, community-knowledge, testing, qa, time, daily-rewards, live-events]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/globals
  - https://create.roblox.com/docs/reference/engine/datatypes/DateTime
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
---
# QA - Testing Time-Based Features - Daily Rewards, Events and Clock Control

Daily rewards, streaks, weekly shops, limited-time events and cooldowns all depend on "now". Testing them by waiting is impossible, and testing them by changing a PC clock does nothing, because server code reads the **server** clock. The fix is to make time injectable, then run a fixed set of boundary cases.

## Make time a dependency

Never call `os.time()` directly in reward logic. Use one clock module the tests and QA commands can shift:

```lua
-- Clock (server ModuleScript)
local Clock = { offset = 0 }
function Clock.now()
	return os.time() + Clock.offset -- UTC seconds
end
function Clock.advance(seconds) -- QA command only
	Clock.offset += seconds
end
return Clock
```

- `os.time()` with no arguments returns UTC Unix seconds on the server; `DateTime.now()` gives the same moment with formatting helpers (`:ToUniversalTime()`).
- Use the client clock only for display (countdowns), never to decide rewards. Clients can fake it.
- For in-round timers use `workspace:GetServerTimeNow()` so client countdowns agree with the server.

Expose `Clock.advance` through gated QA commands (`/time +23h`) and inject a fake clock in unit tests (see [[Dependency Injection and Fakes for Luau Unit Tests]]).

## Pick one reset rule and write it down

"Daily" can mean 24 h since last claim, or a fixed UTC reset (00:00 UTC). Most bugs come from mixing them. Document it, then test it.

## Boundary cases

| Case | Expected |
|---|---|
| Claim, advance 23 h 59 m | Not claimable yet (rolling rule) |
| Claim, advance 24 h | Claimable, streak +1 |
| Claim at 23:59 UTC, advance 2 min (fixed reset) | Claimable, new day |
| Skip a full day | Streak resets (or grace rule applies) |
| Claim twice fast (double click, two remotes) | Only one reward; server debounce |
| Claim, leave, join another server | Still claimed (state in DataStore, not server memory) |
| Data save fails during claim | Reward not granted without saved timestamp, or granted and retried; never both lost and granted twice |
| Event start / end exactly at boundary | Shop items appear and disappear on time on already-running servers |
| Server running for 3 days | Event switches without restart (no timestamps cached at server start) |

## Live events in running servers

Old servers keep running through an event start. Check the event state on a timer (every 30-60 s) rather than once at startup, or schedule the change. For big switches, plan a soft shutdown instead (see [[Server Restart Notices with ServerRestartScheduled]]).

## Checklist
- [ ] All reward logic reads one clock module
- [ ] Reset rule documented in the design note
- [ ] Every boundary case above run with `/time` and passed
- [ ] Countdowns use server time and agree within 1 s across two clients

## Related
[[Testing - Hub]] · [[Dependency Injection and Fakes for Luau Unit Tests]] · [[Seeded Randomness and Deterministic Tests]] · [[QA Test Commands - Gated Cheats for Testers]]
