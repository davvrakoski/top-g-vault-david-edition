---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Plugins That Edit Scripts - ScriptEditorService UpdateSourceAsync"
tags: [roblox, community-knowledge, studio, plugins, script-editor, codegen]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ScriptEditorService
  - https://create.roblox.com/docs/reference/engine/classes/ScriptDocument
  - https://create.roblox.com/docs/studio/script-editor
---
# Studio Tools - Plugins That Edit Scripts - ScriptEditorService UpdateSourceAsync

Code generators, bulk refactors ("rename `wait(` to `task.wait(` in 400 scripts"), header-comment stampers and AI helpers all change script text. The naive way, assigning `script.Source = newText`, fights with anyone who has that script open, including the user and Team Create collaborators using Live Scripting. Their unsaved edits can be overwritten, or your change can be lost. `ScriptEditorService` is the API Studio provides for doing this safely.

## Read: GetEditorSource, not Source

`ScriptEditorService:GetEditorSource(script)` returns the **edit-time** text: if the script is open, what is on screen right now; if not, what the editor would show. The reference warns this is not always the same as `Script.Source`. Analyse this text, not `Source`.

## Write: UpdateSourceAsync with a pure callback

```lua
local SES = game:GetService("ScriptEditorService")

local function replaceDeprecatedWait(s: LuaSourceContainer)
	SES:UpdateSourceAsync(s, function(old: string)
		local new, count = old:gsub("%f[%w_]wait%(", "task.wait(")
		if count == 0 then
			return nil -- returning nil cancels: no change, no undo entry
		end
		return new
	end)
end
```

How it behaves (from the reference):

- Your callback gets the **old** text and returns the **new** text.
- If the script is **open**, Studio asks the editor to apply the change. If the user typed in between and your view was out of date, the editor **rejects** it and Studio **calls your callback again** with fresh text. So the callback must be **pure**: no side effects, no counters you can't run twice.
- The callback **must not yield**.
- Returning **`nil` cancels** the operation.
- `UpdateSourceAsync` itself **yields** until it succeeds or is cancelled. Run it in its own thread when you process many scripts, and show progress.

The pattern above is a little too greedy: it would also change `wait(` inside strings and comments. For real refactors, tokenise properly or show the user a preview first.

## Show edits as reviewable diffs

`ScriptDocument:ReviewableTextEditsAsync()` applies a batch of line-based edits that show up in the editor as **inline diffs the user can accept or reject**. This is the right tool for "suggest a fix" features (AI or lint autofix), where the user should approve each change. `MultiEditTextAsync()` applies several edits as one atomic operation instead.

## Work with open editors

| API | Use |
| --- | --- |
| `GetScriptDocuments()` | All open documents, **including the command bar** (`doc:IsCommandBar()`) |
| `FindScriptDocument(script)` | The open document for a script, or `nil` |
| `OpenScriptDocumentAsync(script, options)` | Open a script; `options.HighlightRange` jumps to and highlights lines, and `Temporary = true` opens a preview tab |
| `doc:GetSelectedText()`, `doc:GetSelection()` | Act on what the user highlighted |
| `doc:EditTextAsync(text, startLine, startCol, endLine, endCol)` | Replace one range |
| `doc:AddReadOnlyReasonsAsync()` | Lock the editor UI while your tool works. Note that `EditTextAsync` on that document then **fails too**; `UpdateSourceAsync` and `Script.Source` still work. Remove the reason when done |
| `TextDocumentDidOpen/DidChange/DidClose` | React to editor events (live linters) |

"Jump to problem" for a custom checker: `OpenScriptDocumentAsync(script, { HighlightRange = { Start = { Line = 10, Character = 1 }, End = { Line = 10, Character = 40 } } })`.

## Creating new scripts

Creating a `Script`/`LocalScript`/`ModuleScript` and setting its source is still normal for code generators. It triggers the **Script Injection** permission prompt for your plugin the first time (see [[Studio Tools - Plugin Permissions - Script Injection and HTTP Domain Prompts]]). Create the instance, parent it, then fill it with `UpdateSourceAsync`, so open-editor rules apply the same way everywhere.

## Pitfalls

- Bulk edits across scripts are **not one undo step** in the way part edits are. Make a named version first: File > Save to Roblox, then check [[Saving and Version History - Never Lose a Place]]. Or work in a Git-synced project.
- Respect Drafts. In a Team Create place with Drafts mode, users may be working on drafts that differ from the committed script ([[Team Create for Beginners - Collaborators, Live Scripting and Drafts]]).
- Never send script contents to an external server without asking the user. The HTTP permission prompt will show your domain, and users will (rightly) uninstall a plugin that does this unannounced.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Script Editor Extensions - Custom Autocomplete and Script Analysis]] · [[Deprecated Roblox APIs and Their Modern Replacements]] · [[AI Code Review Prompt]]
