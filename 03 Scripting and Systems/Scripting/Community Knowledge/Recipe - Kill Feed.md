---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Kill Feed"
tags: [roblox, community-knowledge, scripting, recipe, luau, kill-feed, combat, ui, remoteevent, leaderstats]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/scripting/events/remote
  - https://create.roblox.com/docs/ui/list-flex-layouts
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
---
# Recipe - Kill Feed

The corner list that says "Alex [Sword] Sam" whenever someone is eliminated. It tells players the match is alive and who to watch out for. The server decides who gets credit (the last player who damaged the victim within a time window), bumps a `Kills` stat, and broadcasts one small event; each client draws and fades the entries. Assist splits and damage ledgers are covered in [[Kill Credit, Assists and Damage Attribution]]; this is the simple last-hit version.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `DamageTags` | ModuleScript | `ServerScriptService` |
| `KillFeedServer` | Script | `ServerScriptService` |
| `KillFeedClient` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| `KillFeedEvent` | RemoteEvent | `ReplicatedStorage` (created by the server) |

## Tag damage (call from every weapon)
```lua
-- ServerScriptService/DamageTags (ModuleScript)
local DamageTags = {}
local CREDIT_WINDOW = 10 -- seconds

function DamageTags.damage(victim: Humanoid, attacker: Player?, amount: number, weapon: string)
	if attacker then
		victim:SetAttribute("LastAttackerId", attacker.UserId)
		victim:SetAttribute("LastWeapon", weapon)
		victim:SetAttribute("LastHitAt", workspace:GetServerTimeNow())
	end
	victim:TakeDamage(amount)
end

function DamageTags.creditFor(victim: Humanoid): (number?, string?)
	local at = victim:GetAttribute("LastHitAt")
	if not at or workspace:GetServerTimeNow() - at > CREDIT_WINDOW then
		return nil, nil
	end
	return victim:GetAttribute("LastAttackerId"), victim:GetAttribute("LastWeapon")
end

return DamageTags
```

## Server broadcast
```lua
-- ServerScriptService/KillFeedServer (Script)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local DamageTags = require(ServerScriptService:WaitForChild("DamageTags"))

local feed = Instance.new("RemoteEvent")
feed.Name = "KillFeedEvent"
feed.Parent = ReplicatedStorage

local function bumpKills(player: Player)
	local stats = player:FindFirstChild("leaderstats")
	local kills = stats and stats:FindFirstChild("Kills")
	if kills then kills.Value += 1 end
end

local function onCharacter(player: Player, character: Model)
	local humanoid = character:WaitForChild("Humanoid", 10) :: Humanoid?
	if not humanoid then return end
	humanoid.Died:Once(function()
		local killerId, weapon = DamageTags.creditFor(humanoid)
		local killer = killerId and Players:GetPlayerByUserId(killerId)
		if killer == player then killer = nil end -- self-damage is not a kill
		if killer then bumpKills(killer) end
		-- send plain data: names, team colours, weapon label
		feed:FireAllClients({
			killer = killer and killer.DisplayName or nil,
			killerColor = killer and killer.TeamColor.Color or nil,
			victim = player.DisplayName,
			victimColor = player.TeamColor.Color,
			weapon = if killer then weapon else nil,
		})
	end)
end

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(c) onCharacter(player, c) end)
end)
```

## Client feed
```lua
-- StarterPlayerScripts/KillFeedClient (LocalScript)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local MAX_ENTRIES = 5
local LIFETIME = 6
local feed = ReplicatedStorage:WaitForChild("KillFeedEvent") :: RemoteEvent

local gui = Instance.new("ScreenGui")
gui.Name = "KillFeed"
gui.ResetOnSpawn = false
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local holder = Instance.new("Frame")
holder.AnchorPoint = Vector2.new(1, 0)
holder.Position = UDim2.new(1, -12, 0, 60)
holder.Size = UDim2.fromOffset(320, 200)
holder.BackgroundTransparency = 1
holder.Parent = gui
local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
layout.Padding = UDim.new(0, 4)
layout.Parent = holder

local counter = 0

local function hex(c: Color3?): string
	return if c then "#" .. c:ToHex() else "#FFFFFF"
end

local function escape(s: string): string -- names are safe text, but escape for rich text
	return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
end

feed.OnClientEvent:Connect(function(e)
	counter -= 1 -- newer entries get smaller LayoutOrder, so they sit on top
	local label = Instance.new("TextLabel")
	label.LayoutOrder = counter
	label.AutomaticSize = Enum.AutomaticSize.X
	label.Size = UDim2.fromOffset(0, 24)
	label.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	label.BackgroundTransparency = 0.4
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextSize = 18
	label.RichText = true
	local victim = `<font color="{hex(e.victimColor)}">{escape(e.victim)}</font>`
	if e.killer then
		local weapon = if e.weapon then ` [{escape(e.weapon)}] ` else " > "
		label.Text = `  <font color="{hex(e.killerColor)}">{escape(e.killer)}</font>{weapon}{victim}  `
	else
		label.Text = `  {victim} died  `
	end
	label.Parent = holder

	-- trim old entries
	local entries = {}
	for _, child in holder:GetChildren() do
		if child:IsA("TextLabel") then table.insert(entries, child) end
	end
	table.sort(entries, function(a, b) return a.LayoutOrder < b.LayoutOrder end)
	for i = MAX_ENTRIES + 1, #entries do entries[i]:Destroy() end

	task.delay(LIFETIME, function()
		if not label.Parent then return end
		local fade = TweenService:Create(label, TweenInfo.new(0.5),
			{ TextTransparency = 1, BackgroundTransparency = 1 })
		fade:Play()
		fade.Completed:Wait()
		label:Destroy()
	end)
end)
```

## How to test
1. Add a `Kills` IntValue to `leaderstats` (see [[First Leaderboard with leaderstats]]). Give a test sword that calls `DamageTags.damage(hum, player, 25, "Sword")`.
2. **Clients and Servers** with 2 players: kill one; both screens show "Player1 [Sword] Player2", and Player1's Kills goes up.
3. Fall into the void: "Player2 died", no credit.
4. Hit someone, wait 11 s, then they die to lava: no credit (outside the window).
5. Trigger 8 deaths quickly: never more than 5 lines; each fades after 6 s.

## Common mistakes
- **Clients reporting kills.** The client only displays; the server picks the killer.
- **Sending Instances** (Player objects) in the payload: if the victim leaves, the client gets `nil`. Send names and colours.
- **Using the classic `creator` ObjectValue** from old free-model weapons. It works but every weapon must remember to add and remove it; attributes on the Humanoid are simpler to inspect.
- **Connecting `Died` with `:Connect` on every respawn without cleanup** is fine (the old Humanoid is destroyed), but `:Once` makes intent obvious.
- Showing `Name` instead of `DisplayName`; players expect the display name in feeds.

## Related
[[Scripting - Hub]] · [[Kill Credit, Assists and Damage Attribution]] · [[Recipe - Spectate Mode]] · [[Rich Text and Typewriter Dialogue - MaxVisibleGraphemes]]
