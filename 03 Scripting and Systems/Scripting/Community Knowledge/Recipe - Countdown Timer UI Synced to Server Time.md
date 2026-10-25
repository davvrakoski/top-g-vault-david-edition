---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Countdown Timer UI Synced to Server Time"
tags: [roblox, community-knowledge, scripting, recipe, luau, ui, countdown, timer, server-time, attributes]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/ui/labels
  - https://create.roblox.com/docs/reference/engine/classes/RunService
---
# Recipe - Countdown Timer UI Synced to Server Time

A top-of-screen timer ("Intermission 0:14", "Round 1:47") that every player sees ticking in step, without the server sending anything per second. The server publishes **one number per phase**, the moment the phase ends, measured with `workspace:GetServerTimeNow()`. Each client subtracts its own synced estimate of server time. This is the same clock idea used for scheduled live events in [[Synchronized Global Live Events - Server Time and Scheduled Starts]], applied to a HUD.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Why not `os.time()` or a remote per second?
- `os.time()` on the client is the **device** clock: it can be minutes off, and players can change it.
- A remote per second costs bandwidth, arrives jittery, and pauses visibly when the network hiccups.
- `GetServerTimeNow()` returns the server's time as estimated by the client, so `EndsAt - GetServerTimeNow()` is the same on every screen (within a few milliseconds).

## Where it goes
| Script | Type | Location |
|---|---|---|
| server publisher | any server Script (e.g. [[Recipe - Round System with Intermission]]) | `ServerScriptService` |
| `TimerHud` | LocalScript | `StarterPlayer > StarterPlayerScripts` |

Contract: a Folder `ReplicatedStorage.RoundState` with attributes `Phase` (string), `EndsAt` (number), `Status` (string).

## Server side (the whole thing)
```lua
-- in any server script
local state = game.ReplicatedStorage.RoundState
state:SetAttribute("Phase", "Intermission")
state:SetAttribute("EndsAt", workspace:GetServerTimeNow() + 20)
```

## Client HUD
```lua
-- StarterPlayerScripts/TimerHud (LocalScript)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LABELS = {
	Waiting = "Waiting",
	Intermission = "Intermission",
	Playing = "Round",
	Ending = "Round over",
}
local WARN_AT = 10 -- seconds: turn red

local state = ReplicatedStorage:WaitForChild("RoundState")

local gui = Instance.new("ScreenGui")
gui.Name = "TimerHud"
gui.ResetOnSpawn = false
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.AnchorPoint = Vector2.new(0.5, 0)
label.Position = UDim2.new(0.5, 0, 0, 8)
label.Size = UDim2.fromOffset(260, 36)
label.BackgroundTransparency = 0.35
label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
label.TextColor3 = Color3.new(1, 1, 1)
label.FontFace = Font.fromEnum(Enum.Font.BuilderSansBold) -- Gotham* enums were removed (map to Montserrat)
label.TextScaled = true
label.Parent = gui

local status = Instance.new("TextLabel")
status.AnchorPoint = Vector2.new(0.5, 0)
status.Position = UDim2.new(0.5, 0, 0, 46)
status.Size = UDim2.fromOffset(260, 22)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(220, 220, 220)
status.TextScaled = true
status.Parent = gui

local function format(seconds: number): string
	seconds = math.max(0, math.ceil(seconds))
	return string.format("%d:%02d", seconds // 60, seconds % 60)
end

local lastShown = ""
RunService.Heartbeat:Connect(function()
	local phase = state:GetAttribute("Phase") or "Waiting"
	local endsAt = state:GetAttribute("EndsAt") or 0
	local remaining = endsAt - workspace:GetServerTimeNow()

	local text
	if phase == "Waiting" then
		text = LABELS.Waiting
	else
		text = `{LABELS[phase] or phase}  {format(remaining)}`
	end
	if text ~= lastShown then -- only touch the label when the visible text changes
		lastShown = text
		label.Text = text
		label.TextColor3 = if phase == "Playing" and remaining <= WARN_AT
			then Color3.fromRGB(255, 90, 80)
			else Color3.new(1, 1, 1)
	end
end)

local function updateStatus()
	status.Text = state:GetAttribute("Status") or ""
end
state:GetAttributeChangedSignal("Status"):Connect(updateStatus)
updateStatus()
```

## Variations
- **Per-object timers** (a bomb, a crop, a respawn): put `EndsAt` on the object itself and run the same subtraction in a BillboardGui.
- **Pause:** when pausing, the server stores `Remaining = EndsAt - now` and clears `EndsAt`; on resume it sets `EndsAt = now + Remaining`.
- **Tick sound in the last 5 s:** play it only when the whole-second value changes, at a low volume, and give players a way to mute it.

## How to test
1. Run the round recipe, or paste the two server lines into the server command bar.
2. Start **Clients and Servers** with 2-3 players and place the windows side by side: all timers change second on the same frame (give or take one frame).
3. Change your PC clock by an hour and rejoin: the timer is unaffected.
4. Set `EndsAt` in the past: the label shows `0:00` and never negative numbers.

## Common mistakes
- **Comparing `os.clock()` across machines.** `os.clock()` is CPU time since that process started; it is meaningless on another computer.
- **Setting `label.Text` every frame** even when unchanged; harmless for one label but wasteful in lists. Compare first.
- **Counting down with `task.wait(1)` loops** on the client: drift adds up, and two clients that joined at different times disagree.
- **`math.floor` for display.** Floor shows `0:00` for the last second; `math.ceil` reads more naturally for countdowns.

## Related
[[Scripting - Hub]] · [[Recipe - Round System with Intermission]] · [[Synchronized Global Live Events - Server Time and Scheduled Starts]] · [[Events vs Polling]]
