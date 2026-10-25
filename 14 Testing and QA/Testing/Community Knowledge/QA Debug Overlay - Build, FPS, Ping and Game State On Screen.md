---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Debug Overlay - Build, FPS, Ping and Game State On Screen"
tags: [roblox, community-knowledge, testing, debug-ui, telemetry, playtesting]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Stats
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/DataModel
  - https://create.roblox.com/docs/reference/engine/classes/RunService
---
# QA Debug Overlay - Build, FPS, Ping and Game State On Screen

When a tester sends a screenshot or clip of a bug, the most useful thing in it is information you cannot see in the game: which build, which server, what the frame time and ping were, what state the round was in. A small debug overlay that testers can toggle puts that in every capture for free. It also speeds up your own playtests, because you stop opening the Developer Console to check basic numbers.

## What to show
| Line | Source |
|---|---|
| Build | `game.PlaceVersion` + your build label string |
| Server | first 8 chars of `game.JobId` (full id on click / copy) |
| FPS / frame time | Average of `RunService.RenderStepped` delta over the last second |
| Ping | `Player:GetNetworkPing()` (round-trip in **seconds**; multiply by 1000 for ms) |
| Memory | `Stats:GetTotalMemoryUsageMb()` |
| Instances | `Stats.InstanceCount` |
| Game state | Your own: round id, phase, zone, current quest step, seed |
| Position | Character root position rounded to 1 decimal |

## Client script
```lua
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local player = Players.LocalPlayer

local label: TextLabel = script.Parent.Overlay.Text
local frames, acc = 0, 0

RunService.RenderStepped:Connect(function(dt)
	frames += 1
	acc += dt
	if acc < 0.5 then return end -- update twice per second, not every frame
	local fps = frames / acc
	frames, acc = 0, 0

	local root = player.Character and player.Character.PrimaryPart
	local pos = root and root.Position or Vector3.zero
	label.Text = string.format(
		"v%d  %s\n%.0f fps  %.0f ms ping  %.0f MB  %d inst\nround %s  phase %s\n(%.1f, %.1f, %.1f)",
		game.PlaceVersion, string.sub(game.JobId, 1, 8),
		fps, player:GetNetworkPing() * 1000, Stats:GetTotalMemoryUsageMb(), Stats.InstanceCount,
		tostring(workspace:GetAttribute("RoundId")), tostring(workspace:GetAttribute("Phase")),
		pos.X, pos.Y, pos.Z
	)
end)
```
Updating text twice per second keeps the overlay itself cheap; rewriting a TextLabel every frame shows up in profiles.

## Who can see it
- **Studio:** always available (`RunService:IsStudio()`).
- **Live:** only for testers. Check on the server, then tell the client it may enable the overlay. Typical gate: group rank via `player:GetRankInGroupAsync(groupId)` (the older `GetRankInGroup` is deprecated; cache the result, it is a web call) or an allowlist of UserIds in server config.
- Toggle with a key (for example F7) or a hidden settings button, so it is not on in every tester capture.

Do not put secrets or other players' data on it: testers stream and post clips.

## Server-side state
Some values exist only on the server (server heartbeat, player count in the round, queue size). Replicate a few as attributes on a folder in ReplicatedStorage, updated once per second by the server, and show them in the overlay. Keep the number small; attributes replicate to everyone.

## Make captures useful
- Include the overlay in the bug report template instructions: "turn on overlay (F7) before recording".
- When a report arrives with a server id, you can match it with error logs and the in-game report store.
- Put a timestamp line (`os.date("!%H:%M:%S")`, UTC) so clips can be matched with server logs.

## Related
[[Testing - Hub]] · [[In-Game Bug Report Button - Capturing Useful Context]] · [[Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label]] · [[Performance Hotkeys and Overlays - Quick Reference]]
