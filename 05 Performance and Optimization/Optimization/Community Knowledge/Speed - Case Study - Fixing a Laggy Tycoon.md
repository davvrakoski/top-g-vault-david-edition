---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Case Study - Fixing a Laggy Tycoon"
tags: [roblox, community-knowledge, optimization, case-study, tycoon, physics, replication]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://create.roblox.com/docs/physics/network-ownership
  - https://devforum.roblox.com/t/reducing-part-lag-scripts/858971
---
# Speed - Case Study - Fixing a Laggy Tycoon

Tycoons are the genre most likely to start smooth and end unplayable. Every plot multiplies the cost: 8 plots, 10 droppers each, one physical ore per second each, plus buttons, conveyors and money labels. Lag grows with progress, so it hits your best, longest-playing players. This walkthrough shows what to measure on a full server late in a session, and what to change.

## Reproduce the worst case first

A tycoon fresh in Studio proves nothing. Make a test command that unlocks every plot fully, then run a full server (Studio Test with the max player count, or a private server with friends) for 20 minutes. Measure:

| Metric | Tool | Healthy |
|---|---|---|
| Server heartbeat | F9 > Server Jobs > Heartbeat | ~60 steps/sec |
| Server physics time | Server MicroProfiler, `physicsStepped` / `worldStep` | small and flat |
| Unanchored part count | command bar loop over Workspace | bounded, not growing |
| Server memory by age | Performance dashboard (live) | flat after warm-up |
| Recv KB/s per client | Ctrl+F7 / Shift+F3 network stats | well under 50 KB/s |

## The usual culprits and fixes

**1. Physical drops.** Each dropper clones an unanchored part that rolls down a conveyor and touches a collector. With 80 droppers that is hundreds of live assemblies, all simulated, all replicated, all firing Touched. Options, from smallest change to biggest:
- Cap live drops per plot (for example 30). When the cap is hit, skip spawning and credit the money directly.
- Give drops `CanQuery = false`, a small box collider, and a collision group that does not collide with other drops (drop-on-drop contacts are pure waste).
- Despawn on a timer as well as on collect, so stuck drops never accumulate.
- Make the drop cosmetic: the server computes income on a timer and fires one remote per plot; each client spawns its own visual drops near the camera. The money logic stays authoritative; the ore is just eye candy and costs the server nothing.

**2. Conveyors driven by scripts.** Moving drops by setting CFrame in a loop is the most expensive version. Use the part's `AssemblyLinearVelocity` on an anchored conveyor (a long-standing community technique: an anchored part with a set velocity pushes parts resting on it; confirm it in your engine version, (unverified) in the current docs) or a constraint, never a per-drop loop.

**3. One script per dropper, button and collector.** Hundreds of `while true do task.wait(1)` loops each wake every second. Replace with one income scheduler that loops over plots and droppers in a single `Heartbeat`-accumulated tick, and one CollectionService handler per button type.

**4. Money values changing too often.** Updating `leaderstats` or a `NumberValue` every drop replicates a change per drop to every client. Accumulate and update the visible value a few times per second.

**5. Every plot built in full on join.** Eight finished plots of detailed buildings replicate to every client. Enable streaming, keep unbuilt items in `ServerStorage` until bought, and build with reused MeshParts.

**6. Network ownership surprises.** Unanchored drops near a player may get that player as network owner, so physics results arrive late and look jittery to others. For server-critical drops call `SetNetworkOwner(nil)`; for cosmetic client drops, ownership does not matter because they never exist on the server.

## Before and after checklist

- [ ] Live unanchored parts per plot have a hard cap
- [ ] No per-object loops; one scheduler for income
- [ ] Leaderstats updates throttled
- [ ] Purchased items cloned from ServerStorage, not hidden in Workspace
- [ ] Late-game full-server test recorded with heartbeat and memory numbers

## Pitfalls

- Using `Debris:AddItem` with long lifetimes as the only cleanup: it bounds nothing if drops spawn faster than they expire.
- Saving to DataStore on every income tick; see [[Speed - DataStore Request Budgeting at Scale - Server and Experience Limits]].
- Hiding unbought buttons with `Transparency = 1`: they still cost memory, physics and replication.

## Related
[[Optimization - Hub]] · [[Tycoon Genre Breakdown - Droppers, Button Ladders and Pacing]] · [[Object Pooling Without Making a Mess]] · [[Physics Throttling, Sleep and Adaptive Timestepping]] · [[Perf - Dirty Flags and task.defer - Coalescing Many Changes into One Update]]
