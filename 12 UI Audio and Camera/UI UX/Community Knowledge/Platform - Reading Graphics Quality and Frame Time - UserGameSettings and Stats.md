---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Reading Graphics Quality and Frame Time - UserGameSettings and Stats"
tags: [roblox, community-knowledge, ui, platform, performance, graphics-quality]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/UserGameSettings
  - https://create.roblox.com/docs/reference/engine/enums/SavedQualitySetting
  - https://create.roblox.com/docs/reference/engine/enums/QualityLevel
  - https://create.roblox.com/docs/reference/engine/enums/GraphicsOptimizationMode
  - https://create.roblox.com/docs/reference/engine/classes/DataModel
  - https://create.roblox.com/docs/reference/engine/classes/Stats
  - https://create.roblox.com/docs/performance-optimization/identify
---
# Platform - Reading Graphics Quality and Frame Time - UserGameSettings and Stats

Developers often want to "detect a low-end device and turn things off". Roblox deliberately gives you only part of that picture: you can read what the player **chose**, and you can measure how the frame is **actually performing**, but you cannot read the engine's live automatic quality level. Knowing exactly what is and is not readable saves you from building on properties that always error. This note is the reference; [[Platform - Adaptive Quality Governor Driven by Frame Time]] shows how to act on it.

## What you can read about graphics quality

| Property | Readable by your LocalScript? | Notes |
|---|---|---|
| `UserGameSettings.SavedQualityLevel` (`Enum.SavedQualitySetting`) | **Yes** | `Automatic`, or `QualityLevel1` to `QualityLevel10` if the player set graphics manually. Persisted across sessions |
| `UserGameSettings.GraphicsQualityLevel` (int) | No (RobloxScriptSecurity) | The level actually in use |
| `UserGameSettings.GraphicsOptimizationMode` | No (RobloxScriptSecurity) | `Performance` (manual levels 1 to 3), `Balanced` (4 to 7, default), `Quality` (8 to 10) |
| `UserGameSettings.MaxQualityEnabled` | No (RobloxScriptSecurity) | |
| `DataModel.GraphicsQualityChangeRequest(betterQuality)` | Event, yes | Fires on F10 / Shift+F10 only; not on menu changes, and it does not tell you the new level |
| `Stats:GetHarmonyQualityLevel()` | No (InternalTest capability) | Engine's dynamic performance score 0 to 100 |

The DataModel docs say it directly: there is currently "no way for developers to reliably get the current graphics quality level". If `SavedQualityLevel` is `Automatic` (most players), you know nothing about the level from settings.

```lua
-- LocalScript: read the player's saved choice
local settings = UserSettings():GetService("UserGameSettings")
local saved = settings.SavedQualityLevel

local function manualLevel(): number?
	if saved == Enum.SavedQualitySetting.Automatic then
		return nil
	end
	return saved.Value -- 1..10
end

settings:GetPropertyChangedSignal("SavedQualityLevel"):Connect(function()
	saved = settings.SavedQualityLevel
end)
```
Use a manual low choice (1 to 3) as a **hint** that the player wants performance, for example to start your own effects tier lower. Never force higher detail because a player picked 10.

## What the quality level changes (and why you should not depend on it)
`Enum.QualityLevel` docs: higher levels raise render distance, shading quality, apparent geometry and texture resolution, particle limits, trail fidelity and post-effect quality; low levels may disable some post effects and skip far objects. The docs add that the exact effects are platform- and device-specific "and can not be relied upon". Design so the game is readable even with post effects off and far detail culled.

## What you can measure: Stats (client only)

| `Stats` member | Meaning |
|---|---|
| `FrameTime` | Seconds to render the latest frame (1 / FrameTime = FPS). Client scripts only |
| `RenderCPUFrameTime` | CPU time for render tasks per frame |
| `RenderGPUFrameTime` | GPU time per frame |
| `SceneDrawcallCount`, `SceneTriangleCount` | Scene draw calls and triangles |
| `ShadowsDrawcallCount`, `UI2DDrawcallCount`, `UI3DDrawcallCount` (+ triangle counts) | Breakdown by pass |
| `GetTotalMemoryUsageMb()` | OS-reported memory for the session; close to Task Manager / Activity Monitor numbers |
| `GetMemoryUsageMbForTag(tag)` | Per `DeveloperMemoryTag` category (needs memory tracking) |

Reading GPU vs CPU render time tells you which knob to turn: GPU-bound means fewer pixels/effects/transparency; CPU-bound means fewer draw calls or less script work.

```lua
-- LocalScript: tiny on-screen probe for testers (hide in release)
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")
local label: TextLabel = script.Parent

local acc, n = 0, 0
RunService.Heartbeat:Connect(function()
	acc += Stats.FrameTime
	n += 1
	if n >= 30 then
		local avg = acc / n
		label.Text = string.format("%.0f fps | cpu %.1f ms | gpu %.1f ms | %d draws | %.0f MB",
			1 / avg, Stats.RenderCPUFrameTime * 1000, Stats.RenderGPUFrameTime * 1000,
			Stats.SceneDrawcallCount, Stats:GetTotalMemoryUsageMb())
		acc, n = 0, 0
	end
end)
```
(The `* 1000` assumes the render times are in seconds like `FrameTime`; the API pages do not state the unit, so sanity-check against the Shift+F5 summary.)

## Built-in overlays to compare against
From the performance docs: Shift+F5 debug summary, Shift+Ctrl+F1/F2 debug stats, Ctrl+Alt+F7 performance stats bar, F9 Developer Console. Studio numbers are skewed by Studio itself; measure on the client. To remove the frame rate manager's influence while profiling, set Graphics Mode to manual and max quality.

## Related
[[UI UX - Hub]] · [[Quality Tier Settings]] · [[Visual Scalability and Quality Tiers]] · [[Performance Hotkeys and Overlays - Quick Reference]]
