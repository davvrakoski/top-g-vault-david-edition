---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Drift Scoring - Angle, Speed and Combo Chains"
tags: [roblox, community-knowledge, vehicles, racing, drift, scoring]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://cw-scripts.tebex.io/package/7143394
  - https://devforum.roblox.com/t/how-could-i-change-my-raycast-cars-grip-based-on-its-drift-angle/1457331
  - https://devforum.roblox.com/t/my-fan-made-mall-drifters-car-system-open-source/3605524
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
---
# Racing - Drift Scoring - Angle, Speed and Combo Chains

Drift games (Midnight Chasers, drift-server hangouts, Forza-style "drift zones") live on a score that rewards *style*. The handling that makes a car slide is covered in [[Arcade Handling and Drifting Without Fighting Physics]] and [[Drift and Handling Tuning - Community Tips for Constraint Cars]]; this note is the **score layer** that sits on top of any chassis.

## 1. Measure the drift angle

The drift angle is the angle between where the car points and where it is moving, measured flat on the ground:

```lua
local function driftAngleDeg(chassis: BasePart): (number, number)
	local v = chassis.AssemblyLinearVelocity
	local flatV = Vector3.new(v.X, 0, v.Z)
	local speed = flatV.Magnitude
	if speed < 1 then return 0, 0 end
	local look = chassis.CFrame.LookVector
	local flatLook = Vector3.new(look.X, 0, look.Z).Unit
	local cos = math.clamp(flatLook:Dot(flatV.Unit), -1, 1)
	return math.deg(math.acos(cos)), speed
end
```

If `angle > 100`, the car is going backwards: end the drift (no points for reversing).

## 2. Points per tick

A drift counts only inside a window: angle between ~15 and ~70 degrees, speed above a minimum (e.g. 35 studs/s), and wheels on the ground. An open FiveM drift script (CW-Scripts) uses the same structure: a minimum angle threshold (15 in its example config), steeper angle = more points.

```
points per second = angleFactor * speedFactor * BASE
angleFactor = (angle - 15) / 55          -- 0 at 15 deg, 1 at 70 deg
speedFactor = speed / 60                 -- 1 at 60 studs/s, clamp to 2
```

## 3. Combo chain and multiplier

- **Pending score**: points accumulate into a pending pot while drifting.
- **Multiplier**: rises by +1 for every 2 s of continuous drift, cap at x5-x10 (CW-Scripts caps at 10x, configurable).
- **Chain grace**: if the drift ends, you have ~1.5-3 s to start the next one and keep the multiplier (CW-Scripts resets after 3 s without drifting). Transitions (left to right flick) are the skill moment, so give them a small bonus.
- **Bank**: when the grace timer runs out cleanly, pending x multiplier is added to the total, with a big pop on screen.
- **Fail**: hitting a wall or another car during the drift or grace (`Touched` on the body, or an impact spike in velocity) wipes the pending pot. The risk of losing a big pot is what makes it exciting.

## 4. Bonuses that read well

| Bonus | Rule |
|---|---|
| Near miss / wall tap | Rear bumper passes within 2-3 studs of a wall (raycast sideways) |
| Clipping point | Car passes inside an authored zone part during the drift |
| Tandem | Another drifting car within 15 studs in front |
| Long drift | Single drift > 5 s |

## 5. Server trust

Compute the score on the **client** for instant feedback, but have the server recompute a coarse version from the chassis it sees at 10 Hz (angle, speed). Bank on the server only if the client total is within ~20% of the server estimate. Never accept "add 1,000,000 points" remotes; send events ("drift started/ended"), not totals.

## 6. UI

- Pending score grows near the car (BillboardGui) or centre-low on screen; multiplier as a big "x4".
- Colour the pending text from white to gold as it grows; flash red on fail.
- Session total and best single drift on the side.
- Leaderboards for "best single drift" per map fit [[Racing - Time Trial Leaderboards with OrderedDataStore]] with `ascending = false`.

## Related
[[Vehicles - Hub]] · [[Arcade Handling and Drifting Without Fighting Physics]] · [[Drift and Handling Tuning - Community Tips for Constraint Cars]] · [[Racing - Nitro and Boost Meters]]
