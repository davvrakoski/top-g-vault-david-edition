---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Vehicle QA Test Pass - Before Shipping a Car"
tags: [roblox, community-knowledge, vehicles, qa, checklist, testing]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/testing-modes
  - https://create.roblox.com/docs/studio/network-simulator
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
---
# Vehicle QA Test Pass - Before Shipping a Car

Vehicles touch physics, networking, input, streaming, audio and UI at once, so they regress more often than any other feature. A fixed test pass per new car (and per vehicle code change) catches the usual failures before players do. Plan about 30-40 minutes; most items are quick observations, not deep tests.

## Setup
- Studio: Test tab, **Server & Clients** with 2 clients (the docs allow up to 8). One client drives, one watches.
- Turn on **Network owners** and **Assemblies** in Visualization Options.
- Network Simulator: one run with a mobile-like profile (added latency and some packet loss).
- One run on a real mid-range phone from a published test place.

## 1. Build sanity (edit mode)
- [ ] No anchored parts in the vehicle model (except deliberately for display).
- [ ] Wheels are separate assemblies; body parts welded to the chassis.
- [ ] Decorative parts `Massless`, `CanCollide`/`CanTouch`/`CanQuery` off.
- [ ] Centre of mass at or below hub height.
- [ ] Model `ModelStreamingMode = Atomic` if the place uses streaming.

## 2. Enter and exit
- [ ] Walking past does not auto-sit; the prompt is the only way in.
- [ ] Driver seat gives ownership to the driver (green on driver's client, other colour on the watcher).
- [ ] Exit places the player beside the car, never inside walls or under the car; no launch.
- [ ] After exit, ownership returns (server or nobody-owned behaviour as designed).
- [ ] Passenger seats cannot drive.

## 3. Driving feel (driver client)
- [ ] Full throttle from rest on flat ground: no wheelies, flips or wheelspin you did not design.
- [ ] Full lock at low speed: no front-end shudder (Ackermann or reduced lock).
- [ ] High speed lane change: no rollover; recovers within a second.
- [ ] Jump / ramp: lands on wheels; suspension does not bottom out and bounce.
- [ ] Reverse, brake, handbrake all work; brake lights and reverse lights follow.

## 4. Network (watcher client)
- [ ] Car motion is smooth on the watcher's screen at normal and simulated bad network.
- [ ] Engine sound pitch and lights match on the watcher (attributes replicate).
- [ ] Two cars colliding at speed: both stay on the map, no one gets flung into orbit.

## 5. Platforms
- [ ] Keyboard, gamepad (triggers analog), touch buttons all drive.
- [ ] Touch: gas and steer held together work (two fingers).
- [ ] UI buttons hide when leaving the car.
- [ ] Phone frame rate stays acceptable with 10+ cars nearby at night (lights on).

## 6. Abuse
- [ ] Spam spawn: cooldown and one-car limit hold.
- [ ] Drive off the map: the car is cleaned up and the player can spawn again.
- [ ] Leave the game while driving: car is removed.
- [ ] Fire the spawn / equip remotes with wrong types from the client command bar: server rejects quietly.

## Record results
Log pass / fail per section with the build label (place version) and attach a short clip for any fail. Re-run sections 2-4 after any change to ownership, seats or chassis code.

## Related
[[Vehicles - Hub]] · [[Visual Debugging for Vehicle Physics in Studio]] · [[Vehicle Physics and Impact Lab]] · [[Device, Network and Controller Simulation Test Pass]] · [[Testing - Hub]]
