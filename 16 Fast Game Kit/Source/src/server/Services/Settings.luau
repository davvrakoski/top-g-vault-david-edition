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
