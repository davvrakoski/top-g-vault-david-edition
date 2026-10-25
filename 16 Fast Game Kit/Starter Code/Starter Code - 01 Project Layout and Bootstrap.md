---
area: "16 Fast Game Kit"
cluster: "Starter Code"
tags: [fast-game-kit, roblox, starter-code, rojo, project-structure]
cssclasses: [tg-a16]
verified: 2026-10-25
---

# Starter Code - 01 Project Layout and Bootstrap

## Why this matters
A fixed layout and one boot script make every game you ship look the same inside, so fixes and features move between games by copy-paste and nothing starts in a random order.
All per-game values live in two config files, which is what makes a 30-minute reskin possible.

## The layout

| Folder on disk | Becomes in Studio | Replicated to clients? |
|---|---|---|
| `src/shared` | `ReplicatedStorage.Shared` (Folder) | Yes: never put secrets here |
| `src/server` | `ServerScriptService.Server` (Folder) | No |
| `src/client` | `StarterPlayer.StarterPlayerScripts.Client` (Folder) | Yes (it runs there) |
| (project file) | `SoundService.Music`, `SoundService.SFX` (SoundGroups) | Yes |

Rojo file rules used here: `Name.server.luau` = `Script`, `Name.client.luau` = `LocalScript`, any other `Name.luau` = `ModuleScript`, a folder = `Folder`. Folders mapped with `$path` are fully managed by Rojo: anything you add inside them in Studio is removed on the next sync, so make Studio-only objects elsewhere (Workspace, StarterGui, ServerStorage).

## The code

`Source/default.project.json`

```json
{
  "name": "FastGameKit",
  "tree": {
    "$className": "DataModel",
    "ReplicatedStorage": {
      "Shared": {
        "$path": "src/shared"
      }
    },
    "ServerScriptService": {
      "Server": {
        "$path": "src/server"
      }
    },
    "StarterPlayer": {
      "StarterPlayerScripts": {
        "Client": {
          "$path": "src/client"
        }
      }
    },
    "SoundService": {
      "Music": {
        "$className": "SoundGroup",
        "$properties": {
          "Volume": 0.5
        }
      },
      "SFX": {
        "$className": "SoundGroup",
        "$properties": {
          "Volume": 0.8
        }
      }
    }
  }
}
```

`Source/src/server/Bootstrap.server.luau`

```lua
--!strict
-- Bootstrap: the only server Script. Requires every service in dependency order, then
-- calls Start() in the same order. A service that fails to start stops the boot loudly
-- (a half-started server that loses saves or purchases is worse than an obvious error).

local Services = script.Parent.Services

type Service = { Start: () -> () }

local ORDER: { ModuleScript } = {
	Services.Analytics, -- no dependencies
	Services.PlayerData, -- data + session locks + BindToClose flush
	Services.Currency, -- needs PlayerData, Analytics
	Services.Shop, -- needs Currency
	Services.Monetization, -- needs Currency; sets ProcessReceipt
	Services.Rewards, -- needs Currency, Monetization
	Services.Settings, -- needs PlayerData
}

local started = os.clock()
for _, module in ORDER do
	local service = (require :: any)(module) :: Service
	if type(service) == "table" and type(service.Start) == "function" then
		local t0 = os.clock()
		service.Start()
		print(("[Bootstrap] %s started in %.1f ms"):format(module.Name, (os.clock() - t0) * 1000))
	end
end
print(("[Bootstrap] server ready in %.1f ms"):format((os.clock() - started) * 1000))
```

`Source/src/shared/GameConfig.luau`

```lua
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
```

`Source/src/server/ServerConfig.luau`

```lua
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
```

## How to use

1. Install Rojo and the Studio plugin ([[Rojo, VS Code and luau-lsp - Local Setup from Zero]]). Copy the `Source` folder to a new folder for your game.
2. Either run `rojo serve` in that folder and press **Connect** in the Studio plugin, or build a place file once with `rojo build -o MyGame.rbxlx` and open it.
3. Publish the place, then in **Game Settings > Security** turn on **Enable Studio Access to API Services** so data stores work in Studio playtests. Without it the kit plays on temporary, unsaved data in Studio (see note 02) and kicks in live servers if loading fails.
4. Press Play. The Output shows one `[Bootstrap] <Service> started` line per service and `server ready`.
5. Add your own service: create `src/server/Services/MyThing.luau` returning a table with `Start()`, require what it needs at the top, and add it to `ORDER` after its dependencies.

**Why one Script:** with many Scripts, Roblox decides the run order, so a purchase handler can run before the data service is ready. One Bootstrap requiring modules in an explicit order removes that whole class of bug ([[Module Architecture for a 50k-Line Roblox Game]]).

**Why direct `require` between services instead of a registry:** dependencies are visible at the top of each file, the type checker follows them (full autocomplete with luau-lsp), and a cycle fails loudly at boot. Keep the graph one-way: data at the bottom, gameplay on top.

## Common mistakes

- **Secrets in `GameConfig`.** It lives in ReplicatedStorage, so every client can read it. Unreleased codes, admin lists and webhook URLs go in `ServerConfig`.
- **Editing synced scripts in Studio.** Rojo overwrites them on the next sync. Edit files on disk only.
- **A service that yields in `Start()`.** `Start()` runs in sequence; a `task.wait` or a web call there delays every later service. Put waits in `task.spawn`.
- **Requiring a service before its dependencies are in `ORDER`.** Requires are cached, but `Start()` order matters: a service whose `Start()` uses another service's remotes or callbacks must come after it.
- **Renaming `DataStoreName` after launch.** That points every player at an empty store: a silent wipe.
- **Leaving `Id = 0` and wondering why the shop is empty.** Passes and products with ID 0 are skipped on purpose so the place runs before you create them.

## Checklist

- [ ] `rojo build` (or `rojo serve`) works and Studio shows `ReplicatedStorage.Shared`, `ServerScriptService.Server`, `StarterPlayerScripts.Client`, `SoundService.Music`, `SoundService.SFX`.
- [ ] Output shows every service started and `server ready` with no errors.
- [ ] Studio API access enabled for the published place.
- [ ] Nothing secret in `GameConfig.luau`.
- [ ] New services added to `ORDER` after their dependencies, with no yields in `Start()`.

**Related:** [[Starter Code - Hub]] · [[Starter Code - 02 PlayerData Session-Locked Saves]] · [[Starter Code - 10 Reskin Checklist]] · [[Luau Strict Mode and Type Checking in Practice]] · [[luau-lsp analyze and Rojo Sourcemaps in CI]] · [[Player and Character Lifecycle Without Race Conditions]]
