---
area: "14 Testing and QA"
cluster: "Testing"
title: "Low-End Device and Console Hardware Test Pass"
tags: [roblox, community-knowledge, testing, devices, mobile, console, performance]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://create.roblox.com/docs/input/gamepad
  - https://devforum.roblox.com/t/update-xbox-guidelines-2023/2398716
  - https://create.roblox.com/docs/production/analytics/performance
---
# Low-End Device and Console Hardware Test Pass

Studio runs client and server together on a development PC that is usually far stronger than what players own. The official "Test on hardware" guide is blunt about it: emulation is fine for screen shapes and controls but **not** for memory, frame rate, thermal throttling or input latency. This pass turns that guidance into a repeatable test on one low-end phone and one console or gamepad setup.

## Know your real audience
From the Roblox docs' device statistics:
- About 60 percent of players have **2-4 GB RAM**, about 35 percent 4-8 GB, about 5 percent more than 8 GB.
- Over half play on devices scoring roughly **10,000-20,000 on Passmark**.
- The docs' example Android spread: Infinix Smart 9, Motorola Moto G05, Oppo A18, Amazon Fire HD 10 (2023), Samsung Galaxy S22 Ultra.

Check your own split in the **Performance dashboard** (Creator Hub analytics) and pick one baseline device that matches your bottom 50 percent.

## Device kit on a budget
- One 2-4 GB Android phone (the baseline).
- One older iPhone if your audience is US/EU heavy.
- A gamepad that works with the phone or a handheld with touchscreen: the docs point out multi-input devices let you test touch and gamepad on one piece of hardware.
- Console: an Xbox or PlayStation if you target them; otherwise a PC with a gamepad and no keyboard plugged in.

## The pass (about 30 minutes per device)
**Load**
- [ ] Time from tapping Play to first control (stopwatch). Note it per build.
- [ ] No crash or "out of memory" during the loading screen.

**Frame rate and heat** (Developer Console / MicroProfiler on device)
- [ ] Busiest scene for 10 minutes: frame rate after 10 minutes vs after 1 minute (thermal throttling shows here).
- [ ] Combat or vehicle scenes with max players nearby.

**Memory**
- [ ] Client memory at start, after 10 and 30 minutes. Steady growth means a leak ([[Soak Tests - Long-Session Memory and Leak Checks]]).

**Input and UI**
- [ ] Every screen usable with touch only, then gamepad only (no mouse). Gamepad: can you reach every button with the D-pad / stick selection?
- [ ] Text readable at arm's length on the phone and at couch distance on a TV.
- [ ] Nothing important under the notch, home bar or TV edge.

**Console specifics**
- Roblox staff said in 2023 that the old Xbox guidelines were replaced by **Console Guidelines** covering all supported consoles and that there were no console-specific requirements beyond those best practices. Re-read the current Console Guidelines on the Creator Hub before each console-focused release (unverified whether details changed since).
- [ ] No keyboard-only prompts ("Press E") shown to gamepad players; use the input type to swap glyphs.
- [ ] ButtonA accepts, ButtonB cancels/back everywhere (per the gamepad input docs' conventions).
- [ ] No feature depends on typing (chat-only flows, text boxes without alternatives).

## Pass / fail thresholds (set your own, write them down)
Example: baseline phone holds 30+ FPS in the busiest scene, client memory under your budget after 30 minutes, load under 20 s. Without a written number "it felt fine" always wins.

## Related
[[Testing - Hub]] · [[Mobile Performance Deep Dive]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[Device, Network and Controller Simulation Test Pass]]
