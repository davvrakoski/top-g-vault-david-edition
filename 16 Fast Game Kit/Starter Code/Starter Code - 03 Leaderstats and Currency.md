---
area: "16 Fast Game Kit"
cluster: "Starter Code"
tags: [fast-game-kit, roblox, starter-code, currency, leaderstats]
cssclasses: [tg-a16]
verified: 2026-10-25
---

# Starter Code - 03 Leaderstats and Currency

## Why this matters
If a client can say "give me 500 coins", someone will. Currency must change in exactly one server module that validates every amount and can never go negative.
`Currency` is that module: it owns the balance in player data, mirrors it to `leaderstats` for the player list and HUD, and logs every source and sink for the Economy dashboard. `Shop` shows the pattern for spending it.

## The rules it enforces

- Amounts must be whole, positive, finite numbers (`NaN`, `inf`, `-5`, `2.5` are rejected) and no bigger than `Currency.Max`.
- `Spend` checks and deducts in the same frame (no yield in between), so two rapid requests can never overspend.
- The balance is capped at `Currency.Max` (default 1 trillion), far inside `IntValue`'s 64-bit range.
- `leaderstats` is created only after data loads, so the board never flashes a fake 0, and the folder name is exactly `leaderstats` (lowercase), which the player list requires.
- Every change logs `LogEconomyEvent` with the post-change balance (`Source` for adds, `Sink` for spends).

## The code

`Source/src/server/Services/Currency.luau`

```lua
--!strict
-- Currency: the only code allowed to change a player's soft currency.
-- Server-authoritative: amounts are validated, balances never go negative, every change
-- updates leaderstats, marks the save dirty and logs an analytics economy event.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.Shared.GameConfig)
local PlayerData = require(script.Parent.PlayerData)
local Analytics = require(script.Parent.Analytics)

local CURRENCY_NAME = GameConfig.Currency.Name
local MAX_BALANCE = GameConfig.Currency.Max

local Currency = {}

-- A positive whole number, not NaN/inf, no bigger than the cap.
local function isValidAmount(amount: any): boolean
	return type(amount) == "number"
		and amount == amount
		and amount > 0
		and amount <= MAX_BALANCE
		and math.floor(amount) == amount
end

local function updateLeaderstat(player: Player, balance: number)
	local leaderstats = player:FindFirstChild("leaderstats")
	local stat = if leaderstats then leaderstats:FindFirstChild(CURRENCY_NAME) else nil
	if stat and stat:IsA("IntValue") then
		stat.Value = balance
	end
end

function Currency.Get(player: Player): number
	local data = PlayerData.GetData(player)
	return if data then data.coins else 0
end

function Currency.CanAfford(player: Player, amount: number): boolean
	return isValidAmount(amount) and Currency.Get(player) >= amount
end

-- Add currency. Returns (success, newBalance). The balance is capped at Currency.Max.
-- transactionType: Enum.AnalyticsEconomyTransactionType.<X>.Name or your own (max 20).
function Currency.Add(player: Player, amount: number, transactionType: string, itemSku: string?): (boolean, number)
	if not isValidAmount(amount) then
		warn("[Currency] invalid add amount " .. tostring(amount))
		return false, Currency.Get(player)
	end
	local data = PlayerData.GetData(player)
	if not data then
		return false, 0
	end
	local before = data.coins
	data.coins = math.min(before + amount, MAX_BALANCE)
	PlayerData.MarkDirty(player)
	updateLeaderstat(player, data.coins)
	Analytics.Economy(player, Enum.AnalyticsEconomyFlowType.Source, data.coins - before, data.coins, transactionType, itemSku)
	return true, data.coins
end

-- Spend currency. Fails (and changes nothing) if the amount is invalid or unaffordable.
-- Check and deduct happen with no yield in between, so two calls can never overspend.
function Currency.Spend(player: Player, amount: number, transactionType: string, itemSku: string?): (boolean, number)
	if not isValidAmount(amount) then
		warn("[Currency] invalid spend amount " .. tostring(amount))
		return false, Currency.Get(player)
	end
	local data = PlayerData.GetData(player)
	if not data or data.coins < amount then
		return false, if data then data.coins else 0
	end
	data.coins -= amount
	PlayerData.MarkDirty(player)
	updateLeaderstat(player, data.coins)
	Analytics.Economy(player, Enum.AnalyticsEconomyFlowType.Sink, amount, data.coins, transactionType, itemSku)
	return true, data.coins
end

function Currency.Start()
	-- leaderstats is created only after data loads, so the board never shows a fake 0.
	PlayerData.OnLoaded(function(player: Player, session: PlayerData.Session)
		local leaderstats = Instance.new("Folder")
		leaderstats.Name = "leaderstats" -- exact lowercase name the player list looks for
		local stat = Instance.new("IntValue")
		stat.Name = CURRENCY_NAME
		stat.Value = session.data.coins
		stat.Parent = leaderstats
		leaderstats.Parent = player
	end)
end

return Currency
```

`Source/src/server/Services/Shop.luau`

```lua
--!strict
-- Shop: buy permanent items with soft currency (server validates everything) and the
-- "Shop" analytics funnel: 1 Opened -> 2 Bought.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.Shared.GameConfig)
local Remotes = require(ReplicatedStorage.Shared.Remotes)
local PlayerData = require(script.Parent.PlayerData)
local Currency = require(script.Parent.Currency)
local Analytics = require(script.Parent.Analytics)

local Check = Remotes.Check

local itemsByKey: { [string]: GameConfig.ShopItem } = {}
local itemKeys: { string } = {}
for _, item in GameConfig.ShopItems do
	itemsByKey[item.Key] = item
	table.insert(itemKeys, item.Key)
end

local shopSessions: { [Player]: string } = {} -- current funnel session per player

local Shop = {}

export type BuyResult = { ok: boolean, message: string, balance: number? }

function Shop.Owns(player: Player, itemKey: string): boolean
	local data = PlayerData.GetData(player)
	return data ~= nil and data.ownedItems[itemKey] == true
end

function Shop.Buy(player: Player, itemKey: string): BuyResult
	local item = itemsByKey[itemKey]
	if not item then
		return { ok = false, message = "Unknown item" }
	end
	local data = PlayerData.GetData(player)
	if not data then
		return { ok = false, message = "Your data is still loading" }
	end
	if data.ownedItems[itemKey] then
		return { ok = false, message = "You already own " .. item.Name }
	end
	local paid, balance = Currency.Spend(player, item.Price, Enum.AnalyticsEconomyTransactionType.Shop.Name, item.Key)
	if not paid then
		return { ok = false, message = "Not enough " .. GameConfig.Currency.Name, balance = balance }
	end
	data.ownedItems[itemKey] = true -- same frame as the spend: no yield in between
	PlayerData.MarkDirty(player)
	Analytics.Custom(player, "ShopItemBought", item.Price, item.Key)
	local funnelSession = shopSessions[player]
	if funnelSession then
		Analytics.FunnelStep(player, "Shop", funnelSession, 2, "Bought")
	end
	return { ok = true, message = "Bought " .. item.Name, balance = balance }
end

function Shop.Start()
	Remotes.Server.OnInvoke("BuyItem", { args = { Check.OneOf(itemKeys) }, rate = 2, burst = 4 }, function(player: Player, itemKey: string): BuyResult
		return Shop.Buy(player, itemKey)
	end)

	-- Returns the list of owned item keys once data is loaded.
	Remotes.Server.OnInvoke("GetOwnedItems", { args = {}, rate = 1, burst = 3 }, function(player: Player): { string }?
		local session = PlayerData.AwaitLoaded(player, 30)
		if not session then
			return nil
		end
		local owned = {}
		for key, isOwned in session.data.ownedItems do
			if isOwned then
				table.insert(owned, key)
			end
		end
		return owned
	end)

	-- Client tells us the shop UI opened: funnel step 1 (analytics only, nothing granted).
	Remotes.Server.OnEvent("ShopOpened", { args = {}, rate = 0.5, burst = 3 }, function(player: Player)
		local sessionId = Analytics.NewFunnelSession()
		shopSessions[player] = sessionId
		Analytics.FunnelStep(player, "Shop", sessionId, 1, "Opened")
	end)

	Players.PlayerRemoving:Connect(function(player: Player)
		shopSessions[player] = nil
	end)
end

return Shop
```

## How to use

```lua
-- From any server module (require Currency at the top):
local ok, balance = Currency.Add(player, 25, Enum.AnalyticsEconomyTransactionType.Gameplay.Name, "ZombieKill")
local paid = Currency.Spend(player, 100, Enum.AnalyticsEconomyTransactionType.ContextualPurchase.Name, "Revive")
if paid then
	-- grant the thing in the same frame, before any yield
end
```

- `transactionType` takes the `.Name` of an `Enum.AnalyticsEconomyTransactionType` item (`IAP`, `Shop`, `Gameplay`, `ContextualPurchase`, `TimedReward`, `Onboarding`) or your own string; after 20 distinct values the dashboard groups the rest as "Other".
- `itemSku` is the item or source name (low cardinality: after 100 SKUs they group as "Other").
- Coin items: add entries to `GameConfig.ShopItems`. The client calls the `BuyItem` remote with the item key; the server checks the key is one of the configured keys, that it is not owned, and that the player can pay.
- A second currency (gems): copy the pattern with its own field in `DataTemplate`, its own `IntValue`, and its own analytics currency name. Plan for at most 5 currencies on the Economy dashboard.

## Common mistakes

- **Trusting a price or amount sent by the client.** `BuyItem` only accepts an item key; the price comes from `GameConfig` on the server.
- **Changing `leaderstats` values directly from other scripts.** The save would not change. Always go through `Currency.Add` / `Spend`.
- **Yielding between the check and the grant** (a data store call, `task.wait`, a `RemoteFunction` round trip). Another request can slip in and spend the same coins twice.
- **Logging economy events with a negative amount or before the change.** The docs require a positive amount and a balance `>= 0` after the change.
- **One analytics currency per item or class** ("MageXP", "WarriorXP"). Use one currency and put the variety in custom fields.
- **Floating-point currency.** Keep soft currency in whole numbers; fractional prices drift and break equality checks.

## Checklist

- [ ] No script other than `Currency` writes `data.coins` or the leaderstats value.
- [ ] Every spend path grants in the same frame as `Currency.Spend` returns `true`.
- [ ] Fire `BuyItem` from an exploit-style test with wrong types, unknown keys and spam: nothing granted, no errors.
- [ ] Economy dashboard (after about 24 h on a published game) shows sources and sinks with sensible names.
- [ ] Prices and rewards balanced with [[Economy Sources and Sinks Spreadsheet Model]].

**Related:** [[Starter Code - Hub]] · [[Secure Shop and Currency Blueprint]] · [[First Leaderboard with leaderstats]] · [[Economy events]] · [[Starter Code - 05 Remotes Layer]] · [[Starter Code - 06 Analytics Events]]
