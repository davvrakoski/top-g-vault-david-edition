---
area: "07 AI and Combat"
cluster: "AI"
title: "Chase AI for Vehicles and Racers - Pursuit Prediction and Skill Balancing"
tags: [roblox, community-knowledge, ai, vehicles, racing, pursuit, police-chase, rubber-banding]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.red3d.com/cwr/steer/gdc99/
  - https://www.gamedeveloper.com/design/the-pure-advantage-advanced-racing-game-ai
  - https://www.gamedeveloper.com/design/rubber-banding-as-a-design-requirement
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
---
# Chase AI for Vehicles and Racers - Pursuit Prediction and Skill Balancing

Police chases in city RP games, rival racers, a monster truck hunting players: all need an AI that steers toward a moving target and stays fun to escape or beat. Two classic sources cover it: Craig Reynolds' "Steering Behaviors for Autonomous Characters" (GDC 1999) for pursuit math, and Eduardo Jimenez's Game Developer article on the AI of *Pure* (Black Rock Studio) for keeping AI racers competitive without obvious rubber-banding.

## 1. Pursuit: aim where the target will be

Reynolds' pursuit is "seek the predicted position":

- Predicted position = target position + target velocity × T.
- A simple T is distance × c (a tuning constant): far targets get more prediction.
- T should drop to 0 when the pursuer is in front of the target and aligned with it, or the chaser overshoots.
- **Evasion** is the mirror: flee from the predicted position. Reynolds notes natural evasion is often deliberately suboptimal, which makes it harder to anticipate.
- **Arrival**: inside a slowing radius, desired speed = max speed × distance / slowing radius, so the chaser does not overshoot a stopped target.

```lua
local function pursuitPoint(myPos, myVel, tgtPos, tgtVel)
	local toT = tgtPos - myPos
	local dist = toT.Magnitude
	local T = math.clamp(dist / math.max(myVel.Magnitude, 20), 0, 2) -- seconds of lead
	if toT.Unit:Dot(tgtVel.Unit) < -0.9 then T = 0 end -- head-on: no lead
	return tgtPos + tgtVel * T
end
```

Convert the point to steering for a `VehicleSeat` car: `SteerFloat` from the signed angle between the car's LookVector and the direction to the point (clamped to -1..1), `ThrottleFloat` from distance and the angle (brake for sharp turns). For constraint cars, feed the same values into your own drive script.

## 2. Path first, steering second

In a city, pursue along the road graph: run A* on your road nodes to the target's nearest node, then pursue the next node until the target is in direct line of sight within ~60 studs, then switch to direct pursuit. This avoids cars driving into buildings.

## 3. Police chase design

- **PIT/ram behavior**: offset pursuit (Reynolds) to a point beside the target's rear quarter, then steer in.
- **Roadblocks**: the director spawns ahead along the target's predicted road, out of sight.
- **Lose the cops**: break line of sight for 10-20 s (a search timer like stealth AI). Without an escape rule, chases are just annoying.
- Cap active pursuers (3-4) for performance and fairness.

## 4. Racers: skill instead of speed cheats

*Pure*'s team rejected classic rubber banding (slowing AI ahead of the player, boosting AI behind) because the unfairness was easy to spot. Their replacement:

- Each AI has **skills from 0 to 1** (cornering, trick execution, aggressiveness), normal difficulty starting around 0.4-0.6.
- A **race script** gives each AI a target position relative to the player (groups targeted from +500 m ahead to -500 m behind, one group held right at the player).
- Skill is nudged in proportion to the AI's distance from its target point, capped at 150 m of error.
- AI use top skill for the first 10-20 s, then blend down over ~5 s.
- In the last 20% of the race, the catch-up bonus goes to 0 so AI cannot recover from the player's mistakes unfairly.

For Roblox: express skill as racing-line accuracy (how far from the ideal line), braking point accuracy and top-speed fraction (0.92-1.0), never above the player's car limits.

## 5. Racing line

Place `Attachment` waypoints along the ideal line with a target speed attribute per waypoint. AI steer toward a look-ahead point 2-3 waypoints ahead (more at higher speed) and brake when the current speed exceeds the next waypoint's speed. Lower skill = add noise to the look-ahead point.

## Pitfalls

- Server-side steering at 60 Hz for many cars; 10-20 Hz is enough for AI decisions.
- Network ownership: AI cars should stay server-owned (`SetNetworkOwner(nil)`), or they stutter when a player drives near.
- Giving AI cars more grip or speed than players: players notice within one race.

## Related
[[AI - Hub]] - [[Traffic, NPC Vehicles and Road Graphs]] - [[Steering Behaviors and Boids for NPC Groups]] - [[NPC Traffic - Community Approaches and the City People Cars Demo]]
