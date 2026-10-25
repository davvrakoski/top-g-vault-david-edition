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
