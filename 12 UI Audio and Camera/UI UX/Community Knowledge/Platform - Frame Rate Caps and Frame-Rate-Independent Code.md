---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Frame Rate Caps and Frame-Rate-Independent Code"
tags: [roblox, community-knowledge, ui, platform, performance, frame-rate, scripting]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://create.roblox.com/docs/production/publishing/vr-guidelines
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://gafferongames.com/post/fix_your_timestep/
---
# Platform - Frame Rate Caps and Frame-Rate-Independent Code

Different devices run your client at very different frame rates: a budget phone at 30, most devices at the default 60 cap, a gaming PC at up to 240, a Quest aiming for 72. Any code that assumes "one frame = 1/60 s" behaves differently on each: cameras turn faster on high-FPS PCs, lerps feel snappier, cooldown bars drain unevenly, and fixed per-frame forces give some players an advantage. This note lists the caps and the habits that make code device-neutral.

## Frame rates you will meet

| Where | Rate | Source |
|---|---|---|
| Client default | capped at 60 FPS | Identify performance issues docs |
| Windows clients | player can raise the cap up to 240 FPS | same |
| Server | heartbeat capped at 60 FPS for all games | same |
| Quest (Auto Quality Mode) | aims for at least 72 FPS | VR guidelines |
| Low-end phones under load | often well below 60 | hardware testing guide |

Also: the engine's frame rate manager and automatic quality can change frame rate during play (docs suggest setting graphics to manual max while profiling to remove its effect).

## Rule 1: scale by delta time
`RunService` events pass the frame's delta time (`RenderStepped(dt)`, `Heartbeat(dt)`, `PreSimulation(dt)` etc.). Multiply speeds by it.

```lua
-- wrong: rotates 2 degrees per frame (twice as fast at 120 FPS)
part.CFrame *= CFrame.Angles(0, math.rad(2), 0)

-- right: 120 degrees per second on every device
RunService.Heartbeat:Connect(function(dt)
	part.CFrame *= CFrame.Angles(0, math.rad(120) * dt, 0)
end)
```

## Rule 2: smoothing needs an exponential, not a fixed alpha
`a = a:Lerp(b, 0.1)` every frame converges faster at higher FPS. Use a rate-based factor:

```lua
local SHARPNESS = 12 -- higher = snappier, same feel at any FPS
RunService.RenderStepped:Connect(function(dt)
	local alpha = 1 - math.exp(-SHARPNESS * dt)
	cameraOffset = cameraOffset:Lerp(targetOffset, alpha)
end)
```

## Rule 3: timers use clocks, not frame counts
Cooldowns, combo windows and animations should compare `os.clock()` (or `workspace:GetServerTimeNow()` for shared timing) against a stored start time. "60 frames = 1 second" is only true at exactly 60 FPS.

## Rule 4: gameplay that must be fair belongs on fixed steps or the server
For anything competitive (projectile speed, stamina drain), a high-FPS client must not gain an edge. Options:
- Let the server decide outcomes (server heartbeat is capped at 60 for everyone).
- Use physics constraints and forces, which run on the physics step, instead of per-frame CFrame pushing.
- For custom simulation, accumulate time and run fixed steps, the classic approach in Glenn Fiedler's *Fix Your Timestep* (Gaffer on Games):

```lua
local STEP = 1 / 60
local acc = 0
RunService.Heartbeat:Connect(function(dt)
	acc += math.min(dt, 0.25) -- clamp huge hitches
	while acc >= STEP do
		simulate(STEP) -- your deterministic update
		acc -= STEP
	end
end)
```

## Rule 5: avoid task.wait() for precise timing
The VR guidelines note `task.wait()` does not give precise results compared with connecting to `RunService.Heartbeat`. Use waits for "roughly every second" checks, events for anything frame-accurate.

## Rule 6: do not burn the budget on high-FPS machines either
Higher FPS means per-frame code runs more often. The design docs' example: 100 ms of work every frame means 10 FPS; spread heavy work in chunks (for example 5 ms per frame) or across frames. Heavy per-frame work also heats phones (see [[Platform - Battery and Thermal Throttling on Phones]]).

## Test
- Play at the 60 cap and at 144/240 on a Windows client: camera, movement and UI timing must feel identical.
- Force low FPS (busy scene on a low-end phone) and check cooldowns and combos still time correctly.

## Related
[[UI UX - Hub]] · [[Custom Camera Systems in Luau]] · [[Combo Systems and Input Buffering]] · [[Platform - Gamepad Gameplay Input - Thumbsticks, Triggers, Dead Zones and Multiple Pads]]
