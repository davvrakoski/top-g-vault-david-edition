---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/error-logging-pipeline"
title: "Error Logging Pipeline - ScriptContext Error and Client Error Forwarding"
tags: [roblox, community, "cluster/testing-qa-and-devops", logging, errors, live-ops]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ScriptContext
  - https://create.roblox.com/docs/reference/engine/classes/LogService
  - https://create.roblox.com/docs/production/analytics/error-report
---
# Error Logging Pipeline - ScriptContext Error and Client Error Forwarding

## What Roblox already gives you (use it first)
- **Error Report** (Creator Dashboard > Monitoring) shows server **and client** Luau errors and warnings, with stack traces, place-version annotations, "new errors since version" filtering, platform/OS filters, and up to 100 ignore/group rules per experience ([[Error Report]]).
- The same data is readable from Open Cloud ([[Error Reporting API - Grouping Rules as Code and New-Error Checks]]).

So you do **not** need to forward every error yourself. Add your own pipeline only for what the dashboard can't know: **game context** (which round, which item, which build tag) and **custom alerting**.

## The engine hooks
| Hook | Fires for | Notes from the API docs |
|---|---|---|
| `ScriptContext.Error(message, stackTrace, script)` | Unhandled errors that end a thread | Does **not** fire for watchdog timeouts ("Script timeout: exhausted allowed execution time") |
| `LogService.MessageOut(message, messageType, context)` | Everything written to output (prints, warns, errors) | The docs warn content may be unreliable or truncated: never drive game logic from it |
| `LogService:GetLogHistory()` | The last entries (512 by default) | Handy for attaching "what happened just before" to a bug report |

## Server collector (original)
Builds on the fingerprint idea in [[Bug Triage, Severity and Regression Workflow]], adding build context and a flush loop.

```luau
--!strict
-- ServerScriptService/ErrorCollector.server.luau
local ScriptContext = game:GetService("ScriptContext")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BuildInfo = require(ReplicatedStorage.Shared.Generated.BuildInfo)

type Entry = { count: number, sample: string, where: string, side: string }
local buckets: { [string]: Entry } = {}

local function record(side: string, message: string, where: string, trace: string?)
	-- Strip numbers so "index 17" and "index 18" land in one bucket.
	local key = side .. "|" .. where .. "|" .. string.gsub(string.sub(message, 1, 160), "%d+", "#")
	local entry = buckets[key]
	if entry then
		entry.count += 1
	else
		buckets[key] = { count = 1, sample = string.sub((trace or message), 1, 400), where = where, side = side }
	end
end

ScriptContext.Error:Connect(function(message, stackTrace, scriptInst)
	record("server", message, if scriptInst then scriptInst:GetFullName() else "?", stackTrace)
end)

-- Client reports (see below) arrive here, already rate-limited per player.
local clientErrors = Instance.new("RemoteEvent")
clientErrors.Name = "ClientErrorReport"
clientErrors.Parent = ReplicatedStorage

local perPlayer: { [Player]: number } = {}
clientErrors.OnServerEvent:Connect(function(player, message, where)
	if type(message) ~= "string" or type(where) ~= "string" then
		return
	end
	local n = (perPlayer[player] or 0) + 1
	perPlayer[player] = n
	if n > 20 then
		return -- a broken or malicious client cannot flood us
	end
	record("client", string.sub(message, 1, 200), string.sub(where, 1, 120), nil)
end)
game:GetService("Players").PlayerRemoving:Connect(function(p)
	perPlayer[p] = nil
end)

-- Every 60 s, emit one compact summary line per bucket and reset.
task.spawn(function()
	while true do
		task.wait(60)
		for key, e in buckets do
			warn(("[ERRSUM] build=%s pv=%d x%d %s %s :: %s"):format(
				BuildInfo.tag, game.PlaceVersion, e.count, e.side, e.where, e.sample))
			buckets[key] = nil
		end
	end
end)
```

`warn` writes a warning-level message, and the Error Report tracks warnings as well as errors (filterable by severity and place version), so check on staging that your `[ERRSUM]` lines show up there; if they do, you get a searchable summary without any external service. If you also post to your own HTTP endpoint, batch the buckets into one request per minute and keep the endpoint key in a secret, never in a ModuleScript clients can read.

## Client forwarder (original)

```luau
-- StarterPlayerScripts/ErrorForwarder.client.luau
local ScriptContext = game:GetService("ScriptContext")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("ClientErrorReport")

local sent = 0
ScriptContext.Error:Connect(function(message, _trace, scriptInst)
	sent += 1
	if sent > 20 then return end
	remote:FireServer(message, if scriptInst then scriptInst:GetFullName() else "?")
end)
```

Treat everything a client sends as untrusted text: length-capped, type-checked, rate-limited, never executed or shown to other players.

## Rules
- Fingerprint, count, summarize. Never one log line or one HTTP call per error.
- Never send raw error text as analytics custom-field values; the vault's triage note explains the unique-value budget.
- Keep player names and user IDs out of free-text logs unless you need them for support, and then only in places with access control.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[ScriptContext]] · [[LogService]] · [[Error Report]] · [[Structured Logging with LogService Loggers]] · [[Bug Triage, Severity and Regression Workflow]]

<!-- TDOD_GRAPH_END -->
