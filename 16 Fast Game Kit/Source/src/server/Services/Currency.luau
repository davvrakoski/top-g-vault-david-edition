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
