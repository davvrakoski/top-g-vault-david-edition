---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Multi-Seat Vehicles - Passenger, Gunner and Commander Roles"
tags: [roblox, community-knowledge, vehicles, seats, multiplayer, combat]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://feedback.bistudio.com/T74906
  - https://wowprogramming.com/docs/api/UnitVehicleSeatInfo.html
---
# Ride - Multi-Seat Vehicles - Passenger, Gunner and Commander Roles

Squad vehicles (jeeps with a mounted gun, helicopters with door gunners, buses, boats with a spotter) need more than "one driver seat and some chairs". Each seat has a **role** that decides which inputs it reads, which camera it uses, and who controls physics. Other games already learned this: World of Warcraft's vehicle API separates a "Root" seat that controls movement from "Child" seats that control a part (like a turret), and Arma's seat ranking shows the edge cases when one seat type takes priority over another.

## Seat roles
| Role | Instance | Reads | Camera |
|---|---|---|---|
| Driver | `VehicleSeat` | Throttle/Steer | Chase cam |
| Gunner | `Seat` + turret | Mouse aim, fire | Over-the-gun cam |
| Commander / spotter | `Seat` | Binoculars, markers | Free look |
| Passenger | `Seat` | Nothing (can shoot sidearm if allowed) | Free look |

Tag each seat with an attribute: `seat:SetAttribute("Role", "Gunner")` and an order number for switching.

## One controller per seat, chosen on sit
On the server, listen to each seat's `Occupant` change (`GetPropertyChangedSignal("Occupant")`). When someone sits:
1. Look up the role.
2. Give that player the matching client controller (fire a RemoteEvent with the seat), so the client enables the right input bindings and camera.
3. When they leave, tell the client to clean up.

The client never decides its role; it only reads what the server sends.

## Seat switching
GTA-style: press a key to move to the next free seat in order.
- Client sends "switch". Server finds the next seat by order where `Occupant == nil`, then sets `humanoid.Sit = false`, waits a frame, and calls `targetSeat:Sit(humanoid)`.
- Rate limit to once per second, and block switching into the driver seat while moving fast if you want risk.
- Edge case from Arma: when someone takes a higher-priority seat, other players' switch options change. Re-send the "available seats" list to all occupants whenever any seat changes.

## Ownership with several players
- Physics ownership follows the **driver** (see the ownership note). The gunner's turret is part of the same assembly, so the gunner cannot set its servo targets authoritatively from their own client.
- Gunner flow: the gunner client sends aim targets to the server at 10-20 Hz; the server sets turret `TargetAngle`s; the driver's simulation moves them. Show the gunner a local predicted reticle so it still feels instant.
- Shots are server-validated from the server's view of the gun position.

## Passenger rules
- Locked vehicles: only party or team members can sit (check in a seat `Occupant` handler and immediately unseat others).
- Kick passengers: driver key to unseat all; fine for roleplay, abusable in combat games.
- Seat exit points: compute a free spot beside each seat (raycast) so passengers do not exit into walls or traffic.

## Pitfalls
- Using several `VehicleSeat`s: each one can try to drive the hinges it detects (`AreHingesDetected`), so they fight. Make only the driver seat a VehicleSeat.
- Forgetting to clear controllers on death or reset leaves the camera stuck.

## Related
[[Vehicles - Hub]] - [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]] - [[Ride - Tank Turrets - Yaw and Pitch Servos Aimed in Local Space]] - [[Seat Entry with ProximityPrompt - No More Accidental Sits]]
