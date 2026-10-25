---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Round-Based Minigames - Round Desync, Late Joiners and Winner Edge Cases"
tags: [roblox, community-knowledge, testing, qa, genre-qa, rounds, minigames]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://devforum.roblox.com/t/buggy-round-system/3348473
  - https://devforum.roblox.com/t/statesync-multiplayer-state-framework/3874778
---
# QA Pass - Round-Based Minigames - Round Desync, Late Joiners and Winner Edge Cases

Round-based games (minigame rotations, disaster survival, murder-mystery style, elimination games) run one loop forever: intermission, load map, play, pick winners, clean up. The loop is simple; what breaks it is time and people. Clients disagree about how many seconds are left, players join or leave at the worst moment, and one error in round 37 stops the loop for the rest of the server's life.

## Bugs this genre always ships with
- **Timer drift.** The server sends "30" once and each client counts down on its own; after a hitch, clients disagree by seconds. Sending an end timestamp from `workspace:GetServerTimeNow()` fixes this, since every client reads the same synced clock.
- **Late joiner limbo.** A player joins mid-round and spawns in the lobby with a UI that says "Intermission", or spawns inside the round map without being in the round.
- **Late joiner counted as winner.** "Everyone alive at the end wins" includes people who joined 3 seconds ago in the lobby.
- **Winner left.** The last survivor leaves just before the end; winner code indexes a nil player and errors.
- **Zero or one player.** The round starts with one player and ends instantly with a free win, or waits forever.
- **Dead loop.** An error inside the round loop kills the thread; the server shows "Intermission" forever. A DevForum round-system thread traces a similar bug to running the loop inside `PlayerAdded`.
- **Map not loaded.** Players are teleported into the map before it has fully parented or streamed in, and fall through.
- **Double rewards.** End-of-round reward runs twice when two end conditions fire on one frame (timer ran out and last player died).

## Test checklist
1. Run 50 rounds back to back on an empty server with a bot or test command. Count rounds started and ended; they must match.
2. Inject an error into one random minigame. The loop must log it, clean up and continue to the next round.
3. Join during intermission, during map load, mid-round, and in the last second. Each joiner sees the correct state and timer.
4. The last alive player leaves 1 second before the end. Round ends without errors; no one, or the right player, wins.
5. Start with 1 player, then 2, then have 1 leave mid-round. Check your minimum-player rule.
6. Make the timer end and the last player die on the same frame. Rewards granted once.
7. Hitch a client (pause the Studio client or simulate lag) for 5 seconds mid-round; its timer must snap back to the server's.
8. Turn StreamingEnabled on and teleport players into the farthest map. Nobody falls through.

## Exploit angles
- Round membership is a server-side set built at round start. Rewards and "win" checks use that set, never `Players:GetPlayers()` at the end.
- Clients cannot report "I finished the minigame"; the server checks the finish condition.
- Vote remotes (map vote, skip vote) accept one vote per player per round.

## Balance checks
- Track win rate per minigame and per map. A map where the first player to spawn wins most of the time has a spawn problem.
- Measure average round length vs intermission length; long intermissions are where players leave.

## Data and save checks
- Wins, streaks and currency from a round save once at round end, keyed by round id, so a retried save cannot double them.
- Players leaving mid-round get the rule you chose (no reward, or partial), and that rule is tested.

## Debug helper: one round state, broadcast with an end time
```lua
-- Server: set state via this function only. Clients read the attributes.
local function setPhase(phase: string, seconds: number)
	workspace:SetAttribute("RoundPhase", phase)
	workspace:SetAttribute("PhaseEndsAt", workspace:GetServerTimeNow() + seconds)
	if phase == "Intermission" then -- a new round starts with each intermission
		workspace:SetAttribute("RoundId", (workspace:GetAttribute("RoundId") or 0) + 1)
	end
end

-- Client: remaining time is always computed, never counted down.
local function secondsLeft(): number
	local endsAt = workspace:GetAttribute("PhaseEndsAt") or 0
	return math.max(0, endsAt - workspace:GetServerTimeNow())
end
```
Late joiners automatically get the right state because attributes replicate on join. For QA, print `RoundId` in the debug overlay so testers can say "bug in round 37".

## Related
[[Testing - Hub]] - [[Recipe - Round System with Intermission]] - [[First Round Loop - Intermission, Countdown and Winners]] - [[Story - Multiplayer Cutscene Sync - Server Clock, Late Joiners and Skip Votes]] - [[Test - Join, Leave and Respawn Edge-Case Pass]]
