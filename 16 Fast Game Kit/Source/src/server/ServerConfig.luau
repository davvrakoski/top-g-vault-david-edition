--!strict
-- ServerConfig: per-game values that must stay on the server (ServerScriptService never
-- replicates to clients). Codes live here so exploiters cannot read unreleased ones.

export type CodeInfo = {
	Coins: number,
	Expires: number?, -- Unix seconds (UTC); nil = never expires
}

local Codes: { [string]: CodeInfo } = {
	-- Keys must be UPPERCASE with no spaces: players' input is normalized the same way.
	WELCOME = { Coins = 100 },
	LAUNCH = { Coins = 250, Expires = 1_830_297_600 }, -- 2028-01-01 00:00 UTC
}

local ServerConfig = {
	-- Data store name. Renaming it after launch is a silent wipe of every player's save.
	DataStoreName = "PlayerData",

	-- Studio only: if data stores fail (API access off, no published place) play on
	-- temporary unsaved data instead of kicking. Live servers always kick on a failed load.
	StudioTempDataOnError = true,

	-- Developer product receipts remembered per player (newest kept) for idempotency.
	MaxPurchaseHistory = 100,

	Codes = Codes,
}

return ServerConfig
