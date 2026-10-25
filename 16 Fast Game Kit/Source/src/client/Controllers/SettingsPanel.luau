--!strict
-- SettingsPanel: music / SFX volume. Applies to SoundService.Music and SoundService.SFX
-- SoundGroups on this client only, then sends the value to the server to save.
-- Every Sound must have its SoundGroup property set to one of the two groups.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local GameConfig = require(Shared:WaitForChild("GameConfig"))
local Remotes = require(Shared:WaitForChild("Remotes"))
local Ui = require(script.Parent.Parent.UI.Ui)

local STEP = 0.1
local GROUP_NAMES: { [string]: string } = { music = "Music", sfx = "SFX" } -- setting key -> SoundGroup

local SettingsPanel = {}

local panel: Frame? = nil
local values: { [string]: number } = {
	music = GameConfig.Audio.DefaultMusic,
	sfx = GameConfig.Audio.DefaultSfx,
}
local valueLabels: { [string]: TextLabel } = {}

local function apply(key: string)
	local group = SoundService:FindFirstChild(GROUP_NAMES[key])
	if group and group:IsA("SoundGroup") then
		group.Volume = values[key] -- SoundGroup.Volume is a multiplier (0..10); we use 0..1
	end
	local label = valueLabels[key]
	if label then
		label.Text = ("%d%%"):format(math.round(values[key] * 100))
	end
end

local function change(key: string, delta: number)
	values[key] = math.clamp(math.round((values[key] + delta) * 10) / 10, 0, 1)
	apply(key)
	Remotes.Client.Fire("SetSetting", key, values[key])
end

local function addRow(content: Frame, key: string, title: string, order: number)
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.Size = UDim2.fromScale(1, 0.22)
	frame.LayoutOrder = order
	frame.Parent = content
	Ui.Label(title, UDim2.fromScale(0.4, 1), UDim2.fromScale(0, 0), frame)
	local minus = Ui.Button("-", UDim2.fromScale(0.15, 0.8), frame, function()
		change(key, -STEP)
	end)
	minus.Position = UDim2.fromScale(0.42, 0.1)
	valueLabels[key] = Ui.Label("", UDim2.fromScale(0.2, 1), UDim2.fromScale(0.6, 0), frame)
	local plus = Ui.Button("+", UDim2.fromScale(0.15, 0.8), frame, function()
		change(key, STEP)
	end)
	plus.Position = UDim2.fromScale(0.83, 0.1)
end

function SettingsPanel.Start(screen: ScreenGui)
	local frame, content = Ui.Panel("Settings", "Settings", screen)
	panel = frame
	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0.04, 0)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = content
	addRow(content, "music", "Music", 1)
	addRow(content, "sfx", "Sound FX", 2)
	apply("music")
	apply("sfx")

	-- Load saved values (the server waits for the player's data).
	task.spawn(function()
		local ok, saved = Remotes.Client.Invoke("GetSettings")
		if ok and type(saved) == "table" then
			for key in GROUP_NAMES do
				local value = saved[key]
				if type(value) == "number" then
					values[key] = math.clamp(value, 0, 1)
					apply(key)
				end
			end
		end
	end)
end

function SettingsPanel.Toggle()
	local frame = panel
	if frame then
		frame.Visible = not frame.Visible
	end
end

return SettingsPanel
