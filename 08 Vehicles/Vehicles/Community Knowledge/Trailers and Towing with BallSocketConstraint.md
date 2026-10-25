---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Trailers and Towing with BallSocketConstraint"
tags: [roblox, community-knowledge, vehicles, constraints, trailers, towing]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BallSocketConstraint
  - https://create.roblox.com/docs/physics/mechanical-constraints
  - https://devforum.roblox.com/t/new-constraints-are-live/27217?page=3
  - https://create.roblox.com/docs/physics/network-ownership
---
# Trailers and Towing with BallSocketConstraint

Trailers, tow trucks, train-style cart chains and "drag the broken car to the garage" all come down to joining two vehicles with one constraint. The wrong constraint (a rod or a weld) makes the trailer refuse to turn or flip the truck; a ball socket with sensible limits behaves like a real hitch.

## Pick the joint
| Trailer type | Joint |
|---|---|
| Single- or tandem-axle trailer, caravan, semi-trailer | One `BallSocketConstraint` at the hitch |
| Full trailer with steering front axle (drawbar) | Hinge for the turntable + hinge for drawbar pitch, then ball socket to the truck (the layout a DevForum reply in "New constraints are live" describes) |
| Tow rope / winch | `RopeConstraint` (slack allowed) |
| Rigid tow bar for a broken car | `RodConstraint` or ball socket with tight limits |

## Setting up the hitch
1. Put `HitchAtt` on the truck's rear chassis, `CouplerAtt` on the trailer tongue, both at the same point when coupled.
2. Create the ball socket and connect.
3. Limit articulation so the trailer cannot fold into the cab:

```lua
local hitch = Instance.new("BallSocketConstraint")
hitch.Attachment0 = truck.Chassis.HitchAtt
hitch.Attachment1 = trailer.Tongue.CouplerAtt
hitch.LimitsEnabled = true
hitch.UpperAngle = 70 -- cone half-angle in degrees
hitch.TwistLimitsEnabled = true
hitch.TwistLowerAngle = -25 -- roll between truck and trailer
hitch.TwistUpperAngle = 25
hitch.MaxFrictionTorque = 0 -- free swing; raise slightly to damp sway
hitch.Parent = truck.Chassis
```
Orient the attachments so their primary axis points along the vehicle's length; the cone limit is measured around that axis, and twist is rotation around it.

## Physics rules that prevent explosions
- **Mass ratio.** A 2000-mass trailer behind a 300-mass truck will swing the truck around. Keep the trailer lighter than or similar to the tow vehicle, or add mass to the truck's floor.
- **Tongue weight.** Put the trailer's centre of mass slightly **ahead** of its axle. Mass behind the axle causes sway that grows with speed.
- **Couple at rest.** Create the constraint when both vehicles are slow and the attachments are close (under ~1 stud). Snapping attachments 5 studs together yanks both vehicles.
- **Braking.** Undriven trailer wheels should still brake: when the truck brakes, set trailer wheel hinges to Motor with `AngularVelocity = 0` and moderate torque, otherwise the trailer pushes the truck into a jackknife.

## Network ownership
Connected unanchored assemblies form one mechanism, and the docs note that setting ownership on one assembly of a mechanism with no anchored parts applies to all of it. So when the truck's driver owns the truck, they own the trailer too. Consequences:
- Couple on the server, then (re)apply `SetNetworkOwner(driver)` to the truck root.
- On uncouple, the trailer becomes its own mechanism; give it back to the server (`SetNetworkOwner(nil)`) or it will stay with the driver until auto ownership changes it.

## Couple / uncouple UX
- ProximityPrompt at the hitch, visible only when a trailer's coupler is within 2 studs.
- Server validates both vehicles' distance and that the player owns or is allowed to tow the target.
- Show a short "clunk" and a small camera shake on couple.

## Related
[[Vehicles - Hub]] · [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]] · [[Center of Mass, Anti-Flip and Self-Righting]] · [[BallSocketConstraint]]
