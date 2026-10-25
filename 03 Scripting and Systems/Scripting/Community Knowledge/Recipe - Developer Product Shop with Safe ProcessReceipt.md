---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Developer Product Shop with Safe ProcessReceipt"
tags: [roblox, community-knowledge, scripting, recipe, luau, monetization, developer-products, processreceipt, datastore, idempotency]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/developer-products
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
  - https://create.roblox.com/docs/cloud-services/data-stores/player-data-purchasing
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore
---
# Recipe - Developer Product Shop with Safe ProcessReceipt

Buttons that sell repeatable Robux items (coin packs, revives) and a `ProcessReceipt` callback that grants each purchase **exactly once**, even if the server crashes, the save fails or the player rejoins. Getting this wrong means players pay and get nothing, or get items twice. The flow below follows the order the official "player data and purchasing" guide gives: check the `PurchaseId` was not already handled, award in memory, record the `PurchaseId`, save, and only return `PurchaseGranted` if the save succeeded.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25). Needs Studio API access on.

## Where it goes
| Script | Type | Location |
|---|---|---|
| `PlayerData` | ModuleScript | `ServerScriptService` |
| `Receipts` | Script | `ServerScriptService` (the **only** script that sets `ProcessReceipt`) |
| `ShopButtons` | LocalScript | `StarterGui > ShopGui` (with `TextButton`s named after product keys) |

`PlayerData` is reused by [[Recipe - Coin Shop with Server-Side Validation]] and [[Recipe - Tool Inventory That Saves]].

## Facts from the docs that shape the code
- `ProcessReceipt` is called for unresolved purchases when the purchase completes **and again when the player joins a server**; returning `NotProcessedYet` means "try me again later".
- It may run for the same purchase on two servers at once if the player hops servers quickly.
- Set it once, in one server Script. If you never set it, receipts are auto-acknowledged and cannot be recovered.
- `receiptInfo` gives `PurchaseId`, `PlayerId`, `ProductId`, `CurrencySpent`, `PlaceIdWherePurchased`.

## PlayerData (minimal, no session lock)
```lua
-- ServerScriptService/PlayerData (ModuleScript)
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local store = DataStoreService:GetDataStore("PlayerData_v1")
local PlayerData = {}
local cache: {[Player]: any} = {}
local failed: {[Player]: boolean} = {}

local function key(player: Player) return "u_" .. player.UserId end

local function retry(fn: () -> any): (boolean, any)
	for i = 1, 3 do
		local ok, result = pcall(fn)
		if ok then return true, result end
		warn("DataStore retry", i, result)
		task.wait(2 ^ i)
	end
	return false, nil
end

local function mirror(player: Player)
	local data = cache[player]
	local stats = player:FindFirstChild("leaderstats")
	if data and stats then stats.Coins.Value = data.Coins end
end

local function load(player: Player)
	local stats = Instance.new("Folder")
	stats.Name = "leaderstats"
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Parent = stats
	stats.Parent = player

	local ok, saved = retry(function() return store:GetAsync(key(player)) end)
	if not player.Parent then return end
	if not ok then
		failed[player] = true
		player:Kick("Could not load your save. Please rejoin in a minute.")
		return
	end
	local data = saved or {}
	data.Coins = data.Coins or 0
	data.Receipts = data.Receipts or {}
	data.Owned = data.Owned or {}
	cache[player] = data
	mirror(player)
end

function PlayerData.get(player: Player) return cache[player] end

function PlayerData.waitFor(player: Player, timeout: number?)
	local started = os.clock()
	while player.Parent and not cache[player] and not failed[player]
		and os.clock() - started < (timeout or 30) do
		task.wait(0.2)
	end
	return cache[player]
end

function PlayerData.addCoins(player: Player, amount: number)
	local data = cache[player]
	if not data then return false end
	data.Coins += amount
	mirror(player)
	return true
end

function PlayerData.save(player: Player): boolean
	local data = cache[player]
	if not data then return false end
	local ok = retry(function()
		return store:UpdateAsync(key(player), function()
			return data, { player.UserId } -- userIds tag the key for erasure requests
		end)
	end)
	return ok
end

Players.PlayerAdded:Connect(load)
for _, p in Players:GetPlayers() do task.spawn(load, p) end
Players.PlayerRemoving:Connect(function(player)
	PlayerData.save(player)
	cache[player] = nil
	failed[player] = nil
end)
game:BindToClose(function()
	local pending = 0
	for _, p in Players:GetPlayers() do
		pending += 1
		task.spawn(function() PlayerData.save(p); pending -= 1 end)
	end
	while pending > 0 do task.wait(0.1) end
end)

return PlayerData
```

## Receipts
```lua
-- ServerScriptService/Receipts (Script)
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local PlayerData = require(ServerScriptService:WaitForChild("PlayerData"))

local MAX_RECEIPTS = 100
local GRANTS = {
	[0000001] = function(player, data) data.Coins += 100 end,   -- replace with your product IDs
	[0000002] = function(player, data) data.Coins += 1200 end,
}

local function trim(receipts)
	local list = {}
	for id, t in receipts do table.insert(list, { id = id, t = t }) end
	if #list <= MAX_RECEIPTS then return end
	table.sort(list, function(a, b) return a.t > b.t end)
	for i = MAX_RECEIPTS + 1, #list do receipts[list[i].id] = nil end
end

MarketplaceService.ProcessReceipt = function(receipt)
	local player = Players:GetPlayerByUserId(receipt.PlayerId)
	if not player then return Enum.ProductPurchaseDecision.NotProcessedYet end

	local data = PlayerData.waitFor(player)
	if not data then return Enum.ProductPurchaseDecision.NotProcessedYet end

	if data.Receipts[receipt.PurchaseId] then
		-- already awarded in this session; make sure it is saved before confirming
		return if PlayerData.save(player)
			then Enum.ProductPurchaseDecision.PurchaseGranted
			else Enum.ProductPurchaseDecision.NotProcessedYet
	end

	local grant = GRANTS[receipt.ProductId]
	if not grant then
		warn("No grant function for product", receipt.ProductId)
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	local ok, err = pcall(grant, player, data)
	if not ok then
		warn("Grant failed:", err)
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	data.Receipts[receipt.PurchaseId] = os.time()
	trim(data.Receipts)
	PlayerData.addCoins(player, 0) -- refresh the leaderstats mirror

	if PlayerData.save(player) then
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	return Enum.ProductPurchaseDecision.NotProcessedYet
end
```

## Client buttons
```lua
-- StarterGui/ShopGui/ShopButtons (LocalScript)
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local PRODUCTS = { Coins100 = 0000001, Coins1200 = 0000002 } -- button name -> product ID

for name, id in PRODUCTS do
	local button = script.Parent:WaitForChild(name) :: TextButton
	button.Activated:Connect(function()
		MarketplaceService:PromptProductPurchase(Players.LocalPlayer, id)
	end)
end
```
The client only opens the prompt. It never adds coins, and it does not use `PromptProductPurchaseFinished` to grant anything.

## How to test
1. Create two developer products (Creator Dashboard > your experience > Monetization > Developer Products), paste their IDs in both scripts.
2. Studio purchases are test purchases (no Robux charged). Buy `Coins100`: Coins +100 and the receipt ID appears in `data.Receipts`.
3. Make `PlayerData.save` return `false` temporarily, buy again: coins show in-session, but the receipt is not confirmed. Restore it and rejoin: the second call finds the `PurchaseId` and confirms without paying twice.
4. More cases (declined prompts, rejoin mid-purchase) in [[Testing Purchases - Developer Products, Passes and ProcessReceipt]].

## Common mistakes
- **Returning `PurchaseGranted` before the save.** A crash then loses the item for good.
- **Two scripts setting `ProcessReceipt`.** The last one wins and the other products silently stop working.
- **Granting in `PromptProductPurchaseFinished`.** It is a UI signal, not a receipt.
- **No session lock.** This minimal module can be overwritten by a stale save from another server during a fast server hop. For live games use ProfileStore or the pattern in [[DataStore Session Locking, Retries, Versioning and Erasure]].

## Related
[[Scripting - Hub]] · [[Testing Purchases - Developer Products, Passes and ProcessReceipt]] · [[Idempotent Transaction Ledger]] · [[ProfileStore in 2026 - Status, Wrappers and Lock Lessons]]
