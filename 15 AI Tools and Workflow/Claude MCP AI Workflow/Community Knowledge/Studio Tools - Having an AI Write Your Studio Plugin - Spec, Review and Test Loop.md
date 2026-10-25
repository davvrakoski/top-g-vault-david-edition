---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Having an AI Write Your Studio Plugin - Spec, Review and Test Loop"
tags: [roblox, community-knowledge, studio, plugins, ai, claude, workflow, review]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/plugins
  - https://create.roblox.com/docs/reference/engine/classes/ChangeHistoryService
  - https://create.roblox.com/docs/reference/engine/classes/Plugin
  - https://create.roblox.com/docs/reference/engine/classes/ScriptEditorService
---
# Studio Tools - Having an AI Write Your Studio Plugin - Spec, Review and Test Loop

Small builder plugins are a near-perfect job for an AI coding assistant. They are short, use a well-documented API, and are easy to test by eye. They are also **plugins**, so a careless one can rewrite scripts, break undo, or phone home. This note is a repeatable loop for getting a good plugin out of Claude (or any assistant): a spec that names the right APIs, a review checklist that catches the usual AI mistakes, and a safe test routine.

## 1. Write the spec (paste this, fill in the blanks)

```
Write a Roblox Studio plugin (Luau, single Script, uses the `plugin` global).
Goal: <one sentence, e.g. "drop every selected Model to the surface below it">.
Input: Selection:Get(). Work on <BaseParts | top-level Models (PVInstance + PivotTo)>.
UI: one toolbar "<Team Tools>", one button "<Label>" with buttonId "<StableId>",
    ClickableWhenViewportHidden = true. <No dock widget | DockWidget via CreateDockWidgetPluginGuiAsync>.
Undo: wrap the whole action in ChangeHistoryService:TryBeginRecording / FinishRecording
      (Commit on success, Cancel on error, inside pcall). Handle nil from TryBeginRecording.
Mode: return early if not RunService:IsEdit().
Must NOT: make HTTP requests, create Script/LocalScript instances, use require(<number>),
          loadstring, getfenv, or SetWaypoint / ChangeHistoryService:SetEnabled.
Cleanup: disconnect all connections in plugin.Unloading.
Performance: task.wait() every 300 items for big selections.
```

Naming the modern APIs matters. Assistants trained on older code tend to use `CreateDockWidgetPluginGui` (deprecated, use the `Async` version), `SetWaypoint` (to be deprecated), `PromptImportFile` (deprecated), `wait()` and `mouse.KeyDown`. See [[Deprecated Roblox APIs and Their Modern Replacements]].

## 2. Review checklist (5 minutes, every time)

- [ ] **Undo**: one `TryBeginRecording` per user action; `Cancel` on error; nothing changed before the recording starts ([[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]]).
- [ ] **No network, no remote code**: search for `HttpService`, `RequestAsync`, `GetAsync`, `require(` followed by a number, `loadstring`, `getfenv` ([[Free Model Backdoors - Spot and Remove Them]]).
- [ ] **No script injection** unless the spec asked for it. If it edits scripts, it uses `ScriptEditorService:UpdateSourceAsync` with a pure callback ([[Studio Tools - Plugins That Edit Scripts - ScriptEditorService UpdateSourceAsync]]).
- [ ] **Edit-mode guard** at the top.
- [ ] **Stable IDs**: buttonId, `pluginGuiId`, action IDs are constants, prefixed with your plugin name.
- [ ] **Cleanup**: every `:Connect` result is stored and disconnected in `plugin.Unloading`. CoreGui helpers are destroyed.
- [ ] **Settings keys** have no periods, quotes or backslashes ([[Studio Tools - Plugin Settings with GetSetting and SetSetting - Limits and Patterns]]).
- [ ] **Model handling**: Models are moved with `PivotTo`, not by moving each part.

Ask the assistant to review its own output against this list. Then check it yourself; the assistant's "looks good" is not a test.

## 3. Test routine

1. **Throwaway place** (Baseplate) with a few test objects: a part, a model, a locked part, a model inside a folder, a part inside a package if you use packages.
2. Turn on **Plugin Debugging Enabled**, save as a local plugin, and work from PluginDebugService ([[Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload]]).
3. Run the action, then press **`Ctrl+Z` once**: everything should go back. Then `Ctrl+Y`.
4. Run it with **nothing selected**, then with **500 objects**.
5. **Save and Reload** 10 times, then check for duplicate buttons or doubled output.
6. Press **Play** and confirm the plugin does nothing in the play copies.
7. Only then try it on a **copy** of the real place.

## 4. When an MCP agent edits Studio directly

If the assistant changes your place live through the Studio MCP server instead of writing a plugin, the same rules apply to *its* actions: undoable edits, no secrets, test place first. Setup and limits are in [[Claude and the Roblox Studio MCP Server - Responsible Setup]]. Studio's built-in Assistant has its own planning and skills features ([[Roblox Assistant Skills and Planning Mode - Team Setup]]).

## 5. Keep the result

- Save the final spec next to the code (a comment block at the top). It is the best documentation the plugin will ever have.
- Put the plugin in Git with Rojo once it grows past one file ([[Studio Tools - Plugin Projects with Rojo - rojo build --plugin and Watch Reload]]).

## Related

[[Claude MCP AI Workflow - Hub]] · [[AI Code Review Prompt]] · [[Prompt Library for Claude]] · [[Plugin and MCP Supply-Chain Security]]
