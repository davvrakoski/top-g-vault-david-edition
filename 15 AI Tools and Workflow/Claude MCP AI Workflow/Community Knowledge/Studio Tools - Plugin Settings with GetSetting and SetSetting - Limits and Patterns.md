---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Plugin Settings with GetSetting and SetSetting - Limits and Patterns"
tags: [roblox, community-knowledge, studio, plugins, settings, persistence]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#GetSetting
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#SetSetting
  - https://create.roblox.com/docs/reference/engine/classes/Instance#SetAttribute
---
# Studio Tools - Plugin Settings with GetSetting and SetSetting - Limits and Patterns

A builder tool that forgets its grid size, its last-used prefab folder or its "don't show again" choice every time Studio restarts gets uninstalled. `plugin:SetSetting()` and `plugin:GetSetting()` give each plugin a small **per-user, per-machine** store that survives restarts. Used well, they make a plugin feel polished. Used badly, they corrupt their own file or lose data when two Studio windows are open.

## What the API is

- `plugin:SetSetting(key, value)` stores a JSON-serialisable value (string, number, boolean, table, or `nil` to clear).
- `plugin:GetSetting(key)` returns it, or `nil` if missing.
- Data is saved as a `.json` map with string keys. **Arrays become maps**: numeric keys are turned into strings.

## Hard limits from the reference

These characters can **corrupt the settings file**:

- backslashes (`\`) in keys or values, especially escaped quotes;
- newlines in keys;
- quotes (`"`) in keys;
- **periods (`.`) in keys**. So `"palette.lastFolder"` is a bad key; use `"palette_lastFolder"`.

Also:

- **Several copies of your plugin can run at once** (one per open Studio window, and also in playtest DataModels). Any copy can overwrite a setting at any time.
- Both calls can **silently fail** while several copies are reading and writing. `GetSetting` may then return `nil` for a key that does exist.

## Pattern: one versioned table, written rarely

```lua
local KEY = "TopGPalette_v1"
local DEFAULTS = { gridStep = 1, lastFolder = "", showHints = true }

local function load()
	local saved = plugin:GetSetting(KEY)
	local s = table.clone(DEFAULTS)
	if typeof(saved) == "table" then
		for k, v in saved do
			if s[k] ~= nil and typeof(v) == typeof(s[k]) then s[k] = v end
		end
	end
	return s
end

local settings = load()

local function save()
	plugin:SetSetting(KEY, settings)
end
```

Why this shape:

- **Defaults merged with what was saved**: a new version of your plugin can add fields without crashing on old data.
- **Type checks**: a hand-edited or half-written file can't put a string where you expect a number.
- **Version in the key** (`_v1`): if you change the format, read `_v1`, convert it, and write `_v2`.
- **Save on change, not every frame.** Save when a control is committed (focus lost, mouse released), and once in `plugin.Unloading`.

## Pattern: tell "missing" apart from "temporarily unavailable"

The reference suggests checking again after a short delay if you write often. A simple version: if `GetSetting` returns `nil` on start-up, wait a moment with `task.wait(0.5)` and read once more before you fall back to defaults and overwrite.

## What NOT to put in plugin settings

| Data | Better place |
| --- | --- |
| Per-place config (which folder holds this map's spawn points) | An attribute on a Configuration/Folder **in the place** (`Instance:SetAttribute`), so it travels with the file and with Team Create |
| Shared team presets | A ModuleScript or a Package in the place |
| API keys, tokens or passwords | Nowhere in a plugin. The settings file is plain text on disk. For experience secrets, Studio has its own local secrets store (`StudioService.Secrets`, used by `HttpService:GetSecret()`) |
| Large data (thousands of entries) | A ModuleScript or attributes. Settings are meant to be small |

## Pitfalls

- `nil` and `false` are different: `GetSetting` returns `nil` for missing, so `if not value then` treats a saved `false` as missing. Compare with `== nil`.
- Tables with mixed array/dictionary keys come back as all-string keys. Use `tonumber(k)` when you read them.
- Settings belong to the **plugin identity**. A local copy and the published Creator Store copy of the same plugin may not share settings (unverified: test both if you migrate users).

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload]] · [[Studio Tools - Plugin Cleanup - Unloading, Connections and Reload Safety]] · [[Plugin and MCP Supply-Chain Security]]
