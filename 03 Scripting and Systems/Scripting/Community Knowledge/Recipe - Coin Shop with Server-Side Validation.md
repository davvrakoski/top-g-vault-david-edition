---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Coin Shop with Server-Side Validation"
tags: [roblox, community-knowledge, scripting, recipe, luau, shop, currency, remotefunction, security, ui]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/events/remote
  - https://create.roblox.com/docs/scripting/security/client-server-boundary
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://create.roblox.com/docs/reference/engine/classes/RemoteFunction
---
# Recipe - Coin Shop with Server-Side Validation

An in-game shop where players spend earned coins (not Robux) on tools. The UI is built from one shared catalog, and the server is the only place where prices, balances and ownership are checked. "Shop gives free items" is one of the most common exploits in new Roblox games, almost always because the client sent the price or the server trusted an item name without looking it up.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `ShopCatalog` | ModuleScript | `ReplicatedStorage` (shared: UI reads it, server trusts it) |
| `CoinShop` | Script | `ServerScriptService` |
| `ShopClient` | LocalScript | `StarterGui > ShopGui` (with a `ScrollingFrame` named `List`) |
| `PlayerData`, `ToolInventory` | ModuleScripts | from [[Recipe - Developer Product Shop with Safe ProcessReceipt]] and [[Recipe - Tool Inventory That Saves]] |

Why the catalog can live in ReplicatedStorage: a client can *read* it (and even change its own copy), but the server requires **its own** copy, which the client cannot touch.

## Catalog
```lua
-- ReplicatedStorage/ShopCatalog (ModuleScript)
return {
	{ id = "Sword", name = "Iron Sword", price = 150 },
	{ id = "Grapple", name = "Grapple Hook", price = 600 },
	{ id = "Jetpack", name = "Jetpack", price = 2500 },
}
-- each id must match a Tool name in ServerStorage > Tools
```

## Server
```lua
-- ServerScriptService/CoinShop (Script)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local PlayerData = require(ServerScriptService:WaitForChild("PlayerData"))
local ToolInventory = require(ServerScriptService:WaitForChild("ToolInventory"))
local catalog = require(ReplicatedStorage:WaitForChild("ShopCatalog"))

local byId = {}
for _, item in catalog do byId[item.id] = item end

local MIN_INTERVAL = 0.5
local lastRequest: {[Player]: number} = {}

local buy = Instance.new("RemoteFunction")
buy.Name = "BuyItem"
buy.Parent = ReplicatedStorage

local getOwned = Instance.new("RemoteFunction")
getOwned.Name = "GetOwnedItems"
getOwned.Parent = ReplicatedStorage

buy.OnServerInvoke = function(player: Player, itemId: unknown)
	-- 1. rate limit
	local now = os.clock()
	if now - (lastRequest[player] or 0) < MIN_INTERVAL then
		return { ok = false, reason = "slow down" }
	end
	lastRequest[player] = now

	-- 2. validate the argument type and look it up in the SERVER's catalog
	if type(itemId) ~= "string" then return { ok = false, reason = "bad request" } end
	local item = byId[itemId]
	if not item then return { ok = false, reason = "unknown item" } end

	-- 3. check state
	local data = PlayerData.get(player)
	if not data then return { ok = false, reason = "data not loaded" } end
	if data.Owned[item.id] then return { ok = false, reason = "already owned" } end
	if data.Coins < item.price then return { ok = false, reason = "not enough coins" } end

	-- 4. apply: take coins first, then give; undo if the give fails
	PlayerData.addCoins(player, -item.price)
	if not ToolInventory.give(player, item.id) then
		PlayerData.addCoins(player, item.price)
		return { ok = false, reason = "item unavailable" }
	end
	return { ok = true, coins = data.Coins }
end

getOwned.OnServerInvoke = function(player: Player)
	local data = PlayerData.waitFor(player, 10)
	if not data then return {} end
	local list = {}
	for id in data.Owned do table.insert(list, id) end
	return list
end

Players.PlayerRemoving:Connect(function(player) lastRequest[player] = nil end)
```

## Client
```lua
-- StarterGui/ShopGui/ShopClient (LocalScript)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local catalog = require(ReplicatedStorage:WaitForChild("ShopCatalog"))
local buy = ReplicatedStorage:WaitForChild("BuyItem") :: RemoteFunction
local getOwned = ReplicatedStorage:WaitForChild("GetOwnedItems") :: RemoteFunction

local list = script.Parent:WaitForChild("List") :: ScrollingFrame
local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 6)
layout.Parent = list
list.AutomaticCanvasSize = Enum.AutomaticSize.Y

local owned = {}
local ok, ownedList = pcall(getOwned.InvokeServer, getOwned)
if ok then for _, id in ownedList do owned[id] = true end end

for i, item in catalog do
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, -8, 0, 44)
	button.LayoutOrder = i
	button.TextScaled = true
	button.Text = if owned[item.id] then `{item.name} - owned` else `{item.name} - {item.price} coins`
	button.Parent = list

	button.Activated:Connect(function()
		if owned[item.id] then return end
		button.Active = false
		local success, reply = pcall(buy.InvokeServer, buy, item.id) -- send the id only, never a price
		if success and reply.ok then
			owned[item.id] = true
			button.Text = `{item.name} - owned`
		else
			local reason = if success then reply.reason else "network error"
			button.Text = `{item.name} - {reason}`
			task.delay(1.5, function()
				if not owned[item.id] then button.Text = `{item.name} - {item.price} coins` end
			end)
		end
		button.Active = true
	end)
end
```

## How to test
1. Add Tools named `Sword`, `Grapple`, `Jetpack` to `ServerStorage > Tools`. Give yourself coins from the server command bar: `require(game.ServerScriptService.PlayerData).addCoins(game.Players:GetPlayers()[1], 1000)`.
2. Buy the Sword: coins drop by 150, the Sword appears, the button says owned. Buy again: "already owned".
3. Try the Jetpack with too few coins: "not enough coins", balance unchanged.
4. Exploit tests from the **client** command bar: `game.ReplicatedStorage.BuyItem:InvokeServer("Admin")` gives "unknown item"; `InvokeServer({})` gives "bad request"; editing the client's `ShopCatalog` copy to price 0 changes nothing on the server.
5. Spam-click: at most two requests per second are processed.

## Common mistakes
- **Price or reward sent by the client.** The client sends what it wants; the server decides what it costs.
- **Trusting `leaderstats.Coins` as the balance.** It is a display mirror; the server-side data table is the truth.
- **Deducting after giving** with code that can error in between: free items. Deduct first, refund on failure.
- **RemoteFunction returning instances or yielding forever.** Return plain tables; see [[RemoteFunction Pitfalls - InvokeClient, Yields and Timeouts]].
- Fuzz your remotes before launch: [[RemoteEvent Fuzzing - Bad Input Tests Before Launch]].

## Related
[[Scripting - Hub]] · [[Secure Shop and Currency Blueprint]] · [[Recipe - Tool Inventory That Saves]] · [[RemoteEvent Fuzzing - Bad Input Tests Before Launch]]
