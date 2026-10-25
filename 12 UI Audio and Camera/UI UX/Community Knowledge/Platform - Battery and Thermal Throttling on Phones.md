---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Battery and Thermal Throttling on Phones"
tags: [roblox, community-knowledge, ui, platform, mobile, thermal, battery, performance]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://developer.android.com/games/optimize/adpf/thermal
---
# Platform - Battery and Thermal Throttling on Phones

A phone that runs your game at 60 FPS for the first two minutes may run it at 35 FPS after fifteen. Phones, tablets and thin laptops lower their CPU and GPU clock speeds when they heat up; Roblox's hardware testing guide lists thermal throttling as one of the things Studio cannot show you. Heat and battery drain come from the same source: sustained work every frame. Players notice both, and "this game makes my phone hot" is a real reason kids stop playing.

## What the platforms say
- **Roblox (Test on hardware):** run a 10 to 15 minute active session on a phone and watch for a steady FPS decline, the sign of thermal throttling. If you see it, reduce sustained CPU/GPU load in the hot paths the MicroProfiler shows.
- **Android (Thermal API docs):** the OS can predict how long a device can hold its current performance before overheating; when headroom is short, games should "decrease the workload to a sustainable level", for example by lowering frame rate or fidelity. Roblox games cannot call that API, but the advice transfers: steady, lower load beats bursts that trigger throttling.

## Where sustained load hides in Roblox games
1. **Per-frame scripts that do not need to be per-frame.** The design docs: at 60 FPS each frame has 16.67 ms; prefer event-driven code over per-frame calculations. Common offenders: `RenderStepped` loops updating UI text that changes once a second, distance checks on every NPC every frame, spinning decorative parts with scripts.
2. **UI that animates forever:** rotating shop banners, pulsing buttons, ViewportFrames re-rendering spinning models.
3. **Particles and transparency:** large semi-transparent particles cause overdraw, which is GPU-heavy and very hot on phones.
4. **Idle menus rendering a full 3D scene** behind them at full detail.
5. **Long sessions in AFK-friendly genres** (simulators, idle games): players leave the phone running for an hour.

## Cooling patterns

| Situation | Action |
|---|---|
| Full-screen menu open | Pause decorative animations behind it; hide expensive world effects; optionally move the camera to a cheap view |
| Player idle (no input for N minutes) | Lower effect tier, stop ambient particles, slow UI updates (an "AFK mode") |
| Window loses focus | `UserInputService.WindowFocusReleased`: stop local cosmetic loops; resume on `WindowFocused` |
| Sustained FPS decline | Let a frame-time governor step effects down and recover slowly (see [[Platform - Adaptive Quality Governor Driven by Frame Time]]) |
| Text that rarely changes | Update on change, not on `RenderStepped` |

```lua
-- LocalScript: a simple AFK cool-down mode
local UserInputService = game:GetService("UserInputService")

local IDLE_AFTER = 120 -- seconds without input
local lastInput = os.clock()

UserInputService.InputBegan:Connect(function()
	lastInput = os.clock()
	if workspace:GetAttribute("Idle") then
		workspace:SetAttribute("Idle", false)
	end
end)

UserInputService.WindowFocusReleased:Connect(function()
	workspace:SetAttribute("Idle", true)
end)

task.spawn(function()
	while true do
		task.wait(5)
		if os.clock() - lastInput > IDLE_AFTER and not workspace:GetAttribute("Idle") then
			workspace:SetAttribute("Idle", true) -- effects and UI animators listen and pause
		end
	end
end)
```
Thumbstick holds do not always fire `InputBegan` repeatedly; if your game has long auto-run stretches, also reset the timer on `InputChanged` for gamepad and touch.

## Measuring heat-related slowdown
- Same route, same device, 15 minutes: note FPS at minute 1, 5, 10 and 15 (Ctrl+Alt+F7 performance stats overlay on device).
- Compare with the phone in a case vs out of a case, charging vs on battery: charging phones heat faster.
- Track `RenderGPUFrameTime` vs `RenderCPUFrameTime` over time to see which side throttles.

## Battery-friendly defaults
- Do not run code every frame unless it moves something on screen.
- Use `task.wait(n)` loops for slow checks (once per second is plenty for most UI).
- Limit dynamic lights with shadows and large transparent effects.
- Avoid constant haptics; motors drain battery too.
- Lobby scenes: lighter than gameplay scenes, since players sit in them longest.

## Related
[[UI UX - Hub]] · [[Mobile Performance Deep Dive]] · [[Mobile FPS collapses]] · [[UI Performance - Gradients, Big Lists and Per-Frame Updates]]
