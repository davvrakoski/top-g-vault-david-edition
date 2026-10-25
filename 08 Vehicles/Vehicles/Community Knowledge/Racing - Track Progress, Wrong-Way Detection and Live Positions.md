---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Track Progress, Wrong-Way Detection and Live Positions"
tags: [roblox, community-knowledge, vehicles, racing, positions, anti-cheat]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/race-placement-system-how-do-i-know-who-is-in-first-second-or-third-place/1590589
  - https://devforum.roblox.com/t/racing-how-to-keep-track-of-race-positions/104806
  - https://devforum.roblox.com/t/race-system-with-player-positions-1st-2nd-etc/2214282
  - https://create.roblox.com/docs/reference/engine/datatypes/CFrame
---
# Racing - Track Progress, Wrong-Way Detection and Live Positions

The gate-crossing system in [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]] decides *whether* a lap counts. This note covers the second job: one smooth "progress" number per racer that drives live positions, the "WRONG WAY" banner, gap times and shortcut flags. A good progress value makes the HUD feel honest; a bad one makes 2nd and 3rd flicker every frame on long straights.

## One number for the whole race

DevForum threads on race placement settle on the same idea: fold lap, gate and fraction into one float.

- `whole = lap * gateCount + gatesPassedThisLap`
- `fraction` = how far the car is from the last gate toward the next one, clamped to 0..1.
- `progress = whole + fraction`, sort descending.

The classic bug from thread 1590589: the fraction formula was inverted, so the value hit 0.999 and never rolled over. If you measure distance *to the next gate*, use `1 - dist / segmentLength` clamped at 0. If you measure distance *from the previous gate*, cap at 0.999 so it never equals the next whole number.

## Better fraction: project onto the segment, not straight-line distance

Straight-line distance to the next gate lies on hairpins (a car on the inside of the bend looks "closer" than it is). Project the car onto the line between the two gate centres instead:

```lua
local function segmentFraction(a: Vector3, b: Vector3, p: Vector3): number
	local ab = b - a
	local len2 = ab:Dot(ab)
	if len2 < 1e-6 then return 0 end
	return math.clamp((p - a):Dot(ab) / len2, 0, 0.999)
end
```

For long sweeping corners, add more invisible "progress-only" nodes between real gates (a node every 30-60 studs works well). Nodes only feed the fraction; they never count as gates, so they do not make laps harder.

## Wrong-way detection

Compare the car's velocity with the track direction at its segment:

```lua
local function isWrongWay(chassis: BasePart, a: Vector3, b: Vector3): boolean
	local v = chassis.AssemblyLinearVelocity
	if v.Magnitude < 8 then return false end      -- ignore crawling / spinning
	local trackDir = (b - a).Unit
	return v.Unit:Dot(trackDir) < -0.5            -- more than ~120 deg off
end
```

Add hysteresis: show the banner only after 1.0 s of continuous wrong-way, hide it after 0.5 s of right-way. Without it, a spin-out flashes the banner. Wrong-way for more than ~6 s is a good trigger for an automatic respawn at the last gate.

## Shortcut and teleport flags from progress

Progress should rise smoothly. On the server, store last tick's progress and flag:

| Signal | Likely cause | Response |
|---|---|---|
| Progress jumps > 1.5 segments in one 0.25 s tick | Teleport, cut through a wall | Ignore the gain, respawn at last gate |
| Fraction stuck at 0.999 while speed is high | Car went around the gate (off-track) | Nothing; next gate will not count |
| Progress drops by a whole lap | Crossed finish backwards | Keep the old value; never decrease `lap` |

Never let progress go down by more than one segment per tick; it stops "reverse over the line" exploits that some systems reward.

## Publishing positions without flicker

- Recompute ranks at 4-5 Hz on the server, not every Heartbeat.
- Break ties with the previous rank (stable sort) so two cars side by side do not swap every update.
- Write `RacePosition` and `RaceProgress` as player attributes; the HUD reads them, so you need no extra remote.
- Finished racers always rank above unfinished ones, ordered by finish time.

## Gap times

Store the server time each racer crossed each gate (`gateTimes[lap][gate]`). The gap to the car ahead is "my time at gate G minus their time at gate G", using the most recent gate both have passed. This gives the "+1.42" readouts seen in real racing games and is cheap.

## Checklist

- [ ] Progress = whole + projected fraction, clamped below 1.
- [ ] Extra progress-only nodes on long corners.
- [ ] Wrong-way banner with hysteresis; auto-respawn after a long wrong-way.
- [ ] Server rejects progress jumps and never decreases laps.
- [ ] Ranks at 4-5 Hz, stable tie-break, attributes for the HUD.

## Related
[[Vehicles - Hub]] · [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]] · [[Racing Starter Architecture]] · [[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]]
