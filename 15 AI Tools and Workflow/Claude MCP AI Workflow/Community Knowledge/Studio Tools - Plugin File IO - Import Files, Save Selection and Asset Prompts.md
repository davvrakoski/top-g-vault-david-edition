---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Plugin File IO - Import Files, Save Selection and Asset Prompts"
tags: [roblox, community-knowledge, studio, plugins, import, pipeline, building]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/StudioService#PromptImportFilesAsync
  - https://create.roblox.com/docs/reference/engine/classes/File
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#PromptSaveSelectionAsync
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#SaveSelectedToRoblox
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#PromptForExistingAssetIdAsync
---
# Studio Tools - Plugin File IO - Import Files, Save Selection and Asset Prompts

Plugins can't read your hard drive freely. That is good for security, but it means people often assume plugins can't import data at all. They can, through **user-approved file dialogs**: the user picks a file, and your plugin gets its bytes. That is enough for real build tools: placing props from a CSV exported by a level-design spreadsheet, building walls from a JSON floor plan, previewing local images before upload, or exporting a selection as an `.rbxm` kit for another project.

## Import: PromptImportFileAsync / PromptImportFilesAsync

```lua
local StudioService = game:GetService("StudioService")
local HttpService = game:GetService("HttpService")

local file = StudioService:PromptImportFileAsync({ "json" })
if not file then return end -- cancelled, or file over 100 MB

local data = HttpService:JSONDecode(file:GetBinaryContents())
```

- `PromptImportFileAsync(filter)` → one `File`. `PromptImportFilesAsync(filter)` → a list (empty if cancelled). The older names without `Async` are deprecated.
- The filter is a list of extensions **without the dot**: `{ "csv", "json" }`.
- **Size limit 100 MB.** Bigger files give `nil`.
- `PromptImportFilesAsync` **throws if you pass an empty filter list**. Leave the argument out to allow any type.
- Both **yield** while the dialog is open.

### What a `File` gives you

| Member | Use |
| --- | --- |
| `File.Size` | Bytes on disk, so you can refuse huge files early |
| `File:GetBinaryContents()` | The whole file as a Luau string (text or binary) |
| `File:GetTemporaryId()` | An `rbxtemp://` content ID, to **preview an image** in an `ImageLabel` before uploading it |

## Recipe: props from a CSV

A level designer keeps `prop,x,y,z,rotY` rows in a spreadsheet. Your plugin:

1. Prompts for a `.csv`, splits it into lines with `gmatch`, and parses each row with `string.split(line, ",")`.
2. Looks up `prop` in a `ServerStorage.PropKit` folder.
3. Clones and places each prop with `PivotTo(CFrame.new(x, y, z) * CFrame.Angles(0, math.rad(rotY), 0))`.
4. Does all of it inside **one** ChangeHistoryService recording ([[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]]), with `task.wait()` every few hundred rows.
5. Reports unknown prop names in the Output instead of failing.

Don't keep the CSV/JSON inside the place as a raw asset. Bake it into instances, or into a ModuleScript if the game needs the data at runtime.

## Export: save the selection to disk

`plugin:PromptSaveSelectionAsync(suggestedFileName)` opens a save dialog for the **current selection** and returns `true` if the user saved. Use it for "export this kit" buttons. It writes the same kind of model file as right-click **Save to File**, ready to drag into another place or to commit to Git.

## Upload: SaveSelectedToRoblox

`plugin:SaveSelectedToRoblox()` opens Studio's normal **upload window** for the current selection, so a kit can be published as a model asset without leaving your plugin. The user still fills in the name and settings and confirms. Your plugin can't upload silently.

## Pick an existing animation

`plugin:PromptForExistingAssetIdAsync("Animation")` shows the user's animation inventory and returns the chosen ID, or `-1` if closed. **Only `Animation` is supported**; any other type errors. This is useful for rigging and animation tools that need an ID without copy-pasting.

## FBX rigs and animations

`plugin:ImportFbxRigAsync()` and `plugin:ImportFbxAnimationAsync()` exist for animation tools, but for normal mesh import use Studio's **Importer** (FBX, glTF, OBJ), which has full settings and presets. See [[FBX Import Settings, Scale and Collision Fidelity]].

## Pitfalls

- The dialogs are modal and yield. Don't call them while an undo recording is open.
- `GetBinaryContents` returns raw bytes. Check UTF-8 text with `utf8.len(s)` (returns `nil` for bad UTF-8) before showing it in UI.
- Plugins **cannot write arbitrary files**. Exporting text (CSV reports and similar) means printing to the Output or putting it in a ModuleScript the user saves. Only selections can go through the save dialog.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Selection-Driven Batch Tools - Selection Service and SelectionChanged]] · [[Asset Pipelines as Code - Asphalt, Tarmac and Mantle]] · [[Real-World Heightmaps - Free DEM Sources and Licenses]]
