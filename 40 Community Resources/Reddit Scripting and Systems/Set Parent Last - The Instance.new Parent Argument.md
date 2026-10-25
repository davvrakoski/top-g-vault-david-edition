---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/set-parent-last"
title: "Set Parent Last - The Instance.new Parent Argument"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/psa-dont-use-instancenew-with-parent-argument/30296
cssclasses: [tg-a40]
---

# Set Parent Last - The Instance.new Parent Argument

One of the most-linked performance posts ever (1,600+ likes, 90k+ views), written by @zeuxcg, the Roblox engineer behind much of Luau. Still true in 2026 and still the answer whenever someone pastes `Instance.new("Part", workspace)`.

## The rule

**Create the instance, set every property, then set `Parent` last.**

## Why

- An instance that is not in the DataModel is cheap to change: you're just writing memory.
- Once it's parented under `game`, every property change can trigger work: replication to clients, physics updates, rendering and change signals.
- `Instance.new(class, parent)` parents first, so every property you set afterwards pays that cost. In the original case this caused a real slowdown in a top game.

```lua
-- BAD: parented first, then 6 property changes each replicate/update
local part = Instance.new("Part", workspace)
part.Size = Vector3.new(4, 1, 4)
part.Anchored = true
part.Color = Color3.fromRGB(200, 60, 60)
part.Material = Enum.Material.Neon
part.CFrame = CFrame.new(0, 10, 0)
part.Name = "Marker"

-- GOOD: configure while detached, parent once at the end
local marker = Instance.new("Part")
marker.Name = "Marker"
marker.Size = Vector3.new(4, 1, 4)
marker.Anchored = true
marker.Color = Color3.fromRGB(200, 60, 60)
marker.Material = Enum.Material.Neon
marker.CFrame = CFrame.new(0, 10, 0)
marker.Parent = workspace
```

## Related habits

- **Cloning templates**: same rule. `clone.Parent = folder` goes after positioning and configuration.
- **Bulk moves**: for many parts moving every frame, `workspace:BulkMoveTo(parts, cframes)` is cheaper than setting `CFrame` on each.
- **Exception**: calls that need the instance in the world must come after parenting, for example `SetNetworkOwner` on a part.
- The same thread has a popular one-liner from @zeuxcg advising people never to learn from old Roblox gear code, which is full of outdated habits like this.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Instance Count and Part Budgets]] · [[Object Pooling Without Making a Mess]] · [[Script Profiler, Native Code Gen and Luau Hot Paths]] · [[Community Optimization Tips - Fact-Checked]]

<!-- TDOD_GRAPH_END -->
