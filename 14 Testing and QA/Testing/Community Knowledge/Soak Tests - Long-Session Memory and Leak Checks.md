---
area: "14 Testing and QA"
cluster: "Testing"
title: "Soak Tests - Long-Session Memory and Leak Checks"
tags: [roblox, community-knowledge, testing, memory, soak-test, performance]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Stats
  - https://create.roblox.com/docs/studio/developer-console
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://en.wikipedia.org/wiki/Soak_testing
---
# Soak Tests - Long-Session Memory and Leak Checks

A 10-minute playtest never finds the bug that crashes a server after six hours or kicks phones out after 40 minutes. Those are leaks: connections never disconnected, tables that only grow, instances parented to nil but still referenced. A **soak test** runs the game for a long time under realistic, repeated activity and watches whether memory and frame time stay flat. It is cheap to automate and catches the bugs players describe as "the game gets laggy the longer I play".

## What to measure
`Stats` exposes the numbers directly:
| Measure | API | Watch for |
|---|---|---|
| Total memory | `Stats:GetTotalMemoryUsageMb()` | Steady climb after warm-up |
| Per category | `Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.X)` | Which bucket grows (Script, Instances, Signals, Physics...) |
| Instance count | `Stats.InstanceCount` | Grows each round = something is not destroyed |
| Server frame | `Stats.HeartbeatTime` (seconds; the older `HeartbeatTimeMs` is deprecated) | Slowly rising tick cost |
| Network | `Stats.DataSendKbps`, `Stats.DataReceiveKbps` | Growing traffic with constant players |

(Some Stats properties may only be meaningful on one side; log on both client and server.)

## The sampler
```lua
-- Server Script (test builds only)
local Stats = game:GetService("Stats")
local samples = {}
local START = os.clock()

task.spawn(function()
	while true do
		task.wait(60)
		local row = {
			t = math.floor(os.clock() - START),
			mem = math.floor(Stats:GetTotalMemoryUsageMb()),
			script = math.floor(Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Script)),
			inst = Stats.InstanceCount,
			hb = math.floor(Stats.HeartbeatTime * 1000 * 100) / 100, -- ms
		}
		table.insert(samples, row)
		print(("[soak] t=%ds mem=%dMB script=%dMB inst=%d hb=%.2fms"):format(row.t, row.mem, row.script, row.inst, row.hb))
	end
end)
```
Run a matching LocalScript sampler on a client. Copy the lines into a spreadsheet afterwards and plot them.

## Driving activity
Memory only leaks when code runs. Make the soak repeat the full loop many times:
- Rounds: shorten round timers in a test config so 100 rounds happen in an hour.
- Characters: respawn bots/NPC stand-ins, or have simulated clients (Server & Clients, StudioTestService) leave and rejoin.
- UI: open and close every menu on a timer (VirtualInput can click buttons in Studio).
- Spawning: vehicles, projectiles, pets spawned and despawned continuously.

## Reading the graph
- **Warm-up rise then flat:** fine (caches filling).
- **Sawtooth:** fine (garbage collection).
- **Staircase that rises with every round:** leak tied to the round loop. Diff `InstanceCount` per round; check the per-tag numbers to see if it is Instances, Signals or Script memory.
- **Heartbeat creeping up:** a list processed every frame keeps growing (for example `for _, enemy in allEnemies` never removing dead ones).

## Common leak causes found by soak tests
- `Connect` without `Disconnect` on per-round or per-character objects (use a cleanup helper / maid).
- Tables keyed by Player or Instance never cleared on `PlayerRemoving` / `Destroying`.
- Parented-to-nil instances kept in a cache.
- Client UI cloned each time a menu opens, never destroyed.

## Pass criteria (write them down)
Example: over 2 hours with 4 simulated players and 60+ rounds, server memory growth under 5 percent after the first 10 minutes, no upward trend in `InstanceCount` per round, `HeartbeatTime` flat. Run on the baseline phone for 45 minutes for the client side.

## Related
[[Testing - Hub]] · [[Memory Leaks and Lifecycle Management]] · [[Signals, Connections and Leak-Proof Cleanup]] · [[Developer Console Memory Categories Explained]] · [[Memory grows over time]]
