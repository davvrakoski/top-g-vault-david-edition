---
area: "16 Fast Game Kit"
cluster: "Starter Code"
tags: [fast-game-kit, roblox, starter-code, settings, audio]
cssclasses: [tg-a16]
verified: 2026-10-25
---

# Starter Code - 09 Settings and SoundGroups

## Why this matters
Players who cannot turn the music down leave (or mute the whole device and miss your sound design). Volume that resets every session feels broken.
This pair gives two sliders' worth of control (music and SFX, in 10% steps) that apply instantly on the client and are saved in player data by the server.

## How it works

1. `default.project.json` creates two `SoundGroup`s in `SoundService`: `Music` (0.5) and `SFX` (0.8).
2. Every `Sound` in the game sets its **`SoundGroup` property** to one of them. Parenting a Sound under a SoundGroup does not assign it; the property does (official `SoundGroup` docs).
3. `SettingsPanel` changes `SoundGroup.Volume` on the client. Property changes made on a client stay on that client, so each player hears their own mix.
4. Each change is sent with `SetSetting(key, value)`; the server checks `key` is `"music"` or `"sfx"` and `value` is a finite number in 0..1, rounds it to 2 decimals and stores it in `data.settings`.
5. On join, the client asks `GetSettings` (the server waits for the data) and applies the saved values.

`SoundGroup.Volume` is a multiplier from 0 to 10; the kit keeps it in 0..1 so "100%" means the mix you designed.

> [!warning] SoundGroups vs the Audio API
> The official **Sound groups** guide now says `SoundGroup` objects are discouraged in favor of the newer audio objects (`AudioPlayer` -> `AudioFader` -> `AudioDeviceOutput`, connected by `Wire`s). SoundGroups still work and are the quickest path for a starter place built on `Sound` objects. If your game uses the Audio API, keep this exact settings flow and change only `apply()` in `SettingsPanel` to set `AudioFader.Volume` on a `Music` and an `SFX` fader instead ([[Audio Mixing and Dynamic Music with the Audio API]]).

## The code

`Source/src/server/Services/Settings.luau`

```lua
--!strict
-- Settings: per-player audio volumes stored in player data.
-- The client applies volumes locally (SoundGroup changes made on a client only affect that
-- client); the server only validates and saves them.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = require(ReplicatedStorage.Shared.Remotes)
local PlayerData = require(script.Parent.PlayerData)
local Analytics = require(script.Parent.Analytics)

local Check = Remotes.Check

export type SettingsData = { music: number, sfx: number }

local SETTING_KEYS = { "music", "sfx" }

local Settings = {}

function Settings.Start()
	-- Client asks for its saved settings once at startup (waits for the data to load).
	Remotes.Server.OnInvoke("GetSettings", { args = {}, rate = 1, burst = 3 }, function(player: Player): SettingsData?
		local session = PlayerData.AwaitLoaded(player, 30)
		if not session then
			return nil
		end
		return { music = session.data.settings.music, sfx = session.data.settings.sfx }
	end)

	-- Slider/buttons send changes; the limit allows quick taps but not spam.
	Remotes.Server.OnEvent(
		"SetSetting",
		{ args = { Check.OneOf(SETTING_KEYS), Check.Number(0, 1) }, rate = 4, burst = 8 },
		function(player: Player, key: string, value: number)
			local data = PlayerData.GetData(player)
			if not data then
				return
			end
			local rounded = math.round(value * 100) / 100
			local settings = data.settings :: { [string]: number }
			if settings[key] == rounded then
				return
			end
			settings[key] = rounded
			PlayerData.MarkDirty(player)
			if rounded == 0 then
				-- Log only mutes: one event per decision, not one per button tap (rate budget).
				Analytics.Custom(player, "SettingsChanged", 1, key .. "Muted")
			end
		end
	)
end

return Settings
```

`Source/src/client/Controllers/SettingsPanel.luau`

```lua
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
```

## How to use

- **Assign sounds:** for each `Sound`, set `SoundGroup` to `SoundService.Music` or `SoundService.SFX` (in Studio's Properties, or `sound.SoundGroup = SoundService.SFX` in code when you create it).
- **Change defaults:** `GameConfig.Audio.DefaultMusic` / `DefaultSfx` (new players) and the `Volume` values in `default.project.json` (before the client applies settings).
- **Add a setting** (for example camera shake on/off): add the field to `DataTemplate` (`settings.shake = true`), add the key and a validator to the `SetSetting` remote (or a second remote for booleans), return it from `GetSettings`, and add a row to the panel.
- **Analytics:** only mutes are logged (`SettingsChanged`, field `musicMuted` / `sfxMuted`), so tapping +/- does not burn the analytics rate limit.

## Common mistakes

- **Sounds not assigned to a group.** They ignore the sliders. Search the place for Sounds with an empty `SoundGroup`.
- **Changing volume on the server.** It would change it for everyone (and replicate). Volume is a client decision; the server only stores it.
- **Saving every slider tick straight to the data store.** The kit marks data dirty and lets autosave write it; never call a data store per tap.
- **Not validating the value.** `NaN` or `1e9` would be saved and break the mix. `Check.Number(0, 1)` rejects both.
- **Panel built in a Rojo-synced folder in Studio.** It gets deleted on the next sync; build UI in code or in StarterGui.

## Checklist

- [ ] Every Sound has `SoundGroup` set (music to `Music`, everything else to `SFX`).
- [ ] Music at 0% is silent, SFX at 0% is silent, and both persist after rejoining a different server.
- [ ] Spamming +/- stays smooth and never errors.
- [ ] Settings panel reachable on phone, PC and gamepad.

**Related:** [[Starter Code - Hub]] · [[Player Settings, Persistence and Device Profiles]] · [[Settings and Accessibility Blueprint]] · [[Audio Mixing and Dynamic Music with the Audio API]] · [[Sound groups]] · [[SoundGroup]] · [[Starter Code - 08 Client UI - HUD, Shop and Button Tweens]]
