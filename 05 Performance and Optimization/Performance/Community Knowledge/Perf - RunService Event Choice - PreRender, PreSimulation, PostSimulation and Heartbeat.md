---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "RunService Event Choice - PreRender, PreSimulation, PostSimulation and Heartbeat"
tags: [roblox, community-knowledge, performance, runservice, frame-budget]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://create.roblox.com/docs/performance-optimization/microprofiler/task-scheduler
  - https://create.roblox.com/docs/performance-optimization/improve
---
# RunService Event Choice - PreRender, PreSimulation, PostSimulation and Heartbeat

Every per-frame connection runs inside a specific slot of the frame. Pick the wrong slot and you either add input lag, fight the physics solver, or, worst case, hold back the rendering of the whole frame. Roblox has renamed the main events (`RenderStepped` became `PreRender`, `Stepped` became `PreSimulation`, `Heartbeat` is mirrored by `PostSimulation`), so old tutorials often teach the legacy names with the old habits. This note is a decision table plus the cost rules that come with each slot.

## The frame, in order (client)

1. **PreRender** (replaces `RenderStepped`, client only). Runs before the frame is drawn. The docs warn that the engine **cannot start rendering until your handlers finish**, so every millisecond here is a millisecond of frame time.
2. **PreAnimation**. After render, before physics; the place to change animation speed or weights before joints are evaluated.
3. **PreSimulation** (replaces `Stepped`). Right before physics; set velocities, forces and constraint targets here. The solver may step several times after it.
4. **PostSimulation**. After physics finished; read the simulation result and correct it.
5. **Heartbeat**. Fires after PostSimulation; general game logic. Same cadence on the server.

## Decision table

| Job | Event | Why |
|---|---|---|
| Camera follow, viewmodel, aim offsets | `PreRender` or `BindToRenderStep` | Must be in sync with the drawn frame |
| Animation speed, track weights | `PreAnimation` | Before joints are computed |
| Applying forces, setting velocity | `PreSimulation` | Consumed by this frame's physics |
| Reading positions after physics, snapping | `PostSimulation` | Fresh simulation results |
| Timers, AI ticks, UI text, polling | `Heartbeat` (or a fixed-rate scheduler) | Does not block render |

## Cost rules

- **Keep PreRender tiny.** Camera math, a few CFrames. No raycasting dozens of rays, no table rebuilding. Move anything that does not have to be frame-exact to Heartbeat.
- **Use `BindToRenderStep` when order matters.** It accepts a priority (`Enum.RenderPriority.Camera.Value`, `.Character.Value`, etc.), so your camera code runs after input and before the default camera without race conditions. Unbind with `UnbindFromRenderStep` when the mode ends.
- **Not everything needs every frame.** NPC brains, nametag distance checks and leaderboard refreshes are fine at 5-20 Hz. Accumulate `dt` and run the real work only when the budget elapses: see [[Fixed-Rate Scheduler]].
- **One connection, many items.** A single Heartbeat looping over 200 objects is cheaper to manage than 200 separate connections, and it is easy to time-slice.
- **Server has no render events.** `PreRender`/`RenderStepped` are client only; server code uses PreSimulation, PostSimulation or Heartbeat.
- **Parallel option.** `ConnectParallel` lets an Actor's handler run in parallel; writes to the DataModel must then happen after `task.synchronize()`.

```lua
-- Run expensive work at 10 Hz from one Heartbeat
local RunService = game:GetService("RunService")
local acc = 0
RunService.Heartbeat:Connect(function(dt)
    acc += dt
    if acc < 0.1 then return end
    acc -= 0.1
    updateAllNpcTargets()   -- your batched work
end)
```

## How to confirm

Open the MicroProfiler: PreRender work appears before the render jobs on the main thread, physics callbacks appear around `simulation` / `worldStep`. Label your handlers with `debug.profilebegin("MyCamera")` / `debug.profileend()` so they show up by name.

## Related
[[Performance - Hub]] - [[Fixed-Rate Scheduler]] - [[MicroProfiler Reading Guide]] - [[Coroutines vs the task Library]]
