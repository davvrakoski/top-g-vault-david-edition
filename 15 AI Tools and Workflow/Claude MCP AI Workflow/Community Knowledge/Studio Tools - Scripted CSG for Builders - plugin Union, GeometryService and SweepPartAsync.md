---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Scripted CSG for Builders - plugin Union, GeometryService and SweepPartAsync"
tags: [roblox, community-knowledge, studio, plugins, csg, solid-modeling, building]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#Union
  - https://create.roblox.com/docs/reference/engine/classes/GeometryService
  - https://create.roblox.com/docs/parts/solid-modeling
---
# Studio Tools - Scripted CSG for Builders - plugin Union, GeometryService and SweepPartAsync

Studio's Union/Negate buttons are fine for one window hole. They don't scale to "cut a doorway in all 40 apartment walls" or "build a curved handrail that follows these 12 points". Scripted solid modeling does, from a plugin or the command bar. There are two API families: the old **Plugin CSG methods** that copy the toolbar buttons, and the newer **GeometryService** async methods with more options, including **SweepPartAsync**, which most builders have never heard of.

## Option A: Plugin methods (same as the toolbar)

| Method | Returns |
| --- | --- |
| `plugin:Union(parts)` | One `UnionOperation` |
| `plugin:Negate(parts)` | `NegateOperation`s (the "holes") |
| `plugin:Intersect(parts)` | One `IntersectOperation` |
| `plugin:Separate(unions)` | The original parts back |

These need `PluginSecurity`, so they only work in plugins or the command bar. They act like clicking the buttons, so the usual Studio defaults apply.

## Option B: GeometryService (more control)

| Method | Does |
| --- | --- |
| `UnionAsync(part, parts, options?)` | Merge |
| `SubtractAsync(part, parts, options?)` | Cut `parts` out of `part` |
| `IntersectAsync(part, parts, options?)` | Keep the overlap |
| `SweepPartAsync(part, cframes, options?)` | Drag a part's shape along a list of CFrames into one `MeshPart` |
| `FragmentAsync` / `GenerateFragmentSites` | Break a part into pieces (see [[Destructible Map Pieces - FragmentAsync, Pre-Fractured Models and Debris Budgets]]) |

The **options** table sets `CollisionFidelity`, `RenderFidelity`, `FluidFidelity` and, for the boolean operations, `SplitApart` (default `true`: results that don't touch become separate parts).

Rules from the reference:

- Results come back with **no Parent**, like `Clone()`. Parent them next to the original, then `Destroy()` the inputs.
- If any input is a **MeshPart**, the results are **MeshParts**.
- Terrain isn't supported as an input.
- They **yield**. Run batches in a loop, not all at once, and show progress.

## Recipe: doorway in every selected wall

```lua
local GS = game:GetService("GeometryService")
local CHS = game:GetService("ChangeHistoryService")
local cutter = workspace.DoorCutter -- a Part sized like the doorway

local id = CHS:TryBeginRecording("CutDoorways")
for _, wall in game:GetService("Selection"):Get() do
	if wall:IsA("BasePart") then
		local ok, results = pcall(GS.SubtractAsync, GS, wall, { cutter }, {
			CollisionFidelity = Enum.CollisionFidelity.PreciseConvexDecomposition,
			SplitApart = false,
		})
		if ok then
			for _, r in results do r.Parent = wall.Parent end
			wall:Destroy()
		else
			warn("Cut failed on", wall:GetFullName(), results)
		end
	end
end
if id then CHS:FinishRecording(id, Enum.FinishRecordingOperation.Commit) end
```

Move the cutter to each wall's door position before each subtract, or keep one cutter per wall in a tagged folder.

## Recipe: rails and pipes with SweepPartAsync

`SweepPartAsync(part, cframes)` makes the union of the convex hulls between **each pair of neighbouring CFrames**. A small cylinder swept along points sampled from a curve gives a smooth single-mesh handrail or pipe:

1. Put Attachments (or small parts) along the path and read their world CFrames in order.
2. Add extra in-between CFrames on curves. More samples give a smoother bend but more triangles.
3. Sweep a thin `Part` (Shape Cylinder, oriented along the path) through them.
4. Parent the returned `MeshPart` and set `Anchored = true`.

One CFrame gives just the convex hull of the input part, which is a quick way to "convex-wrap" a shape.

## Keep the cost in check

- Unions and generated meshes can cost more than they save. Read [[Unions vs MeshParts - When CSG Costs More Than It Saves]] before you cut 400 walls.
- Use `CollisionFidelity = Box` or `Hull` for decoration that players never touch closely. Use precise decomposition only for walkable shapes.
- Keep the **inputs** (wall + cutter) in a `ServerStorage` "source" folder, so you can redo the cut later instead of trying to edit a union.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Parts, Unions or MeshParts - Choosing the Geometry Type]] · [[Free Detail and Shape Plugins - Pipes, Curves, Cutters and 3D Text]] · [[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]]
