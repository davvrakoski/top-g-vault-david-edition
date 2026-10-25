---
area: "16 Fast Game Kit"
cluster: "Starter Code"
tags: [fast-game-kit, roblox, starter-code, ui, mobile]
cssclasses: [tg-a16]
verified: 2026-10-25
---

# Starter Code - 08 Client UI - HUD, Shop and Button Tweens

## Why this matters
Most Roblox players are on phones, and a HUD built in pixels for a laptop ends up under the notch, behind the top bar, or too small to tap. A shop that feels dead (no press feedback) also sells less.
This UI is built in code with scale sizes, aspect-ratio constraints and the core-UI safe area, plus one reusable button-tween helper, so it works on phone, tablet, PC and console without a designer pass.

## Layout rules used

| Rule | How |
|---|---|
| Safe area | Every `ScreenGui` uses `ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets` (the default, set explicitly): content stays clear of the Roblox top bar buttons and device cutouts such as a camera notch |
| Scale, not pixels | Sizes and positions use `UDim2.fromScale`; `UIAspectRatioConstraint` keeps shapes; `UISizeConstraint` stops panels growing huge on a TV |
| Readable text | `TextScaled` with a `UITextSizeConstraint` (max 28-32, min 8) |
| Thumb zone | Menu buttons on the right edge, vertically centered, where a right thumb rests |
| Feedback | `ButtonTween` animates a `UIScale` (hover 1.06, press 0.94), so it never fights `UIListLayout` |
| Input | `Activated` handles mouse, touch and gamepad A; `SelectionGained` gives gamepad navigation the hover state |
| Respawn | `ResetOnSpawn = false` so the UI and its state survive character respawns |

## The code

`Source/src/client/ClientMain.client.luau`

```lua
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
```

`Source/src/client/UI/ButtonTween.luau`

```lua
--!strict
-- ButtonTween: hover / press / gamepad-select feedback for any GuiButton.
-- Animates a UIScale child instead of Size, so it never fights UIListLayout or
-- constraints. Returns a cleanup function that disconnects everything.

local TweenService = game:GetService("TweenService")

local HOVER_SCALE = 1.06
local PRESS_SCALE = 0.94
local TWEEN_INFO = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local ButtonTween = {}

local function isPressInput(input: InputObject): boolean
	return input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch
		or input.KeyCode == Enum.KeyCode.ButtonA
end

function ButtonTween.Attach(button: GuiButton, onActivated: (() -> ())?): () -> ()
	local uiScale: UIScale
	local existing = button:FindFirstChildOfClass("UIScale")
	if existing then
		uiScale = existing
	else
		uiScale = Instance.new("UIScale")
		uiScale.Parent = button
	end

	local hovering = false
	local pressed = false
	local current: Tween? = nil

	local function tweenTo(target: number)
		if current then
			current:Cancel()
		end
		local tween = TweenService:Create(uiScale, TWEEN_INFO, { Scale = target })
		current = tween
		tween:Play()
	end

	local function settle()
		tweenTo(if pressed then PRESS_SCALE elseif hovering then HOVER_SCALE else 1)
	end

	local connections: { RBXScriptConnection } = {
		button.MouseEnter:Connect(function()
			hovering = true
			settle()
		end),
		button.MouseLeave:Connect(function()
			hovering = false
			pressed = false
			settle()
		end),
		button.SelectionGained:Connect(function() -- gamepad / keyboard UI navigation
			hovering = true
			settle()
		end),
		button.SelectionLost:Connect(function()
			hovering = false
			pressed = false
			settle()
		end),
		button.InputBegan:Connect(function(input: InputObject)
			if isPressInput(input) then
				pressed = true
				settle()
			end
		end),
		button.InputEnded:Connect(function(input: InputObject)
			if isPressInput(input) then
				pressed = false
				-- Touch has no "mouse leave": drop the hover state or the button stays big.
				if input.UserInputType == Enum.UserInputType.Touch then
					hovering = false
				end
				settle()
			end
		end),
	}

	if onActivated then
		-- Activated covers mouse click, touch tap and gamepad A in one event.
		table.insert(connections, button.Activated:Connect(function()
			onActivated()
		end))
	end

	return function()
		for _, connection in connections do
			connection:Disconnect()
		end
		if current then
			current:Cancel()
		end
		uiScale.Scale = 1
	end
end

return ButtonTween
```

`Source/src/client/UI/Ui.luau`

```lua
--!strict
-- Ui: tiny builders for scale-based, safe-area-aware UI. All sizes use scale (fractions
-- of the screen) plus aspect-ratio constraints, so layouts hold from phone to TV.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("GameConfig"))
local ButtonTween = require(script.Parent.ButtonTween)

local Theme = GameConfig.Theme

local Ui = {}

-- A ScreenGui kept inside the core-UI safe area (clear of the top bar, notches and cutouts).
function Ui.Screen(name: string, displayOrder: number, parent: Instance): ScreenGui
	local gui = Instance.new("ScreenGui")
	gui.Name = name
	gui.ResetOnSpawn = false -- keep state across respawns
	gui.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	gui.DisplayOrder = displayOrder
	gui.Parent = parent
	return gui
end

function Ui.Corner(parent: GuiObject, radiusScale: number)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(radiusScale, 0)
	corner.Parent = parent
end

function Ui.Aspect(parent: GuiObject, ratio: number)
	local aspect = Instance.new("UIAspectRatioConstraint")
	aspect.AspectRatio = ratio -- width / height
	aspect.Parent = parent
end

-- Scaled text with a max size so it stays readable on big screens.
local function styleText(instance: TextLabel | TextButton | TextBox, maxTextSize: number)
	local label = instance :: any -- the three classes share these properties
	label.Font = Theme.Font
	label.TextColor3 = Theme.Text
	label.TextScaled = true
	label.BackgroundTransparency = 1
	local limit = Instance.new("UITextSizeConstraint")
	limit.MaxTextSize = maxTextSize
	limit.MinTextSize = 8
	limit.Parent = instance
end

function Ui.Label(text: string, size: UDim2, position: UDim2, parent: Instance): TextLabel
	local label = Instance.new("TextLabel")
	label.Text = text
	label.Size = size
	label.Position = position
	styleText(label, 32)
	label.Parent = parent
	return label
end

-- A themed button with tween feedback. Returns the button and its cleanup function.
function Ui.Button(text: string, size: UDim2, parent: Instance, onActivated: () -> ()): (TextButton, () -> ())
	local button = Instance.new("TextButton")
	button.Name = text
	button.Text = text
	button.Size = size
	button.AutoButtonColor = false -- ButtonTween gives the feedback
	styleText(button, 28)
	button.BackgroundTransparency = 0
	button.BackgroundColor3 = Theme.Accent
	button.TextColor3 = Theme.AccentText
	Ui.Corner(button, 0.25)
	button.Parent = parent
	local cleanup = ButtonTween.Attach(button, onActivated)
	return button, cleanup
end

-- A centered modal panel (hidden by default) with a title and a close button.
-- Returns the panel and its content frame.
function Ui.Panel(name: string, title: string, parent: ScreenGui): (Frame, Frame)
	local panel = Instance.new("Frame")
	panel.Name = name
	panel.AnchorPoint = Vector2.new(0.5, 0.5)
	panel.Position = UDim2.fromScale(0.5, 0.5)
	panel.Size = UDim2.fromScale(0.6, 0.75)
	panel.BackgroundColor3 = Theme.Panel
	panel.Visible = false
	Ui.Corner(panel, 0.04)
	Ui.Aspect(panel, 1.4)
	local sizeLimit = Instance.new("UISizeConstraint")
	sizeLimit.MaxSize = Vector2.new(900, 650) -- do not become huge on a TV or 4K monitor
	sizeLimit.Parent = panel
	panel.Parent = parent

	Ui.Label(title, UDim2.fromScale(0.7, 0.12), UDim2.fromScale(0.05, 0.02), panel)

	local close = Ui.Button("X", UDim2.fromScale(0.1, 0.12), panel, function()
		panel.Visible = false
	end)
	close.AnchorPoint = Vector2.new(1, 0)
	close.Position = UDim2.fromScale(0.97, 0.03)
	close.BackgroundColor3 = Theme.Bad
	Ui.Aspect(close, 1)

	local content = Instance.new("Frame")
	content.Name = "Content"
	content.BackgroundTransparency = 1
	content.Position = UDim2.fromScale(0.05, 0.17)
	content.Size = UDim2.fromScale(0.9, 0.78)
	content.Parent = panel

	return panel, content
end

-- Short coin formatting: 950, 1.2K, 3.4M, 5.6B.
function Ui.Abbreviate(value: number): string
	local units = {
		{ size = 1e12, suffix = "T" },
		{ size = 1e9, suffix = "B" },
		{ size = 1e6, suffix = "M" },
		{ size = 1e3, suffix = "K" },
	}
	for _, unit in units do
		if value >= unit.size then
			local text = string.format("%.1f", value / unit.size):gsub("%.0$", "")
			return text .. unit.suffix
		end
	end
	return tostring(math.floor(value))
end

return Ui
```

`Source/src/client/Controllers/Hud.luau`

```lua
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
```

`Source/src/client/Controllers/ShopPanel.luau`

```lua
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
```

## How to use

- **Restyle:** change `GameConfig.Theme` (colors, `Enum.Font.BuilderSansBold`). Every builder reads it.
- **Add a HUD button:** add `{ text = "Pets", action = PetsPanel.Toggle }` to `buttons` in `Hud.Start`.
- **Add a panel:** copy `SettingsPanel` (note 09): `Ui.Panel(name, title, menuScreen)` returns the panel and its content frame; expose `Start(screen)` and `Toggle()`, wire them in `ClientMain`.
- **Use the tween on your own buttons** (including ones made in Studio):

```lua
local ButtonTween = require(script.Parent.UI.ButtonTween)
local cleanup = ButtonTween.Attach(myButton, function()
	print("pressed")
end)
-- later, if the button is destroyed or reused: cleanup()
```

- **Shop contents** come from `GameConfig`: products and passes with a non-zero `Id` and every `ShopItems` entry. Robux prices are read live with `MarketplaceService:GetProductInfoAsync(id, Enum.InfoType.Product / GamePass)` (`PriceInRobux`), so price tests and regional prices show correctly.
- **Toasts:** `Hud.Toast("text", isError)` from any client module; the server sends them with `Remotes.Server.Fire("Notify", player, text)`.
- **Hand-made UI instead:** keep the controllers' logic and replace the builder calls with references to your Studio-made `ScreenGui` (put it in StarterGui, not in the Rojo-synced `Client` folder).

## Common mistakes

- **`ScreenInsets = None` (or `IgnoreGuiInset = true`) on interactive UI.** Buttons slide under the top bar or the notch. Use `None` only for full-screen backgrounds.
- **Offset (pixel) sizes.** Fine on your monitor, tiny on a phone, huge on a TV.
- **Tweening `Size` for hover effects** inside layouts. The layout fights the tween; scale a `UIScale` instead.
- **Hover state stuck on mobile.** A tap can fire `MouseEnter` with no matching `MouseLeave`, leaving the button enlarged; `ButtonTween` clears hover on touch release.
- **Granting from the client** after a prompt closes. The client only prompts; `ProcessReceipt` and `BuyItem` grant on the server.
- **Hard-coded "R$ 49" labels.** They go stale the moment you run a price test.
- **Waiting on remotes while building UI.** The HUD draws first; remote waits run in `task.spawn`.

## Checklist

- [ ] Device emulator in Studio: a small phone, a tablet, 1080p and a TV resolution. Nothing under the top bar or notch; buttons at least thumb-sized.
- [ ] Gamepad: every button reachable with UI navigation and shows the hover scale when selected.
- [ ] Currency counter updates instantly after buying, claiming and redeeming.
- [ ] Shop shows real Robux prices after publishing (IDs set), "Owned" after a pass purchase without rejoining.
- [ ] UI survives a character reset.

**Related:** [[Starter Code - Hub]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]] · [[TweenService UI Animation Recipes]] · [[Shop UX, Pricing and Player Trust]] · [[ScreenInsets]] · [[Starter Code - 09 Settings and SoundGroups]]
