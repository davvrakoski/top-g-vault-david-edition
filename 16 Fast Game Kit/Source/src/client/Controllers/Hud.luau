--!strict
-- Hud: currency counter (top-left), menu buttons (right side, thumb zone on phones) and
-- toast messages (top-center). The counter reads leaderstats, which only the server writes.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local GameConfig = require(Shared:WaitForChild("GameConfig"))
local Remotes = require(Shared:WaitForChild("Remotes"))
local Ui = require(script.Parent.Parent.UI.Ui)

local Theme = GameConfig.Theme
local player = Players.LocalPlayer

export type Actions = {
	onShop: () -> (),
	onDaily: () -> (),
	onSettings: () -> (),
}

local Hud = {}

local toastLabel: TextLabel? = nil
local toastToken = 0

function Hud.Toast(message: string, isError: boolean?)
	local label = toastLabel
	if not label then
		return
	end
	toastToken += 1
	local myToken = toastToken
	label.Text = message
	label.TextColor3 = if isError then Theme.Bad else Theme.Text
	label.Visible = true
	task.delay(2.5, function()
		if toastToken == myToken then -- a newer toast replaced this one
			label.Visible = false
		end
	end)
end

local function bindCounter(counter: TextLabel)
	local leaderstats = player:WaitForChild("leaderstats", 60)
	local stat = if leaderstats then leaderstats:WaitForChild(GameConfig.Currency.Name, 10) else nil
	if not (stat and stat:IsA("IntValue")) then
		counter.Text = "--"
		return
	end
	local function refresh()
		counter.Text = Ui.Abbreviate(stat.Value) .. " " .. GameConfig.Currency.Name
	end
	stat.Changed:Connect(refresh)
	refresh()
end

function Hud.Start(screen: ScreenGui, actions: Actions)
	-- Currency pill, top-left inside the safe area.
	local pill = Instance.new("Frame")
	pill.Name = "CurrencyPill"
	pill.BackgroundColor3 = Theme.Background
	pill.BackgroundTransparency = 0.2
	pill.Position = UDim2.fromScale(0.01, 0.02)
	pill.Size = UDim2.fromScale(0.2, 0.08)
	Ui.Corner(pill, 0.5)
	Ui.Aspect(pill, 3.5)
	pill.Parent = screen
	local counter = Ui.Label("...", UDim2.fromScale(0.84, 0.8), UDim2.fromScale(0.08, 0.1), pill)
	counter.TextColor3 = Theme.Accent

	-- Menu buttons, right edge, vertically centered.
	local menu = Instance.new("Frame")
	menu.Name = "Menu"
	menu.BackgroundTransparency = 1
	menu.AnchorPoint = Vector2.new(1, 0.5)
	menu.Position = UDim2.fromScale(0.99, 0.5)
	menu.Size = UDim2.fromScale(0.12, 0.45)
	menu.Parent = screen
	local list = Instance.new("UIListLayout")
	list.Padding = UDim.new(0.04, 0)
	list.HorizontalAlignment = Enum.HorizontalAlignment.Right
	list.VerticalAlignment = Enum.VerticalAlignment.Center
	list.SortOrder = Enum.SortOrder.LayoutOrder
	list.Parent = menu

	local buttons: { { text: string, action: () -> () } } = {
		{ text = "Shop", action = actions.onShop },
		{ text = "Daily", action = actions.onDaily },
		{ text = "Settings", action = actions.onSettings },
	}
	for index, entry in buttons do
		local button = Ui.Button(entry.text, UDim2.fromScale(1, 0.28), menu, entry.action)
		button.LayoutOrder = index
		Ui.Aspect(button, 2.2)
	end

	-- Toast line under the top bar.
	local toast = Ui.Label("", UDim2.fromScale(0.5, 0.06), UDim2.fromScale(0.5, 0.1), screen)
	toast.AnchorPoint = Vector2.new(0.5, 0)
	toast.Visible = false
	toastLabel = toast

	-- In its own thread: waiting for the remote must not delay drawing the HUD.
	task.spawn(function()
		Remotes.Client.On("Notify", function(message: any)
			if type(message) == "string" then
				Hud.Toast(message)
			end
		end)
	end)

	task.spawn(bindCounter, counter)
end

return Hud
