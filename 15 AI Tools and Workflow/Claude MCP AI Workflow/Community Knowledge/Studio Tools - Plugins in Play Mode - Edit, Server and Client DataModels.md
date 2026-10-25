---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Plugins in Play Mode - Edit, Server and Client DataModels"
tags: [roblox, community-knowledge, studio, plugins, playtest, runservice]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/PluginCapabilities
  - https://create.roblox.com/docs/reference/engine/classes/RunService#IsEdit
  - https://create.roblox.com/docs/reference/engine/classes/Studio
  - https://create.roblox.com/docs/reference/engine/classes/ChangeHistoryService#TryBeginRecording
  - https://create.roblox.com/docs/reference/engine/classes/StudioTestService
  - https://devforum.roblox.com/t/introducing-studiotestservice/4116257
---
# Studio Tools - Plugins in Play Mode - Edit, Server and Client DataModels

When you press **Play**, Studio does not just run your game. It creates a separate **server** DataModel and one or more **client** DataModels next to the edit one. Plugins can be loaded into those too. A plugin that does not expect this ends up with duplicate toolbar buttons, a placement tool that edits the throw-away play copy, or an "auto-tag" script that runs three times. This note explains which copy of your plugin is running and how to guard it.

## Which DataModels a plugin targets

`PluginCapabilities.Manifest` is a JSON description of a plugin's capabilities. Its default is:

```json
{"Metadata":{"TargetDataModels":["Edit","Server","Client"]},"Permissions":{}}
```

So by default a plugin is meant to run in **Edit, Server and Client** DataModels. The manifest itself is `RobloxScriptSecurity` (used by built-in and standalone plugins), so you cannot change it from a normal plugin script. Guard in code instead.

There are also Studio settings: `LoadUserPluginsInRunModes` controls whether **user-installed** plugins load in run modes, and `LoadAllBuiltinPluginsInRunModes` does the same for built-in ones. The default values aren't listed in our docs copy, so don't rely on either one. Write code that is correct both ways.

## The guard

```lua
local RunService = game:GetService("RunService")

if not RunService:IsEdit() then
	-- We are inside a playtest (server or client copy). Edit-only tools stop here.
	return
end

-- toolbar, widgets, edit tools...
```

`IsEdit()` is `true` only in edit mode. During a playtest it is `false`. When the simulation is **paused**, both `IsEdit()` and `IsRunning()` return `false`. In a paused Run session your plugin should behave as "not edit".

For a **runtime debug tool** (an inspector that shows server state while you play), do the opposite: `if RunService:IsServer() and RunService:IsRunning() then ... end`. Keep that code in its own module, so edit tools never load it in play mode.

## What breaks in play mode

| Feature | Behaviour during a solo playtest |
| --- | --- |
| `ChangeHistoryService:TryBeginRecording()` | **Returns `nil`**. Undo recordings fail in solo playtests |
| Edits to Workspace | Go to the play copy and are **lost** when you stop (unless you copy them out on purpose) |
| `plugin:SetSetting()` | Shared across all copies, so play-mode copies can overwrite edit-mode values ([[Studio Tools - Plugin Settings with GetSetting and SetSetting - Limits and Patterns]]) |
| Dock widgets | Each loaded copy can create its own widget, so you get duplicate panels |

## Getting play-mode results back to Edit

Builders often want "record positions while playing, then apply them in Edit" (camera paths, NPC patrol points):

1. In play mode, collect the data and save it with `plugin:SetSetting("TopG_Capture", data)` (only plain values: numbers in tables, not CFrames).
2. After stopping, the Edit copy reads the setting and creates the instances inside a ChangeHistoryService recording.
3. Clear the setting afterwards.

## Automating playtests from a plugin

`StudioTestService` lets plugins start and control playtests themselves. Its methods include `ExecutePlayModeAsync` and `ExecuteRunModeAsync`, and `EndTest(result)` returns a value to the caller. This is the base of the multi-client recipes in [[Multi-Client Integration Recipes with StudioTestService]].

## Checklist

- [ ] Edit-only code returns early when `not RunService:IsEdit()`
- [ ] Runtime-only code is in a separate module behind `IsRunning()`
- [ ] Your tool shows a message when `TryBeginRecording` returns `nil`
- [ ] Tested with the setting `LoadUserPluginsInRunModes` both on and off

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Testing Modes for Beginners - Test, Run and Server and Clients]] · [[Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload]] · [[Works in Studio, Breaks Live - Checklist]]
