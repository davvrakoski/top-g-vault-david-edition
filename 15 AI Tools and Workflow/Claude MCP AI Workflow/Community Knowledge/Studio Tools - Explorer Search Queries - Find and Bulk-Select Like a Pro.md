---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Explorer Search Queries - Find and Bulk-Select Like a Pro"
tags: [roblox, community-knowledge, studio, explorer, building, workflow]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/explorer
  - https://create.roblox.com/docs/studio/properties
---
# Studio Tools - Explorer Search Queries - Find and Bulk-Select Like a Pro

Many builders install a "select by property" plugin or paste command-bar loops, when the Explorer search box already understands a small **query language**: property filters, class checks, tags, ancestry paths and boolean logic. Combined with **Select All** on the results, it handles most cleanup jobs with no code and nothing to undo-proof: "every unanchored part in the map", "every Decal", "all lamps tagged `Flicker` that are still Neon". This note is the practical cheat sheet with ready-to-paste queries.

Open the search with `Ctrl+Shift+X` (see [[Studio Keyboard Shortcuts Cheat Sheet]]).

## The query language at a glance

| Kind | Syntax | Example |
| --- | --- | --- |
| Name contains | `text` | `lamp` |
| Property equals | `Prop = value` or `==` | `Anchored = false` |
| Property compare | `~=`, `>`, `<`, `>=`, `<=` | `Transparency ~= 0` |
| One field of a vector/colour | `Prop.X`, `Color.R` | `Position.Y < -50` |
| Whole vector/colour | value in quotes | `Size > "20, 5, 20"` |
| Class (or subclass) | `is:Class` | `is:BasePart` |
| Tag | `tag:Name` (quote names with spaces) | `tag:"Light Source"` |
| Child path | `Parent.Child` | `Map.Shops` |
| Wildcards | `*` = one level, `**` = all descendants | `Map.**` |
| AND | space or `and` | `is:BasePart Anchored = false` |
| OR / groups | `or`, `( )` | `(is:Decal or is:Texture)` |

Notes from the docs: property search is **case-insensitive**, ignores spacing, and allows **partial** matches (`Material == plas` finds Plastic **and** SmoothPlastic). Names with **spaces** must be in double quotes, or the space is read as an AND.

## Selecting the results

- In a searched tree, `Ctrl+A` (or the select-all button) selects **only the matches**, not everything.
- **Shift-click** between two matches selects only the matches in between.
- **Box-drag** from empty space selects only matches inside the box.

The Properties window then edits all of them at once. That one edit is a single undo step.

## Ready-to-paste cleanup queries

| Goal | Query |
| --- | --- |
| Loose parts that will fall at runtime | `Workspace.** is:BasePart Anchored = false` |
| Invisible parts that still collide (invisible walls) | `is:BasePart Transparency = 1 CanCollide = true` |
| Invisible parts that still cast shadows | `is:BasePart Transparency = 1 CastShadow = true` |
| Parts fallen under the map | `is:BasePart Position.Y < -100` |
| Giant accidental parts | `is:BasePart Size > "500, 500, 500"` |
| All image surfaces to review | `(is:Decal or is:Texture or is:SurfaceAppearance)` |
| Every script in the map folder (backdoor hunt) | `Map.** (is:Script or is:LocalScript or is:ModuleScript)` |
| Neon parts (bloom and cost check) | `is:BasePart Material = Neon` |
| Tagged lamps that are still enabled | `tag:Flicker Enabled = true` |
| Locked parts in a model | `Building.** Locked = true` |

`Workspace.**` limits the search to the Workspace, so a matching part in `ServerStorage` is not caught by accident. Check the exact casing of service names in your tree.

## Explorer search vs plugin vs command bar

| Use | When |
| --- | --- |
| **Explorer search** | Find or select by properties you can see, then edit in Properties. No code, easy to undo |
| **Command bar** | The change is calculated (random rotation, renaming with numbers, maths on positions). See [[Studio Tools - Command Bar Bulk-Edit Recipes with Undo]] |
| **Plugin** | You repeat it every week, or other people need it. See [[Studio Tools - Selection-Driven Batch Tools - Selection Service and SelectionChanged]] |

## Pitfalls

- Very large places: searching `**` on the whole game can be slow. Narrow to a folder first.
- Some properties don't support search (the docs say "most properties are supported"). If a query returns nothing, test it on one known object.
- Partial matching works both ways: `Name = Door` also matches `DoorFrame`. Use more conditions when that matters.
- Hidden services aren't in the tree unless **Show Hidden Objects in Explorer** is on.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Explorer, Properties and Toolbox - Beginner Field Guide]] · [[Map Audit Command Bar Script - Parts, Mesh IDs, Collision and Shadows]] · [[CollectionService Tag-Driven Architecture]]
