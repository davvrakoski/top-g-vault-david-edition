---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Battlegrounds and Fighting - Hitbox Desync, Combo Loops and Spawn Kills"
tags: [roblox, community-knowledge, testing, qa, genre-qa, combat, battlegrounds]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/server-authority
  - https://create.roblox.com/docs/reference/engine/classes/SpawnLocation
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://developer.valvesoftware.com/wiki/Lag_Compensation
  - https://devforum.roblox.com/t/responsive-combat/2840397
  - https://devforum.roblox.com/t/fast-paced-combat/2944831
  - https://devforum.roblox.com/t/combat-system-hitboxes/3312821
---
# QA Pass - Battlegrounds and Fighting - Hitbox Desync, Combo Loops and Spawn Kills

Battlegrounds games are judged in milliseconds. Players forgive ugly maps but not a hit that "should have landed", a combo that never lets them move, or dying the moment they spawn. This pass is the genre layer on top of the general combat checklist: it tests fairness under real ping, stun-lock loops and the spawn area.

## Bugs this genre always ships with
- **Late or phantom hits.** Server-side hitboxes use positions that are already a ping behind the attacker's screen, so hits feel late; client-side hitboxes feel instant but let the client claim hits. DevForum combat threads land on the usual compromise: detect on the client, then have the server sanity-check distance (with a ping allowance) and timing. Valve's lag compensation article describes the fuller version, where the server rewinds positions to what the shooter saw.
- **Trade priority.** Two M1s land in the same window and both players get stunned, or the one with lower ping always wins. One DevForum reply suggests resolving by the first hit event received rather than complex priority.
- **Infinite combos.** Each hit refreshes the stun before it ends, so a fast attacker never releases the target. Ragdoll into M1 into ragdoll is the common loop.
- **Fling out of map.** Knockback on a character the server does not own can be multiplied by physics and send players into the void.
- **Cooldowns on the client only.** The UI shows a cooldown, but the server accepts the next ability anyway.
- **Spawn kills.** Players respawn into an ongoing fight with no protection, or protection that ends when they move but still lets them attack.

## Test checklist
1. Raise simulated latency (Studio's network simulation settings) to 150 ms and 300 ms. Record 20 trades: who was hit, and did it match what each screen showed?
2. Two testers press M1 together, 20 times. Count double-stuns and log who won.
3. Have a tester mash a full combo on a dummy with a stun meter (helper below). Longest continuous stun must stay under your cap.
4. Use every knockback move against a wall, a corner and the map edge. Nobody leaves the map.
5. Fire ability remotes faster than the cooldown with a fuzz script. Server rejects extras.
6. Die and respawn ten times next to an active fight. Protection must stop damage both ways.
7. Use an ability during ragdoll, during a teleport and while dead. All must be rejected.

## Exploit angles
- Reach: the server rejects hits where attacker and target are farther apart than the move's range plus a latency margin.
- Rate: the server stores the last use time of each ability per player and ignores early calls.
- Target trust: never accept a list of victims without checking each one is alive, in range and not protected.

## Balance checks
- For each character or moveset, record damage per second in a simple combo and time-to-kill a full-health dummy. Outliers become the meta within a day of release.
- Measure how many seconds a target spends stunned per 10 seconds of combat. If it is above about half, players will call it stun-lock (judgement number, tune per game).

## Spawn protection
`SpawnLocation.Duration` sets how long the spawn `ForceField` lasts (default 10 seconds; 0 means no ForceField). A ForceField alone does not stop scripted damage that sets `Health` directly or uses your own damage function, so your damage code must check for it too, and attacking should end the protection.

## Data and save checks
- Kill streaks and leaderboard kills count on the server only, once per death, with the last-damage dealer recorded.
- Selected moveset and cosmetics load before the player can fight; test with a slow DataStore.

## Debug helper: stun budget meter
```lua
-- Server: wrap your stun function. Logs any target held longer than the cap.
local CAP = 2.5 -- seconds of continuous stun
local stunUntil, stunStart = {}, {}

local function applyStun(target: Model, seconds: number)
	local now = os.clock()
	if (stunUntil[target] or 0) < now then
		stunStart[target] = now -- fresh stun
	end
	stunUntil[target] = math.max(stunUntil[target] or 0, now + seconds)
	local held = stunUntil[target] - stunStart[target]
	if held > CAP then
		warn(("%s stunned for %.2fs straight"):format(target.Name, held))
	end
	-- your real stun code goes here (attributes, WalkSpeed, etc.)
end
```
Once the log shows which move chain breaks the cap, add diminishing returns or a forced release window.

## Related
[[Testing - Hub]] - [[Test - Combat Regression Checklist]] - [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]] - [[Case Study - The Strongest Battlegrounds]] - [[Device, Network and Controller Simulation Test Pass]]
