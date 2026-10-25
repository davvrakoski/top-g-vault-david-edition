---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - AI Racers on a Racing Line Spline"
tags: [roblox, community-knowledge, vehicles, racing, ai, splines]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/the-pure-advantage-advanced-racing-game-ai
  - https://devforum.roblox.com/t/new-studio-racing-template/2805745
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
---
# Racing - AI Racers on a Racing Line Spline

Bots fill empty grids, which matters a lot on Roblox: most servers have 2-6 players, and a 2-car race feels dead. You do not need machine learning or pathfinding. Real racing games drive bots along a hand-authored **racing line** and add small offsets and speed rules. This note covers the driver; catch-up tuning is in [[Racing - Rubber-Banding and Fair Catch-Up]].

## 1. Author the racing line

- Place 30-80 small invisible parts (`RacingLine/1, 2, ...`) along the ideal line: outside on entry, apex on the inside, outside on exit.
- Smooth them with a Catmull-Rom spline so the bot never sees sharp corners between nodes (math in [[Bezier Curves and Catmull-Rom Splines in Luau]]).
- Bake the spline once at server start into ~1 sample per 4-6 studs: position, tangent, distance along the track, and a **target speed**.

## 2. Target speed from curvature

At each baked sample, measure how fast the direction changes over the next ~40 studs. Tight turn = low speed:

```lua
-- tangents are unit vectors; d = distance between them in studs
local function cornerSpeed(t1: Vector3, t2: Vector3, d: number, vMax: number, grip: number): number
	local angle = math.acos(math.clamp(t1:Dot(t2), -1, 1))
	if angle < 1e-3 then return vMax end
	local radius = d / angle                -- approx turn radius in studs
	return math.min(vMax, math.sqrt(grip * radius))  -- v^2 / r <= grip
end
```

Then run a backwards pass so the bot brakes *before* the corner: walking the samples from last to first, `speed[i] = min(speed[i], sqrt(speed[i+1]^2 + 2 * brakeDecel * d))`. Tune `grip` and `brakeDecel` by watching a bot lap; they are per car class.

## 3. Steering: pure pursuit

Each tick (10-20 Hz is enough), find the bot's nearest baked sample (search only a window ahead of last tick's index), then pick a **look-ahead point** further along: `lookAhead = 12 + speed * 0.4` studs. Steer toward it:

```lua
local local_ = chassis.CFrame:PointToObjectSpace(target)
local steer = math.clamp(local_.X / math.max(-local_.Z, 1) * 2, -1, 1)
```

Feed `steer` and a throttle (`+1` if below target speed, brake if above by more than 5 studs/s) into whatever your car uses: `VehicleSeat.SteerFloat/ThrottleFloat` for seat cars, or the same input attributes your player controller reads, so bots and players share one car script. The Studio Racing Template ships no AI racers, but a reply in its announcement thread suggests exactly this: drop the client control scripts and let an AI script write the same input attributes the car's controller reads.

## 4. Lanes and personality

- Give each bot a lateral offset (-4..+4 studs) that drifts slowly with Perlin noise (`math.noise`) so they do not drive in a single-file train.
- Personality values per bot: `skill` (0..1 scales target speed 0.88..1.0), `aggression` (how close it follows), `mistakeRate` (chance per corner to brake 10% late).
- Overtaking: if a car is within 10 studs ahead in the same lane, shift the offset toward the side with more room for 2-3 s.

## 5. Recovery

- Stuck (speed < 3 studs/s for 2 s): reverse with opposite steer for 1 s, then retry.
- Off the line by > 25 studs or upside down: respawn at the nearest baked sample like a player.
- Bots use the same gate system as players so positions and laps just work.

## 6. Performance and ownership

Bots are server-owned: call `SetNetworkOwner(nil)` on the chassis. Run all bots from one script in one Heartbeat loop at a fixed lower rate rather than one script per bot. 6-8 bots is a sensible cap on mid-range servers; measure with the MicroProfiler. If you add a server-authority chassis later, bots should still read inputs the same way.

## Pitfalls

- Steering toward the *nearest* point instead of a look-ahead point: bots wobble.
- No backward braking pass: bots fly off at every hairpin.
- Per-bot `while true do wait() end` loops: server lag at 8 bots.

## Related
[[Vehicles - Hub]] · [[Bezier Curves and Catmull-Rom Splines in Luau]] · [[NPC Traffic - Community Approaches and the City People Cars Demo]] · [[Roblox Racing Template - Dune Buggy Chassis and Server Authority Version]]
