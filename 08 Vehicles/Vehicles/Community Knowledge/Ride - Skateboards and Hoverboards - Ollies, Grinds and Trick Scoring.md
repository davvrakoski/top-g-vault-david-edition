---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Skateboards and Hoverboards - Ollies, Grinds and Trick Scoring"
tags: [roblox, community-knowledge, vehicles, skateboard, hoverboard, tricks]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SkateboardPlatform
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://devforum.roblox.com/t/closed-need-scripter-to-create-a-rail-grinding-system/911048
  - https://forums.unrealengine.com/t/letsmakesomegames-epic-grinding-skating-framework-grinding-extreme-sports-gameplay-system/2834581
  - https://steamcommunity.com/app/861650/discussions/0/1628538005516969108
---
# Ride - Skateboards and Hoverboards - Ollies, Grinds and Trick Scoring

Boards are the most "movement game" of all vehicles: speed comes from skill, and score comes from tricks. Roblox once shipped a built-in `SkateboardPlatform` (with a `SkateboardController`); the API reference marks `SkateboardPlatform` deprecated and no longer supported, so build your own. The good news: a board is best treated as a **character movement mode**, not a physics vehicle.

## Board as a movement mode
- Keep the Humanoid. Weld the board mesh to the feet (or root) with `Massless = true`.
- Raise `Humanoid.WalkSpeed` with momentum: push (W) adds speed up to a cap, no input slowly decays, downhill adds speed from the slope (`raycast normal` dot gravity).
- Turn with lower turn rate at speed: set `Humanoid.AutoRotate = false` and rotate the root yourself toward a target heading at a capped rate.
- Hoverboards: same, plus a fixed hover height. Raycast down and drive `Humanoid.HipHeight` up, add a soft bob, and allow crossing water.

## Ollie and air
- Jump on release (not press) gives the "pop" feel. Charging for 0.3 s gives a higher ollie (`Humanoid.JumpPower` or `JumpHeight` multiplier).
- In the air, inputs pick tricks: direction + button, as the Unreal grinding framework describes ("input direction-based tricks").
- Spins: rotate the root while airborne, count accumulated yaw. 180 / 360 / 540 bonuses.

## Grinding rails
The DevForum job post describes the target exactly: when the player lands on or jumps at a rail, lock them to it and carry them along it in the direction they face.

1. Rails are models with an ordered list of Attachments (or a spline). Tag them with CollectionService, e.g. `Rail`.
2. While airborne, check the closest point on nearby rail segments within about 2 studs below the feet.
3. On snap: store `rail, segment, t, direction` (sign of facing dot segment direction). Anchor nothing; drive the root with `PivotTo` on the client each frame, along the rail at current speed, with a small balance meter.
4. Exit when `t` passes the rail end, jump is pressed, or balance fails.

The Skate Sim community complaint (landing on a rail is not enough, you must press a grind trick) is a design choice worth making on purpose: auto-snap is friendlier on mobile; a grind button is more skill.

## Trick scoring
| Element | Base | Notes |
|---|---|---|
| Ollie / kickflip | 100-300 | input + air time |
| Spin | 100 per 180 | |
| Grind | 50 per second | balance multiplier |
| Manual (wheelie) | 30 per second | links combos |

Combo = sum of base x number of distinct tricks. Landing ends the combo unless you are in a manual or grind. Bail (land at more than 60 degrees off travel direction) loses the combo. This "risk the bank" rule is the heart of skate games.

## Network
Tricks run on the client; send combo summaries to the server, which checks plausible scores per second before awarding. Replicate board state (grinding, rail id) with attributes for other players' animations.

## Pitfalls
- Using a physics VehicleSeat board: it flips on every curb. Movement-mode boards avoid that.
- Rail snapping through walls: raycast from feet to the snap point first.

## Related
[[Vehicles - Hub]] - [[Racing - Drift Scoring - Angle, Speed and Combo Chains]] - [[Kenney - Mini Skate]] - [[Motorcycles and Bikes - Lean Angle and Balance]]
