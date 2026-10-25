---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Sprint with Stamina Bar"
tags: [roblox, community-knowledge, scripting, recipe, luau, movement, sprint, stamina, ui]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ContextActionService
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://create.roblox.com/docs/input/mobile
---
# Recipe - Sprint with Stamina Bar

Hold Shift (or a touch button, or L3 on a gamepad) to run faster. Running drains a stamina bar; it refills after a short pause. Almost every action, horror and obby game wants this, and the common bugs (stamina that goes negative, sprinting while standing still, no mobile button) are all avoidable in one small script.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Script | Type | Location |
|---|---|---|
| `SprintStamina` | LocalScript | `StarterPlayer > StarterPlayerScripts` |

No server script is needed. The client owns its own character's physics, so a `WalkSpeed` change made on the client moves the character for everyone (see [[What a Client Controls on Its Own Character - Replication Exceptions]]). That also means sprint is not "secure": if speed matters for gameplay, let the server's anti-cheat tolerate `SPRINT_SPEED`, and nothing above it.

## The code
```lua
-- StarterPlayerScripts/SprintStamina (LocalScript)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ContextActionService = game:GetService("ContextActionService")

local WALK_SPEED = 16
local SPRINT_SPEED = 26
local MAX_STAMINA = 100
local DRAIN_PER_SEC = 25      -- 4 seconds of sprint from full
local REGEN_PER_SEC = 20
local REGEN_DELAY = 1.0       -- seconds after you stop before refilling
local MIN_TO_START = 15       -- stops "stutter sprint" at 0 stamina

local player = Players.LocalPlayer
local stamina = MAX_STAMINA
local wantsSprint = false
local sprinting = false
local lastDrain = 0

-- Build the bar in code so the recipe is copy-paste
local gui = Instance.new("ScreenGui")
gui.Name = "StaminaGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local back = Instance.new("Frame")
back.AnchorPoint = Vector2.new(0.5, 1)
back.Position = UDim2.new(0.5, 0, 1, -90)
back.Size = UDim2.fromOffset(220, 10)
back.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
back.BorderSizePixel = 0
back.Parent = gui

local fill = Instance.new("Frame")
fill.Size = UDim2.fromScale(1, 1)
fill.BackgroundColor3 = Color3.fromRGB(90, 200, 120)
fill.BorderSizePixel = 0
fill.Parent = back

local function getHumanoid(): Humanoid?
	local character = player.Character
	return character and character:FindFirstChildOfClass("Humanoid")
end

local function onSprint(_actionName, inputState, _input)
	if inputState == Enum.UserInputState.Begin then
		wantsSprint = true
	elseif inputState == Enum.UserInputState.End or inputState == Enum.UserInputState.Cancel then
		wantsSprint = false
	end
	return Enum.ContextActionResult.Pass
end

-- true = also create an on-screen touch button
ContextActionService:BindAction("Sprint", onSprint, true, Enum.KeyCode.LeftShift, Enum.KeyCode.ButtonL3)
ContextActionService:SetTitle("Sprint", "Run")

RunService.Heartbeat:Connect(function(dt)
	local humanoid = getHumanoid()
	if not humanoid or humanoid.Health <= 0 then
		sprinting = false
		return
	end

	local moving = humanoid.MoveDirection.Magnitude > 0.1
	if sprinting then
		if not wantsSprint or not moving or stamina <= 0 then
			sprinting = false
		end
	elseif wantsSprint and moving and stamina >= MIN_TO_START then
		sprinting = true
	end

	if sprinting then
		stamina = math.max(0, stamina - DRAIN_PER_SEC * dt)
		lastDrain = os.clock()
	elseif os.clock() - lastDrain >= REGEN_DELAY then
		stamina = math.min(MAX_STAMINA, stamina + REGEN_PER_SEC * dt)
	end

	humanoid.WalkSpeed = if sprinting then SPRINT_SPEED else WALK_SPEED
	fill.Size = UDim2.fromScale(stamina / MAX_STAMINA, 1)
	fill.BackgroundColor3 = if stamina < MIN_TO_START
		then Color3.fromRGB(210, 80, 70)
		else Color3.fromRGB(90, 200, 120)
	back.Visible = stamina < MAX_STAMINA
end)
```

## How to test
1. Play (F5). Hold Shift while walking: speed jumps, the bar appears and shrinks.
2. Stand still holding Shift: the bar must **not** drain (`MoveDirection` check).
3. Drain to 0, keep holding Shift: you drop to walk speed and cannot restart until the bar passes the red zone.
4. Device Emulator, pick a phone: a "Run" touch button appears; hold it to sprint.
5. Reset the character (Esc > Reset): the bar survives because `ResetOnSpawn = false`.

## Common mistakes
- **Shift-lock conflict.** Left Shift is also the default mouse-lock key. Either turn mouse lock off (`StarterPlayer.EnableMouseLockOption = false`) or bind Left Ctrl instead.
- **Two scripts writing `WalkSpeed`.** This loop sets it every frame, so a slow-down potion elsewhere gets overwritten. Keep one owner: read a multiplier attribute (e.g. `humanoid:GetAttribute("SpeedMult")`) and multiply here.
- **Using `wait()` or a `while true` loop with fixed steps.** Stamina then depends on frame rate. Always scale by `dt`.
- **Draining on the server.** It adds lag to a purely local feeling. Only move it to the server if stamina also gates attacks or other server actions; then the server keeps its own copy and the client bar is just a display.
- Add camera polish with [[FOV Punch, Sprint FOV and Zoom]], and crouch/slide with [[Sprint, Crouch and Slide - A Movement State Layer over the Humanoid]].

## Related
[[Scripting - Hub]] · [[Sprint, Crouch and Slide - A Movement State Layer over the Humanoid]] · [[FOV Punch, Sprint FOV and Zoom]] · [[Mobile Action Buttons - Input Action System and ContextActionService]]
