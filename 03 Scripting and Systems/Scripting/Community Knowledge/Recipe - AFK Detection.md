---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - AFK Detection"
tags: [roblox, community-knowledge, scripting, recipe, luau, afk, idle, attributes, billboardgui, remoteevent]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/reference/engine/classes/BillboardGui
  - https://create.roblox.com/docs/scripting/attributes
---
# Recipe - AFK Detection

Mark players as AFK after a period without input: show an "AFK" tag over their head, skip them when starting rounds or balancing teams, and pause idle-farm rewards if you want to. The engine already has `Player.Idled`, but per the docs it only fires on the **client**, starts about **two minutes** after the engine considers the player idle, and Roblox disconnects players idle for at least 20 minutes. Most games want a shorter, configurable window, so this recipe tracks input itself and uses `Idled` as a backup signal.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `AfkClient` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| `AfkServer` | Script | `ServerScriptService` |
| `SetAfk` | RemoteEvent | `ReplicatedStorage` (created by the server) |

The server owns the `AFK` attribute on each Player. Other systems read `player:GetAttribute("AFK")`.

## Client: detect inactivity
```lua
-- StarterPlayerScripts/AfkClient (LocalScript)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AFK_AFTER = 90 -- seconds without input
local setAfk = ReplicatedStorage:WaitForChild("SetAfk") :: RemoteEvent
local player = Players.LocalPlayer

local lastInput = os.clock()
local isAfk = false

local function report(value: boolean)
	if value ~= isAfk then
		isAfk = value
		setAfk:FireServer(value)
	end
end

local function activity()
	lastInput = os.clock()
	if isAfk then report(false) end
end

-- stay in sync when the server sets AFK by other means (e.g. an /afk command)
player:GetAttributeChangedSignal("AFK"):Connect(function()
	isAfk = player:GetAttribute("AFK") == true
end)

UserInputService.InputBegan:Connect(activity)
UserInputService.InputChanged:Connect(function(input)
	-- mouse movement, thumbsticks and touch drags count; ignore tiny gamepad drift
	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch
		or (input.KeyCode == Enum.KeyCode.Thumbstick1 and input.Position.Magnitude > 0.3)
		or (input.KeyCode == Enum.KeyCode.Thumbstick2 and input.Position.Magnitude > 0.3) then
		activity()
	end
end)

-- backup: the engine's own idle signal (fires about 2 min after idle, then every 30 s)
player.Idled:Connect(function()
	report(true)
end)

while true do
	task.wait(5)
	if not isAfk and os.clock() - lastInput >= AFK_AFTER then
		report(true)
	end
end
```

## Server: own the flag and the tag
```lua
-- ServerScriptService/AfkServer (Script)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MIN_INTERVAL = 1
local setAfk = Instance.new("RemoteEvent")
setAfk.Name = "SetAfk"
setAfk.Parent = ReplicatedStorage

local lastChange: {[Player]: number} = {}

local function updateTag(player: Player)
	local character = player.Character
	local head = character and character:FindFirstChild("Head")
	if not head then return end
	local tag = head:FindFirstChild("AfkTag")
	if player:GetAttribute("AFK") then
		if not tag then
			tag = Instance.new("BillboardGui")
			tag.Name = "AfkTag"
			tag.Size = UDim2.fromOffset(80, 28)
			tag.StudsOffset = Vector3.new(0, 2.6, 0)
			tag.MaxDistance = 80
			local label = Instance.new("TextLabel")
			label.Size = UDim2.fromScale(1, 1)
			label.BackgroundTransparency = 1
			label.Text = "AFK"
			label.TextScaled = true
			label.TextColor3 = Color3.fromRGB(255, 220, 90)
			label.Parent = tag
			tag.Parent = head
		end
	elseif tag then
		tag:Destroy()
	end
end

setAfk.OnServerEvent:Connect(function(player, value)
	if type(value) ~= "boolean" then return end
	local now = os.clock()
	if now - (lastChange[player] or 0) < MIN_INTERVAL then return end
	lastChange[player] = now
	player:SetAttribute("AFK", value) -- the attribute listener below redraws the tag
end)

Players.PlayerAdded:Connect(function(player)
	player:SetAttribute("AFK", false)
	-- any server code (remote, /afk command, admin tool) can flip the attribute
	player:GetAttributeChangedSignal("AFK"):Connect(function() updateTag(player) end)
	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("Head", 5)
		updateTag(player) -- keep the tag after respawn
	end)
end)
Players.PlayerRemoving:Connect(function(p) lastChange[p] = nil end)
```

## Using the flag
- Rounds: `if not p:GetAttribute("AFK") then ... end` when picking contestants (already in [[Recipe - Round System with Intermission]]).
- Rewards: skip time-based payouts while AFK if your design treats AFK farming as unwanted.
- A manual `/afk` toggle: see [[Recipe - Chat Commands with TextChatCommand]].

## How to test
1. Set `AFK_AFTER = 10` for testing. Play and do nothing: after 10-15 s the tag appears over your head and the server shows `AFK = true`.
2. Move the mouse: the tag disappears.
3. Spam the remote from the client command bar (`for i = 1, 50 do game.ReplicatedStorage.SetAfk:FireServer(i % 2 == 0) end`): the attribute changes at most once per second.
4. Reset your character while AFK: the tag comes back on the new head.

## Common mistakes
- **Server-side `Idled`.** It never fires on the server.
- **Kicking AFK players yourself** after a minute: annoying, and Roblox already disconnects at 20 minutes. Only kick earlier with a clear warning, for servers where slots are scarce.
- **Counting `InputChanged` from a drifting thumbstick** as activity: a resting controller keeps the player "active" forever. Use a dead-zone.
- **Trusting the AFK flag for anything valuable.** A cheater can report "not AFK" forever; the flag is for comfort features, not anti-farm security.

## Related
[[Scripting - Hub]] · [[Recipe - Round System with Intermission]] · [[BillboardGui Cost - Nametags, Health Bars and MaxDistance]] · [[Offline Earnings - Idle Rewards Without Clock Exploits]]
