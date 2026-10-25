---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Test Commands - Gated Cheats for Testers"
tags: [roblox, community-knowledge, testing, admin-commands, qa-tools, security]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://github.com/evaera/Cmdr
  - https://create.roblox.com/docs/scripting/security/security-tactics
---
# QA Test Commands - Gated Cheats for Testers

Testing level 40 content by playing to level 40 is not testing, it is grinding. Every game needs QA commands: give currency, jump to a stage, set a seed, spawn an enemy wave, force an event. Done carelessly, these are also the most dangerous code in the game, because one ungated command is a free admin panel for exploiters. This note is a safe pattern.

## Commands worth having
| Command | Why |
|---|---|
| `give <item/currency> <amount>` | Test shops, inventory caps, overflow |
| `stage <n>` / `tp <zone>` | Jump to content under test |
| `level <n>` / `xp <n>` | Test unlocks and level-gated UI |
| `seed <n>` | Reproduce procedural bugs (log the seed, replay it) |
| `spawn <enemy> <count>` | Load and combat tests |
| `round end` / `phase <name>` | Test transitions without waiting |
| `time <hour>` / `weather <x>` | Visual and lighting checks |
| `resetdata` | Start fresh as a new player (test profile only) |
| `fail <system>` | Turn on failure injection (DataStore errors, slow HTTP) |

## Gate on the server, always
```lua
local RunService = game:GetService("RunService")
local TESTER_GROUP, MIN_RANK = 1234567, 200
local QA_PLACE_IDS = { [111111111] = true } -- test places only

local rankCache = {}
local function isTester(player: Player): boolean
	if RunService:IsStudio() then return true end
	if not QA_PLACE_IDS[game.PlaceId] then return false end -- never in production
	if rankCache[player] == nil then
		local ok, rank = pcall(player.GetRankInGroupAsync, player, TESTER_GROUP)
		rankCache[player] = ok and rank >= MIN_RANK
	end
	return rankCache[player]
end

commandRemote.OnServerEvent:Connect(function(player, name, args)
	if not isTester(player) then return end -- silently ignore
	if typeof(name) ~= "string" or typeof(args) ~= "table" then return end
	local cmd = Commands[name]
	if cmd then
		print(("[QA] %d ran %s"):format(player.UserId, name))
		cmd(player, args)
	end
end)
```
Key points:
- **Place allowlist:** commands only exist in Studio and test places. Production servers refuse even for the owner. If you need live admin tools, build them separately, with logging and fewer powers.
- **Server decides who is a tester.** The client UI can hide the console for non-testers, but the remote handler is the real gate.
- **Log every command** with UserId; it explains odd data later.
- Clear the cache on `PlayerRemoving`.

## Using a command framework
Cmdr (open source by evaera) gives a console, argument types, autocomplete and permission hooks. If you use it, put permission checks in its server-side `BeforeRun` hook so every command is gated (see [[Cmdr Permissions - BeforeRun Hooks Done Right]]). Check Cmdr's repository for its current license before bundling.

## Keep test data separate
- `give` and `resetdata` should write to a **test** DataStore (or a key prefix) in test places so QA never corrupts real saves ([[Studio API Access and Data Safety During Testing]]).
- Mark test-granted items with a flag if they could ever reach production data.

## Make commands part of test cases
Write test cases with the command to reach the state: "`stage 12`, `give Coins 5000`, open shop, buy Dragon Pet; expect..." Testers then reproduce exactly the same setup, and bug reports can include the command line that reproduces them.

## Related
[[Testing - Hub]] · [[Admin Command Safety - Server-Side Permission Checks]] · [[Seeded Randomness and Deterministic Tests]] · [[QA Test Plan Template for Roblox Experiences]]
