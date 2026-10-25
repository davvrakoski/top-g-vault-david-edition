---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/physics-throttling-adaptive"
title: "Physics Throttling, Sleep and Adaptive Timestepping"
tags: [roblox, community, "cluster/performance-and-security", physics, server-performance]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/physics/adaptive-timestepping
  - https://create.roblox.com/docs/physics/sleep-system
  - https://create.roblox.com/docs/reference/engine/classes/Workspace#GetPhysicsThrottling
  - https://devforum.roblox.com/t/disable-physics-throttling/564890
  - https://devforum.roblox.com/t/adaptive-physicssteppingmethod-a-touched-connection-makes-server-owned-moving-parts-slow-down-on-character-contact/4778826
---
# Physics Throttling, Sleep and Adaptive Timestepping

A familiar complaint in full servers: NPCs, carts and vehicles start moving in slow motion. That is usually **physics throttling**, and fixing it means having less simulation for the engine to do, not adding script tricks.

## What throttling is (official)

- `workspace:GetPhysicsThrottling()` returns 0 to 100: the percentage of real time that physics is being throttled *to*. When physics can't keep up, it updates less often, so BaseParts **appear to move slower**.
- Objects tied to **Humanoids are exempt** from throttling. That's why players look fine while the server-owned carts crawl.
- By default, physics runs at **240 Hz**, about 4 worldsteps per 60 FPS frame.

## Community findings (DevForum thread *Disable Physics Throttling*, 2020 to 2023)

- AbstractAlex asked for a way to turn throttling off for specific parts (custom controllers, vehicles, NPCs). Later posters said the problem was still open in 2023. No staff reply appears in that thread.
- nooneisback said `SetPhysicsThrottleEnabled` was meant for plugins and no longer works. Don't rely on it in live games.
- dmnksz tested scaling speed by the throttle value, and it **did not help**: throttling reduces how *often* physics steps, not how fast things move.
- iamEvan said they rewrote attacker movement in *Toilet Tower Defense* so it no longer uses `Humanoid:Move()`, and added their own lag compensation.
- Apenz1's advice: avoid physics for big NPC workloads, switch off far-away NPCs, and let nearby players own the physics where it's safe to.

## Sleep: the free optimization

From the Creator Hub sleep system page, an assembly falls asleep (and costs nothing to simulate) when it is below thresholds such as:

| Threshold | Value |
|---|---|
| Linear velocity | 0.33 studs/s |
| Rotational velocity | 0.42 studs/s |
| Linear / rotational acceleration | 0.24 studs/s² |

Things that **wake** an assembly: a collision with something moving faster than 1 stud/s, any physics property change (Anchored, CanCollide, CanTouch, Massless, velocity, CustomPhysicalProperties and others), an impulse, or a Workspace Gravity change.

**Practical takeaway:** a server loop that rewrites `CanCollide` or velocity on idle parts every frame keeps them awake for good. Only write a property when its value actually changes.

## Adaptive timestepping

- Set **Workspace.PhysicsSteppingMethod = Adaptive** in Studio. Parts are sorted into solver islands at **240, 120 or 60 Hz**. Fast-moving, high-acceleration or complex assemblies stay at 240 Hz.
- The docs say it can improve physics performance **by up to 2.5 times** and recommend it in most cases.
- Stay on **Fixed (240 Hz)** for racing games, destruction simulations or complex mechanisms like tanks. Also stay on Fixed when most parts end up at 240 Hz anyway: when a 240 Hz island touches a slower one, both are converted to 240 Hz, and that overhead can cancel the gain.
- To check what you get: in Studio settings, go to **Physics** and turn on **Are Timesteps Shown**. Parts get an outline showing their rate. In the MicroProfiler, `worldStep` reads `worldStep - Adaptive`.

### Known community bug (2026)

fewkz reported (Aug 2026, follow-up Oct 2026) that with **Adaptive** on, connecting `Touched` can make server-owned moving parts slow down when a character touches them, though not every time. The property **can't be set by script**, which is a problem for games with many places. When the report was posted there was no staff reply. If your moving platforms stutter only under Adaptive, test against Fixed before rewriting your code.

## Original monitoring snippet (server)

```lua
-- Logs physics throttling once every 30 seconds so you can match slow-motion reports to load.
local THRESHOLD = 90 -- below this %, physics is running slower than real time
task.spawn(function()
	while true do
		task.wait(30)
		local pct = workspace:GetPhysicsThrottling()
		if pct < THRESHOLD then
			warn(("[PhysicsHealth] throttled to %d%% | physics FPS %.1f | players %d"):format(
				pct, workspace:GetRealPhysicsFPS(), #game:GetService("Players"):GetPlayers()))
		end
	end
end)
```

## Checklist

- [ ] Anchor everything that never moves.
- [ ] Don't write physics properties on idle parts every frame.
- [ ] Test Adaptive against Fixed, with timestep outlines on.
- [ ] Use animated or CFrame-driven NPCs at a distance instead of fully physical ones.
- [ ] Log `GetPhysicsThrottling()` from live servers.

## Credits

Roblox Creator Hub physics docs (CC BY 4.0). DevForum: AbstractAlex, nooneisback, dmnksz, iamEvan, Apenz1, erin5 (*Disable Physics Throttling*), and fewkz (Adaptive PhysicsSteppingMethod bug report).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Adaptive timestepping]] · [[Sleep system]] · [[Network Ownership and Physics Replication]] · [[NPC Crowds, Animation LOD and Server Budgets]] · [[Server Heartbeat, Ping and Bandwidth Monitoring]]

<!-- TDOD_GRAPH_END -->
