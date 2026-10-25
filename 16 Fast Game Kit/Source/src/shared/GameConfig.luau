--!strict
-- GameConfig: every per-game value the client may see lives here.
-- Reskin = edit this file + server/ServerConfig.luau.
-- This module replicates to every client: never put secrets here
-- (unreleased codes, admin user ids, webhook URLs).

export type PassInfo = {
	Key: string, -- stable internal name, used in code and attributes ("Pass_<Key>")
	Id: number, -- pass ID from Creator Dashboard > Monetization > Passes (0 = not created yet)
	Name: string,
	Description: string,
}

export type ProductInfo = {
	Key: string, -- stable internal name, also the analytics item SKU
	Id: number, -- developer product ID (0 = not created yet)
	Name: string,
	Coins: number, -- coins granted per purchase
}

export type ShopItem = {
	Key: string, -- stable internal name, saved in player data: never rename after launch
	Name: string,
	Price: number, -- in soft currency
}

local GamePasses: { PassInfo } = {
	{ Key = "VIP", Id = 0, Name = "VIP", Description = "2x coins from playtime" },
}

local Products: { ProductInfo } = {
	{ Key = "Coins100", Id = 0, Name = "100 Coins", Coins = 100 },
	{ Key = "Coins500", Id = 0, Name = "500 Coins", Coins = 500 },
}

local ShopItems: { ShopItem } = {
	{ Key = "SpeedCoil", Name = "Speed Coil", Price = 250 },
	{ Key = "GravityCoil", Name = "Gravity Coil", Price = 400 },
}

local GameConfig = {
	GameName = "Fast Game Kit",

	Currency = {
		Name = "Coins", -- leaderstats name, HUD label and analytics currency name
		Start = 100, -- coins a brand-new player starts with
		Max = 1_000_000_000_000, -- hard cap, keeps values far inside IntValue range
	},

	GamePasses = GamePasses,
	Products = Products,
	ShopItems = ShopItems,

	Daily = {
		-- Day 1..7 of a streak, then the cycle repeats. Missing a UTC day resets to day 1.
		Rewards = { 50, 75, 100, 125, 150, 200, 300 },
	},

	Playtime = {
		IntervalSeconds = 60,
		Coins = 10,
		VipPassKey = "VIP", -- PassInfo.Key of the pass that multiplies playtime coins
		VipMultiplier = 2,
	},

	Audio = {
		DefaultMusic = 0.5, -- 0..1, written to SoundService.Music.Volume
		DefaultSfx = 0.8, -- 0..1, written to SoundService.SFX.Volume
	},

	Theme = {
		Background = Color3.fromRGB(24, 24, 32),
		Panel = Color3.fromRGB(36, 36, 48),
		Accent = Color3.fromRGB(255, 200, 61),
		AccentText = Color3.fromRGB(20, 20, 20),
		Text = Color3.fromRGB(245, 245, 245),
		Muted = Color3.fromRGB(150, 150, 165),
		Good = Color3.fromRGB(80, 200, 120),
		Bad = Color3.fromRGB(235, 87, 87),
		Font = Enum.Font.BuilderSansBold,
	},
}

return GameConfig
