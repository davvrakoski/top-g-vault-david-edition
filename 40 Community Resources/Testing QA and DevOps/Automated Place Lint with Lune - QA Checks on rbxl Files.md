---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/place-lint-lune"
title: "Automated Place Lint with Lune - QA Checks on rbxl Files"
tags: [roblox, community, "cluster/testing-qa-and-devops", qa, lune, ci, security]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MPL-2.0 (Lune); script below is original"
sources:
  - https://lune-org.github.io/docs/api-reference/roblox
  - https://lune-org.github.io/docs/roblox/4-api-status
  - https://lune-org.github.io/docs/api-reference/fs
  - https://lune-org.github.io/docs/api-reference/process
---
# Automated Place Lint with Lune - QA Checks on rbxl Files

**Idea:** many release bugs are not code bugs but **place-file mistakes**: a script in the wrong container, an unanchored prop that falls through the map, a free model hiding a `require(123456)` backdoor, a missing tag. selene can't see those because they live in the `.rbxl`, not in `src/`. Lune can open the built place and check it in CI, with no Studio.

## Lune facts used here
- `require("@lune/fs").readFile(path)` returns the file contents; `require("@lune/roblox").deserializePlace(contents)` turns the **contents string** (not a path) into a DataModel.
- Lune's API status page lists `GetDescendants`, `IsA`, `FindFirstChild`, `GetFullName`, `GetAttribute`, and CollectionService `GetTags`/`HasTag` as implemented. Recently added engine members may be missing.
- `process.exit(code)` sets the CI result.

## The linter (original)

```luau
-- tools/place_lint.luau   usage: lune run tools/place_lint.luau build/game.rbxl
local fs = require("@lune/fs")
local process = require("@lune/process")
local roblox = require("@lune/roblox")

local path = process.args[1] or "build/game.rbxl"
local game = roblox.deserializePlace(fs.readFile(path))

local problems: { string } = {}
local function report(inst, msg: string)
	table.insert(problems, inst:GetFullName() .. ": " .. msg)
end

local workspace = game:GetService("Workspace")

for _, inst in game:GetDescendants() do
	-- 1. Server code must not live where clients can read it.
	if inst:IsA("Script") and not inst:IsA("LocalScript") then
		local top = inst:GetFullName():match("^([^%.]+)")
		if top == "ReplicatedStorage" or top == "ReplicatedFirst" or top == "StarterGui" then
			report(inst, "server Script in a client-visible container")
		end
	end

	-- 2. Numeric require() is the classic free-model backdoor.
	--    (Source access is not listed on Lune's API status page; pcall in case it is unavailable.)
	if inst:IsA("LuaSourceContainer") then
		local ok, source = pcall(function()
			return (inst :: any).Source
		end)
		if ok and type(source) == "string" and source:find("require%s*%(%s*%d+%s*%)") then
			report(inst, "require(<asset id>) found - review before shipping")
		end
	end

	-- 3. Loose props in Workspace that will fall at runtime.
	if inst:IsA("BasePart") and inst:IsDescendantOf(workspace) and not (inst :: any).Anchored then
		if not inst:FindFirstAncestorWhichIsA("Model") and not inst:HasTag("Physics") then
			report(inst, "unanchored part outside any Model (tag it 'Physics' if intended)")
		end
	end
end

-- 4. Required structure.
for _, needed in { "ServerScriptService", "ReplicatedStorage" } do
	if not game:FindFirstChild(needed) then
		table.insert(problems, "missing service " .. needed)
	end
end

for _, p in problems do
	print("PLACE-LINT " .. p)
end
print(("place lint: %d problem(s)"):format(#problems))
process.exit(if #problems == 0 then 0 else 1)
```

`IsDescendantOf` and `FindFirstAncestorWhichIsA` are standard Instance methods; if your Lune version lacks one, replace it with a walk up `.Parent`. Run the script once locally against a known-good place before adding it to CI.

## Where it fits
Add it after `rojo build` in [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]]:

```yaml
- name: Place lint
  run: lune run tools/place_lint.luau game.rbxl
```

If your map is built in Studio (not Rojo), download or export the place file and run the same check before publishing.

## More checks worth adding
- Every `ProximityPrompt` has `ObjectText`/`ActionText` set (localization and accessibility).
- Every `Sound` in the place uses an asset you own or that is cleared for use ([[Plugin and Free Model Safety Checklist]]).
- No `Script` with `Disabled = true` left over from debugging (or allow-list them by name).
- Collision groups and tags required by your systems exist (spawn points, kill bricks, checkpoints).

## Limits
Lune is a file inspector, not the engine: no physics, no script execution, no streaming. It finds structural mistakes; behaviour still needs [[Engine Tests in CI with Open Cloud Luau Execution]] and playtests.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Lune - Run Luau Outside Studio]] · [[Lune Test Harness for Pure Luau Modules]] · [[Plugin and Free Model Safety Checklist]] · [[Full Test Matrix]]

<!-- TDOD_GRAPH_END -->
