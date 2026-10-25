---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/structured-logging-loggers"
title: "Structured Logging with LogService Loggers"
tags: [roblox, community, "cluster/testing-qa-and-devops", logging, debugging]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/LogService
  - https://create.roblox.com/docs/reference/engine/classes/Logger
---
# Structured Logging with LogService Loggers

**What's new:** `LogService` now has structured logging methods (`Info`, `Warn`, `Error`, `Output`, `Log`) that take a message **template** plus a **context** table, and `LogService:GetLogger(name)` returns a named, hierarchical `Logger`. Older tutorials only show `print` and `warn`; this note shows how to use the new API for QA and live-ops.

## API facts (from the engine reference)
- **Templates:** `{key}` placeholders are filled from the context table. Literal braces are `{{` and `}}`.
- **Context values:** Instances are stored as their full path, functions as `"<function>"`, other non-primitive types via `tostring()`. Numeric keys become string keys.
- **`LogService:Error(...)` always throws** a structured error (a table with `message`, `template`, `context`, `stack`, and a `__tostring`). Wrap it in `pcall` if you only want to log.
- **Loggers:** `LogService:GetLogger("Combat")` returns a top-level logger; `combat:GetLogger("Damage")` makes `Combat.Damage` (`Name` and `FullPath` properties). Names cannot be empty, contain `.` or control characters.
- **Propagation:** `Logger.MessageOut` fires on the logger **and every ancestor**, so one listener on `Combat` hears all combat sub-systems.
- Logger output flows to the Output window, the Developer Console, `LogService.MessageOut`, and `GetLogHistory()` (tagged with the full path).

## A logging layout for a game (original)

```luau
--!strict
-- ReplicatedStorage/Shared/Log.luau
local LogService = game:GetService("LogService")

local Log = {
	Economy = LogService:GetLogger("Economy"),
	Data = LogService:GetLogger("Data"),
	Combat = LogService:GetLogger("Combat"),
	Matchmaking = LogService:GetLogger("Matchmaking"),
}

-- Sub-loggers for hot areas.
Log.EconomyShop = Log.Economy:GetLogger("Shop")
Log.DataSave = Log.Data:GetLogger("Save")

return table.freeze(Log)
```

Use it:

```luau
local Log = require(game:GetService("ReplicatedStorage").Shared.Log)

Log.EconomyShop:Info("Purchase {item} for {price} by {userId}", {
	item = itemId, price = price, userId = player.UserId,
})

Log.DataSave:Warn("Save retry {attempt}/{max} for {userId}", {
	attempt = attempt, max = MAX_RETRIES, userId = player.UserId,
})
```

## Listening per subsystem (QA use)
During a test session, a debug panel or test harness can watch one area only:

```luau
local Log = require(game:GetService("ReplicatedStorage").Shared.Log)

local seen = 0
Log.Economy.MessageOut:Connect(function(message, messageType, context)
	seen += 1
	if messageType == Enum.MessageType.MessageWarning then
		print("[QA] economy warning:", message)
	end
end)
```

In an automated test, assert that a purchase flow produced exactly one `Economy.Shop` info line and zero warnings.

## Rules
- Log **facts with context**, not prose: `"Save failed {code}"` with a context table beats a long string built with `..`.
- Pick levels by audience: `Info` for tracing during tests, `Warn` for things ops should see, `Error` only when you also want to throw.
- Don't put secrets or chat text into context tables.
- The docs warn that `LogService` output may be truncated or unreliable: logs are for humans and tools, never for game logic.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[LogService]] · [[Logger]] · [[Error Logging Pipeline - ScriptContext Error and Client Error Forwarding]] · [[Developer Console]] · [[Debugging Playbook]]

<!-- TDOD_GRAPH_END -->
