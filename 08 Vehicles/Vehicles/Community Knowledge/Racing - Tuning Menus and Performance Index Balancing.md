---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Tuning Menus and Performance Index Balancing"
tags: [roblox, community-knowledge, vehicles, tuning, balancing, ui]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/reference/engine/classes/CylindricalConstraint
  - https://create.roblox.com/docs/reference/engine/classes/SpringConstraint
  - https://devforum.roblox.com/t/new-studio-racing-template/2805745
---
# Racing - Tuning Menus and Performance Index Balancing

A tuning menu lets players feel like mechanics: more power, stiffer springs, different gearing. Without a balancing rule, though, every car ends up maxed and the class system dies. Real racing games solve this with a **performance index (PI)**: one number per car that goes up with upgrades and decides which class it races in. This note shows a simple PI model, the tuning UI, and how settings reach the physics.

## 1. Two kinds of options

- **Upgrades** (bought, raise performance): engine stage, turbo, tyres compound, weight reduction, brakes.
- **Tunes** (free sliders, trade-offs): spring stiffness, ride height, brake bias, final drive, steering lock, downforce. These change *feel*, not raw performance.

Upgrades change PI; tunes should not (or only a little), so players experiment freely.

## 2. Stats as attributes

Each car model holds base stats as attributes (`Power`, `Mass`, `Grip`, `Brake`, `TopSpeed`). The applied tune is a table in the player's profile, keyed by car id. One `applyTune(model, tune)` function on the server converts tune values into physics properties:

| Tune slider | Property it drives |
|---|---|
| Spring stiffness | `SpringConstraint.Stiffness` |
| Damping | `SpringConstraint.Damping` |
| Ride height | `SpringConstraint.FreeLength` |
| Power | `CylindricalConstraint.MotorMaxTorque` / your torque curve scale |
| Top speed / final drive | `AngularVelocity` target or gear ratios (see [[Engine RPM, Gearbox and Torque Curve Model]]) |
| Steering lock | max steer angle in your steering servo |
| Tyre grip | `CustomPhysicalProperties` friction (see [[Tyre Friction with CustomPhysicalProperties]]) |

Clamp every slider on the server; the client sends values, the server clamps and saves.

## 3. A simple PI formula

```lua
-- higher = faster. weights tuned by lap-timing each car on a test track
local function performanceIndex(s): number
	local powerToWeight = s.Power / s.Mass
	local raw = 300 * powerToWeight + 2.5 * s.TopSpeed + 180 * s.Grip + 40 * s.Brake
	return math.floor(math.clamp(raw, 100, 999))
end
-- classes: D < 400 <= C < 500 <= B < 600 <= A < 700 <= S
```

Calibrate it: lap 6-10 cars on one test track with a bot driver (see [[Racing - AI Racers on a Racing Line Spline]]), then adjust weights until PI order matches lap-time order. Recheck whenever you add a car.

## 4. Class races

Matchmaking or race rooms choose a class; a car above the class PI cap cannot enter (or is auto-detuned, if you want convenience). This lets a tuned D-class hatch race fairly against stock C cars and keeps old cars relevant.

## 5. The menu

- Left: categories (Engine, Handling, Tyres, Aero). Right: slider or upgrade cards.
- Show **before/after** bars for Speed, Acceleration, Handling, Braking, plus the PI number and class badge changing live.
- "Test drive" button right in the menu, and "Reset to default".
- Save **tune presets** (2-3 slots per car) so players switch between drift and grip setups.
- Mobile: big +/- buttons on sliders; drag sliders are fiddly on touch.

## 6. Applying safely

- Apply tunes when spawning the car (server), not while driving; physics changes mid-drive cause jolts.
- Version the tune table (`tuneVersion = 2`) so you can migrate old saves when you rebalance.
- Log PI per finish; if one car dominates a class in data, fix the weights or the car, not the leaderboard.

## Related
[[Vehicles - Hub]] · [[Engine RPM, Gearbox and Torque Curve Model]] · [[Tyre Friction with CustomPhysicalProperties]] · [[Racing - Car Shops, Unlock Ladders and Progression Pacing]]
