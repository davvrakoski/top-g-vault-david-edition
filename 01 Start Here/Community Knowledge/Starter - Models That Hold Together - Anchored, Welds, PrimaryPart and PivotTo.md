---
area: "01 Start Here"
cluster: "Start Here"
title: "Models That Hold Together - Anchored, Welds, PrimaryPart and PivotTo"
tags: [roblox, community-knowledge, start-here, models, welds, pivot, physics]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/assemblies
  - https://create.roblox.com/docs/studio/pivot-tools
  - https://create.roblox.com/docs/reference/engine/classes/Model
  - https://create.roblox.com/docs/reference/engine/classes/WeldConstraint
---
# Models That Hold Together - Anchored, Welds, PrimaryPart and PivotTo

Three beginner moments: you press Play and your car, tree or tower **falls apart**; you try to move a model from a script and only **one part** moves; or you rotate a model and it swings around a **strange point**. All three come from the same few ideas: anchoring, welds (assemblies), and pivots. Learn them once and every model you build or spawn behaves.

## Anchored or not?

- **Anchored = true:** the part ignores physics. It never falls, never gets pushed. Use for buildings, floors, decorations, most props. Anchored parts are also cheaper for the physics engine.
- **Anchored = false:** the part falls and can be pushed. Use for things that should move by physics: crates you can knock over, vehicles, NPCs, ragdolls.

Rule of thumb for beginners: **anchor everything that should not move.** A static map with unanchored parts is the number one cause of "my map collapsed when I hit Play".

## Welds: many parts, one object

When something must move as one piece (a car body, a swinging sign, a tool, a crate made of 6 parts), weld the parts together:

1. Pick one main part (the biggest, or the base).
2. **Model** tab > **Constraints** > **Weld**, then click the two parts, or insert a **WeldConstraint** in code with `Part0` and `Part1` set.
3. Weld every other part to the main part (a star shape is easier to debug than a long chain).

Welded parts form one **assembly**. The engine picks one **root part** for it: an anchored part always wins; otherwise non-massless, then higher `RootPriority`, then the largest part (Seats and parts named `HumanoidRootPart` get extra weight). If **one** part of an assembly is anchored, the whole assembly is held in place. That is how you build a door frame that does not fall but has a welded handle.

```lua
local function weldTogether(model: Model, main: BasePart)
	for _, part in model:GetDescendants() do
		if part:IsA("BasePart") and part ~= main then
			local weld = Instance.new("WeldConstraint")
			weld.Part0 = main
			weld.Part1 = part
			weld.Parent = main
			part.Anchored = false
		end
	end
end
```

`WeldConstraint` keeps parts in the positions they had when the weld was made. Move parts into place **first**, then weld.

## PrimaryPart and the pivot

Every Model has a **pivot**: the point it moves and rotates around.

- Set the Model's **PrimaryPart** property to its main part, and the pivot jumps to that part's pivot. This makes rotations predictable.
- In Studio, press **Pivot** on the Model tab to see and drag the pivot. You can place it where it makes sense, for example at the hinge of a door or the bottom centre of a tree.
- If you delete the PrimaryPart later, the pivot stays where it was rather than jumping.

## Moving a model from code

```lua
local tree = workspace.Tree
-- move and rotate the whole model around its pivot
tree:PivotTo(CFrame.new(0, 0, 50) * CFrame.Angles(0, math.rad(45), 0))

-- move relative to where it is now
tree:PivotTo(tree:GetPivot() + Vector3.new(0, 5, 0))
```

- `PivotTo` and `GetPivot` work on both Models and single parts, anchored or not.
- `SetPrimaryPartCFrame` is **deprecated**; use `PivotTo` instead.
- `Model:MoveTo(position)` exists but lifts the model up if something is in the way and does **not** keep rotation. Use `PivotTo` when exact placement matters.
- A Model has no `Position` property. Changing one part's `Position` moves only that part out of the model's layout.

## Quick diagnosis

| Symptom | Likely cause | Fix |
| --- | --- | --- |
| Model falls apart on Play | Parts unanchored and not welded | Anchor, or weld to a main part |
| Whole model falls through the floor | Welded but nothing anchored, CanCollide off on the base | Anchor the base or turn CanCollide on |
| Only one part moves from script | Setting one part's CFrame/Position | `model:PivotTo(...)` |
| Rotation swings around an odd point | Pivot not where you think | Set PrimaryPart or move the pivot |
| Spawned clone appears at the origin | Never positioned after Clone | `clone:PivotTo(spawn.CFrame)` before parenting |

## Related
[[00 START HERE - Top G Vault]] · [[Part Properties Every Beginner Must Know]] · [[Pivot tools]] · [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]] · [[Starter - First Spawner - Templates in ServerStorage, Clone and Cleanup]]
