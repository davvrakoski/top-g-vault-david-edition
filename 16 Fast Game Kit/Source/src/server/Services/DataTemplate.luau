--!strict
-- DataTemplate: the save shape, defaults for new players, and ordered schema migrations.
-- Rule: when you change the shape, bump SCHEMA_VERSION and add ONE migration step.
-- Never edit an old step after it has shipped.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameConfig = require(ReplicatedStorage.Shared.GameConfig)

export type Data = {
	coins: number,
	ownedItems: { [string]: boolean }, -- ShopItem.Key -> true
	purchaseHistory: { string }, -- developer product PurchaseIds, oldest first
	redeemedCodes: { [string]: number }, -- CODE -> os.time() when redeemed
	daily: {
		lastClaimDay: number, -- UTC day number (os.time() // 86400); 0 = never
		streak: number,
	},
	settings: {
		music: number, -- 0..1
		sfx: number, -- 0..1
	},
	stats: {
		firstJoin: number, -- os.time()
		joins: number,
	},
}

local DataTemplate = {}

DataTemplate.SCHEMA_VERSION = 3

function DataTemplate.new(): Data
	return {
		coins = GameConfig.Currency.Start,
		ownedItems = {},
		purchaseHistory = {},
		redeemedCodes = {},
		daily = { lastClaimDay = 0, streak = 0 },
		settings = {
			music = GameConfig.Audio.DefaultMusic,
			sfx = GameConfig.Audio.DefaultSfx,
		},
		stats = { firstJoin = os.time(), joins = 0 },
	}
end

-- migrations[n] upgrades data saved at schema n to schema n + 1. Steps must not yield.
-- The two steps below are examples of the kind of change you will make; keep them as a
-- pattern (a brand-new game can delete them and start SCHEMA_VERSION at 1).
local migrations: { [number]: (data: { [string]: any }) -> () } = {
	-- v1 -> v2: the currency field was renamed from "Coins" to "coins".
	[1] = function(data)
		if data.Coins ~= nil and data.coins == nil then
			data.coins = data.Coins
		end
		data.Coins = nil
	end,
	-- v2 -> v3: audio settings were added (reconcile fills defaults; this shows a
	-- data-dependent step: muted players from an older "musicOn" flag stay muted).
	[2] = function(data)
		if data.musicOn == false then
			data.settings = { music = 0, sfx = GameConfig.Audio.DefaultSfx }
		end
		data.musicOn = nil
	end,
}

-- Fill in any key the template has and the saved data lacks (one level into sub-tables),
-- so adding a new field never needs a migration step of its own.
local function reconcile(data: { [string]: any }, template: { [string]: any })
	for key, defaultValue in template do
		local current = data[key]
		if current == nil then
			data[key] = defaultValue
		elseif type(defaultValue) == "table" and type(current) == "table" then
			for subKey, subDefault in defaultValue do
				if current[subKey] == nil then
					current[subKey] = subDefault
				end
			end
		end
	end
end

-- Upgrade saved data from `fromVersion` to the current schema.
-- Returns the upgraded data and whether anything changed (so the caller can mark it dirty).
function DataTemplate.migrate(fromVersion: number, raw: any): (Data, boolean)
	local data: { [string]: any } = if type(raw) == "table" then raw else {}
	local changed = false
	for version = fromVersion, DataTemplate.SCHEMA_VERSION - 1 do
		local step = migrations[version]
		if step then
			step(data)
			changed = true
		end
	end
	reconcile(data, DataTemplate.new() :: any)
	return (data :: any) :: Data, changed
end

return DataTemplate
