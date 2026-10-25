---
area: "14 Testing and QA"
cluster: "Testing"
title: "Live-Ops Event Dry Run - Rehearsing a Timed Event End to End"
tags: [roblox, community-knowledge, testing, live-ops, events, configs, rehearsal]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/configs
  - https://create.roblox.com/docs/reference/engine/classes/ConfigService
  - https://create.roblox.com/docs/production/game-design/liveops-essentials
  - https://create.roblox.com/docs/projects/update-games
---
# Live-Ops Event Dry Run - Rehearsing a Timed Event End to End

A limited-time event (Halloween map, a boss weekend, a double-XP hour) is the one release where the "go live" moment is fixed and public, often announced on Discord and social media. If the countdown hits zero and nothing happens, you cannot quietly try again tomorrow. A **dry run** is a full rehearsal of the event timeline in a staging universe, compressed into about an hour, with the same people and the same levers you will use on the day. [[QA - Testing Time-Based Features - Daily Rewards, Events and Clock Control]] tests the clock logic; this note tests the **operation**.

## What you rehearse

1. **Pre-event publish**: event content shipped dark (hidden behind a flag) days before.
2. **Switch-on**: the flag flips at start time, in every running server.
3. **During**: the event loop, rewards, leaderboards, shop items, announcements.
4. **Switch-off**: event ends, rewards stop, shop items leave, nothing breaks.
5. **Aftermath**: grants that must persist (badges, limited items) are still there after rejoin.

## Build for rehearsal

- Drive the event window from **Experience Configs** (`ConfigService`) instead of hard-coded dates, for example keys `event_halloween_start`, `event_halloween_end`, `event_halloween_enabled`. Configs change without a publish.
- Know the config behaviours you are relying on: new values are **staged** first and visible only in your team's Studio sessions; **Publish now** reaches players in roughly 15 seconds to 1 minute; snapshots do **not** update by themselves, so your code must call `ConfigSnapshot:Refresh()` (or listen to its update signal) and decide when to apply.
- `ConfigService:SetTestingValue(key, value)` overrides a value on one server only (or one Studio session), and `ClearTestingValue` removes it. That is your per-server rehearsal lever.
- Keep a **kill switch** key (`event_halloween_killswitch`) checked by every event system.

## Dry-run script (about 60 minutes, staging universe)

| T | Action | Who | Check |
| --- | --- | --- | --- |
| -10 | Publish the event build (dark) to staging; restart outdated servers | Release owner | Event invisible, no new errors in Error Report |
| -5 | Open 2+ staging servers with testers in each | QA | QA overlay shows build and config values |
| 0 | Set start time to now + 2 min in Configs and publish | Live-ops owner | Within ~1 min all servers show the countdown |
| +2 | Countdown ends | Everyone | Event starts in **every** server at the same time (within a few seconds) |
| +5 | Testers play the event loop | QA | Rewards granted, saved, visible after rejoin |
| +15 | A new server starts mid-event | QA | Late server reads the config on boot and is in event state |
| +20 | Flip the kill switch | Live-ops owner | Event hides cleanly; no errors; players not stuck in event areas |
| +25 | Restore from Configs **History** | Live-ops owner | Event returns; history entry shows who changed what |
| +30 | Set end time to now + 2 min | Live-ops owner | End sequence runs, shop items removed, leaderboards frozen |
| +40 | Rejoin all testers | QA | Permanent rewards still owned; temporary buffs gone |
| +45 | Debrief | All | Write down every surprise |

## What dry runs usually catch

- One server never switched on because a script read the snapshot once at boot and never refreshed.
- The countdown used client `os.time()` and differed between devices; use a server-sent time.
- Teleporting into an event sub-place lost the event state.
- Shop prices for event items were hard-coded in UI text.
- The end of the event deleted temporary items that players had already equipped, causing errors in the character loader.

## On the real day

- Same people, same order, same chat channel as the dry run.
- Publish start/end times days ahead; on the day you only watch, and the kill switch is the only lever you expect to touch.
- Watch Error Report with **Show version** on and the concurrent user chart for 30 minutes after start.

## Related

[[Testing - Hub]] · [[Experiments and Configs - In-Game A-B Testing]] · [[Rollback Drills - Rehearsing a Bad Release]] · [[Release Readiness Runbook 2026]]
