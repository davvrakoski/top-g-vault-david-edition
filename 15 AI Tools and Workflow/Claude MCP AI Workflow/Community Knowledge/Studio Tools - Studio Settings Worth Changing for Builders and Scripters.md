---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Studio Settings Worth Changing for Builders and Scripters"
tags: [roblox, community-knowledge, studio, settings, workflow, building]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Studio
  - https://create.roblox.com/docs/studio/script-editor
  - https://create.roblox.com/docs/studio/plugins
---
# Studio Tools - Studio Settings Worth Changing for Builders and Scripters

Studio has well over a hundred settings (File > Studio Settings, `Alt+S`), and most people never open the window. A handful of them save real time every day: faster camera flying across big maps, auto-recovery that actually saves often, scripts that format themselves, and measurement rulers on the drag handles. This is a short list of settings worth changing, grouped by job, using the **property names from the `Studio` settings class** (the labels in the window are usually the same or close).

## Safety first: recovery and updates

| Setting | Suggestion | Why |
| --- | --- | --- |
| `Auto-Recovery Enabled` | **On** | Recovery files after a crash |
| `Auto-Recovery Interval (Minutes)` | **5** (lower than you think) | A crash costs at most a few minutes of work |
| `AutoUpdateEnabled` | On | Older builds miss fixes; Team Create users should be on the same version |

Auto-recovery is not a backup. Keep named saves and version history too ([[Saving and Version History - Never Lose a Place]]).

## Building and camera

| Setting | Suggestion |
| --- | --- |
| `Camera Speed` / `Camera Shift Speed` | Raise them for big maps (Shift + WASD for fast flying). `CameraShiftFactor` is the Shift multiplier |
| `Camera Zoom to Mouse Position` | **On**: scrolling zooms to where you point, not the screen centre |
| `CameraTweenFocus` | On: `F` (focus) glides instead of jumping, so you keep your orientation |
| `DraggerShowMeasurement` | **On**: distance read-out while dragging |
| `DraggerShowHoverRuler` | On: a ruler when you hover near the dragger |
| `Use Bounding Box Move Handles` | Try it: move handles at the bounding box edge instead of the pivot, easier on large models |
| `Physical Draggers Select Scope By Default` | Decides whether a click picks the whole model or the part. Set it to match your habit |
| `Set Pivot of Imported Parts` | Check before mass imports, so pivots land where your kit expects |
| `Show Navigation Mesh` | Turn on while laying out NPC areas, off otherwise |
| `Show Hidden Objects in Explorer` | On when you hunt for planted scripts; off day to day |

## Script Editor

| Setting | Suggestion |
| --- | --- |
| `Format On Paste` / `Format On Type` | On: pasted code gets your indentation |
| `Indent Using Spaces` + `Tab Width` | Match your team (and your StyLua config if you use Rojo; see [[StyLua for Roblox - Config, Ignore Rules and CI Check]]) |
| `Rulers` | Add a column such as `100` to keep lines short |
| `Enable Temporary Tabs` / `...In Explorer` | On, if you hate tab clutter: single-clicked scripts open in a reusable preview tab |
| `Highlight Occurances` | On: other uses of the word under the cursor light up (the property name is spelled this way) |
| `Show Whitespace` | On only while fixing mixed tabs/spaces |
| `MaxFindReplaceAllResults` | Raise it if Find All (`Ctrl+Shift+F`) cuts off results in big projects |
| `EnableCodeAssist`, `Automatically trigger AI Code Completion` | Your choice; read the Script Editor page's code-privacy section first |

## Output and testing

| Setting | Suggestion |
| --- | --- |
| `Clear Output On Start` | **On**: each playtest starts with a clean log |
| `Maximum Output Lines` | Raise it for chatty systems |
| `Show Diagnostics Bar` | On: basic diagnostic info in the bottom right |
| `ScriptTimeoutLength` | Leave the default; raising it hides infinite-loop bugs |
| `Only Play Audio from Window in Focus` | **On** with several test clients open, so you don't hear four copies of every sound |
| `Main Volume` | Lower it for long test sessions |
| `Respect Studio shortcuts when game has focus` | On if Studio shortcuts should still work while the game window has focus |

## Plugin developers

| Setting | Suggestion |
| --- | --- |
| `PluginDebuggingEnabled` | On: shows PluginDebugService and allows breakpoints ([[Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload]]) |
| `ReloadLocalPluginsOnChange` | On with Rojo `--watch` builds ([[Studio Tools - Plugin Projects with Rojo - rojo build --plugin and Watch Reload]]) |
| `LoadUserPluginsInRunModes` | Test your plugin with it both on and off ([[Studio Tools - Plugins in Play Mode - Edit, Server and Client DataModels]]) |
| `Show Plugin GUI Service in Explorer` | On while debugging plugin UI |
| `Enable Http Sandboxing` | Leave the default |

## Settings to leave alone

`Enable Internal Features`, `Enable Internal Beta Features` and `LoadInternalPlugins` are for Roblox engineers. They can unlock unfinished tools and odd behaviour. Use **File > Beta Features** for official betas instead.

## Team tip

Write your team's choices into the project README. Studio settings are per user and per machine, so new collaborators won't get them automatically.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Install Studio and Your First Hour - Interface Tour]] · [[Studio Keyboard Shortcuts Cheat Sheet]] · [[Team Create for Beginners - Collaborators, Live Scripting and Drafts]]
