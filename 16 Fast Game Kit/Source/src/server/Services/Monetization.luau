--!strict
-- Monetization: pass ownership cache + developer products with an idempotent ProcessReceipt.
-- Receipt rule: grant -> record PurchaseId in the save -> save succeeds -> PurchaseGranted.
-- Anything else returns NotProcessedYet, and Roblox delivers the receipt again later
-- (next purchase attempt or next join), where the PurchaseId check stops a double grant.

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.Shared.GameConfig)
local Remotes = require(ReplicatedStorage.Shared.Remotes)
local PlayerData = require(script.Parent.PlayerData)
local Currency = require(script.Parent.Currency)
local Analytics = require(script.Parent.Analytics)

local PASS_ATTRIBUTE_PREFIX = "Pass_" -- player:GetAttribute("Pass_VIP") is readable on the client
local RECEIPT_DATA_WAIT = 60 -- seconds to wait for a joining player's data before giving up

local passKeyById: { [number]: string } = {}
local productById: { [number]: GameConfig.ProductInfo } = {}
for _, pass in GameConfig.GamePasses do
	if pass.Id ~= 0 then
		passKeyById[pass.Id] = pass.Key
	end
end
for _, product in GameConfig.Products do
	if product.Id ~= 0 then
		productById[product.Id] = product
	end
end

local ownedPasses: { [Player]: { [string]: boolean } } = {}

local Monetization = {}

----------------------------------------------------------------------
-- Passes
----------------------------------------------------------------------

local function setPassOwned(player: Player, passKey: string)
	local owned = ownedPasses[player]
	if not owned then
		owned = {}
		ownedPasses[player] = owned
	end
	owned[passKey] = true
	player:SetAttribute(PASS_ATTRIBUTE_PREFIX .. passKey, true)
end

local function checkPass(player: Player, passKey: string, passId: number)
	for attempt = 1, 3 do
		local ok, result = pcall(MarketplaceService.UserOwnsGamePassAsync, MarketplaceService, player.UserId, passId)
		if ok then
			if result == true and player.Parent == Players then
				setPassOwned(player, passKey)
			end
			return
		end
		warn(("[Monetization] pass check %s attempt %d failed: %s"):format(passKey, attempt, tostring(result)))
		task.wait(attempt * 2)
	end
end

-- Cached: safe to call every frame. False until the join-time check finishes.
function Monetization.OwnsPass(player: Player, passKey: string): boolean
	local owned = ownedPasses[player]
	return owned ~= nil and owned[passKey] == true
end

----------------------------------------------------------------------
-- Developer products
----------------------------------------------------------------------

-- Grant handlers must NOT yield: the PurchaseId check, the grant and the record must happen
-- in one go. Add special products here; by default a product grants its Coins.
type GrantHandler = (player: Player, product: GameConfig.ProductInfo) -> ...any

local customHandlers: { [string]: GrantHandler } = {
	-- Example: Coins500 = function(player, product) ... end,
}

local function defaultGrant(player: Player, product: GameConfig.ProductInfo)
	local ok = Currency.Add(player, product.Coins, Enum.AnalyticsEconomyTransactionType.IAP.Name, product.Key)
	if not ok then
		error("Currency.Add failed for " .. product.Key)
	end
end

local function processReceipt(receiptInfo: { [string]: any }): Enum.ProductPurchaseDecision
	local userId = receiptInfo.PlayerId
	local productId = receiptInfo.ProductId
	local purchaseId = receiptInfo.PurchaseId
	if type(userId) ~= "number" or type(productId) ~= "number" or type(purchaseId) ~= "string" then
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end

	local player = Players:GetPlayerByUserId(userId)
	if not player then
		return Enum.ProductPurchaseDecision.NotProcessedYet -- redelivered when they next join
	end

	-- Receipts arrive on join, often before data has loaded: wait for it.
	local session = PlayerData.AwaitLoaded(player, RECEIPT_DATA_WAIT)
	if not session then
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end

	-- Already granted (for example the save succeeded but Roblox never recorded our answer):
	-- do not grant again, just make sure it is saved.
	if PlayerData.HasPurchase(session, purchaseId) then
		return if PlayerData.SaveNow(player)
			then Enum.ProductPurchaseDecision.PurchaseGranted
			else Enum.ProductPurchaseDecision.NotProcessedYet
	end

	local product = productById[productId]
	if not product then
		warn("[Monetization] no product configured for id " .. productId)
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end

	local handler: GrantHandler = customHandlers[product.Key] or defaultGrant
	local granted, err = pcall(handler, player, product)
	if not granted then
		warn("[Monetization] grant failed for " .. product.Key .. ": " .. tostring(err))
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	PlayerData.RecordPurchase(session, purchaseId) -- same frame as the grant

	if session.temporary then
		warn("[Monetization] Studio temporary data: purchase granted but NOT saved")
	elseif not PlayerData.SaveNow(player) then
		-- Grant + PurchaseId stay in memory; the next delivery sees the id and only re-saves.
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end

	Remotes.Server.Fire("Notify", player, ("Thanks! +%d %s"):format(product.Coins, GameConfig.Currency.Name))
	return Enum.ProductPurchaseDecision.PurchaseGranted
end

----------------------------------------------------------------------
-- Start
----------------------------------------------------------------------

function Monetization.Start()
	Remotes.Server.Declare("Notify")

	local function onPlayerAdded(player: Player)
		for passId, passKey in passKeyById do
			task.spawn(checkPass, player, passKey, passId) -- concurrent calls are batched by the engine
		end
	end
	Players.PlayerAdded:Connect(onPlayerAdded)
	for _, player in Players:GetPlayers() do
		onPlayerAdded(player)
	end
	Players.PlayerRemoving:Connect(function(player: Player)
		ownedPasses[player] = nil
	end)

	-- Server-side, wasPurchased reflects the final outcome (MarketplaceService docs).
	MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player: Player, gamePassId: number, wasPurchased: boolean)
		if not wasPurchased then
			return
		end
		local passKey = passKeyById[gamePassId]
		if passKey then
			setPassOwned(player, passKey)
			Analytics.Custom(player, "PassBought", 1, passKey)
			Remotes.Server.Fire("Notify", player, "Pass unlocked: " .. passKey)
		end
	end)

	-- Set exactly once, in one server Script context, for ALL developer products.
	MarketplaceService.ProcessReceipt = processReceipt
end

return Monetization
