---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Tower Defense - Pathing, Wave Scaling, Tower Stacking and AFK Farms"
tags: [roblox, community-knowledge, testing, qa, genre-qa, tower-defense]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/characters/pathfinding
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/luau/numbers
  - https://create.roblox.com/docs/scripting/security/client-server-boundary
  - https://devforum.roblox.com/t/tower-defense-enemy-movement/1930853
  - https://devforum.roblox.com/t/how-to-handle-enemy-positions/2643951
  - https://devforum.roblox.com/t/2312772
---
# QA Pass - Tower Defense - Pathing, Wave Scaling, Tower Stacking and AFK Farms

Tower defense games break in the same four places almost every time: enemies that leave the path or get stuck, wave formulas that run out of numbers in endless mode, towers or buffs that stack in ways nobody priced, and "AFK farms" where a perfect setup earns rewards with nobody playing. This pass is a one-session checklist you can run before every update that touches enemies, towers or rewards.

## Bugs this genre always ships with
- **Waypoint overshoot.** Fast enemies driven by `Humanoid:MoveTo` slide past corners or circle a waypoint (a common DevForum report). Many TD games move enemies as data on the server and let clients tween the models, which brings the next bug.
- **Server/client position drift.** If the server's enemy table and the client models disagree, towers "hit air" or skip a visible enemy. DevForum threads on client-rendered enemies flag this as the hard part.
- **Leak counting.** An enemy that reaches the base is subtracted twice (touch event + end-of-path check) or never removed, so the wave never ends.
- **Placement trust.** The client sends a CFrame and the server places it: towers land on the path, inside other towers, on roofs, or outside the map.
- **Stacking.** Support towers buffing each other multiplicatively, or ten buff towers stacking where the design assumed one.
- **Sell/upgrade races.** Selling during an upgrade refunds the upgraded price; selling on the same frame as a wave reward double-pays.

## Test checklist
1. With a gated test command (see [[QA Test Commands - Gated Cheats for Testers]]), jump to waves 1, 10, 50, 100 and the endless cap. Watch for enemies that stop moving for more than 3 s.
2. Spawn the biggest wave you allow, double it, and check server heartbeat time in the MicroProfiler and the count of live enemies vs the server table.
3. Fire the placement remote with bad data: a CFrame on the path, 1,000 studs away, NaN coordinates, an unowned tower id. Each must be rejected server-side.
4. Place two towers on the same spot with two clients in the same frame (Team Test or a multi-client server test).
5. Upgrade then sell within one frame; sell during wave reward payout; sell after the match ends.
6. Leave mid-wave: do your towers keep firing, vanish, or keep earning for you? Decide the rule and test it.
7. Late joiner: joins at wave 30. Do they get starting cash, and can they still earn the full match reward?

## Exploit angles
- Placement validation must run on the server: raycast down to a surface tagged placeable, distance from the path spline above a minimum, and no overlap with other towers (radius check or `GetPartBoundsInBox`).
- Rate-limit placement and upgrade remotes per player; compare money server-side on every call.
- If enemies are client-rendered, never accept "I killed enemy 42" from a client. Towers resolve hits on the server table.

## Balance checks
- Build a sheet of DPS per coin for every tower and level. Any row more than ~1.5x the median is a stacking or meta problem (judgement call, tune for your game).
- For each wave, compare total enemy HP against the DPS of a cheap "worst sensible" loadout and the best loadout. The gap is your difficulty band.
- Count buff sources that can hit one tower. Cap the total multiplier (for example `math.min(buff, 3)`) and test the cap.

## AFK farming
`Player.Idled` fires on the client about two minutes after the engine marks a player idle, and Roblox disconnects players idle for 20 minutes (Player API). A TD farm can dodge that with an autoclicker, so the defence is design, not detection: cap rewards per hour, require a vote or click to start each wave in public servers, and make endless-mode rewards taper. Test that the cap survives a rejoin (store it in the player's save, not server memory). See [[Recipe - AFK Detection]].

## Data and save checks
- Match reward is granted exactly once, even if the player leaves during the results screen.
- If the match runs in a separate place, the reward is written by the match server to the DataStore, not passed back in teleport data (teleport data comes from the client and can be edited).
- Tower unlocks and skins load before the loadout screen, and a failed load blocks the match rather than starting it with an empty loadout.

## Debug helper: find where your wave formula breaks
```lua
-- Run in the Command Bar. Swap in your real health formula.
local function waveHealth(n: number): number
	return 100 * 1.12 ^ n
end

for n = 1, 1000 do
	local hp = waveHealth(n)
	if hp ~= hp or hp == math.huge then
		warn(("wave %d: health is %s"):format(n, tostring(hp)))
		break
	elseif hp > 2 ^ 53 then
		warn(("wave %d: %.3g is past 2^53, integer math is no longer exact"):format(n, hp))
		break
	end
end
```
Luau numbers are doubles, so whole numbers above 2^53 lose precision. With this example formula the warning fires at wave 284; endless modes need a cap or a different curve before that.

## Related
[[Testing - Hub]] - [[Tower Defense Genre Breakdown - Waves, Placement Economy and Unit Rosters]] - [[Tower Defense Targeting Modes - First, Last, Strongest and Closest]] - [[Case Study - Tower Defense Simulator]] - [[RemoteEvent Fuzzing - Bad Input Tests Before Launch]]
