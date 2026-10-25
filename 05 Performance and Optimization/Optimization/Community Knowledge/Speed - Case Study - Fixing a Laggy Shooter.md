---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Case Study - Fixing a Laggy Shooter"
tags: [roblox, community-knowledge, optimization, case-study, shooter, projectiles, networking]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://devforum.roblox.com/t/problems-with-lagging-bullets/1991256
  - https://devforum.roblox.com/t/most-effiecient-way-to-simulate-bullets/3182234
  - https://devforum.roblox.com/t/server-side-hit-detection/1295976
  - https://devforum.roblox.com/t/more-performant-way-to-create-a-projectile/2312096
---
# Speed - Case Study - Fixing a Laggy Shooter

Shooters stress the two things players notice most: frame time during fights and input-to-hit delay. A shooter can idle at 60 FPS and still drop to 25 in a 12-player firefight, because cost scales with shots per second times players. This walkthrough fixes a typical "fine alone, lags in fights" shooter.

## Reproduce the fight

Measure during the worst moment, not in an empty map. Run a test server with bots or friends all firing automatic weapons for 60 seconds, then capture:

- **Server**: MicroProfiler dump during the fight; F9 > Server Jobs heartbeat; Script Profiler sorted by total time.
- **Client**: MicroProfiler on a mid phone; Shift+F3 / Ctrl+F7 network stats for Recv KB/s and data ping.
- **Counts**: live projectile parts, live Sound instances, live ParticleEmitters, bullet-hole decals.

## Culprits and fixes

**1. Physical bullets moved by the server.** DevForum threads keep finding the same root cause: a server script moving a bullet part every frame, hundreds of times, so every CFrame change replicates to every client. Fix: the server simulates the bullet as data (position, velocity, a raycast per step); each client draws its own cosmetic tracer. No bullet part ever exists on the server. Libraries such as FastCast follow this split; see [[Projectile Libraries - FastCast, FastCast2 and SwiftCast]].

**2. One script or connection per bullet.** Spawning a `Script`, a `task.spawn` thread or a Heartbeat connection per projectile scales badly. Keep one projectile system that steps an array of active projectiles in a single Heartbeat callback and removes finished ones by swap-remove.

```lua
local active = {} -- { {pos: Vector3, vel: Vector3, life: number} }
RunService.Heartbeat:Connect(function(dt)
	local i = 1
	while i <= #active do
		local p = active[i]
		local step = p.vel * dt
		local hit = workspace:Raycast(p.pos, step, params)
		p.life -= dt
		if hit or p.life <= 0 then
			-- resolve hit here
			active[i] = active[#active]; active[#active] = nil
		else
			p.pos += step; i += 1
		end
	end
end)
```

**3. Remote spam.** Firing one remote per bullet per client, then the server re-broadcasting each to all clients, multiplies traffic by player count. Batch: clients send "fired at time T with seed S" once per burst; the server sends one compact batch per frame to other clients. See [[Remote Send Rate - Batching, Deltas and When One Remote Is Not Faster]].

**4. Hit effects that never die.** Bullet holes, sparks and shell casings created per shot and cleaned with long `Debris` timers pile up during fights. Pool them with a hard cap (for example 64 decals per client, oldest reused first) and skip effects beyond a camera distance.

**5. Sound instances per shot.** A new `Sound` per gunshot creates instance churn and memory spikes. Reuse a small pool of Sounds per weapon and cap simultaneous voices. See [[Perf - Sound Instance Budget - Unique Clips, Voice Reuse and Cleanup]].

**6. Expensive hit validation.** Server-side validation is required, but doing a full rewind for every shot from every player is costly. Validate cheaply first (fire rate, distance, line of sight with one raycast) and do deeper checks only for suspicious hits. Raycast cost depends more on what the ray can hit than on its length, so keep a tight `RaycastParams` filter (exclude effects, accessories, debris).

**7. Client frame drops from VFX.** Muzzle flashes with high `Rate` emitters and lights with shadows on every gun add up. One light per weapon, `Shadows = false`, short-lived emitters with `:Emit(n)` instead of toggling `Enabled`.

## What "fixed" looks like

| Metric (12-player fight) | Before | Target |
|---|---|---|
| Server heartbeat | drops below 40 | stays near 60 |
| Recv KB/s per client | spikes | well under 50 |
| Live projectile Parts on server | hundreds | 0 |
| Live bullet-hole decals | unbounded | capped |

Numbers in the "before" column are illustrative; record your own.

## Pitfalls

- Moving to client-only hit detection to "fix lag": that trades lag for exploits. Keep the server as judge.
- Testing with one player: shooter cost is per shot per player; always test full.
- Using `Touched` on fast bullets: it misses at high speed and costs physics; raycast instead.

## Related
[[Optimization - Hub]] · [[Spatial Query Cost - Raycast, Bounds Queries and GetPartsInPart]] · [[Object Pooling Without Making a Mess]] · [[Perf - Destroy vs Parent nil vs Debris - Teardown Without Spikes]]
