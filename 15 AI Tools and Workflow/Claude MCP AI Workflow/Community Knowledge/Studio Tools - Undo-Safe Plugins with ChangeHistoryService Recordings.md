---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings"
tags: [roblox, community-knowledge, studio, plugins, undo, changehistoryservice]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ChangeHistoryService
  - https://create.roblox.com/docs/reference/engine/enums/FinishRecordingOperation
  - https://create.roblox.com/docs/studio/plugins
---
# Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings

A plugin that changes the place without telling the undo system is dangerous: the builder presses `Ctrl+Z` and either nothing happens or an unrelated earlier action is undone. Every plugin, command-bar macro or AI tool that edits the DataModel should wrap each user action in a **ChangeHistoryService recording**. Then one click is one undo step, with a readable name in the Edit menu.

## The modern API (use this)

| Call | What it does |
| --- | --- |
| `TryBeginRecording(name, displayName?)` | Starts tracking changes. Returns a string ID, or `nil` if it could not start |
| `FinishRecording(id, operation, finalOptions?)` | Ends the recording. `operation` is an `Enum.FinishRecordingOperation` |
| `IsRecordingInProgress(id?)` | Checks whether your plugin has an open recording |
| `GetCanUndo()` / `GetCanRedo()` | Returns whether undo/redo is possible, plus the action name |
| `OnUndo` / `OnRedo` | Events you can use to refresh your plugin UI after the user undoes or redoes |

`FinishRecordingOperation` values:

- **Commit**: push the changes as a new undo step (the normal case).
- **Append**: merge into the previous step if possible. Good for a slider drag where each tick would otherwise be its own step.
- **Cancel**: throw the changes away and **revert** them. The ID is ignored for Cancel, so you can always cancel your own open recording.

`SetWaypoint(name)` is the old method; the reference says it will be deprecated soon in favour of recordings.

## A safe wrapper

```lua
local CHS = game:GetService("ChangeHistoryService")

local function withUndo(name: string, fn: () -> ())
	local id = CHS:TryBeginRecording(name, name)
	if not id then
		warn("Could not start undo recording (playtest running or one already open)")
		return
	end
	local ok, err = pcall(fn)
	if ok then
		CHS:FinishRecording(id, Enum.FinishRecordingOperation.Commit)
	else
		CHS:FinishRecording(id, Enum.FinishRecordingOperation.Cancel)
		warn(name .. " failed and was rolled back: " .. tostring(err))
	end
end

-- usage
withUndo("Color selection red", function()
	for _, p in game:GetService("Selection"):Get() do
		if p:IsA("BasePart") then p.Color = Color3.fromRGB(200, 40, 40) end
	end
end)
```

The `pcall` plus **Cancel** pattern means a half-finished batch edit (an error at part 120 of 300) is rolled back instead of leaving the map in a mixed state.

## Rules from the reference

- Call `TryBeginRecording` **before** you change anything, or you get warnings.
- **One open recording per plugin.** A second call returns `nil` until the first is finished.
- Recordings **fail during a solo playtest** (`nil` is returned). Your tool should say so instead of silently doing nothing.
- `FinishRecording` **errors** if you have no open recording, or if the ID does not match (except with Cancel).
- **Reloading a plugin does not cancel its open recording.** The official guide suggests storing the last recording ID (for example in an attribute) so the reloaded plugin can cancel it.

## The command bar is recorded too

The multi-line command bar uses recordings itself, so a one-off bulk edit typed there can usually be undone. The guide warns against command-bar code that **keeps running** (a loop or a connection that stays alive), because that keeps a recording open. See [[Studio Tools - Command Bar Bulk-Edit Recipes with Undo]].

## Slider and drag tools: use Append

For a "scale selection" slider, start a recording on the first change and **Commit** it. Then use **Append** for later changes in the same drag, so the user can undo the whole drag with one `Ctrl+Z`. Start a fresh Commit when the mouse is released.

## Pitfalls

- **Never** call `SetEnabled(false)` to make your tool faster. It clears the user's whole undo history.
- `ResetWaypoints()` also wipes the history. It is meant for special tools, not normal edits.
- Keep one recording per user intention. Don't open one per part in a loop, or the user will have to press `Ctrl+Z` 300 times.
- AI or MCP tools that edit the place should follow the same rule. Ask your agent setup whether its edits are undoable; see [[Claude and the Roblox Studio MCP Server - Responsible Setup]].

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload]] · [[Saving and Version History - Never Lose a Place]] · [[Plugin and MCP Supply-Chain Security]]
