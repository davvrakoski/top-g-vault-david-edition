---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Racing - Lap Cheats, Car Collisions and Fair Starts"
tags: [roblox, community-knowledge, testing, qa, genre-qa, racing, vehicles]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/workspace/collisions
  - https://create.roblox.com/docs/projects/server-authority
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://devforum.roblox.com/t/feedback-on-upcoming-racing-game/311758
---
# QA Pass - Racing - Lap Cheats, Car Collisions and Fair Starts

Racing games have one result that matters, the finishing order, and three ways to corrupt it: counting laps that were not driven, cars that wreck each other through physics glitches instead of driving, and starts or finishes timed by the client. Because each driver's client normally simulates their own car (network ownership), the server has to check progress rather than trust it.

## Bugs this genre always ships with
- **Finish-line toggling.** Lap counts on every finish-line touch, so reversing over the line and driving forward again adds a lap.
- **Skipped checkpoints.** Checkpoints counted as a total, not in order, so a shortcut that misses one still finishes. A write-up on racing checkpoints also warns that overlapping checkpoint volumes can register as a single hit.
- **Wrong position on lapping.** Race position computed from checkpoint index only, ignoring lap number, so a lapped car shows as leading.
- **Physics flings.** Two client-owned cars collide, each client resolves the hit differently, and one car launches into the sky.
- **Start ramming.** Grid spacing too tight or cars unanchored during countdown.
- **Client countdown.** The countdown runs locally and fast clients (or edited clients) go early.
- **Respawn wrong way.** "Reset car" drops the car on the last checkpoint facing backward, or under the track.
- **Disconnect mid-race.** The race never ends because it waits for a player who left.

## Test checklist
1. Cross the finish line, reverse back over it, drive forward over it. Lap count must rise by one only after a full lap.
2. Drive every shortcut you know (and any a tester finds). Missing a checkpoint must stop the lap counting.
3. Lap a slower car. Position board must show the lapping car ahead.
4. Two testers crash head-on at top speed, 10 times, at 0 ms and 200 ms simulated latency. Note any car leaving the track by more than a few studs.
5. Start a race with 8 cars on the grid. Nobody touches before "GO" and nobody moves early.
6. Reset the car at every checkpoint. Car lands on the track, facing the next checkpoint.
7. Leave mid-race, and have the leader leave just before the finish. Race still ends and remaining racers still get results.
8. Speedhack check: compare each lap time with the best tester lap; anything far below it gets logged.

## Exploit angles
- Checkpoints in strict order on the server, plus a direction check (the car's velocity should point roughly through the checkpoint, see helper).
- Minimum time between checkpoints based on distance and top speed; a car that arrives sooner teleported.
- Start and finish times come from the server (`workspace:GetServerTimeNow()` is shared by server and clients, so the client can display the same clock).
- Roblox's server authority model is built for competitive genres like racing; consider it if speedhacks are a serious problem.

## Collisions
- A "ghost mode" or pit area can turn off car-to-car collisions with collision groups: register a group, assign car parts to it, and set the group not collidable with itself.
- If collisions stay on, test the worst case: many cars in one corner at low frame rate.
- A DevForum racing feedback thread suggests slowing cars off-track as an alternative to strict corner-cut detection; it is gentler and harder to exploit.

## Balance checks
- Compare top speed, acceleration and handling for every car the shop sells. If the top paid car beats the best free car by more than your target, races become pay-to-win.
- Check that the AI or rubber-band (if any) cannot win against a perfect lap.

## Data and save checks
- Best lap and leaderboard times save only from server-validated laps.
- Car ownership and tuning save by stable car id, with defaults when a car is removed from the shop.

## Debug helper: ordered, directional checkpoint gate
```lua
-- Server: checkpoints is an ordered array of parts; their LookVector points along the track.
local function onCheckpoint(state, car: BasePart, index: number, checkpoints: {BasePart})
	local expected = state.nextIndex
	if index ~= expected then
		warn(("checkpoint %d hit, expected %d"):format(index, expected))
		return
	end
	local forward = checkpoints[index].CFrame.LookVector
	if car.AssemblyLinearVelocity:Dot(forward) <= 0 then
		warn("crossed checkpoint", index, "backwards")
		return
	end
	state.nextIndex = index % #checkpoints + 1
	if index == #checkpoints then
		state.lap += 1 -- the last checkpoint sits on the finish line
	end
end
```
Point every checkpoint's front face along the racing direction when you build the track, and test once in each direction.

## Related
[[Testing - Hub]] - [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]] - [[Racing - Ghost Cars - Recording and Replaying CFrame Laps]] - [[Racing - Race HUD - Minimap, Position, Lap and Split Times]] - [[Device, Network and Controller Simulation Test Pass]]
