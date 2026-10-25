---
area: "14 Testing and QA"
cluster: "Testing"
title: "In-Game Bug Report Button - Capturing Useful Context"
tags: [roblox, community-knowledge, testing, bug-reports, telemetry, liveops]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/LogService
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/reference/engine/classes/TextService
  - https://create.roblox.com/docs/cloud-services/data-stores
---
# In-Game Bug Report Button - Capturing Useful Context

Players report bugs in Discord as "game broken pls fix". An in-game report button that silently attaches the build, server, device and the last log lines turns those into actionable tickets, and players use it far more than an external form because it is right there. This note covers what to collect, how to send it safely and where to store it.

## What to attach automatically
| Field | Source |
|---|---|
| Place version / build label | `game.PlaceVersion` (plus your own build string) |
| Server id | `game.JobId` |
| Player | `player.UserId` (not the display name) |
| Time | `os.time()` on the server, `DateTime.now():ToIsoDate()` |
| Device class | Client: `UserInputService.TouchEnabled`, `GamepadEnabled`, `KeyboardEnabled`, viewport size |
| Where | Character position, current zone / stage / round id |
| Recent logs | `LogService:GetLogHistory()` on the client, filtered to warnings and errors, last ~20 entries |
| Session | Time in session, last 5 analytics-style actions you track (opened shop, died, etc.) |

The player adds a **category** (dropdown: stuck, lost items, purchase, visual, other) and an optional short description.

## Client side
```lua
local LogService = game:GetService("LogService")
local UIS = game:GetService("UserInputService")

local function collectClientContext()
	local logs = {}
	local history = LogService:GetLogHistory()
	for i = math.max(1, #history - 60), #history do
		local entry = history[i]
		if entry.messageType == Enum.MessageType.MessageError or entry.messageType == Enum.MessageType.MessageWarning then
			table.insert(logs, string.sub(entry.message, 1, 300))
		end
	end
	local cam = workspace.CurrentCamera
	return {
		touch = UIS.TouchEnabled, pad = UIS.GamepadEnabled, kb = UIS.KeyboardEnabled,
		vp = { math.floor(cam.ViewportSize.X), math.floor(cam.ViewportSize.Y) },
		logs = table.move(logs, math.max(1, #logs - 19), #logs, 1, {}),
	}
end

submitButton.Activated:Connect(function()
	reportRemote:FireServer(categoryValue, descriptionBox.Text, collectClientContext())
end)
```

## Server side: validate, limit, store
```lua
local CATEGORIES = { stuck = true, items = true, purchase = true, visual = true, other = true }
reportRemote.OnServerEvent:Connect(function(player, category, text, ctx)
	if not CATEGORIES[category] or typeof(text) ~= "string" or typeof(ctx) ~= "table" then return end
	if not RateLimit.allow(player, "BugReport", 1, 120) then return end -- 1 per 2 minutes
	local report = {
		v = game.PlaceVersion, job = game.JobId, uid = player.UserId, t = os.time(),
		cat = category, text = string.sub(text, 1, 500),
		ctx = sanitize(ctx), -- re-check types and lengths of every field
		pos = getCharacterPosition(player), zone = getZone(player),
	}
	ReportStore.add(report)
end)
```

Where `ReportStore` can be:
- A regular **DataStore key per day** (for example `reports_2026-10-25`) updated with `UpdateAsync` into a capped list. Keep it well under the per-key size limit, batch writes (flush every minute instead of per report), and read it via Open Cloud.
- An external tracker through `HttpService` via a proxy you control (keep keys in Secrets; plain Discord webhooks break and get rate-limited, see [[Discord Webhooks from Roblox - Why They Break and Safer Logging]]).

## Text and privacy rules
- Player-written text shown to **other players** must be filtered; reports read only by your team are not shown in-game, but treat them as personal data anyway: keep them short-lived and do not paste them publicly.
- Do not collect anything beyond what you need to fix bugs. UserId is enough to look up a save.
- Tell the player "Thanks, report sent (#1234)" with a short id so they can quote it in Discord.

## Turning reports into work
- Group by `cat` + place version each morning; a spike after a release is a regression signal.
- The attached errors usually match lines in the Error Report dashboard; link the two.
- Add the report id to the bug ticket in your template ([[Bug Report Template]]).

## Related
[[Testing - Hub]] · [[Bug Triage, Severity and Regression Workflow]] · [[Error Logging Pipeline - ScriptContext Error and Client Error Forwarding]] · [[Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label]]
