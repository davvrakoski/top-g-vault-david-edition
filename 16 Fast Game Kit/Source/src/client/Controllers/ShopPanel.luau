--!strict
-- ShopPanel: coin packs (developer products), passes and coin items, plus a code box.
-- The client only PROMPTS purchases; the server grants them (ProcessReceipt, BuyItem).

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local GameConfig = require(Shared:WaitForChild("GameConfig"))
local Remotes = require(Shared:WaitForChild("Remotes"))
local Ui = require(script.Parent.Parent.UI.Ui)
local Hud = require(script.Parent.Hud)

local Theme = GameConfig.Theme
local player = Players.LocalPlayer

local ShopPanel = {}

local panel: Frame? = nil
local owned: { [string]: boolean } = {}
local itemButtons: { [string]: TextButton } = {}

local function row(parent: Instance, order: number): Frame
	local frame = Instance.new("Frame")
	frame.BackgroundColor3 = Theme.Background
	frame.Size = UDim2.fromScale(1, 0.16)
	frame.LayoutOrder = order
	Ui.Corner(frame, 0.2)
	frame.Parent = parent
	return frame
end

local function addEntry(list: ScrollingFrame, order: number, title: string, buttonText: string, onBuy: () -> ()): TextButton
	local frame = row(list, order)
	Ui.Label(title, UDim2.fromScale(0.6, 0.8), UDim2.fromScale(0.03, 0.1), frame).TextXAlignment = Enum.TextXAlignment.Left
	local button = Ui.Button(buttonText, UDim2.fromScale(0.32, 0.7), frame, onBuy)
	button.AnchorPoint = Vector2.new(1, 0.5)
	button.Position = UDim2.fromScale(0.97, 0.5)
	return button
end

-- Real Robux price from the platform (prices can change with price tests / regional pricing).
local function fillPrice(button: TextButton, id: number, infoType: Enum.InfoType, isOwned: (() -> boolean)?)
	task.spawn(function()
		local ok, info = pcall(MarketplaceService.GetProductInfoAsync, MarketplaceService, id, infoType)
		if isOwned and isOwned() then
			return -- keep the "Owned" label
		end
		if ok and type(info) == "table" and type(info.PriceInRobux) == "number" then
			button.Text = "R$ " .. info.PriceInRobux
		end
	end)
end

local function refreshItems()
	for key, button in itemButtons do
		if owned[key] then
			button.Text = "Owned"
			button.BackgroundColor3 = Theme.Muted
		end
	end
end

local function buildList(content: Frame)
	local list = Instance.new("ScrollingFrame")
	list.BackgroundTransparency = 1
	list.Size = UDim2.fromScale(1, 0.82)
	list.CanvasSize = UDim2.new()
	list.AutomaticCanvasSize = Enum.AutomaticSize.Y
	list.ScrollBarThickness = 6
	list.Parent = content
	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0.015, 0)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = list

	local order = 0
	for _, product in GameConfig.Products do
		if product.Id ~= 0 then
			order += 1
			local button = addEntry(list, order, product.Name, "Buy", function()
				MarketplaceService:PromptProductPurchase(player, product.Id)
			end)
			fillPrice(button, product.Id, Enum.InfoType.Product)
		end
	end
	for _, pass in GameConfig.GamePasses do
		if pass.Id ~= 0 then
			order += 1
			local attribute = "Pass_" .. pass.Key -- set by the server (Monetization)
			local function ownsPass(): boolean
				return player:GetAttribute(attribute) == true
			end
			local button = addEntry(list, order, pass.Name .. ": " .. pass.Description, "Buy", function()
				if not ownsPass() then
					MarketplaceService:PromptGamePassPurchase(player, pass.Id)
				end
			end)
			local function refreshPass()
				if ownsPass() then
					button.Text = "Owned"
					button.BackgroundColor3 = Theme.Muted
				end
			end
			fillPrice(button, pass.Id, Enum.InfoType.GamePass, ownsPass)
			player:GetAttributeChangedSignal(attribute):Connect(refreshPass)
			refreshPass() -- the join-time check may already have finished
		end
	end
	for _, item in GameConfig.ShopItems do
		order += 1
		local label = ("%s (%d %s)"):format(item.Name, item.Price, GameConfig.Currency.Name)
		itemButtons[item.Key] = addEntry(list, order, label, "Buy", function()
			if owned[item.Key] then
				return
			end
			local ok, result = Remotes.Client.Invoke("BuyItem", item.Key)
			if ok and type(result) == "table" then
				Hud.Toast(result.message, not result.ok)
				if result.ok then
					owned[item.Key] = true
					refreshItems()
				end
			else
				Hud.Toast("Shop is busy, try again", true)
			end
		end)
	end

	-- Code box at the bottom.
	local codeRow = Instance.new("Frame")
	codeRow.BackgroundTransparency = 1
	codeRow.Position = UDim2.fromScale(0, 0.85)
	codeRow.Size = UDim2.fromScale(1, 0.14)
	codeRow.Parent = content
	local box = Instance.new("TextBox")
	box.PlaceholderText = "Enter code"
	box.Text = ""
	box.ClearTextOnFocus = false
	box.Font = Theme.Font
	box.TextScaled = true
	box.TextColor3 = Theme.Text
	box.BackgroundColor3 = Theme.Background
	box.Size = UDim2.fromScale(0.64, 1)
	Ui.Corner(box, 0.2)
	box.Parent = codeRow
	local redeem = Ui.Button("Redeem", UDim2.fromScale(0.32, 1), codeRow, function()
		local code = box.Text
		if code == "" then
			return
		end
		local ok, result = Remotes.Client.Invoke("RedeemCode", code)
		if ok and type(result) == "table" then
			Hud.Toast(result.message, not result.ok)
			if result.ok then
				box.Text = ""
			end
		else
			Hud.Toast("Slow down and try again", true)
		end
	end)
	redeem.AnchorPoint = Vector2.new(1, 0)
	redeem.Position = UDim2.fromScale(1, 0)
end

function ShopPanel.Start(screen: ScreenGui)
	local frame, content = Ui.Panel("Shop", "Shop", screen)
	panel = frame
	buildList(content)
	task.spawn(function()
		local ok, keys = Remotes.Client.Invoke("GetOwnedItems")
		if ok and type(keys) == "table" then
			for _, key in keys do
				owned[key] = true
			end
			refreshItems()
		end
	end)
end

function ShopPanel.Toggle()
	local frame = panel
	if not frame then
		return
	end
	frame.Visible = not frame.Visible
	if frame.Visible then
		Remotes.Client.Fire("ShopOpened")
	end
end

return ShopPanel
