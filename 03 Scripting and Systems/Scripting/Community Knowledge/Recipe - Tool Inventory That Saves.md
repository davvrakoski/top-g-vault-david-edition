---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Tool Inventory That Saves"
tags: [roblox, community-knowledge, scripting, recipe, luau, inventory, tools, backpack, startergear, datastore]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/players/tools
  - https://create.roblox.com/docs/reference/engine/classes/Tool
  - https://create.roblox.com/docs/reference/engine/classes/Backpack
  - https://create.roblox.com/docs/reference/engine/classes/StarterGear
---
# Recipe - Tool Inventory That Saves

Players keep the tools they unlocked (swords, flashlights, fishing rods) across deaths **and** across sessions. The trick is to save tool **names**, never Tool instances, and to rebuild them on the server from trusted templates in `ServerStorage`. Each owned tool is put in both the `Backpack` (usable now) and `StarterGear` (copied into the Backpack automatically on every respawn).

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `ToolInventory` | ModuleScript | `ServerScriptService` |
| `ToolInventoryBoot` | Script | `ServerScriptService` |
| tool templates | Tools (named e.g. `Flashlight`, `Sword`) | `ServerStorage > Tools` |
| `PlayerData` | ModuleScript from [[Recipe - Developer Product Shop with Safe ProcessReceipt]] | `ServerScriptService` |

Ownership is stored in `data.Owned`, a set like `{ Flashlight = true, Sword = true }`, inside the same save as coins. One save per player keeps purchases and coins consistent.

## ToolInventory module
```lua
-- ServerScriptService/ToolInventory (ModuleScript)
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local PlayerData = require(ServerScriptService:WaitForChild("PlayerData"))

local templates = ServerStorage:WaitForChild("Tools")
local ToolInventory = {}

local function hasCopy(container: Instance?, toolName: string): boolean
	return container ~= nil and container:FindFirstChild(toolName) ~= nil
end

-- put one copy in Backpack (now) and one in StarterGear (every respawn)
local function equipCopies(player: Player, toolName: string)
	local template = templates:FindFirstChild(toolName)
	if not template or not template:IsA("Tool") then
		warn("Unknown tool template:", toolName)
		return
	end
	local backpack = player:FindFirstChildOfClass("Backpack")
	local gear = player:FindFirstChild("StarterGear")
	local character = player.Character
	if backpack and not hasCopy(backpack, toolName) and not hasCopy(character, toolName) then
		template:Clone().Parent = backpack
	end
	if gear and not hasCopy(gear, toolName) then
		template:Clone().Parent = gear
	end
end

function ToolInventory.owns(player: Player, toolName: string): boolean
	local data = PlayerData.get(player)
	return data ~= nil and data.Owned[toolName] == true
end

-- grant permanently; returns false if data is not loaded or the tool does not exist
function ToolInventory.give(player: Player, toolName: string): boolean
	local data = PlayerData.get(player)
	if not data or not templates:FindFirstChild(toolName) then return false end
	data.Owned[toolName] = true
	equipCopies(player, toolName)
	return true
end

function ToolInventory.take(player: Player, toolName: string)
	local data = PlayerData.get(player)
	if data then data.Owned[toolName] = nil end
	for _, container in { player:FindFirstChildOfClass("Backpack"), player:FindFirstChild("StarterGear"), player.Character } do
		local copy = container and container:FindFirstChild(toolName)
		if copy and copy:IsA("Tool") then copy:Destroy() end
	end
end

-- called once the save has loaded
function ToolInventory.restore(player: Player)
	local data = PlayerData.get(player)
	if not data then return end
	for toolName in data.Owned do
		if templates:FindFirstChild(toolName) then
			equipCopies(player, toolName)
		else
			-- a tool you removed from the game: keep the flag, skip it
		end
	end
end

return ToolInventory
```

## Boot script
```lua
-- ServerScriptService/ToolInventoryBoot (Script)
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local PlayerData = require(ServerScriptService:WaitForChild("PlayerData"))
local ToolInventory = require(ServerScriptService:WaitForChild("ToolInventory"))

local STARTER_TOOLS = { "Flashlight" } -- everyone owns these

local function onPlayer(player: Player)
	if not PlayerData.waitFor(player) then return end
	for _, name in STARTER_TOOLS do
		ToolInventory.give(player, name)
	end
	ToolInventory.restore(player)
end

Players.PlayerAdded:Connect(onPlayer)
for _, p in Players:GetPlayers() do task.spawn(onPlayer, p) end
```

Templates: set `CanBeDropped = false` on each Tool (otherwise Backspace drops it into the world, where anyone can pick it up and the saved flag no longer matches what players hold).

## How to test
1. Put a Tool named `Flashlight` (with a `Handle`) and one named `Sword` in `ServerStorage > Tools`.
2. Play: you start with the Flashlight. In the server command bar: `require(game.ServerScriptService.ToolInventory).give(game.Players:GetPlayers()[1], "Sword")`. The Sword appears.
3. Reset your character: both tools return (StarterGear).
4. Leave and rejoin (API access on): both tools come back from the save.
5. Equip the Sword, then call `give` again: no duplicate (the `Character` is checked too, since an equipped tool lives there).
6. Call `take(player, "Sword")`: it disappears from hand, Backpack and StarterGear.

## Common mistakes
- **Saving Tool objects** or their full property dump. Save names (or item IDs) and rebuild from templates; you can then rebalance a tool for everyone by editing one template.
- **Only cloning into the Backpack.** Everything there is wiped on death; `StarterGear` is what survives respawns.
- **Cloning from `ReplicatedStorage`.** Works, but exposes server scripts inside tools to clients; templates belong in `ServerStorage`.
- **Granting tools from a RemoteEvent argument** ("give me Sword"). The client only asks to *buy*; the server checks price and ownership (see [[Recipe - Coin Shop with Server-Side Validation]]).
- For a custom hotbar on top of these tools, see [[Custom Inventory and Hotbar - Community Approaches]].

## Related
[[Scripting - Hub]] · [[Recipe - Coin Shop with Server-Side Validation]] · [[Tool Security - Equip Checks, Server Cooldowns and Dropped Tools]] · [[First Tool - A Sword or Flashlight You Can Equip]]
