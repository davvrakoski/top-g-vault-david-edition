---
area: "01 Start Here"
cluster: "Start Here"
title: "Where Scripts Go - Containers, Script Types and RunContext"
tags: [roblox, community-knowledge, start-here, scripting, script-types, runcontext]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/locations
  - https://create.roblox.com/docs/projects/data-model
  - https://create.roblox.com/docs/tutorials/fundamentals/coding-6/intro-to-module-scripts
  - https://devforum.roblox.com/t/findfirstchild-vs-waitforchild/1794355
---
# Where Scripts Go - Containers, Script Types and RunContext

In most engines a script runs wherever you attach it. In Roblox, **the type of script plus the folder it sits in decides whether it runs at all, and on which machine**. "My script does nothing" is very often a script in a folder where that type never runs. This note gives you a decision table you can check in ten seconds.

## The three script types

| Type | Runs on | Notes |
| --- | --- | --- |
| `Script` | Server **or** client, decided by its `RunContext` property and location | The default `RunContext` is `Legacy` |
| `LocalScript` | Client only | No RunContext; only runs in certain containers |
| `ModuleScript` | Never on its own | Returns a table; runs when another script calls `require()` on it |

### RunContext on a Script

| RunContext | Behaviour |
| --- | --- |
| `Legacy` (default) | Server script; runs only in server containers such as `ServerScriptService` or `Workspace` |
| `Server` | Server script; can also run from `ReplicatedStorage` (not recommended, clients can read it) |
| `Client` | Client script; runs in `ReplicatedStorage`, `ReplicatedFirst`, `StarterPlayerScripts`, `StarterCharacterScripts` |

Change it in the Properties window with the Script selected.

## Decision table: "I want code that..."

| Goal | Use | Put it in |
| --- | --- | --- |
| Handles coins, damage, saving, rounds | Script | `ServerScriptService` |
| Reads input, drives the camera, runs once per player | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| Runs each time the character spawns (sprint, footsteps) | LocalScript | `StarterPlayer > StarterCharacterScripts` |
| Controls one UI | LocalScript | Inside the `ScreenGui` in `StarterGui` |
| Is shared by server and client (config, utility functions) | ModuleScript | `ReplicatedStorage` |
| Is server-only shared code | ModuleScript | `ServerScriptService` or `ServerStorage` |
| Shows a loading screen as early as possible | LocalScript | `ReplicatedFirst` |
| Belongs to a tool | LocalScript (input) + Script (effects) | Inside the `Tool` |

## Where code never runs

- `ServerStorage`: no script of any kind runs here. It is storage for things you clone.
- A `LocalScript` in `Workspace` (unless it is inside the player's own character) or `ServerScriptService`: silently ignored.
- A `Script` with `Legacy` context in `ReplicatedStorage` or `StarterPlayerScripts`: ignored.

## The pattern the docs recommend once you grow

1. One `Script` (RunContext `Server`) in `ServerScriptService`.
2. One `Script` (RunContext `Client`) in `ReplicatedStorage`.
3. Everything else as ModuleScripts that each expose a `start()` function. The two entry scripts `require` every module first, then call `start()` on each.

Benefits: one entry point per side, easy to disable a broken module, and Output error links point at a stable location instead of a copy inside `Players.YourName.PlayerScripts`.

Also: avoid dropping a script into every lava brick. Tag the bricks (for example `Lava`) and let one script handle all of them through `CollectionService`. See [[CollectionService Tag-Driven Architecture]].

## A minimal ModuleScript

```lua
-- ReplicatedStorage/Config (ModuleScript)
local Config = {}
Config.START_COINS = 100
Config.SPRINT_SPEED = 24
return Config
```

```lua
-- any Script or LocalScript
local Config = require(game:GetService("ReplicatedStorage"):WaitForChild("Config"))
print(Config.START_COINS)
```

A module runs once per side (once on the server, once per client) and every `require` after that returns the same table.

## Starter containers copy, they do not run in place

`StarterGui`, `StarterPack`, `StarterPlayerScripts` and `StarterCharacterScripts` are templates. On join or respawn, Roblox copies their contents into the player (`PlayerGui`, `Backpack`, `PlayerScripts`, the character). Editing the Starter copy during a test changes nothing for players already in.

## Pitfalls

- Clients cannot see `ServerScriptService` or `ServerStorage`. A LocalScript that does `game.ServerStorage.Sword` errors.
- On the client, objects may not have loaded yet: use `WaitForChild` there. On the server most things already exist, so `FindFirstChild` or direct indexing is usually fine (community consensus in the linked thread).

## Related
[[00 START HERE - Top G Vault]] · [[Client and Server in Plain Words]] · [[Module Architecture for a 50k-Line Roblox Game]] · [[Infinite Yield Possible - Causes and Fixes]] · [[30 Official Roblox Docs/Scripting/Script types and locations|Script types and locations (official)]]
