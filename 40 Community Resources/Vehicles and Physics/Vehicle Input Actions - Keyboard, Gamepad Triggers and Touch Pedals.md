---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/vehicle-input-actions"
title: "Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals"
tags: [roblox, community, vehicles, input, gamepad, mobile, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/input/input-action-system
  - https://create.roblox.com/docs/reference/engine/enums/InputActionType
  - https://create.roblox.com/docs/reference/engine/classes/InputBinding
  - https://devforum.roblox.com/t/vehicle-input-controller-module/262941
  - https://devforum.roblox.com/t/new-studio-racing-template/2805745?page=2
---
# Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals

The **Input Action System** (`InputContext` > `InputAction` > `InputBinding`) is Roblox's modern way to map keyboard, gamepad and touch to one action. The docs literally use a car's accelerator pedal as the example for the `Direction1D` type, so it fits vehicles well.

## Which action type for which control
| Control | Type | Bindings | State you read |
|---|---|---|---|
| Throttle / reverse | `Direction1D` | keyboard `Up = W`, `Down = S`; gamepad `KeyCode = ButtonR2` | -1..1 (trigger gives 0..1) |
| Brake (analog) | `Direction1D` | `KeyCode = ButtonL2` | 0..1 |
| Steer (keys) | `Direction1D` | `Up = D`, `Down = A` | -1..1 |
| Steer (stick) | `Direction2D` | `KeyCode = Thumbstick1` | Vector2, use `.X` |
| Handbrake, horn, boost | `Bool` | key, gamepad button, or **`UIButton`** for touch | true / false |
| Hover / fly up-down plus strafe | `Direction3D` | Up / Down / Left / Right / Forward / Backward keys | Vector3 |

Two facts from the docs that shape the code:
- Only `Bool` actions expose the `UIButton` property, so **touch pedals are Bool actions**.
- For continuous input `StateChanged` fires only when the value changes, so **poll `GetState()` every frame** instead of waiting for events.

## Original Luau: a drive context built in code
LocalScript in `StarterPlayerScripts`. You can build the same tree by hand in Studio (the docs suggest a folder of contexts in ReplicatedStorage); building it in code keeps the bindings in version control.

```lua
--!strict
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local context = Instance.new("InputContext")
context.Name = "DriveContext"
context.Enabled = false          -- only on while seated in a car
context.Parent = playerGui

local function action(name: string, kind: Enum.InputActionType): InputAction
	local a = Instance.new("InputAction")
	a.Name = name
	a.Type = kind
	a.Parent = context
	return a
end

local function bind(a: InputAction, props: { [string]: any })
	local b = Instance.new("InputBinding")
	for key, value in props do
		(b :: any)[key] = value
	end
	b.Parent = a
end

local throttle = action("Throttle", Enum.InputActionType.Direction1D)
bind(throttle, { Up = Enum.KeyCode.W, Down = Enum.KeyCode.S })
bind(throttle, { KeyCode = Enum.KeyCode.ButtonR2 })

local brake = action("Brake", Enum.InputActionType.Direction1D)
bind(brake, { KeyCode = Enum.KeyCode.ButtonL2 })

local steerKeys = action("Steer", Enum.InputActionType.Direction1D)
bind(steerKeys, { Up = Enum.KeyCode.D, Down = Enum.KeyCode.A })

local steerStick = action("SteerStick", Enum.InputActionType.Direction2D)
bind(steerStick, { KeyCode = Enum.KeyCode.Thumbstick1 })

local handbrake = action("Handbrake", Enum.InputActionType.Bool)
bind(handbrake, { KeyCode = Enum.KeyCode.Space })
bind(handbrake, { KeyCode = Enum.KeyCode.ButtonX })

-- Touch pedals: two GuiButtons you made in a ScreenGui called "DrivePedals".
-- Set that ScreenGui's ResetOnSpawn to false so these UIButton links survive respawns.
local pedals = playerGui:WaitForChild("DrivePedals") :: ScreenGui
local gasPedal = action("GasPedal", Enum.InputActionType.Bool)
bind(gasPedal, { UIButton = pedals:WaitForChild("Gas") })
local brakePedal = action("BrakePedal", Enum.InputActionType.Bool)
bind(brakePedal, { UIButton = pedals:WaitForChild("Brake") })

local function readDrive(): (number, number, boolean)
	local t = (throttle:GetState() :: number) - (brake:GetState() :: number)
	if gasPedal:GetState() then t += 1 end
	if brakePedal:GetState() then t -= 1 end

	local s = steerKeys:GetState() :: number
	local stickX = (steerStick:GetState() :: Vector2).X
	if math.abs(stickX) > math.abs(s) then
		s = stickX
	end
	return math.clamp(t, -1, 1), math.clamp(s, -1, 1), handbrake:GetState() :: boolean
end

-- Switch the context on only while sitting in a seat tagged as a car seat.
local currentCar: Model? = nil
local function onCharacter(character: Model)
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	humanoid.Seated:Connect(function(active, seatPart)
		local car = if active and seatPart then seatPart:FindFirstAncestorWhichIsA("Model") else nil
		currentCar = if car and car:HasTag("Vehicle") then car else nil
		context.Enabled = currentCar ~= nil
		pedals.Enabled = currentCar ~= nil and UserInputService.TouchEnabled
	end)
end
if player.Character then onCharacter(player.Character) end
player.CharacterAdded:Connect(onCharacter)

RunService.PreSimulation:Connect(function()
	local car = currentCar
	if not car then return end
	local t, s, hb = readDrive()
	-- Hand the abstract inputs to whatever drives the car (your chassis reads these).
	car:SetAttribute("Throttle", t)
	car:SetAttribute("Steer", s)
	car:SetAttribute("Handbrake", hb)
end)
```

## Why inputs go into attributes
- The chassis does not care whether a key, a stick, a touch pedal or an **AI** produced the numbers. The Racing template team said the same: an AI can drive their buggy through its Controller module and the attributes on its Input configuration object ([[Roblox Racing Template - Dune Buggy Chassis and Server Authority Version]]).
- Under server authority the docs copy inputs into attributes too, so other clients see them ([[Server Authority Vehicles - Prediction, BindToSimulation and Input Attributes]]).
- Attributes set by the driver's client do **not** replicate to the server. If the server needs them, send them through a validated remote.

## Older alternative
Before the Input Action System, WingItMan's "Vehicle Input Controller Module" (DevForum, 2019, no license stated, link only) mapped keyboard, gamepad and touch to throttle, brake, steer, handbrake, clutch and gears through `UserInputService`, with gamepad dead-zone damping. Its author later called it convoluted; the new system replaces most of it.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Mobile Vehicle Controls - Community Findings]] · [[Input Action System]] · [[InputAction]] · [[Vehicle Enter - Exit, Seats and Camera]]

<!-- TDOD_GRAPH_END -->
