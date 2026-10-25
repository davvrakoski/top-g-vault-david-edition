---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Set Parent Last - Instance Creation Order and Template Cloning"
tags: [roblox, community-knowledge, performance, optimization, instances, replication]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/Instance
  - https://create.roblox.com/docs/reference/engine/classes/Instance
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://devforum.roblox.com/t/psa-dont-use-instance-new-with-parent-argument/30296
---
# Set Parent Last - Instance Creation Order and Template Cloning

The order in which you create and configure an instance changes how much work the engine does. Once an object sits inside the DataModel (Workspace, ReplicatedStorage, a player's PlayerGui), the engine starts listening to it for replication, rendering and physics. Every property you set after that point is a "live" change: on the server it can become its own replication message, and on the client it can re-trigger layout, physics or render updates. Building the object first and parenting it last turns many small live changes into one insert. This matters most in hot paths: projectile spawners, loot drops, UI list rows, and anything created dozens of times per second.

## The rule

The official `Instance.new` reference says it plainly: for performance, set `Parent` **last** instead of passing the second (`parent`) argument of the constructor. A Roblox engineer's DevForum PSA (linked) explains the reason: with the parent set first, each later property write is processed as a change to an object already in the world.

```lua
-- Good: configure while detached, then insert once
local part = Instance.new("Part")
part.Size = Vector3.new(1, 1, 4)
part.CFrame = muzzle.WorldCFrame
part.Anchored = true
part.CanCollide = false
part.Parent = workspace.Projectiles   -- last line

-- Avoid: every line after the constructor is a live change
local bad = Instance.new("Part", workspace)
bad.Size = Vector3.new(1, 1, 4)
```

## The same idea for whole hierarchies

- **Build children under a detached root, then parent the root.** A model with 30 parts parented one-by-one into Workspace costs more than the same model assembled in memory and parented once.
- **UI rows:** create the row Frame, add its TextLabels and ImageLabels, then parent the row into the ScrollingFrame. A UIListLayout re-sorts on every child insert, so inserting one finished row beats inserting a frame and then adding five children to it.
- **Batch multiple rows:** if you add 50 rows, build them all under a detached container and parent the container last, or parent rows inside a single frame step (see the dirty-flag note below).

## Template cloning

For complex objects, keep a prebuilt template in ServerStorage or ReplicatedStorage and `Clone()` it instead of rebuilding with dozens of `Instance.new` calls.

1. `Clone()` returns a detached copy (Parent is nil), so you get "parent last" for free.
2. Set per-instance values (CFrame, attributes, owner) on the clone.
3. Parent it.

```lua
local template = ServerStorage.Templates.Crate
local function spawnCrate(cf: CFrame)
    local crate = template:Clone()
    crate:PivotTo(cf)
    crate:SetAttribute("Loot", "Ammo")
    crate.Parent = workspace.Crates
    return crate
end
```

Notes:
- `Clone()` skips instances whose `Archivable` is false, so a template with a non-archivable child silently loses it.
- The constructor `Instance.fromExisting` copies properties only, not descendants (per the Instance datatype docs).
- If the same object is spawned and removed many times per minute, a pool beats both approaches: see [[Object Pooling Without Making a Mess]].

## Checklist

- [ ] No `Instance.new(class, parent)` two-argument calls in hot paths (search your codebase for `Instance.new(` with a comma).
- [ ] Every spawn function ends with the `.Parent =` line.
- [ ] UI list rows are built fully before insert.
- [ ] Repeated complex objects come from templates or pools.

## Related
[[Optimization - Hub]] - [[Object Pooling Without Making a Mess]] - [[Instance Count and Part Budgets]] - [[Remote Send Rate - Batching, Deltas and When One Remote Is Not Faster]]
