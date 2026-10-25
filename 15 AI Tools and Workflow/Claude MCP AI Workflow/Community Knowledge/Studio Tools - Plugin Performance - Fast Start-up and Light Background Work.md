---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Plugin Performance - Fast Start-up and Light Background Work"
tags: [roblox, community-knowledge, studio, plugins, performance]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Plugin
  - https://create.roblox.com/docs/reference/engine/classes/Selection
  - https://create.roblox.com/docs/reference/engine/classes/PluginGui
  - https://create.roblox.com/docs/reference/engine/classes/Highlight
---
# Studio Tools - Plugin Performance - Fast Start-up and Light Background Work

Every installed plugin runs when Studio opens each place, and copies can also load into playtest DataModels. Ten "small" plugins that each scan the whole Workspace at start-up, or listen to every property change, are why some people's Studio takes a minute to open and stutters while they drag parts. If you write plugins, keep them **lazy and quiet**. If you install them, these are the signs of a heavy one.

## Rule 1: do almost nothing at start-up

At load time, a plugin should only:

1. create its toolbar/buttons and PluginActions;
2. create (but not fill) its dock widget, since `CreateDockWidgetPluginGuiAsync` restores saved state;
3. connect the button clicks.

Everything else (requiring big modules, building UI trees, scanning the place) should wait until the user first clicks, or until the widget becomes visible:

```lua
local ui -- built on first open
local function ensureUI()
	if ui then return ui end
	ui = require(script.UI).build(widget, plugin) -- heavy require happens here
	return ui
end

widget:GetPropertyChangedSignal("Enabled"):Connect(function()
	if widget.Enabled then ensureUI() end
end)
if widget.Enabled then task.defer(ensureUI) end -- restored open from last session
```

Measure it: wrap your start-up in `local t = os.clock()` ... `print(("[TopG] loaded in %.1f ms"):format((os.clock() - t) * 1000))` and aim for a few milliseconds.

## Rule 2: listen narrowly

| Expensive | Cheaper |
| --- | --- |
| `game.DescendantAdded` on the whole game | `CollectionService:GetInstanceAddedSignal(tag)` for your tag, or `DescendantAdded` on one folder |
| `Changed` on many instances | `GetPropertyChangedSignal("Size")` for the one property you need |
| `RunService.Heartbeat` polling in edit mode | Events, or a `task.delay` loop that only runs while your panel is open |
| Refreshing on every `SelectionChanged` | Debounce with `task.defer` (see [[Studio Tools - Selection-Driven Batch Tools - Selection Service and SelectionChanged]]) |

Disconnect everything when your panel closes, not only on unload. A closed panel should cost nothing.

## Rule 3: chunk big jobs

For anything over a few hundred instances:

- Process in batches of about 200-500 and call `task.wait()` between batches, so Studio can draw frames.
- Show progress in your panel and offer **Cancel** (end the recording with `Cancel` to roll back, see [[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]]).
- Keep the whole job in **one** undo recording.

## Rule 4: watch visual helpers

- Viewport helpers are live 3D objects. Hundreds of adornments or billboards slow down the editor camera.
- `Highlight` is capped at **255 visible at once** in Studio; past that, extra ones are silently ignored. Design overlays that don't need hundreds ([[Studio Tools - Edit-Mode Overlays - Visualise Tags and Zones from a Plugin]]).
- Pause live previews on `WindowFocusReleased` and resume on `WindowFocused`.

## Rule 5: stay out of playtests

Return early when `not RunService:IsEdit()` unless your plugin is a runtime debugger ([[Studio Tools - Plugins in Play Mode - Edit, Server and Client DataModels]]). Otherwise you add load time to every Play press.

## For users: finding the slow plugin

1. **Plugins > Manage Plugins**: disable half your plugins, restart Studio, and check whether opening a place or dragging parts gets faster. Repeat (binary search).
2. Watch the Output at start-up for plugins that print or warn a lot.
3. Remove what you don't use. The safety checklist says the same for security reasons ([[Plugin and Free Model Safety Checklist]]).

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Plugin Cleanup - Unloading, Connections and Reload Safety]] · [[MicroProfiler Reading Guide]] · [[Studio Tools - DockWidgetPluginGui Panels - Create, Restore and Toggle]]
