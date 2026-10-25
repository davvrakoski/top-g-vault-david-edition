---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Spectate Mode"
tags: [roblox, community-knowledge, scripting, recipe, luau, spectate, camera, streaming, replicationfocus, ui]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Camera
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/scripting/events/remote
---
# Recipe - Spectate Mode

Eliminated players (or players waiting in the lobby) can watch the players still in the round, flipping between them with Prev/Next buttons or Q/E. It keeps dead players engaged instead of leaving. The camera part is one line (`Camera.CameraSubject = targetHumanoid`); the parts people forget are skipping players who die or leave, and **StreamingEnabled**: the spectator's client may not have the far-away target streamed in, so the server moves that player's `ReplicationFocus` to the target.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `Spectate` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| `SpectateServer` | Script | `ServerScriptService` |
| `SpectateFocus` | RemoteEvent | `ReplicatedStorage` (created by the server) |

It uses the `InRound` player attribute from [[Recipe - Round System with Intermission]]: players with `InRound = true` are watchable, and only players **not** in the round may spectate.

## Server: replication focus
`Player.ReplicationFocus` must be set on the server; per the docs, `nil` means "focus on my own character".
```lua
-- ServerScriptService/SpectateServer (Script)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local focusEvent = Instance.new("RemoteEvent")
focusEvent.Name = "SpectateFocus"
focusEvent.Parent = ReplicatedStorage

focusEvent.OnServerEvent:Connect(function(player, target)
	if target == nil then
		player.ReplicationFocus = nil
		return
	end
	if typeof(target) ~= "Instance" or not target:IsA("Player") or target == player then return end
	if player:GetAttribute("InRound") then return end -- players in the round cannot spectate
	local root = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
	if root then
		player.ReplicationFocus = root
	end
end)

Players.PlayerRemoving:Connect(function(leaving)
	-- anyone focused on the leaving player goes back to default
	for _, p in Players:GetPlayers() do
		local focus = p.ReplicationFocus
		if focus and leaving.Character and focus:IsDescendantOf(leaving.Character) then
			p.ReplicationFocus = nil
		end
	end
end)
```

## Client
```lua
-- StarterPlayerScripts/Spectate (LocalScript)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local focusEvent = ReplicatedStorage:WaitForChild("SpectateFocus") :: RemoteEvent

local spectating = false
local index = 1
local current: Player? = nil

-- UI ----------------------------------------------------------
local gui = Instance.new("ScreenGui"); gui.Name = "SpectateGui"; gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")
local function makeButton(text: string, x: number): TextButton
	local b = Instance.new("TextButton")
	b.AnchorPoint = Vector2.new(0.5, 1)
	b.Position = UDim2.new(0.5, x, 1, -20)
	b.Size = UDim2.fromOffset(110, 40)
	b.Text = text
	b.Parent = gui
	return b
end
local toggleButton = makeButton("Spectate", 0)
local prevButton = makeButton("< Prev", -130)
local nextButton = makeButton("Next >", 130)
local nameLabel = Instance.new("TextLabel")
nameLabel.AnchorPoint = Vector2.new(0.5, 1); nameLabel.Position = UDim2.new(0.5, 0, 1, -66)
nameLabel.Size = UDim2.fromOffset(300, 28); nameLabel.BackgroundTransparency = 1
nameLabel.TextColor3 = Color3.new(1, 1, 1); nameLabel.TextScaled = true
nameLabel.Parent = gui

-- logic -------------------------------------------------------
local function candidates(): {Player}
	local list = {}
	for _, p in Players:GetPlayers() do
		local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
		if p ~= player and p:GetAttribute("InRound") and hum and hum.Health > 0 then
			table.insert(list, p)
		end
	end
	table.sort(list, function(a, b) return a.UserId < b.UserId end) -- stable order
	return list
end

local function watchOwn()
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hum then camera.CameraSubject = hum end
end

local function stop()
	spectating = false
	current = nil
	focusEvent:FireServer(nil)
	watchOwn()
end

local function show(step: number)
	local list = candidates()
	if #list == 0 then
		nameLabel.Text = "Nobody to watch"
		stop()
		return
	end
	index = ((index - 1 + step) % #list) + 1
	current = list[index]
	local hum = current.Character and current.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		camera.CameraSubject = hum
		nameLabel.Text = "Watching " .. current.DisplayName
		focusEvent:FireServer(current)
	end
end

local function refreshUI()
	local allowed = not player:GetAttribute("InRound")
	toggleButton.Visible = allowed
	toggleButton.Text = if spectating then "Stop" else "Spectate"
	prevButton.Visible = spectating
	nextButton.Visible = spectating
	nameLabel.Visible = spectating
	if spectating and not allowed then stop() end -- joined a round: back to own camera
end

toggleButton.Activated:Connect(function()
	if spectating then stop() else spectating = true; show(0) end
	refreshUI()
end)
prevButton.Activated:Connect(function() show(-1) end)
nextButton.Activated:Connect(function() show(1) end)
UserInputService.InputBegan:Connect(function(input, processed)
	if processed or not spectating then return end
	if input.KeyCode == Enum.KeyCode.Q then show(-1) elseif input.KeyCode == Enum.KeyCode.E then show(1) end
end)

-- if the watched player dies or leaves, move on automatically
RunService.Heartbeat:Connect(function()
	if not spectating then return end
	local hum = current and current.Character and current.Character:FindFirstChildOfClass("Humanoid")
	if not current or not current.Parent or not hum or hum.Health <= 0 or not current:GetAttribute("InRound") then
		show(1)
		refreshUI()
	end
end)

player:GetAttributeChangedSignal("InRound"):Connect(refreshUI)
player.CharacterAdded:Connect(function()
	if not spectating then task.defer(watchOwn) end
end)
refreshUI()
```

## How to test
1. Run with 3 players and the round recipe. When player 3 dies, they see "Spectate"; click it: the camera follows player 1. Next: player 2.
2. Kill the watched player: the view jumps to the remaining one within a frame or two.
3. With StreamingEnabled on and the arena far from the lobby, the watched player's surroundings still appear (thanks to `ReplicationFocus`).
4. When a new round starts and the spectator is teleported in, spectating stops and the camera returns to their own character.

## Common mistakes
- **Setting `ReplicationFocus` from the client.** The docs say to set it only from a server Script; do it through the remote as above.
- **Not resetting `CameraSubject`** on respawn: the player respawns and the camera stays on someone else.
- **Letting players in the round spectate**: free wallhacks in hide-and-seek games.
- **Changing `CameraType`.** Leave it on `Custom`; changing only the subject keeps normal orbit controls.

## Related
[[Scripting - Hub]] · [[Recipe - Round System with Intermission]] · [[Recipe - Kill Feed]] · [[Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync]]
