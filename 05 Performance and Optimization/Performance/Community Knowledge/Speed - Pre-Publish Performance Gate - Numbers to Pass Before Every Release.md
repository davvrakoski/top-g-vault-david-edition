---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Speed - Pre-Publish Performance Gate - Numbers to Pass Before Every Release"
tags: [roblox, community-knowledge, performance, release, checklist, qa, budgets]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/production/analytics/performance
---
# Speed - Pre-Publish Performance Gate - Numbers to Pass Before Every Release

Post-release dashboards tell you a regression already reached players. A gate before publishing catches most of them while the fix is cheap. This note is a pass/fail sheet built from the Creator Hub's own thresholds plus device facts, meant to take about 45 minutes per release on one baseline phone and one test server. (For the after-publish routine see [[Release Regression Check - Performance Dashboard by Place Version]].)

## Pick the baseline first

The Creator Hub's player-base facts: Android is about 65% of a typical game's players; about 60% of those devices have 2 to 4 GB of RAM; over half of all players are on devices scoring 10,000 to 20,000 on Passmark. Studio emulation is not accurate for memory. So:

- **Baseline device**: a real Android phone with 3 to 4 GB RAM, graphics on automatic.
- **Stretch device** (optional): a 2 GB phone or old tablet, for crash checks only.
- **Reference PC**: your dev machine, for MicroProfiler dumps and server tests.

Record the device name in the gate sheet so results stay comparable between releases.

## The gate sheet

| # | Check | How | Pass |
|---|---|---|---|
| 1 | Join to control | stopwatch on baseline phone, cleared app cache | your target (write it down; no more than last release + 10%) |
| 2 | Join payload | Studio > Network > Print Join Size Breakdown | no new large instance in the top 20 you cannot explain |
| 3 | Client frame time, busiest scene | MicroProfiler on phone (Ctrl+Alt+F6) | under 16.67 ms for 60 FPS, or your declared 30 FPS target (33.3 ms) |
| 4 | Thermal | 10 to 15 min active play on phone | no steady FPS decline |
| 5 | Client memory | F9 Memory on phone, after 15 min | flat after warm-up; under the limit you found for your baseline |
| 6 | Render load | Shift+F2 render stats, busiest viewpoint | under your measured baseline limits (docs example: 1,000 draw calls, 1,000,000 triangles) |
| 7 | Server heartbeat, full server | F9 > Server Jobs > Heartbeat during peak gameplay | about 60 steps/s; no sustained dips |
| 8 | Server memory | F9 server memory, full server, 30 min | under 50% of `6.25 GiB + 100 MiB x max players`; flat over time |
| 9 | Join/leave leak | 20 join/leave cycles | LuaHeap and InstanceCount return to baseline |
| 10 | Network | Shift+F3 data ping vs network ping; Recv KB/s | data ping not far above network ping; receive well under 50 KB/s |
| 11 | Remotes and DataStores | review new code | no DataStore call per player action; remotes batched |
| 12 | Script Profiler | top 10 functions, server and client | nothing new in the top 10 without a reason |

Server memory example from the docs' formula: at 30 max players the server has about 9.18 GiB, so keep usage under about 4.6 GiB. The dashboard page also gives a simpler rule of thumb: stay below 3 GB.

## Hard fails (do not publish)

- Any crash on the baseline device during the 15-minute session.
- Memory still climbing at the end of the 15-minute client session or 30-minute server session.
- Server heartbeat sustained below 45 at full player count (our threshold; choose yours and keep it).
- Join time regression above 25% with no planned cause.

## After publishing

The dashboard's guidance: a sudden uptick in crashes after an update often means a memory regression on low-end devices, and client crash rates above 2 to 3% deserve investigation. Compare the new place version within the first hour, then follow the regression routine.

## Make it cheap to run

- Keep a **benchmark route**: a fixed walk through the heaviest areas that a tester repeats every time (see [[MicroProfiler Benchmark Routes for Performance Regression Checks]]).
- Keep a test command that spawns the worst case (full NPC horde, all tycoon plots unlocked, max particles).
- Paste results into your [[Performance Log Template]] so trends are visible across releases.

## Pitfalls

- Measuring in Studio and calling it done: Studio runs client and server together and hides device limits.
- Graphics quality manual-max on the phone during the gate: test on automatic, the way players run.
- Skipping the full-server test because "the change was client side": client changes often add remotes or replication.

## Related
[[Performance - Hub]] · [[Performance Budget Template]] · [[Performance Audit Procedure]] · [[Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory]] · [[Pre-Release Gate]]
