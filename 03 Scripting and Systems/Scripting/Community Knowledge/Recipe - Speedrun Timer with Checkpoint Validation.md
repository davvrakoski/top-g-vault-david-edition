---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Speedrun Timer with Checkpoint Validation"
tags: [roblox, community-knowledge, scripting, recipe, luau, speedrun, timer, obby, ordereddatastore, anti-cheat]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/OrderedDataStore
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
---
# Recipe - Speedrun Timer with Checkpoint Validation

Touch the start line, a timer runs on screen, touch the finish, and your time (and personal best) is recorded. Obbies, racing courses and parkour maps get huge replay value from this. The server keeps the **real** time with its own clock, requires the checkpoints in order (so nobody teleports from start to finish), rejects impossible times, and saves the best time as an integer in an `OrderedDataStore` so you can show a top-10 board later.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `Speedrun` | Script | `ServerScriptService` |
| `RunTimerHud` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| course parts | Parts tagged `RunStart`, `RunFinish`, `RunCheckpoint` | `Workspace` |

Each `RunCheckpoint` has a number attribute `Order` (1, 2, 3 ...). Trigger parts: Anchored, `CanCollide` off, `Transparency` around 0.7.

## Server
```lua
-- ServerScriptService/Speedrun (Script)
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local DataStoreService = game:GetService("DataStoreService")

local MIN_TIME = 15            -- seconds: faster than this is impossible on this course
local bestStore = DataStoreService:GetOrderedDataStore("BestTimeMs_v1")

type Run = { started: number, nextCheckpoint: number }
local runs: {[Player]: Run} = {}

local function checkpointCount(): number
	return #CollectionService:GetTagged("RunCheckpoint")
end

local function playerFromHit(hit: BasePart): Player?
	local character = hit:FindFirstAncestorOfClass("Model")
	local player = character and Players:GetPlayerFromCharacter(character)
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if player and humanoid and humanoid.Health > 0 then return player end
	return nil
end

local function formatTime(t: number): string
	return string.format("%d:%05.2f", t // 60, t % 60)
end

local function saveBest(player: Player, ms: number)
	local ok, err = pcall(function()
		bestStore:UpdateAsync("u_" .. player.UserId, function(old)
			if old and old <= ms then return nil end -- not a new record: no write
			return ms
		end)
	end)
	if not ok then warn("Best time save failed:", err) end
end

local function onStart(hit: BasePart)
	local player = playerFromHit(hit)
	if not player then return end
	local run = runs[player]
	if run and os.clock() - run.started < 1 then return end -- still standing on the line
	runs[player] = { started = os.clock(), nextCheckpoint = 1 }
	player:SetAttribute("RunStartedAt", workspace:GetServerTimeNow())
end

local function onCheckpoint(part: BasePart, hit: BasePart)
	local player = playerFromHit(hit)
	local run = player and runs[player]
	if run and part:GetAttribute("Order") == run.nextCheckpoint then
		run.nextCheckpoint += 1
	end
end

local function onFinish(hit: BasePart)
	local player = playerFromHit(hit)
	local run = player and runs[player]
	if not run then return end
	runs[player] = nil
	player:SetAttribute("RunStartedAt", nil)

	if run.nextCheckpoint <= checkpointCount() then
		player:SetAttribute("LastRun", "Missed a checkpoint")
		return
	end
	local t = os.clock() - run.started
	if t < MIN_TIME then
		player:SetAttribute("LastRun", "Invalid run")
		warn("Suspicious run", player.UserId, t)
		return
	end
	player:SetAttribute("LastRun", formatTime(t))
	local best = player:GetAttribute("BestRun")
	if not best or t < best then
		player:SetAttribute("BestRun", t)
		task.spawn(saveBest, player, math.floor(t * 1000)) -- ordered stores hold integers
	end
end

local function bind(tag: string, fn)
	local function hook(part: Instance)
		if part:IsA("BasePart") then
			part.Touched:Connect(function(hit) fn(part, hit) end)
		end
	end
	for _, p in CollectionService:GetTagged(tag) do hook(p) end
	CollectionService:GetInstanceAddedSignal(tag):Connect(hook)
end

bind("RunStart", function(_, hit) onStart(hit) end)
bind("RunCheckpoint", onCheckpoint)
bind("RunFinish", function(_, hit) onFinish(hit) end)

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		runs[player] = nil -- dying cancels the run
		player:SetAttribute("RunStartedAt", nil)
	end)
	local ok, ms = pcall(bestStore.GetAsync, bestStore, "u_" .. player.UserId)
	if ok and ms then player:SetAttribute("BestRun", ms / 1000) end
end)
Players.PlayerRemoving:Connect(function(p) runs[p] = nil end)
```

## Client HUD
```lua
-- StarterPlayerScripts/RunTimerHud (LocalScript)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui"); gui.Name = "RunTimer"; gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")
local label = Instance.new("TextLabel")
label.AnchorPoint = Vector2.new(1, 0); label.Position = UDim2.new(1, -12, 0, 12)
label.Size = UDim2.fromOffset(220, 60); label.BackgroundTransparency = 0.4
label.BackgroundColor3 = Color3.fromRGB(15, 15, 15); label.TextColor3 = Color3.new(1, 1, 1)
label.TextScaled = true; label.Parent = gui

local function fmt(t: number): string
	return string.format("%d:%05.2f", t // 60, t % 60)
end

RunService.Heartbeat:Connect(function()
	local started = player:GetAttribute("RunStartedAt")
	local best = player:GetAttribute("BestRun")
	local bestText = if best then "Best " .. fmt(best) else "No best yet"
	if started then
		label.Text = fmt(workspace:GetServerTimeNow() - started) .. "\n" .. bestText
	else
		label.Text = (player:GetAttribute("LastRun") or "Touch START") .. "\n" .. bestText
	end
end)
```
The on-screen clock is only a display. The saved time is the server's `os.clock()` difference.

## How to test
1. Build start, three checkpoints (`Order` 1-3) and finish. Play the course: the timer runs; at the finish you see your time and "Best".
2. Skip checkpoint 2 by walking around it: "Missed a checkpoint".
3. Set `MIN_TIME = 9999` temporarily: every run is "Invalid run" (proves the check).
4. Rejoin with API access on: "Best" loads from the ordered store.
5. Reset mid-run: the timer clears.

## Common mistakes
- **Timing on the client** and sending the result: exploiters send `0.01`.
- **Saving decimals to an `OrderedDataStore`.** It sorts integer values; store milliseconds.
- **Writing every finish.** The `UpdateAsync` transform returns `nil` when the time is not a record, so it does not write.
- **Start line re-triggering** every frame while you stand on it, restarting the clock: the 1 s guard handles it.
- Weekly boards and resets: [[Weekly and Seasonal Leaderboards with OrderedDataStore]].

## Related
[[Scripting - Hub]] · [[Weekly and Seasonal Leaderboards with OrderedDataStore]] · [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]] · [[Recipe - Countdown Timer UI Synced to Server Time]]
