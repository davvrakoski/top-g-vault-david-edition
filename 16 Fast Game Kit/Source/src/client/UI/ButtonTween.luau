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
