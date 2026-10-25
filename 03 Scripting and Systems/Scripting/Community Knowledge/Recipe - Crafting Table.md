---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Crafting Table"
tags: [roblox, community-knowledge, scripting, recipe, luau, crafting, proximityprompt, remoteevent, inventory, ui]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/proximity-prompts
  - https://create.roblox.com/docs/scripting/events/remote
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
---
# Recipe - Crafting Table

Walk up to a workbench, press E, pick a recipe, and turn materials (wood, cloth, scrap) into items. Survival and simulator games live on this loop. The design side (recipe tiers, sinks) is in [[Crafting System Blueprint]]; this note is the working code: recipes as shared data, a server that re-checks **everything** (recipe exists, you are at a table, you have the materials), and a small UI built in code.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `CraftingRecipes` | ModuleScript | `ReplicatedStorage` |
| `Crafting` | Script | `ServerScriptService` |
| `CraftingClient` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| tables | Model or Part tagged `CraftingTable` (needs a `PrimaryPart` if a Model) | `Workspace` |
| tool outputs | `ToolInventory` from [[Recipe - Tool Inventory That Saves]] | `ServerScriptService` |

Materials are `IntValue`s in a `Materials` folder under each Player (server-created, so the client can read them for the UI). Saving them is one line in your save code: copy the folder's values into your data table.

## Recipes (shared data)
```lua
-- ReplicatedStorage/CraftingRecipes (ModuleScript)
return {
	Plank = { inputs = { Wood = 1 }, output = { kind = "Material", name = "Plank", amount = 4 } },
	Torch = { inputs = { Plank = 1, Cloth = 1 }, output = { kind = "Tool", name = "Torch" } },
	Spear = { inputs = { Plank = 2, Scrap = 3 }, output = { kind = "Tool", name = "Spear" } },
}
```

## Server
```lua
-- ServerScriptService/Crafting (Script)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local CollectionService = game:GetService("CollectionService")

local recipes = require(ReplicatedStorage:WaitForChild("CraftingRecipes"))
local ToolInventory = require(ServerScriptService:WaitForChild("ToolInventory"))

local MATERIALS = { "Wood", "Cloth", "Scrap", "Plank" }
local USE_RANGE = 12

local openEvent = Instance.new("RemoteEvent"); openEvent.Name = "OpenCrafting"; openEvent.Parent = ReplicatedStorage
local craftEvent = Instance.new("RemoteEvent"); craftEvent.Name = "Craft"; craftEvent.Parent = ReplicatedStorage
local resultEvent = Instance.new("RemoteEvent"); resultEvent.Name = "CraftResult"; resultEvent.Parent = ReplicatedStorage

local busy: {[Player]: boolean} = {}

local function addMaterials(player: Player)
	if player:FindFirstChild("Materials") then return end
	local folder = Instance.new("Folder")
	folder.Name = "Materials"
	for _, name in MATERIALS do
		local v = Instance.new("IntValue")
		v.Name = name
		v.Parent = folder
	end
	folder.Parent = player
end
Players.PlayerAdded:Connect(addMaterials)
for _, p in Players:GetPlayers() do addMaterials(p) end

local function tablePosition(t: Instance): Vector3?
	if t:IsA("BasePart") then return t.Position end
	if t:IsA("Model") then return t:GetPivot().Position end
	return nil
end

local function nearAnyTable(player: Player): boolean
	local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not root then return false end
	for _, t in CollectionService:GetTagged("CraftingTable") do
		local pos = tablePosition(t)
		if pos and (pos - root.Position).Magnitude <= USE_RANGE then return true end
	end
	return false
end

local function setupTable(t: Instance)
	local host = if t:IsA("Model") then t.PrimaryPart else t
	if not host then return end
	local prompt = Instance.new("ProximityPrompt")
	prompt.ActionText = "Craft"
	prompt.ObjectText = "Workbench"
	prompt.Parent = host
	prompt.Triggered:Connect(function(player)
		openEvent:FireClient(player)
	end)
end
for _, t in CollectionService:GetTagged("CraftingTable") do setupTable(t) end
CollectionService:GetInstanceAddedSignal("CraftingTable"):Connect(setupTable)

craftEvent.OnServerEvent:Connect(function(player, recipeId)
	if busy[player] then return end
	if type(recipeId) ~= "string" then return end
	local recipe = recipes[recipeId]
	if not recipe then return end
	if not nearAnyTable(player) then
		resultEvent:FireClient(player, false, "Move closer to a workbench")
		return
	end
	local mats = player:FindFirstChild("Materials")
	if not mats then return end

	busy[player] = true
	-- check every input first, then deduct; never deduct half a recipe
	for name, need in recipe.inputs do
		local have = mats:FindFirstChild(name)
		if not have or have.Value < need then
			busy[player] = nil
			resultEvent:FireClient(player, false, `Need {need} {name}`)
			return
		end
	end
	for name, need in recipe.inputs do
		mats[name].Value -= need
	end

	local out = recipe.output
	local ok = true
	if out.kind == "Material" then
		local v = mats:FindFirstChild(out.name)
		if v then v.Value += out.amount or 1 else ok = false end
	elseif out.kind == "Tool" then
		ok = ToolInventory.give(player, out.name)
	end
	if not ok then -- refund
		for name, need in recipe.inputs do mats[name].Value += need end
	end
	busy[player] = nil
	resultEvent:FireClient(player, ok, if ok then `Crafted {out.name}` else "Could not craft")
end)

Players.PlayerRemoving:Connect(function(p) busy[p] = nil end)
```

## Client
```lua
-- StarterPlayerScripts/CraftingClient (LocalScript)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local recipes = require(ReplicatedStorage:WaitForChild("CraftingRecipes"))
local openEvent = ReplicatedStorage:WaitForChild("OpenCrafting") :: RemoteEvent
local craftEvent = ReplicatedStorage:WaitForChild("Craft") :: RemoteEvent
local resultEvent = ReplicatedStorage:WaitForChild("CraftResult") :: RemoteEvent

local gui = Instance.new("ScreenGui")
gui.Name = "CraftingGui"
gui.ResetOnSpawn = false
gui.Enabled = false
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local panel = Instance.new("Frame")
panel.AnchorPoint = Vector2.new(0.5, 0.5)
panel.Position = UDim2.fromScale(0.5, 0.5)
panel.Size = UDim2.fromOffset(320, 260)
panel.Parent = gui
local layout = Instance.new("UIListLayout"); layout.Padding = UDim.new(0, 4); layout.Parent = panel

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 28); status.Text = "Pick a recipe"; status.LayoutOrder = 0
status.Parent = panel

local function describe(inputs)
	local parts = {}
	for name, n in inputs do table.insert(parts, `{n} {name}`) end
	return table.concat(parts, ", ")
end

local order = 1
for id, recipe in recipes do
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1, 0, 0, 36); b.LayoutOrder = order; order += 1
	b.Text = `{id}  ({describe(recipe.inputs)})`
	b.Parent = panel
	b.Activated:Connect(function() craftEvent:FireServer(id) end)
end

local close = Instance.new("TextButton")
close.Size = UDim2.new(1, 0, 0, 30); close.LayoutOrder = 999; close.Text = "Close"
close.Parent = panel
close.Activated:Connect(function() gui.Enabled = false end)

openEvent.OnClientEvent:Connect(function() gui.Enabled = true end)
resultEvent.OnClientEvent:Connect(function(_ok, message) status.Text = message end)
```

## How to test
1. Tag a part `CraftingTable`, add a `Torch` Tool to `ServerStorage > Tools`. In the server command bar give wood: `game.Players:GetPlayers()[1].Materials.Wood.Value = 5` (and `Cloth` = 2).
2. Press E at the table, craft Plank: Wood -1, Plank +4. Craft Torch: a Torch appears in your Backpack.
3. Craft Spear without Scrap: "Need 3 Scrap", and **no** Planks were taken.
4. Walk 30 studs away and fire from the client command bar: `game.ReplicatedStorage.Craft:FireServer("Torch")`: "Move closer to a workbench".
5. Fire `Craft:FireServer("Nope")` and `FireServer(123)`: silently ignored.

## Common mistakes
- **Trusting "the UI was open"** as proof the player is at a table. Exploiters fire remotes directly; re-check distance on every craft.
- **Deducting inputs one by one while checking.** If the third check fails, the first two are already gone. Check all, then deduct all.
- **Client-side material counts.** The client reads the IntValues to draw the UI; only the server writes them.
- **Recipes defined twice** (one table in the UI, one on the server) drift apart. One shared ModuleScript, required by both.

## Related
[[Scripting - Hub]] · [[Crafting System Blueprint]] · [[Recipe - Tool Inventory That Saves]] · [[Instance Arguments Over Remotes - Nil, Streaming and Ownership Checks]]
