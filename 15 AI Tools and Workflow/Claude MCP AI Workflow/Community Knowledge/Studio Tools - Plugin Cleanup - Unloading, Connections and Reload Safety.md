---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Plugin Cleanup - Unloading, Connections and Reload Safety"
tags: [roblox, community-knowledge, studio, plugins, lifecycle, memory]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#Unloading
  - https://create.roblox.com/docs/studio/plugins
  - https://create.roblox.com/docs/reference/engine/classes/ChangeHistoryService
---
# Studio Tools - Plugin Cleanup - Unloading, Connections and Reload Safety

While you develop a plugin you reload it dozens of times an hour. Your users' copies also reload when the plugin updates, when it is disabled, and when a place closes. Each reload that leaves something behind (a connection firing into dead code, a ghost preview part in the Workspace, an open undo recording) makes Studio slower and stranger. The reference is blunt: if a plugin does not clean up, old copies remain, and users may have to close and reopen the place.

## What Studio cleans up for you

According to the `Plugin.Unloading` reference, these are removed automatically when the plugin unloads:

- `PluginToolbarButton`s
- `DockWidgetPluginGui`s and other `PluginGui`s

**Everything else is your job.**

## When Unloading fires

`plugin.Unloading` fires **just before** the plugin stops: when it is disabled, uninstalled, about to be updated, when the place is closing, and when you use **Reload Plugin** during development.

## A cleanup bag (Maid/Trove style, written by hand)

```lua
local cleanup = {}

local function track(thing)
	table.insert(cleanup, thing)
	return thing
end

track(game:GetService("Selection").SelectionChanged:Connect(onSelection))
track(settings().Studio.ThemeChanged:Connect(repaint))
local ghost = track(Instance.new("Part"))

plugin.Unloading:Connect(function()
	for i = #cleanup, 1, -1 do
		local t = cleanup[i]
		if typeof(t) == "RBXScriptConnection" then
			t:Disconnect()
		elseif typeof(t) == "Instance" then
			t:Destroy()
		elseif type(t) == "function" then
			t()
		end
	end
	table.clear(cleanup)
end)
```

Clean up in **reverse order**: things created later often depend on things created earlier. Libraries such as Trove or Maid do the same; check their licenses before you bundle one.

## The things people forget

| Leftover | Symptom | Fix |
| --- | --- | --- |
| Service connections (`Selection`, `ChangeHistoryService.OnUndo`, `RunService.Heartbeat`) | Handlers fire twice after a reload, errors from "dead" code | Disconnect in `Unloading` |
| Preview / ghost parts | Stray transparent parts saved in the place | Track and `Destroy()` them; also hide them on `Deactivation` |
| Adornments (`SelectionBox`, `Highlight`, handles) | Outlines that never go away | Parent them to one folder and destroy the folder |
| Open ChangeHistoryService recording | Undo history stuck, next `TryBeginRecording` returns `nil` | See below |
| `task.spawn` loops | CPU use after the plugin is "gone" | Loop on a `running` flag, set it to `false` in `Unloading` |
| React/Fusion roots | Memory growth | `root:unmount()` / clean up the scope |

## Open undo recordings across reloads

The official plugin guide notes that **reloading a plugin does not cancel its open ChangeHistoryService recordings**. Two habits help:

1. Never keep a recording open across a yield the user controls (a dialog, a drag that can be interrupted). Open it, change things, finish it.
2. If you must (a long drag tool), save the recording ID, for example as an attribute on a folder your plugin owns. On start-up, if an ID is still there, cancel it with `FinishRecording(id, Enum.FinishRecordingOperation.Cancel)`. Cancel ignores the ID, so this is safe.

## Development hygiene

- Use **Save and Reload Plugin** under PluginDebugService (see [[Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload]]). After 20 reloads, check the Explorer for stray instances and watch `Stats` / the Developer Console memory for growth.
- Give everything your plugin creates in the DataModel a clear name prefix (`TopG_Ghost`). Leftovers are then easy to find with Explorer search ([[Studio Tools - Explorer Search Queries - Find and Bulk-Select Like a Pro]]).
- For panels, use a `PluginGui`, which Studio cleans up for you. Viewport helpers (Handles, adornments) are usually parented to `CoreGui`, which is not saved with the place. Studio does **not** remove those on unload, so destroy them yourself.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]] · [[Studio Tools - DockWidgetPluginGui Panels - Create, Restore and Toggle]] · [[Developer Console Memory Categories Explained]]
