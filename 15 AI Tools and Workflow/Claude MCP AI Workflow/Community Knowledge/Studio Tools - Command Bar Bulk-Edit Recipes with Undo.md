---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Command Bar Bulk-Edit Recipes with Undo"
tags: [roblox, community-knowledge, studio, command-bar, building, workflow]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked; snippets are original and free to use"
sources:
  - https://create.roblox.com/docs/studio/overview
  - https://create.roblox.com/docs/studio/plugins
  - https://create.roblox.com/docs/reference/engine/classes/Selection
  - https://create.roblox.com/docs/reference/engine/classes/Studio
---
# Studio Tools - Command Bar Bulk-Edit Recipes with Undo

The command bar (View > Command Bar) runs Luau in the **edit** DataModel with plugin-level access, right now, with no plugin to install. It is the builder's power tool for one-off jobs too fiddly for the Properties window: numbered renames, random rotations, dropping props to the ground, swapping placeholders for real models. The multi-line command bar records its changes with ChangeHistoryService, so a run can usually be undone with `Ctrl+Z`. These recipes are written to stay that way. For read-only audits (counting parts, finding mesh IDs) see [[Map Audit Command Bar Script - Parts, Mesh IDs, Collision and Shadows]].

## Ground rules

- **Select first, run second.** Every recipe works on `game.Selection:Get()`, so it can't touch the whole map by accident.
- **No loops that keep running.** The official plugin guide warns that the command bar's undo recording should not be left running. Don't leave `while true` loops or connections behind.
- **Save a version first** for anything over a few hundred objects ([[Saving and Version History - Never Lose a Place]]).
- Settings: `CommandBarEnterExec` decides whether Enter runs the code, and `CommandBarLocalState` keeps your input between sessions.

## 1. Numbered rename (Lamp_01, Lamp_02...)

```lua
local sel = game.Selection:Get()
table.sort(sel, function(a, b) return a:GetPivot().X < b:GetPivot().X end)
for i, obj in sel do obj.Name = string.format("Lamp_%02d", i) end
```

Sorting by X first gives numbers in walking order, not click order.

## 2. Random Y rotation (rocks, trees, crates)

```lua
local rng = Random.new()
for _, obj in game.Selection:Get() do
	if obj:IsA("PVInstance") then
		obj:PivotTo(obj:GetPivot() * CFrame.Angles(0, math.rad(rng:NextNumber(0, 360)), 0))
	end
end
```

## 3. Random scale within a range

```lua
local rng = Random.new()
for _, m in game.Selection:Get() do
	if m:IsA("Model") then m:ScaleTo(rng:NextNumber(0.85, 1.2)) end
end
```

`Model:ScaleTo` scales the whole model about its pivot, including joints and attachments.

## 4. Drop to the ground

```lua
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude
local sel = game.Selection:Get()
params.FilterDescendantsInstances = sel
for _, obj in sel do
	if obj:IsA("PVInstance") then
		local pivot = obj:GetPivot()
		local hit = workspace:Raycast(pivot.Position + Vector3.new(0, 5, 0), Vector3.new(0, -500, 0), params)
		if hit then
			local size
			if obj:IsA("Model") then
				local _, s = obj:GetBoundingBox()
				size = s
			else
				size = obj.Size
			end
			obj:PivotTo(pivot + Vector3.new(0, hit.Position.Y + size.Y / 2 - pivot.Position.Y, 0))
		end
	end
end
```

This assumes the pivot is at the centre of the bounding box (the default for most models). Adjust it if your kit uses bottom pivots.

## 5. Swap placeholders for a real model

```lua
local source = game.ServerStorage.Kit.StreetLamp
for _, ph in game.Selection:Get() do
	if ph:IsA("BasePart") then
		local copy = source:Clone()
		copy:PivotTo(ph.CFrame)
		copy.Parent = ph.Parent
		ph:Destroy()
	end
end
```

Block the level out with grey cubes, then swap them all for art in one go.

## 6. Snap positions to the grid

```lua
local step = 0.5
for _, p in game.Selection:Get() do
	if p:IsA("BasePart") then
		local v = p.Position
		p.Position = Vector3.new(math.round(v.X / step) * step, math.round(v.Y / step) * step, math.round(v.Z / step) * step)
	end
end
```

## 7. Tag the selection (and see it in Explorer search)

```lua
for _, obj in game.Selection:Get() do obj:AddTag("Flicker") end
```

Then find them again with `tag:Flicker` ([[Studio Tools - Explorer Search Queries - Find and Bulk-Select Like a Pro]]).

## 8. Shadows off for tiny clutter

```lua
for _, obj in game.Selection:Get() do
	for _, p in { obj, unpack(obj:GetDescendants()) } do
		if p:IsA("BasePart") and p.Size.Magnitude < 2 then p.CastShadow = false end
	end
end
```

## When a recipe becomes a plugin

If you paste the same snippet every week, turn it into a toolbar button ([[Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload]]) and wrap it in an explicit recording ([[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]]).

## Pitfalls

- `unpack` on huge descendant lists can hit stack limits. For whole-map passes, loop over `GetDescendants()` directly.
- Code in the command bar during **Play** runs in the play DataModel, and changes vanish when you stop.
- Copy-pasting command-bar code from strangers is like installing a plugin. Read it first; see [[Free Model Backdoors - Spot and Remove Them]].

## Related

[[Claude MCP AI Workflow - Hub]] · [[Map Audit Command Bar Script - Parts, Mesh IDs, Collision and Shadows]] · [[Studio Keyboard Shortcuts Cheat Sheet]] · [[Free Building Plugins - Stravant, F3X and Archimedes]]
