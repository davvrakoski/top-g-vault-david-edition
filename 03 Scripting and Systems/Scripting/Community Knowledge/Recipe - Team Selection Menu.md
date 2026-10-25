---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Team Selection Menu"
tags: [roblox, community-knowledge, scripting, recipe, luau, teams, team-balance, ui, remoteevent, respawn]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/players/teams
  - https://create.roblox.com/docs/reference/engine/classes/Team
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/scripting/events/remote
---
# Recipe - Team Selection Menu

A menu with one button per team ("Police 4", "Criminals 6") that lets players pick a side, with the server enforcing balance, a cooldown, and an immediate respawn at the new team's spawn. Roleplay, cops-and-robbers and team shooters all need it. The no-code team setup and automatic assignment are in [[First Team Game - Teams and SpawnLocations]]; this recipe is the player-choice version.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Setup
1. In `Teams`, add Team objects (e.g. `Police`, `Criminals`). Set `AutoAssignable = false` on all of them, and give each a distinct `TeamColor`.
2. Add a Boolean attribute `Selectable = true` to teams players may pick (leave staff-only teams without it).
3. Optional neutral lobby: a `SpawnLocation` with `Neutral = true` where players start before choosing.
4. One `SpawnLocation` per team, with `TeamColor` matching the team and `Neutral = false`.

## Where it goes
| Item | Type | Location |
|---|---|---|
| `TeamSelectServer` | Script | `ServerScriptService` |
| `TeamMenu` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| `RequestTeam` | RemoteEvent | `ReplicatedStorage` (created by the server) |

## Server
```lua
-- ServerScriptService/TeamSelectServer (Script)
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MAX_LEAD = 1        -- a team may have at most 1 more player than the smallest team
local COOLDOWN = 5        -- seconds between switches

local request = Instance.new("RemoteEvent")
request.Name = "RequestTeam"
request.Parent = ReplicatedStorage

local lastSwitch: {[Player]: number} = {}

local function selectableTeams(): {Team}
	local list = {}
	for _, t in Teams:GetTeams() do
		if t:GetAttribute("Selectable") then table.insert(list, t) end
	end
	return list
end

local function sizeWithout(team: Team, player: Player): number
	local n = 0
	for _, p in team:GetPlayers() do
		if p ~= player then n += 1 end
	end
	return n
end

request.OnServerEvent:Connect(function(player, team)
	-- validate the argument: must be one of OUR selectable Team objects
	if typeof(team) ~= "Instance" or not team:IsA("Team") or team.Parent ~= Teams then return end
	if not team:GetAttribute("Selectable") then return end
	if player.Team == team then return end
	if player:GetAttribute("InRound") then return end -- no switching mid-round
	local now = os.clock()
	if now - (lastSwitch[player] or -math.huge) < COOLDOWN then return end

	-- balance: compare the target team (after joining) with the smallest other team
	local smallest = math.huge
	for _, t in selectableTeams() do
		smallest = math.min(smallest, sizeWithout(t, player))
	end
	if sizeWithout(team, player) + 1 > smallest + MAX_LEAD then
		return -- team full; the UI shows counts so players see why
	end

	lastSwitch[player] = now
	player.Neutral = false
	player.Team = team
	task.spawn(function()
		player:LoadCharacterAsync() -- respawn at a SpawnLocation of the new team colour
	end)
end)

Players.PlayerRemoving:Connect(function(p) lastSwitch[p] = nil end)
```

## Client menu
```lua
-- StarterPlayerScripts/TeamMenu (LocalScript)
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local request = ReplicatedStorage:WaitForChild("RequestTeam") :: RemoteEvent
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui"); gui.Name = "TeamMenu"; gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local panel = Instance.new("Frame")
panel.AnchorPoint = Vector2.new(0.5, 0.5); panel.Position = UDim2.fromScale(0.5, 0.5)
panel.Size = UDim2.fromOffset(300, 0); panel.AutomaticSize = Enum.AutomaticSize.Y
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 30); panel.Parent = gui
local layout = Instance.new("UIListLayout"); layout.Padding = UDim.new(0, 6); layout.Parent = panel
local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0, 8); pad.PaddingBottom = UDim.new(0, 8)
pad.PaddingLeft = UDim.new(0, 8); pad.PaddingRight = UDim.new(0, 8); pad.Parent = panel

local buttons: {[Team]: TextButton} = {}

local function refresh()
	for team, button in buttons do
		local mine = if player.Team == team then "  (you)" else ""
		button.Text = `{team.Name}  {#team:GetPlayers()}{mine}`
	end
end

for _, team in Teams:GetTeams() do
	if team:GetAttribute("Selectable") then
		local b = Instance.new("TextButton")
		b.Size = UDim2.new(1, 0, 0, 44)
		b.BackgroundColor3 = team.TeamColor.Color
		b.TextScaled = true
		b.Parent = panel
		buttons[team] = b
		b.Activated:Connect(function()
			request:FireServer(team)
		end)
		team.PlayerAdded:Connect(refresh)
		team.PlayerRemoved:Connect(refresh)
	end
end

local close = Instance.new("TextButton")
close.Size = UDim2.new(1, 0, 0, 32); close.LayoutOrder = 999; close.Text = "Close"; close.Parent = panel
close.Activated:Connect(function() panel.Visible = false end)

-- reopen with the T key
game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
	if not processed and input.KeyCode == Enum.KeyCode.T then panel.Visible = not panel.Visible end
end)
player:GetPropertyChangedSignal("Team"):Connect(function()
	refresh()
	panel.Visible = false
end)
refresh()
```

## How to test
1. Two teams, both `Selectable`, one spawn each. Start **Clients and Servers** with 3 players.
2. Player 1 picks Police: respawns at the Police spawn; counts update on all screens.
3. Player 2 picks Police too: allowed? With 1 Police, 0 Criminals, joining makes 2 vs 0 = lead 2 > 1, so it is refused. Player 2 picks Criminals: allowed.
4. Switch twice within 5 s: the second request is ignored.
5. From the client command bar fire `game.ReplicatedStorage.RequestTeam:FireServer(workspace)` or a team without `Selectable`: nothing happens.

## Common mistakes
- **Accepting a team name string** and doing `Teams[name]`: an exploiter passes "StaffTeam". Validate against selectable Team objects as above.
- **`player:LoadCharacter()`** in new code: the docs list `LoadCharacterAsync` as the current method.
- **`AutoAssignable` left on**: Roblox assigns a random team before the menu appears.
- **Spawn colours not matching** the team `TeamColor`: players spawn at the neutral lobby.
- **Silent refusals** confuse players; showing live counts (as here) or a toast (see [[Recipe - Notification Toasts from the Server]]) fixes that.

## Related
[[Scripting - Hub]] · [[First Team Game - Teams and SpawnLocations]] · [[Team Uniforms and Skin Tones by Script - Shirt, Pants and BodyColors]] · [[Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync]]
