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
