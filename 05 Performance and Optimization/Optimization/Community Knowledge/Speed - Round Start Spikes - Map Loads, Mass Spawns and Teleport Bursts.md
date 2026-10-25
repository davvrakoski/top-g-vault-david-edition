---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Round Start Spikes - Map Loads, Mass Spawns and Teleport Bursts"
tags: [roblox, community-knowledge, optimization, rounds, replication, spikes, streaming]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/workspace/streaming
---
# Speed - Round Start Spikes - Map Loads, Mass Spawns and Teleport Bursts

Round-based games often run smoothly for the whole round and freeze for a second exactly when it matters: the countdown hits zero, the map appears, 24 players teleport in and every client receives a whole new map at once. The average frame time looks fine, so nobody notices in profiling until players complain about "the lag at round start". The fix is to spread a burst of work across time, and to start it before the countdown ends.

## What happens in that one second

1. The server clones a map model from ServerStorage and parents it to Workspace (one big replication burst to every client).
2. Every character is pivoted to a spawn point at the same moment.
3. Round scripts initialise: tagging parts, connecting events, spawning NPCs and pickups.
4. Clients run their own map setup (lighting changes, music, UI), often in the same frame.

## Fix 1: load during the intermission, not at zero

Clone and parent the next map while players are still in the lobby, as soon as the vote ends. Replication then finishes in the background during the countdown.

```lua
-- server: start loading as soon as the map is chosen
local function prepareMap(name: string)
	local map = ServerStorage.Maps[name]:Clone()
	map:PivotTo(ARENA_ANCHOR.CFrame)
	map.Parent = workspace.Arena -- replicates during intermission
	return map
end
```

With streaming on, parts far from players are not sent yet; that is fine, because the next step brings players there.

## Fix 2: build big maps in chunks

If a map is too large to send in one go, split it into a few child models (terrain dressing, buildings, props) and parent them a frame or two apart with `task.wait()` between, gameplay-critical geometry first. The Creator Hub's general guidance is to break long work into chunks spread over frames rather than one long frame.

## Fix 3: stream players in smoothly

- With streaming enabled, request the area before teleporting: `player:RequestStreamAroundAsync(spawnPosition)` (server) asks the client to load around the spawn point first. Call it for each player in a spawned thread a few seconds before round start.
- Teleport players in small groups over 0.5 to 1 second rather than all in one frame; nobody notices a stagger behind a fade-to-black.

## Fix 4: stagger round initialisation

- Spawn NPCs and pickups over several frames from a queue, not all in one loop.
- Connect events per tag once at server start (CollectionService) instead of re-connecting per round; new round parts just get tags.
- Clean up the previous map **after** the new round is running, or during the next intermission, and destroy in chunks; destroying 20,000 instances in one frame is its own spike (see [[Perf - Destroy vs Parent nil vs Debris - Teardown Without Spikes]]).

## Fix 5: hide what is left

Use the fade-out and fade-in around the teleport as the loading window. A short "Get ready" camera pan over the map gives streaming and client setup two or three seconds for free.

## Measuring the spike

- Client MicroProfiler: pause right at round start and look for the long frame; replication work and script `Init` labels will dominate.
- Wrap your round start code in `debug.profilebegin("RoundStart")` / `debug.profileend()` so it is easy to find.
- Watch Recv KB/s in Shift+F3 at round start; a single huge spike means the map arrived in one burst.

## Pitfalls

- Keeping the next map hidden in Workspace (transparent or far away) to "preload" it: every client holds it all round. Keep it in ServerStorage until needed.
- Client code using `WaitForChild` on map parts without timeouts under streaming: parts may never arrive if the player is far away.
- Running the new map's setup and the old map's cleanup in the same frame.

## Related
[[Optimization - Hub]] · [[Map Rotation and Voting - Loading Maps from ServerStorage]] · [[Recipe - Round System with Intermission]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]]
