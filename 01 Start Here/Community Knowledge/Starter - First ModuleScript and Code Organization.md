---
area: "01 Start Here"
cluster: "Start Here"
title: "First ModuleScript and Code Organization"
tags: [roblox, community-knowledge, start-here, modulescript, code-organization, luau]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/module
  - https://create.roblox.com/docs/reference/engine/classes/ModuleScript
  - https://create.roblox.com/docs/reference/engine/globals/Luau globals
---
# First ModuleScript and Code Organization

Your first games usually grow as one long Script per feature, with the same numbers (prices, damage, cooldowns) copied into five places. The day you change a price and forget one copy, you get a bug. A **ModuleScript** fixes this: you write a value or function once, and every script that needs it calls `require()` on the module. This note is the step after [[Where Scripts Go - Containers, Script Types and RunContext]]: how to actually split a small game into modules without over-engineering it.

## How a ModuleScript behaves (the three rules)

1. **It does nothing on its own.** A ModuleScript only runs when some script calls `require(module)`.
2. **It runs once per side.** The first `require` runs the module and caches what it returns; every later `require` (on the same server, or on the same client) gets the *same* table back. Change a field in that table and every script sees the change.
3. **It must return exactly one value**, usually a table.

Where it lives decides who can use it:

| Put it in | Server scripts | LocalScripts | Use for |
| --- | --- | --- | --- |
| `ServerScriptService` / `ServerStorage` | yes | no | secrets, reward logic, data saving |
| `ReplicatedStorage` | yes | yes | shared config, math helpers, item lists |

A client `require` gets its own copy, separate from the server's. Changing a shared table on the client never changes the server.

## Step by step: a shared config module

1. In `ReplicatedStorage`, insert a **Folder** named `Shared`, then a **ModuleScript** inside it named `GameConfig`.
2. Replace its code:

```lua
-- ReplicatedStorage/Shared/GameConfig
local GameConfig = {
	StartingCoins = 50,
	SprintSpeed = 24,
	Shop = {
		Sword = { Price = 100, Damage = 20 },
		Torch = { Price = 40 },
	},
}
return GameConfig
```

3. Use it from a server Script and from a LocalScript the same way:

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameConfig = require(ReplicatedStorage.Shared:WaitForChild("GameConfig"))
print(GameConfig.Shop.Sword.Price) --> 100
```

Now the shop UI (client) and the purchase check (server) read the same price. The server still decides; the client only displays.

## A helper module with functions

```lua
-- ReplicatedStorage/Shared/Util
local Util = {}

function Util.formatTime(seconds: number): string
	return string.format("%d:%02d", seconds // 60, seconds % 60)
end

function Util.clampCoins(n: number): number
	return math.clamp(math.floor(n), 0, 1e9)
end

return Util
```

Name modules after what they *are* (`GameConfig`, `Util`, `ShopService`) and keep one job per module.

## A simple folder layout that scales

```
ReplicatedStorage
  Shared/        GameConfig, Util, ItemData   (both sides)
  Remotes/       RemoteEvents
ServerScriptService
  Main           (one Script that requires the server modules)
  Services/      DataService, ShopService, RoundService (ModuleScripts)
StarterPlayer/StarterPlayerScripts
  ClientMain     (one LocalScript)
  Controllers/   ShopUI, Sprint (ModuleScripts)
```

The pattern: **few Scripts, many ModuleScripts.** One server entry Script requires each service and calls its `start()` function. This gives you a clear load order instead of ten Scripts racing each other.

## When to split code into a module

- The same value or function is needed in two or more scripts.
- A Script passes about 200 lines and has two unrelated jobs.
- You want to test a piece of logic alone (pure functions are easiest).

Do not split a 30-line script into five modules "for cleanliness". Beginners lose more time to tiny files than to long ones.

## Pitfalls

- **Circular requires**: module A requires B and B requires A gives the error "Requested module was required recursively". Move the shared part into a third module.
- **Yielding at the top of a module** (long `WaitForChild` chains, `task.wait`) stalls every script that requires it. Keep top-level code fast.
- **Expecting a fresh copy**: `require` returns the cached table, so storing per-player data in module fields shares it across all players unless you key it by player.
- **Secrets in ReplicatedStorage**: anything there can be read by exploiters. Server-only logic stays in `ServerScriptService`.

## Related
[[00 START HERE - Top G Vault]] · [[Where Scripts Go - Containers, Script Types and RunContext]] · [[Module Architecture for a 50k-Line Roblox Game]] · [[Knit Is Archived - Frameworks vs Your Own Module Loader]] · [[Starter - First Class with Metatables - One Blueprint, Many Objects]]
