--!strict
-- ClientMain: the only LocalScript. Builds the UI and wires the controllers together.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local GameConfig = require(Shared:WaitForChild("GameConfig"))
local Remotes = require(Shared:WaitForChild("Remotes"))
local Ui = require(script.Parent.UI.Ui)
local Hud = require(script.Parent.Controllers.Hud)
local ShopPanel = require(script.Parent.Controllers.ShopPanel)
local SettingsPanel = require(script.Parent.Controllers.SettingsPanel)

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local hudScreen = Ui.Screen("Hud", 1, playerGui)
local menuScreen = Ui.Screen("Menus", 2, playerGui) -- panels draw above the HUD

local function claimDaily()
	local ok, result = Remotes.Client.Invoke("ClaimDaily")
	if ok and type(result) == "table" then
		Hud.Toast(result.message, not result.ok)
	else
		Hud.Toast("Try again in a moment", true)
	end
end

Hud.Start(hudScreen, {
	onShop = ShopPanel.Toggle,
	onDaily = claimDaily,
	onSettings = SettingsPanel.Toggle,
})
ShopPanel.Start(menuScreen)
SettingsPanel.Start(menuScreen)

-- Nudge the player if today's reward is waiting.
task.spawn(function()
	local ok, status = Remotes.Client.Invoke("GetDailyStatus")
	if ok and type(status) == "table" and status.canClaim == true then
		local reward = tonumber(status.reward) or 0
		Hud.Toast(("Daily reward ready: %d %s (tap Daily)"):format(reward, GameConfig.Currency.Name))
	end
end)
