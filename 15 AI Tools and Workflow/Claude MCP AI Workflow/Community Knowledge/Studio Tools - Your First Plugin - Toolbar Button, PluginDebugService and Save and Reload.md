---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload"
tags: [roblox, community-knowledge, studio, plugins, plugin-development, workflow]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/plugins
  - https://create.roblox.com/docs/reference/engine/classes/Plugin
  - https://create.roblox.com/docs/reference/engine/classes/PluginToolbar
  - https://create.roblox.com/docs/reference/engine/classes/PluginToolbarButton
  - https://create.roblox.com/docs/reference/engine/classes/Studio
---
# Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload

A Studio plugin is just a Script that runs inside Studio with extra permissions (`PluginSecurity`), plus a global called `plugin`. Once you can write one, every repetitive building chore (rename 200 parts, snap lamps to a wall, add a tag to a selection) becomes one button. This note gets you from nothing to a working toolbar button with a fast edit-reload loop. The rest of the "Studio Tools" notes build on it.

## Step 0: turn on plugin debugging

Studio settings > **Studio** > enable **Plugin Debugging Enabled** (the `PluginDebuggingEnabled` setting). This shows **PluginDebugService** in the Explorer. Local plugins appear there and you can set breakpoints in them, just like game scripts (see [[Studio Debugger - Breakpoints, Logpoints, Watch and Call Stack]]).

## Step 1: write the script

Put a `Script` in `ServerStorage` (anywhere that will not run in-game) and name it after the plugin, for example `QuickAnchor`.

```lua
local Selection = game:GetService("Selection")

local toolbar = plugin:CreateToolbar("Top G Tools")
-- CreateButton(buttonId, tooltip, iconname, text)
local button = toolbar:CreateButton("QuickAnchor", "Anchor every selected part", "", "Anchor")
button.ClickableWhenViewportHidden = true

button.Click:Connect(function()
	for _, inst in Selection:Get() do
		if inst:IsA("BasePart") then
			inst.Anchored = true
		end
	end
end)
```

The empty icon string gives a text-only button; pass an uploaded image as `rbxassetid://<id>` for a real icon. (Undo support is missing on purpose here; add it with [[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]].)

## Step 2: save it as a local plugin

1. Select the script in the Explorer.
2. **Plugins** tab > **Save as Local Plugin** > **Save**. Studio writes a file into your local Plugins folder (the `PluginsDir` setting; on Windows this is normally `%LOCALAPPDATA%\Roblox\Plugins`, and the Plugins tab has a **Plugins Folder** button that opens it - button name unverified in the newest ribbon layout).
3. **Delete the original script** from `ServerStorage`. From now on, edit the copy under **PluginDebugService**. The official guide warns about this: if you keep both, you end up editing the wrong one.

## Step 3: the edit-reload loop

| Action | How |
| --- | --- |
| Save edits and restart one plugin | Right-click it under PluginDebugService > **Save and Reload Plugin** |
| Restart without saving (to hit a breakpoint again) | Right-click > **Reload Plugin** |
| Save and reload everything | Right-click PluginDebugService > **Save and Reload All Plugins in Debugger** (`Ctrl+Shift+L` / `Cmd+Shift+L`) |

If you build plugins from files with Rojo instead, see [[Studio Tools - Plugin Projects with Rojo - rojo build --plugin and Watch Reload]]. Studio also has a `ReloadLocalPluginsOnChange` setting that reloads local plugins when their files change.

## Toolbar button facts worth knowing

- `CreateToolbar(name)` makes one labelled group in the **Plugins** tab. Make **one toolbar per plugin** and put all its buttons in it.
- `buttonId` should be unique and stable. Changing it later makes Studio treat it as a new button.
- `ClickableWhenViewportHidden = true` lets the button work while a script tab is in front. Leave it `false` for tools that need the 3D view.
- `button:SetActive(true/false)` shows a toggled state. Use it for tools that stay on, such as a placement mode or a panel that is open.
- `button.Enabled = false` greys the button out, for example when nothing valid is selected.

## Pitfalls

- **The plugin also runs during playtests.** Guard edit-only code. See [[Studio Tools - Plugins in Play Mode - Edit, Server and Client DataModels]].
- **Leaked connections on reload.** Buttons and widgets are cleaned up for you; your own connections and any temporary parts in the Workspace are not. See [[Studio Tools - Plugin Cleanup - Unloading, Connections and Reload Safety]].
- **Inserting scripts needs permission.** If your plugin creates `Script`/`LocalScript` instances, the user is asked for Script Injection permission. See [[Studio Tools - Plugin Permissions - Script Injection and HTTP Domain Prompts]].

## Checklist

- [ ] Plugin Debugging Enabled is on
- [ ] Source script removed from `ServerStorage` after the first save
- [ ] One toolbar, unique stable button IDs
- [ ] Changes wrapped in a ChangeHistoryService recording
- [ ] Edit-mode guard in place

## Related

[[Claude MCP AI Workflow - Hub]] · [[Plugin and MCP Supply-Chain Security]] · [[Studio Debugger - Breakpoints, Logpoints, Watch and Call Stack]] · [[Built-in Studio Tools That Replace Old Plugins]]
