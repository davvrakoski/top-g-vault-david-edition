---
area: "14 Testing and QA"
cluster: "Testing"
title: "MicroProfiler Benchmark Routes for Performance Regression Checks"
tags: [roblox, community-knowledge, testing, performance, microprofiler, regression]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/microprofiler
  - https://create.roblox.com/docs/performance-optimization/microprofiler/use-microprofiler
  - https://create.roblox.com/docs/reference/engine/libraries/debug
  - https://create.roblox.com/docs/reference/engine/classes/Stats
---
# MicroProfiler Benchmark Routes for Performance Regression Checks

"It feels slower since the update" is not actionable. A **benchmark route** is a fixed, repeatable walk or fly-through of your heaviest scenes, captured with the MicroProfiler before and after each change. Because the route is identical, any difference in the dumps is caused by the build, and the MicroProfiler web UI can diff two captures directly. This turns performance into a pass / fail test like any other.

## 1. Build the route
- Pick 3-5 heavy spots: spawn hub, busiest combat area, densest map region, a UI-heavy screen.
- Script a camera path through them so it is identical every run:

```lua
-- LocalScript, enabled only by a test flag
local TweenService = game:GetService("TweenService")
local camera = workspace.CurrentCamera
local points = workspace.BenchmarkRoute:GetChildren() -- parts named 1..N
table.sort(points, function(a, b) return tonumber(a.Name) < tonumber(b.Name) end)

camera.CameraType = Enum.CameraType.Scriptable
for _, p in points do
	debug.profilebegin("Bench_" .. p.Name)
	local tween = TweenService:Create(camera, TweenInfo.new(4, Enum.EasingStyle.Linear), {CFrame = p.CFrame})
	tween:Play()
	tween.Completed:Wait()
	debug.profileend()
	task.wait(2) -- hold so you can capture a stable window here
end
```
The `debug.profilebegin` labels mark each segment in the timeline (keep label strings constant; the profiler only needs short names).

- Spawn the same load each time: same NPC count, same number of test clients, same time of day and graphics quality.

## 2. Capture
- Open the MicroProfiler (the docs list Ctrl+F6 for Studio and the desktop client, and the walkthrough and network pages use Ctrl+Alt+F6; Cmd on Mac) and use the **Dump** menu at each hold point. Dumps land in the Roblox logs directory and only contain the selected number of frames.
- For phones, use the MicroProfiler web UI over the local network (the docs show adding `/90` to the URL to fetch 90 frames instead of 30).
- Capture the **server** too via the Developer Console's server profiler when server cost matters.
- Record alongside: place version, device, quality level, and `Stats` numbers (`HeartbeatTime`, draw calls `SceneDrawcallCount`, `SceneTriangleCount`).

## 3. Compare
In the web UI, drag a second dump onto the first to get a **diff flame graph**, then **Combine & Compare** to export it. The docs suggest combining several dumps per side (for example four before and four after) for a steadier comparison, and warn not to combine dumps from different places.

Read it as: brighter = bigger difference; check which side is heavier and which labels (your `Bench_` segments or engine tasks) grew.

## 4. Pass / fail rules
Write thresholds per route point, for example:
| Point | Device | Budget |
|---|---|---|
| Hub | baseline phone | p95 frame under 33 ms |
| Combat | mid PC | p95 frame under 16.7 ms |
| Any | any | no new script label above 1 ms per frame |

The docs stress **consistent** frame times: one 400 ms frame among fast ones is a visible stutter even at "60 FPS", so judge spikes, not just averages.

## Tips
- Keep the route in the place file, disabled; a test flag (attribute or command) turns it on.
- Always run twice and discard the first run (shader / asset warm-up).
- Store dumps with the place version in the file name so you can compare any two releases later.

## Related
[[Testing - Hub]] · [[MicroProfiler Reading Guide]] · [[Release Regression Check - Performance Dashboard by Place Version]] · [[Script Profiler, Native Code Gen and Luau Hot Paths]]
