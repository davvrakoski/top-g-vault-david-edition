---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Carnival Rides - Ride Cycles, Restraints and Motor Programs"
tags: [roblox, community-knowledge, vehicles, theme-park, rides, constraints]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/physics/build-a-ferris-wheel
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
  - https://create.roblox.com/docs/reference/engine/classes/PrismaticConstraint
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
---
# Ride - Carnival Rides - Ride Cycles, Restraints and Motor Programs

The official ferris wheel tutorial shows one ride: a `HingeConstraint` set to Motor that spins forever. Real carnival rides (teacups, drop towers, pendulum ships, scramblers) are short shows with a **ride cycle**: board, lock restraints, run a timed program, stop, unlock, unload. Build the cycle once and every new ride is just a new program table.

## The ride cycle
`Boarding (20 s or full) -> Locking (2 s) -> Running (program) -> Stopping -> Unlocking -> Unloading (5 s) -> Boarding`

- **Boarding**: seats enabled (`Seat.Disabled = false`), a countdown board shows time left. Start early when all seats are filled.
- **Locking**: animate lap bars down, then set every empty seat `Disabled = true` so nobody jumps in mid-ride. Block jumping for seated riders (disable the Jumping state on their Humanoid from their client, or re-seat them with `Seat:Sit(humanoid)` if they leave).
- **Unlocking**: bars up, re-enable jumping, eject anyone still seated after the unloading timer.

The server owns the cycle; clients only get the state and timestamps via attributes.

## Programs as data
A program is a list of steps that set motor targets over time:

```lua
local DropTower = {
	{t = 0,  lift = {target = 120, speed = 8}},   -- slow climb
	{t = 18, hold = 3},                          -- tease at the top
	{t = 21, lift = {target = 4, speed = 90}},    -- drop
	{t = 23, lift = {target = 4, speed = 10}},    -- brake
}
```
A runner walks the list and applies each step to constraints:
| Ride | Motion | Constraint setup |
|---|---|---|
| Ferris wheel | Slow constant spin | `HingeConstraint` Motor, `AngularVelocity` 0.1-0.2 rad/s |
| Teacups / scrambler | Platter spin + cup spin | Two Motor hinges, cup speed changeable by riders |
| Drop tower | Up, hold, drop | `PrismaticConstraint` Servo, change `Speed` and `TargetPosition` |
| Pendulum ship | Swing growing to 75 degrees | `HingeConstraint` Servo, alternate `TargetAngle` +/- with rising amplitude |
| Carousel | Spin + horses bob | Motor hinge + per-horse prismatic servos with offset phases |

Gondolas on a ferris wheel stay level with a free hinge (no actuator) and low center of mass, or with `AlignOrientation` keeping them upright.

## Anchored alternative
For rides that must look identical for everyone and must never break, skip physics: anchor everything and move parts with `PivotTo` on clients from a shared start time (`workspace:GetServerTimeNow()`). Riders must then be carried (see the riding moving vehicles note). Physics rides are easier to build; anchored rides are more reliable at 30+ riders.

## Safety and griefing
- Players love flinging themselves off rides. Use a collision group so riders and ride parts do not collide while running.
- Exits: on `Unlocking`, teleport riders to an exit pad instead of dropping them where they sit.
- Rate limit "start ride" if players can trigger it.

## Theme park tycoon numbers
Ticket price, ride duration and capacity give throughput: riders per hour = seats x 3600 / (cycle time). Show it in the ride's info UI; tycoon players optimise it.

## Related
[[Vehicles - Hub]] - [[Build a ferris wheel]] - [[Ride - Roller Coasters - Track Splines, Chain Lifts and Energy-Based Speed]] - [[Riding Moving Vehicles - Keeping Standing Players Onboard]]
