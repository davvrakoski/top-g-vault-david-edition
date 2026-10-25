---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/studiotestservice-recipes"
title: "Multi-Client Integration Recipes with StudioTestService"
tags: [roblox, community, "cluster/testing-qa-and-devops", testing, integration, studio]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "Roblox docs CC BY 4.0 (facts); code below is original"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/StudioTestService
  - https://create.roblox.com/docs/studio/testing-modes
---
# Multi-Client Integration Recipes with StudioTestService

The vault's [[Device, Network and Controller Simulation Test Pass]] introduces `StudioTestService` with a two-player trade test. This note adds a **suite runner** and three recipes that unit tests can't cover: staggered joins, mid-action disconnects, and server-only Run-mode checks.

## API recap (engine reference)
| Method | Called from | Does |
|---|---|---|
| `ExecuteMultiplayerTestAsync(numPlayers, args)` | Plugin only | Server + 1-8 clients; yields; returns the value given to `EndTest` |
| `ExecutePlayModeAsync(args)` / `ExecuteRunModeAsync(args)` | Plugin | Solo Test / Run session; returns `EndTest` value or `nil` |
| `GetTestArgs()` | Server (client LocalScripts have a known issue) | Returns `args` unchanged (any serializable value, tables included) |
| `AddPlayers(n)` | Server of a running multiplayer test | Adds 1-8 more clients mid-session |
| `CanLeaveTest()` / `LeaveTest()` | Client | Disconnect this client from the test |
| `EndTest(value)` | Server | Ends the session asynchronously |

Only one multiplayer session per Studio instance; `ExecuteMultiplayerTestAsync` can't be called inside a test. These services do nothing in published games.

## The suite runner plugin (original)

```luau
-- Plugin script: runs scenarios one after another and prints a summary
local StudioTestService = game:GetService("StudioTestService")

local SCENARIOS = {
	{ name = "lobby-staggered-join", clients = 2 },
	{ name = "trade-disconnect", clients = 2 },
}

local toolbar = plugin:CreateToolbar("QA Suite")
local button = toolbar:CreateButton("RunSuite", "Run multiplayer scenarios", "")

button.Click:Connect(function()
	button.Enabled = false
	task.spawn(function()
		local failures = 0
		for _, s in SCENARIOS do
			local ok, result = pcall(function()
				return StudioTestService:ExecuteMultiplayerTestAsync(s.clients, { scenario = s.name, timeout = 60 })
			end)
			local passed = ok and type(result) == "table" and result.passed == true
			if not passed then failures += 1 end
			print(("[QA] %s %s %s"):format(if passed then "PASS" else "FAIL", s.name,
				if ok then tostring(type(result) == "table" and result.detail or result) else tostring(result)))
		end
		print(("[QA] suite done, failures=%d"):format(failures))
		button.Enabled = true
	end)
end)
```

## Server-side scenario host (original)
One server Script reads the args, publishes the scenario name for clients (avoiding the client `GetTestArgs` issue), runs the scenario and always ends the test, even on timeout.

```luau
-- ServerScriptService/QA/ScenarioHost.server.luau
local RunService = game:GetService("RunService")
local StudioTestService = game:GetService("StudioTestService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

if not RunService:IsStudio() then return end
local args = StudioTestService:GetTestArgs()
if type(args) ~= "table" or type(args.scenario) ~= "string" then return end

ReplicatedStorage:SetAttribute("QAScenario", args.scenario)
local scenarios = require(script.Parent.Scenarios) -- table of name -> function(): (boolean, string)

local finished = false
local function finish(passed: boolean, detail: string)
	if finished then return end
	finished = true
	StudioTestService:EndTest({ passed = passed, detail = detail })
end

task.delay(args.timeout or 60, function()
	finish(false, "timeout")
end)

local ok, passed, detail = pcall(scenarios[args.scenario])
if ok then finish(passed, detail) else finish(false, tostring(passed)) end
```

## Recipe 1: staggered join (lobby leader)
Bug class: "the first player becomes lobby leader, but if two join in the same frame nobody does."

```luau
-- inside Scenarios["lobby-staggered-join"]
local Players = game:GetService("Players")
local Lobby = require(game:GetService("ServerScriptService").Services.Lobby)

while #Players:GetPlayers() < 2 do task.wait() end
if not Lobby.getLeader() then return false, "no leader with 2 players" end

StudioTestService:AddPlayers(3)            -- three more arrive mid-session
while #Players:GetPlayers() < 5 do task.wait() end
task.wait(1)
local leader = Lobby.getLeader()
return leader ~= nil and leader.Parent == Players, "leader after joins: " .. tostring(leader)
```

## Recipe 2: disconnect in the middle of a trade
Bug class: duplicated or lost items when a player leaves during a trade. The server picks a client and tells it to leave; the client checks `CanLeaveTest()` first.

```luau
-- client side: StarterPlayerScripts/QAClient.client.luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StudioTestService = game:GetService("StudioTestService")
if ReplicatedStorage:GetAttribute("QAScenario") == nil then return end

local leaveCmd = ReplicatedStorage:WaitForChild("QALeave")
leaveCmd.OnClientEvent:Connect(function()
	if StudioTestService:CanLeaveTest() then
		StudioTestService:LeaveTest()
	end
end)
```

The server scenario starts a trade between the two players, fires `QALeave` to one of them after the offer is locked, waits for `PlayerRemoving`, then asserts both inventories match one of the two legal outcomes (trade completed or fully rolled back), never a mix.

## Recipe 3: server-only smoke in Run mode
`ExecuteRunModeAsync({ scenario = "boot-smoke" })` starts the server with no avatar. Good checks: every service's `Init` returned, required folders exist, config modules parse, no `ScriptContext.Error` fired during boot.

## Tips
- Keep scenarios short (under 60 s each) and deterministic; seed any randomness from the args.
- Clean QA hooks out of release builds, or keep them guarded by `RunService:IsStudio()` plus the `QAScenario` attribute, as above.
- For input-driven UI flows, combine with `VirtualInput` from `UserInputService:CreateVirtualInput()` ([[VirtualInput]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[StudioTestService]] · [[Device, Network and Controller Simulation Test Pass]] · [[Studio testing modes]] · [[Load Testing Roblox Servers - Simulated Players and Bots]]

<!-- TDOD_GRAPH_END -->
