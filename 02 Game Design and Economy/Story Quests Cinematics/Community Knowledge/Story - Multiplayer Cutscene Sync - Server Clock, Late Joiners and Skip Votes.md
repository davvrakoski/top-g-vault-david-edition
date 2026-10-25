---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Multiplayer Cutscene Sync - Server Clock, Late Joiners and Skip Votes"
tags: [roblox, community-knowledge, story, cutscene, networking, multiplayer]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/classes/RemoteEvent
  - https://create.roblox.com/docs/reference/engine/classes/Player
---
# Multiplayer Cutscene Sync - Server Clock, Late Joiners and Skip Votes

A story beat in a co-op horror or adventure game often needs **everyone** to see it: the boss reveal, the bridge collapse, the ending. Done naively, each client starts the cutscene when its RemoteEvent arrives, so players with 250 ms ping see it a quarter-second late, the player who joined mid-scene sees nothing, and one impatient player skips for everyone. This note covers group cutscenes. Single-player cutscenes stay client-only (see [[Cutscene Cameras - Spline Paths, Letterbox and Skip]]); the playback engine is in [[Story - Cutscene Timeline Runner - Tracks, Seeking and Safe Cleanup]].

## Decide the type first

| Type | Who sees it | Example | Sync needed |
|---|---|---|---|
| **Personal** | One player | Reading a note, a private flashback | None |
| **Local group** | Players in an area | Monster bursts through a wall | Yes, among those present |
| **Server-wide** | Everyone | Chapter intro, ending | Yes, plus late-join handling |

The world change (the wall breaks) is always server state. The cutscene only *presents* it.

## Sync with the server clock

`workspace:GetServerTimeNow()` returns the server's Unix time in seconds on both server and clients, so every client can compute "how far into the cutscene are we" from one shared start time.

```lua
-- Server
local START_DELAY = 0.5 -- give the remote time to arrive everywhere
local function playGroupCutscene(id, players)
	local startAt = workspace:GetServerTimeNow() + START_DELAY
	workspace:SetAttribute("ActiveCutscene", id)
	workspace:SetAttribute("ActiveCutsceneStart", startAt)
	for _, p in players do
		CutsceneRemote:FireClient(p, id, startAt)
	end
end
```

```lua
-- Client
CutsceneRemote.OnClientEvent:Connect(function(id, startAt)
	local offset = workspace:GetServerTimeNow() - startAt
	if offset < 0 then task.wait(-offset); offset = 0 end
	Runner.play(id, offset) -- seek into the timeline if we are late
end)
```

Everyone starts within a frame or two of each other regardless of ping. A player who arrives 0.3 s late seeks 0.3 s in.

## Late joiners

Storing `ActiveCutscene` and `ActiveCutsceneStart` as attributes means a player who joins or respawns mid-scene can check them on load:

- If more than ~70% of the cutscene has passed, **skip it** for them and apply the end state.
- Otherwise **seek in** using the same offset calculation.
- If it is a one-time story beat they missed entirely, mark it unseen in their save so they can rewatch it from a menu ([[Story - Story State Flags - Saving Chapter Progress Without Breaking Old Saves]]).

## Skip rules for groups

Pick one and show it on screen:

- **Vote skip:** each player presses skip; when a majority (or all) agree, the server fires "skip" to everyone. Show "2/4 want to skip".
- **Personal skip with wait:** a player who skips gets their camera back but stays frozen (or in a waiting view) until the scene ends for the group. Their gameplay cannot get ahead.
- **Host skip** in private or party servers.
- **Seen-before skip:** the skip option only appears if *every* player has seen this cutscene before (check their `seen` flags).

```lua
-- Server: majority vote skip
local Players = game:GetService("Players")
local votes = {}
SkipRemote.OnServerEvent:Connect(function(player)
	if not workspace:GetAttribute("ActiveCutscene") then return end
	votes[player] = true
	local count, total = 0, #Players:GetPlayers()
	for _ in votes do count += 1 end
	if count > total / 2 then
		table.clear(votes)
		CutsceneRemote:FireAllClients("skip")
		applyCutsceneEndState()
		workspace:SetAttribute("ActiveCutscene", nil)
	end
end)
```

Clear votes when the cutscene ends, and remove a leaving player's vote on `PlayerRemoving`.

## Gameplay during group cutscenes

- **Freeze threats.** Monsters pause (or the server stops their AI) and players are invulnerable for the duration plus 2 s. Nothing is worse than dying during a scene you cannot control.
- **Pin positions.** Teleport players to marks before the scene, or let the camera cover where they are. After the scene, return them to safe spots, not to where a collapsing bridge used to be.
- **Timeout.** The server ends the cutscene itself after `length + 2` seconds even if no client reports finishing. Never wait for a client to say "done".

## Pitfalls

- **`tick()` or `os.time()` for sync.** Client clocks differ; `os.time()` has 1-second resolution. Use `GetServerTimeNow()`.
- **Firing from the client.** Clients can request a skip vote; they never start a group cutscene.
- **Audio drift.** Start music with `TimePosition = offset` so it matches late seekers.

## Related
[[Story Quests Cinematics - Hub]] · [[Cinematic and Cutscene Direction]] · [[Story - Cutscene Timeline Runner - Tracks, Seeking and Safe Cleanup]] · [[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]]
