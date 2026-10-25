---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Script Editor Extensions - Custom Autocomplete and Script Analysis"
tags: [roblox, community-knowledge, studio, plugins, script-editor, linting, autocomplete]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ScriptEditorService#RegisterAutocompleteCallback
  - https://create.roblox.com/docs/reference/engine/classes/ScriptEditorService#RegisterScriptAnalysisCallback
  - https://create.roblox.com/docs/reference/engine/enums/Severity
  - https://create.roblox.com/docs/studio/script-editor
---
# Studio Tools - Script Editor Extensions - Custom Autocomplete and Script Analysis

Every team has house rules: "remotes live in `ReplicatedStorage.Remotes`", "never call `DataStore` from the client", "use our `Signal` module, not BindableEvents". Studio lets a plugin plug into the **Script Editor itself**. You can add your own autocomplete entries (your remote names, your config keys) and your own **Script Analysis warnings** with wavy underlines. Teams that work in Studio instead of VS Code get a lightweight version of what `selene` gives Rojo users ([[selene for Roblox - Config, Std and Inline Filters]]).

## Custom Script Analysis warnings

```lua
local SES = game:GetService("ScriptEditorService")

SES:RegisterScriptAnalysisCallback("TopG_HouseRules", 10, function(req)
	local diagnostics = {}
	local s = req.script
	if not s then return { diagnostics = diagnostics } end

	local src = SES:GetEditorSource(s)
	local line = 0
	for text in (src .. "\n"):gmatch("(.-)\n") do
		line += 1
		local col = text:find("Instance.new%(\"BindableEvent\"%)")
		if col then
			table.insert(diagnostics, {
				range = {
					start = { line = line, character = col },
					["end"] = { line = line, character = col + 29 },
				},
				code = "TG001",
				message = "Use Shared.Signal instead of BindableEvent (team rule)",
				severity = Enum.Severity.Warning,
			})
		end
	end
	return { diagnostics = diagnostics }
end)

plugin.Unloading:Connect(function()
	SES:DeregisterScriptAnalysisCallback("TopG_HouseRules")
end)
```

Rules from the reference:

- Callbacks run in **ascending `priority`** order and **must not yield**.
- The request has `script` (the `LuaSourceContainer`, may be `nil`).
- Each diagnostic needs a `range` and a `message`. `code`, `severity` (`Enum.Severity`) and `codeDescription.href` are optional. **Links only show if they point to `https://create.roblox.com`**, so you can't link to your own wiki.
- Results appear both as underlines in the editor and in the **Script Analysis** window.

We assumed one-based line/character numbers in the snippet, to match the autocomplete request, which the reference says is one-indexed. Check that your underline lands on the right characters before you trust it (unverified for analysis ranges).

## Custom autocomplete

`RegisterAutocompleteCallback(name, priority, fn)` with `fn(request, response) -> response`:

- `request.position` has a **one-indexed** `line` and `character`. `request.textDocument` has `document` (a ScriptDocument) and/or `script`.
- `response.items` is the list Studio already built. **Add to it or filter it, then return it.** The next callback gets your output.
- Each item needs a `label`. Optional fields: `kind` (`Enum.CompletionItemKind`, sets the icon), `detail`, `documentation = { value = "..." }`, `codeSample`, `preselect`, `tags`, and `textEdit` for exact insert/replace ranges.

```lua
SES:RegisterAutocompleteCallback("TopG_Remotes", 20, function(req, res)
	local doc = req.textDocument.document
	if not doc then return res end
	local lineText = doc:GetLine(req.position.line)
	if lineText:find("Remotes%.") then
		for _, r in game.ReplicatedStorage.Remotes:GetChildren() do
			table.insert(res.items, {
				label = r.Name,
				detail = r.ClassName,
				documentation = { value = "Project remote" },
			})
		end
	end
	return res
end)
```

## Design tips

- **Fast and cheap**: these callbacks run while people type. Cache the remote list and refresh it on `ChildAdded`/`ChildRemoved`, not on every keystroke.
- **Few rules, high signal**: three warnings people agree with beat thirty they learn to ignore.
- **Deregister on unload**, or reloads stack duplicate warnings.
- **Ship rules as a team plugin** (published privately or as a group asset), so everyone gets the same checks.
- If you also use VS Code, keep the same rules in `selene` so the two don't disagree.

## Pitfalls

- Analysis callbacks get only `script`, not the open document. Use `GetEditorSource` to read unsaved text.
- Pattern matching on raw text gives false positives in comments and strings. Strip `--` comments first, or accept some noise.
- Not every `CompletionItemKind` has its own icon; unsupported ones show the "Property" icon.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Plugins That Edit Scripts - ScriptEditorService UpdateSourceAsync]] · [[selene for Roblox - Config, Std and Inline Filters]] · [[luau-lsp analyze and Rojo Sourcemaps in CI]]
