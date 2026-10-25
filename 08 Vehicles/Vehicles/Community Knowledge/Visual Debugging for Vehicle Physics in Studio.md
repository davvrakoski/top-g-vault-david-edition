---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Visual Debugging for Vehicle Physics in Studio"
tags: [roblox, community-knowledge, vehicles, debugging, studio, physics]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/physics/assemblies
  - https://create.roblox.com/docs/physics/sleep-system
  - https://create.roblox.com/docs/physics/adaptive-timestepping
  - https://create.roblox.com/docs/physics/mechanical-constraints
---
# Visual Debugging for Vehicle Physics in Studio

Most vehicle bugs are invisible in the numbers: the car is owned by the wrong machine, the wheels are welded into the chassis assembly, a part is asleep, or the solver is running the car at a lower timestep. Studio can draw all of these on screen during a playtest. Turning the right overlay on usually finds the bug in seconds.

## The overlays and what they answer
| Overlay | Where to turn it on | Question it answers |
|---|---|---|
| **Constraint Details** | View menu or Model tab toggle (Alt+D) | Are attachments where I think? Which way is the hinge axis? Is the spring length right? |
| **Assemblies** | Visualization Options (top-right of viewport) | Which parts move as one rigid body? Wheels should be separate assemblies from the chassis. |
| **Network owners** | Visualization Options | Who simulates the car right now? |
| **Awake parts** | Visualization Options | Is the car sleeping when it should move, or awake when parked? |
| **Are Timesteps Shown** | Studio Settings > Physics | What simulation rate is each part on (adaptive timestepping)? |

## Reading network owner colours
From the network ownership docs:
- **Green:** your client owns and simulates it. The driver's car should be green on the driver's client.
- **Red:** buffer zone; your client simulates it but it is still owned elsewhere (ownership may be about to switch).
- **White / grey:** the server or another client owns it.
- **Black:** owned by nobody; physics will not apply.

In a multi-client test (Test tab > Server & Clients) each client gets its own colour, mirrored in the server view. That is the fastest way to confirm that ownership moves to the driver on sit and back to the server on exit. A car that is grey on the driver's screen is the classic cause of "laggy steering" ([[Vehicle jitters - wrong player controls physics]]).

## Reading sleep colours
With **Awake parts** on, awake parts outline red and sleep-checking parts outline orange. A parked car flickering red forever means something keeps waking it (a constantly-set motor velocity, a touching part, a script nudging CFrame). Parked cars should go to sleep; that is free performance.

## Assemblies check
Turn on **Assemblies** with the car spawned:
- Chassis, body and seats: one colour (welded together).
- Each wheel: its own colour (joined by hinge or cylindrical constraint, not welded).
- If a wheel shares the chassis colour, a stray `WeldConstraint` is gluing it and it will never spin.

## Timesteps
Adaptive timestepping can simulate simple, slow assemblies at lower rates. Fast cars with stiff springs need the higher rates. If a car jitters only sometimes, turn on **Are Timesteps Shown** and see whether its rate changes. Fixes and the `PhysicsSteppingMethod` options are covered in [[Physics Throttling, Sleep and Adaptive Timestepping]].

## A 2-minute vehicle debug routine
1. Spawn the car, Constraint Details on: check every attachment and axis.
2. Assemblies on: wheels separate, body one piece.
3. Play with 1-2 clients, Network owners on: sit, drive, exit; watch colours change.
4. Park and wait 10 s with Awake parts on: car should stop being red.
5. Drive fast with timesteps shown if anything shakes.

## Related
[[Vehicles - Hub]] · [[Vehicle Physics and Impact Lab]] · [[Vehicle jitters - wrong player controls physics]] · [[Physics Throttling, Sleep and Adaptive Timestepping]]
